using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Usear_Factor : System.Web.UI.Page
{
    public DataClassesDataContext Data = new DataClassesDataContext();
    public static int _id;
    public static bool SansAny;
    public static tbl_San Sans;
    public static tbl_User User;
    public static tbl_Admin Admins;
    protected void Page_Load(object sender, EventArgs e)
    {
        Tools.CookiUser();
        Tools.FullItemUser();

        if (!IsPostBack)
        {

            if (Request.QueryString["id"] == null || Request.QueryString["id"] == "")
            {
                Tools.Error();
            }
            else
            {
                //GetID
                _id = int.Parse(Request.QueryString["id"]);

                //Any Sans
                SansAny = Data.tbl_Sans.Any(s =>
                    s.ID == _id &&
                    s.Deleted == 0);

                if (SansAny)
                {
                    //Get Sans
                    Sans = Data.tbl_Sans.Single(s =>
                        s.ID == _id &&
                        s.Deleted == 0);

                    //Get User
                    User = Data.tbl_Users.Single(u =>
                        u.UserName.ToLower() == Request.Cookies["username"].Value &&
                        u.Password.ToLower() == Request.Cookies["password"].Value &&
                        u.Deleted == 0);

                    //Get Admins
                    Admins = Data.tbl_Admins.Single(a =>
                        a.ID == User.GymID &&
                        a.Deleted == 0);

                    spanFullName.InnerText = Sans.FullName;
                    h4SansID.InnerText = (" کد سانس :" + Sans.ID.ToString());
                    spanDateStart.InnerText = ("تاریخ شروع: " + Sans.D_Start);
                    spanDateEnd.InnerText = ("تاریخ اتمام: " + Sans.D_End);
                    spanDateNow.InnerText = ("تاریخ امروز: " + Tools.DateTime());
                    pUserName.InnerText = ("نام مربی: " + Sans.Techare);
                    pNameGym.InnerText = ("نام باشگاه: " + Admins.FullNameGym);
                    pNameAdminGym.InnerText = ("نام مدیریت باشگاه: " + Admins.FullName);
                    pFilds.InnerText = ("رشته: " + Sans.SportFild);

                    string _Gender;
                    if (Sans.Gender == 0)
                    {
                        _Gender = "مرد";
                    }
                    else
                    {
                        _Gender = "زن";

                    }
                    pGender.InnerText = ("جنسیت: " + _Gender);

                    pDays.InnerText = ("روز برگزاری: " + Sans.Days);
                    tdMony.InnerText = (string.Format("{0:n0}", Sans.Mony));
                    tdSumMony.InnerText = (string.Format("{0:n0}", (Sans.Mony)));
                    var AdminAddress = Data.tbl_Admins.Select(a => new { a.ID, a.Address, a.N_PhoneGym }).Single(a => a.ID == Sans.GymID);
                    spanAddressGym.InnerText = (AdminAddress.Address);
                    spanNumberGym.InnerText = (AdminAddress.N_PhoneGym);

                }
                else
                {
                    Tools.Error();
                }
            }
        }
    }

    protected void btnBuy_OnClick(object sender, EventArgs e)
    {
        bool Result = false;

        #region ZarenPall

        Result = true;

        #endregion

        //Report Buy User
        tbl_ReportsBuyUser RBU = new tbl_ReportsBuyUser();
        RBU.Date = Tools.DateTime();
        RBU.Result = Result == false ? 0 : 1;
        RBU.N_Buy = "0000000";
        RBU.Money = (Sans.Mony).ToString();
        RBU.UserID = Tools.GetIDUser();
        Data.tbl_ReportsBuyUsers.InsertOnSubmit(RBU);
        Data.SubmitChanges();

        if (Result)
        {
            tbl_SansBuy _SansBuy = new tbl_SansBuy();

            _SansBuy.SansID = Sans.ID;
            _SansBuy.UserID = User.ID;

            Data.tbl_SansBuys.InsertOnSubmit(_SansBuy);
            Data.SubmitChanges();
        }
    }

    protected void btnBak_OnClick(object sender, EventArgs e)
    {
        Response.Redirect("RegisterSans.aspx");
    }
}