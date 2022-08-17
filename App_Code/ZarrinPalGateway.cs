using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Web;
using Newtonsoft.Json;
using RestSharp;

public class ZarrinPalGateway
{
    private double _amount;
    private string _mobile = "";
    private string _email = "";
    //private string _metaData;
    private string _description = "پرداخت";
    private string _authority;
    private string _errorscode;
    private string _callbackUrl = "/VerifyPayment.aspx?PID=";
    private string _message;
    //private string _zarinPalUrl = "";
    // private string _zarinPalVerifyUrl = "";
    private string _redirectUrl = "https://www.zarinpal.com/pg/StartPay/";
    private string _merchantId = "3d94482c-fc90-4e60-b217-a53f1f41ae4e";




    //private readonly QuickCartCountsViewModel _model = new QuickCartCountsViewModel();
    public ZarrinPalGateway()
    {

    }


    public void GetAmount(double amount)
    {
        _amount = amount;
    }

    public ResponseToRequestPayment Payment(PaymentRequestData data)
    {
        if (!string.IsNullOrEmpty(data.Mobile))
        {

            _mobile = data.Mobile;
        }

        if (!string.IsNullOrEmpty(data.Email))
        {
            _email = data.Email;
        }
        if (!string.IsNullOrEmpty(data.Description))
        {
            _description = data.Description;
        }
        var domainName = HttpContext.Current.Request.Url.AbsoluteUri.Remove(
             HttpContext.Current.Request.Url.AbsoluteUri.IndexOf(HttpContext.Current.Request.Url.AbsolutePath));
        _callbackUrl = domainName + _callbackUrl + data.OnlinePaymentID;
        var model = RequestPayment();
        return model;


    }
    private ResponseToRequestPayment RequestPayment()
    {
        try
        {

           // string[] metadata = new string[2];
            //metadata[0] = $"[mobile: {_mobile}]";
            //metadata[1] = $"[email: {_email}]";


            //be dalil in ke metadata be sorate araye ast va do meghdare mobile va email dar metadata gharar mmigirad
            //shoma mitavanid in maghadir ra az kharidar begirid va set konid dar gheir in sorat khali ersal konid

            //string requesturl;
            //requesturl = _zarinPalUrl + "?merchant_id=" +
            //             _merchantId + "&amount=" + _amount +
            //    "&callback_url=" + _callbackUrl +
            //    "&description=" + _description+ _metaData;
            var model = new RequestZarin()
            {
                amount = _amount.ToString(),
                callback_url = _callbackUrl,
                description = _description,
                merchant_id = _merchantId,
                metadata = new Metadata() { email = _email, mobile = _mobile }
            };
            var modelConvertToJson = Newtonsoft.Json.JsonConvert.SerializeObject(model);
            var client = new RestClient("https://api.zarinpal.com/pg/v4/payment/request.json");
            client.Timeout = -1;
            var request = new RestRequest(Method.POST);
            request.AddHeader("Content-Type", "application/json");
            request.AddHeader("Accept", "application/json");
            var body = modelConvertToJson;
            request.AddParameter("application/json", body, ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);
            //var myOjbect11 = JsonConvert.DeserializeObject<ResponseToRequestPayment>(response.Content);
            Newtonsoft.Json.Linq.JObject jo = Newtonsoft.Json.Linq.JObject.Parse(response.Content);
            _errorscode = jo["errors"].ToString();

            Newtonsoft.Json.Linq.JObject jodata = Newtonsoft.Json.Linq.JObject.Parse(response.Content);
            string dataauth = jodata["data"].ToString();



            if (dataauth != "[]")
            {


                _authority = jodata["data"]["authority"].ToString();
                _message = jodata["data"]["message"].ToString();
                return new ResponseToRequestPayment()
                {
                    Type = ResponseTypes.SuccessResponse,
                    RedirctUrl = _redirectUrl + _authority,
                    Authority = _authority,
                    Message = _message
                };


            }
            else
            {

                return new ResponseToRequestPayment()
                {
                    Type = ResponseTypes.ErrorResponse,
                    RedirctUrl = _authority,
                    Authority = _authority,
                    Message = _message
                };


            }


        }
        catch (Exception ex)
        {
            return new ResponseToRequestPayment()
            {
                Type = ResponseTypes.ErrorResponse,
                RedirctUrl = "تلاش برای ارسال دیتا به بانک نا موفق بود >> ",
                Authority = _authority,
                Message = _errorscode
            };
        }
    }

    public ResponseToVerifyPayment GetVerifyPaymentCode(string authority)
    {
        var model = VerifyPayment(authority);
        return model;
    }
    private ResponseToVerifyPayment VerifyPayment(string authority)
    {
        try
        {

            string url = "https://api.zarinpal.com/pg/v4/payment/verify.json?merchant_id=" +
                         _merchantId + "&amount="
                         + _amount + "&authority="
                         + authority;

            var client = new RestClient(url);
            client.Timeout = -1;

            var request = new RestRequest(Method.POST);

            request.AddHeader("accept", "application/json");

            request.AddHeader("content-type", "application/json");

            IRestResponse response = client.Execute(request);


            Newtonsoft.Json.Linq.JObject jodata = Newtonsoft.Json.Linq.JObject.Parse(response.Content);
            string data = jodata["data"].ToString();

            Newtonsoft.Json.Linq.JObject jo = Newtonsoft.Json.Linq.JObject.Parse(response.Content);
            string errors = jo["errors"].ToString();

            if (data != "[]")
            {
                string refid = jodata["data"]["ref_id"].ToString();
                string code = jodata["data"]["code"].ToString();
                string refMessage = jodata["data"]["message"].ToString();
                string cardPan = jodata["data"]["card_pan"].ToString();

                return new ResponseToVerifyPayment()
                {
                    Code = Convert.ToInt32(code),
                    Amount = _amount.ToString(),
                    TransactionCode = refid,
                    ResponseMessage = refMessage,
                    cardPan = cardPan,
                    Successful = true
                };
            }
            if (errors != "[]")
            {

                string errorscode = jo["errors"]["code"].ToString();
                return new ResponseToVerifyPayment()
                {
                    Code = Convert.ToInt32(errorscode),
                    Amount = _amount.ToString(),
                    TransactionCode = errorscode,
                    ResponseMessage = "نتیجه تاییدیه با خطا مواجه شد",
                    cardPan = "",
                    Successful = false
                };


            }


        }
        catch (Exception ex)
        {
            return new ResponseToVerifyPayment()
            {
                Code = -1000,
                Amount = _amount.ToString(),
                TransactionCode = "-1000",
                ResponseMessage = "تلاش برای تاییدیه گرفتن از بانک با خطا مواجه شد",
                cardPan = "",
                Successful = false
            };
            // throw new Exception(ex.Message);
        }
        return new ResponseToVerifyPayment()
        {
            Amount = _amount.ToString(),
            TransactionCode = "-5000",
            ResponseMessage = "تلاش برای تاییدیه گرفتن از بانک با خطا مواجه شد",
            cardPan = "",
            Successful = false
        };
    }


}