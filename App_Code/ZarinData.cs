using System.Collections.Generic;

public class ZarinData
{
    public static List<ZarrinPalResponseMassage> GetResponseMasseges()
    {
        return new List<ZarrinPalResponseMassage>()
        {
            new ZarrinPalResponseMassage() { Code = -9 ,EnglishText = "Validation error", PersinText = "خطای اعتبار سنجی"},
            new ZarrinPalResponseMassage() { Code = -10 ,EnglishText = "Terminal is not valid, please check merchant_id or ip address", PersinText = ".ای پی و يا مرچنت كد پذيرنده صحيح نيست"},
            new ZarrinPalResponseMassage() { Code = -11 ,EnglishText = "Terminal is not active, please contact our support team", PersinText = ".مرچنت کد فعال نیست لطفا با تیم پشتیبانی ما تماس بگیرید"},
            new ZarrinPalResponseMassage() { Code = -12  ,EnglishText = "To many attempts, please try again later", PersinText = "تلاش بیش از حد در یک بازه زمانی کوتاه."},
            new ZarrinPalResponseMassage() { Code = -15 ,EnglishText = "Terminal user is suspend : (please contact our support team).", PersinText = "ترمینال شما به حالت تعلیق در آمده با تیم پشتیبانی تماس بگیرید"},
            new ZarrinPalResponseMassage() { Code = -16 ,EnglishText = "Terminal user level is not valid : (please contact our support team).", PersinText = "سطح تاييد پذيرنده پايين تر از سطح نقره اي است."},
            new ZarrinPalResponseMassage() { Code =100  ,EnglishText = "Success", PersinText = " عملیات موفق"},
            new ZarrinPalResponseMassage() { Code = -30 ,EnglishText = "Terminal do not allow to accept floating wages.", PersinText = "اجازه دسترسی به تسویه اشتراکی شناور ندارید"},
            new ZarrinPalResponseMassage() { Code = -31 ,EnglishText = "Terminal do not allow to accept wages, please add default bank account in panel.", PersinText = "حساب بانکی تسویه را به پنل اضافه کنید مقادیر وارد شده واسه تسهیم درست نیست"},
            new ZarrinPalResponseMassage() { Code = -32 ,EnglishText = "Wages is not valid, Total wages(floating) has been overload max amount. ", PersinText = ""},
            new ZarrinPalResponseMassage() { Code = -33 ,EnglishText = "Wages floating is not valid. ", PersinText = "درصد های وارد شده درست نیست"},
            new ZarrinPalResponseMassage() { Code = -34 ,EnglishText = "Wages is not valid, Total wages(fixed) has been overload max amount.", PersinText = "مبلغ از کل تراکنش بیشتر است"},
            new ZarrinPalResponseMassage() { Code =-35  ,EnglishText = "Wages is not valid, Total wages(floating) has been reached the limit in max parts.", PersinText = "تعداد افراد دریافت کننده تسهیم بیش از حد مجاز است"},
            new ZarrinPalResponseMassage() { Code =-40  ,EnglishText = "Invalid extra params, expire_in is not valid.", PersinText = ""},
            new ZarrinPalResponseMassage() { Code = -50 ,EnglishText = "Session is not valid, amounts values is not the same.", PersinText = "مبلغ پرداخت شده با مقدار مبلغ در وریفای متفاوت است"},
            new ZarrinPalResponseMassage() { Code = -51 ,EnglishText = "Session is not valid, session is not active paid try.", PersinText = "پرداخت ناموفق"},
            new ZarrinPalResponseMassage() { Code = -52 ,EnglishText = "Oops!!, please contact our support team", PersinText = " خطای غیر منتظره با پشتیبانی تماس بگیرید"},
            new ZarrinPalResponseMassage() { Code = -53 ,EnglishText = " Session is not this merchant_id session ", PersinText = "اتوریتی برای این مرچنت کد نیست"},
            new ZarrinPalResponseMassage() { Code = -54  ,EnglishText = "Invalid authority.", PersinText = " اتوریتی نامعتبر است"},
            new ZarrinPalResponseMassage() { Code =  101,EnglishText = "Verified", PersinText = " تراکنش وریفای شده"}

        };
    }
}
public class PaymentRequestData
{
    public int OnlinePaymentID { get; set; }
    public string Mobile { get; set; }
    public string Email { get; set; }
    public string Description { get; set; }
}
public class ResponseToRequestPayment
{

    public ResponseTypes Type { get; set; }
    public string Message { get; set; }
    public string RedirctUrl { get; set; }
    public string Authority { get; set; }
}
public class ResponseToVerifyPayment
{
    public int Code { get; set; }
    public string Amount { get; set; }
    public string TransactionCode { get; set; }
    public string ResponseMessage { get; set; }
    public string cardPan { get; set; }
    public bool Successful { get; set; }
}
public enum ResponseTypes
{
    SuccessResponse,
    ErrorResponse
}
public enum RequestTypes
{
    TestRequst,
    RealRequest
}
public enum VerifyTypes
{
    TestRequst,
    RealRequest
}

public class RequestZarin
{
    public string merchant_id { get; set; }
    public string amount { get; set; }
    public string callback_url { get; set; }
    public string description { get; set; }
    public Metadata metadata { get; set; }
}

public class Metadata
{
    public string mobile { get; set; }
    public string email { get; set; }
}


public class ZarrinPalResponseMassage
{
    public int Code { get; set; }
    public string EnglishText { get; set; }
    public string PersinText { get; set; }

}