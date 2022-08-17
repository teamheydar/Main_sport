using System;
using System.Globalization;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using ir.smsnegar.sms;

public class Tools
{
    public static string[] FormatImg = { ".png", ".jpg" };
    public static int Siseimg = 5;
    public static string Textfotmatimg = "فایل های " + StringFormat() + "مجاز هستند. " + "حداکثر حجم فایل ها " + Siseimg + " مگابایت می باشد.";

    #region Date

    public static string DateTime()
    {
        DateTime dateTime = System.DateTime.Now;
        PersianCalendar pc = new PersianCalendar();
        int Y = pc.GetYear(dateTime);
        int M = pc.GetMonth(dateTime);
        int D = pc.GetDayOfMonth(dateTime);
        return Y + "/" + M + "/" + D;
    }

    public static string DateTime(DateTime dateTime)
    {
        PersianCalendar pc = new PersianCalendar();
        int Y = pc.GetYear(dateTime);
        int M = pc.GetMonth(dateTime);
        int D = pc.GetDayOfMonth(dateTime);
        return Y + "/" + M + "/" + D;
    }

    public static string DateWek(DateTime Time)
    {
        switch (Time.DayOfWeek)
        {
            case DayOfWeek.Sunday:
                return "یک شنبه";

            case DayOfWeek.Monday:
                return "دو شنبه";

            case DayOfWeek.Tuesday:
                return "سه شنبه";

            case DayOfWeek.Wednesday:
                return "چهار شنبه";

            case DayOfWeek.Thursday:
                return "پنج شنبه";

            case DayOfWeek.Friday:
                return "جمعه";

            case DayOfWeek.Saturday:
                return "شنبه";

            default: return null;
        }
    }

    #endregion

    #region Page

    public static void Error()
    {
        HttpContext.Current.Response.Redirect("~/Error.aspx");
    }
    public static void NotE()
    {
        HttpContext.Current.Response.Redirect("/NotE.aspx");
    }
    public static void NotEGymMy()
    {
        HttpContext.Current.Response.Redirect("/NotEGymMy.aspx");
    }
    public static void NotActive()
    {
        HttpContext.Current.Response.Redirect("/NotActive.aspx");
    }

    #endregion

    #region Cooki

    public static void CookiUser()
    {
        DataClassesDataContext Data = new DataClassesDataContext();
        HttpContext app = HttpContext.Current;

        if (app.Request.Cookies["username"] == null || app.Request.Cookies["password"] == null)
        {
            app.Response.Redirect("~/Usear/Login.aspx");
        }
        else
        {

            var AnyUser = Data.tbl_Users.Any(u =>
                u.UserName == app.Request.Cookies["username"].Value &&
                u.Password == app.Request.Cookies["password"].Value &&
                u.Deleted == 0);

            if (!AnyUser)
            {
                app.Response.Redirect("~/Usear/Login.aspx");
            }
        }
        var IDAdminUser = Data.tbl_Users.Single(u =>
            u.UserName == app.Request.Cookies["username"].Value &&
            u.Password == app.Request.Cookies["password"].Value &&
            u.Deleted == 0).GymID;

        DateEAdmin(IDAdminUser);
        ActiveAdmin(IDAdminUser);
    }
    public static void CookiTeacher()
    {
        DataClassesDataContext Data = new DataClassesDataContext();
        HttpContext app = HttpContext.Current;

        if (app.Request.Cookies["tusername"] == null || app.Request.Cookies["tpassword"] == null)
        {
            app.Response.Redirect("/Teacher/Login.aspx");
        }
        else
        {

            var AnyUser = Data.tbl_Teachers.Any(u =>
                u.UserName == app.Request.Cookies["tusername"].Value &&
                u.Password == app.Request.Cookies["tpassword"].Value &&
                u.Deleted == 0);

            if (!AnyUser)
            {
                app.Response.Redirect("/Teacher/Login.aspx");
            }
        }
        var IDAdminUser = Data.tbl_Teachers.Single(u =>
            u.UserName == app.Request.Cookies["tusername"].Value &&
            u.Password == app.Request.Cookies["tpassword"].Value &&
            u.Deleted == 0).Gym_ID;
        DateEAdmin(IDAdminUser);
        ActiveAdmin(IDAdminUser);
    }
    public static void CookiAdmin()
    {
        DataClassesDataContext Data = new DataClassesDataContext();
        HttpContext app = HttpContext.Current;

        if (app.Request.Cookies["ausername"] == null || app.Request.Cookies["apassword"] == null)
        {
            app.Response.Redirect("/Admin/Login.aspx");
        }
        else
        {


            var AnyUser = Data.tbl_Admins.Any(u =>
                u.UserName == app.Request.Cookies["ausername"].Value &&
                u.Password == app.Request.Cookies["apassword"].Value &&
                u.Deleted == 0);

            if (!AnyUser)
            {
                app.Response.Redirect("~/Admin/Login.aspx");
            }
        }
        var AdminLevel = Data.tbl_Admins.Single(u =>
            u.UserName == app.Request.Cookies["ausername"].Value &&
            u.Password == app.Request.Cookies["apassword"].Value &&
            u.Deleted == 0).AdminLevel;
        if (AdminLevel == 0)
        {
            DateEAdmin();
            ActiveAdmin();
        }
    }

    #endregion

    #region FullItem

    public static void FullItemUser()
    {
        DataClassesDataContext Data = new DataClassesDataContext();
        HttpContext app = HttpContext.Current;

        var Full = Data.tbl_Users.Any(k =>
            k.UserName.ToLower() == app.Request.Cookies["username"].Value
            &&
            k.Password.ToLower() == app.Request.Cookies["password"].Value
            &&
            k.Deleted == 0
            &&
            k.FullItem == 1);

        if (Full == false)
        {
            app.Response.Redirect("~/Usear/EditProfile.aspx");
        }
    }

    #endregion

    #region Get ID

    public static int GetIDUser()
    {
        DataClassesDataContext Data = new DataClassesDataContext();
        HttpContext app = HttpContext.Current;

        var IDUser = Data.tbl_Users.Single(k =>
            k.UserName.ToLower() == app.Request.Cookies["username"].Value &&
            k.Password.ToLower() == app.Request.Cookies["password"].Value &&
            k.Deleted == 0).ID;

        return IDUser;
    }

    public static int GetADminId()
    {
        DataClassesDataContext Data = new DataClassesDataContext();

        HttpRequest Request = HttpContext.Current.Request;
        //Get Admin
        int AdminId = Data.tbl_Admins.Single(k =>
            k.UserName.ToLower() == Request.Cookies["ausername"].Value
            &&
            k.Password.ToLower() == Request.Cookies["apassword"].Value
            &&
            k.Deleted == 0).ID;

        return AdminId;
    }

    public static int GetIDTeacher()
    {
        DataClassesDataContext Data = new DataClassesDataContext();
        HttpContext app = HttpContext.Current;

        var IDUser = Data.tbl_Teachers.Single(k =>
            k.UserName.ToLower() == app.Request.Cookies["tusername"].Value &&
            k.Password.ToLower() == app.Request.Cookies["tpassword"].Value &&
            k.Deleted == 0).ID;

        return IDUser;
    }
    #endregion

    #region DateE

    public static void DateEAdmin()
    {
        DataClassesDataContext Data = new DataClassesDataContext();
        HttpContext app = HttpContext.Current;

        var EAdmin = Data.tbl_Admins
            .Select(e => new
            {
                e.UserName,
                e.Password,
                e.Deleted,
                e.E_DateGym
            }).Single(a =>
                 a.UserName == app.Request.Cookies["ausername"].Value &&
                 a.Password == app.Request.Cookies["apassword"].Value &&
                 a.Deleted == 0);

        DateTime Eadmin = Convert.ToDateTime(EAdmin.E_DateGym);
        DateTime Now = Convert.ToDateTime(DateTime());

        if (Eadmin < Now)
        {
            NotE();
        }
    }

    public static void DateEAdmin(int? IDAdmin)
    {
        DataClassesDataContext Data = new DataClassesDataContext();
        HttpContext app = HttpContext.Current;

        var EAdmin = Data.tbl_Admins
            .Select(e => new
            {
                e.UserName,
                e.Password,
                e.Deleted,
                e.E_DateGym,
                e.ID
            }).Single(a =>
                a.ID == IDAdmin &&
                a.Deleted == 0);

        DateTime Eadmin = Convert.ToDateTime(EAdmin.E_DateGym);
        DateTime Now = Convert.ToDateTime(DateTime());

        if (Eadmin < Now)
        {
            NotEGymMy();
        }
    }

    #endregion

    #region ActiveAdmin

    public static void ActiveAdmin()
    {
        DataClassesDataContext Data = new DataClassesDataContext();
        HttpContext app = HttpContext.Current;

        var Admin = Data.tbl_Admins.Single(u =>
            u.UserName == app.Request.Cookies["ausername"].Value &&
            u.Password == app.Request.Cookies["apassword"].Value &&
            u.Deleted == 0).Active;
        if (Admin == 1)
        {
            NotActive();
        }
    }
    public static void ActiveAdmin(int? id)
    {
        DataClassesDataContext Data = new DataClassesDataContext();
        HttpContext app = HttpContext.Current;

        var Admin = Data.tbl_Admins.Single(u =>
            u.ID == id &&
            u.Deleted == 0).Active;
        if (Admin == 1)
        {
            NotActive();
        }
    }

    #endregion

    #region MainAdmin

    public static void AdminNotMain()
    {
        //DataClassesDataContext Data = new DataClassesDataContext();
        //HttpContext app = HttpContext.Current;

        //var Admin = Data.tbl_Admins.Select(s => new { s.Deleted, s.UserName, s.Password, s.AdminLevel }).Single(a =>
        //    a.Deleted == 0 &&
        //    a.UserName == app.Request.Cookies["ausername"].Value &&
        //    a.Password == app.Request.Cookies["apassword"].Value);

        //if (Admin.AdminLevel == 1)
        //{
        //    app.Response.Redirect("/NotD.aspx");
        //}
        //DateEAdmin();
        //ActiveAdmin();
    }

    public static void AdminMain()
    {
        //DataClassesDataContext Data = new DataClassesDataContext();
        //HttpContext app = HttpContext.Current;

        //var Admin = Data.tbl_Admins.Select(s => new { s.Deleted, s.UserName, s.Password, s.AdminLevel }).Single(a =>
        //           a.Deleted == 0 &&
        //           a.UserName == app.Request.Cookies["ausername"].Value &&
        //           a.Password == app.Request.Cookies["apassword"].Value);

        //if (Admin.AdminLevel == 0)
        //{
        //    app.Response.Redirect("/NotD.aspx");
        //}
    }

    public static bool AdminLevel()
    {
        DataClassesDataContext Data = new DataClassesDataContext();
        HttpContext app = HttpContext.Current;

        var Admin = Data.tbl_Admins
            .Select(s => new { s.Deleted, s.UserName, s.Password, s.AdminLevel })
            .Single(a =>
            a.Deleted == 0 &&
            a.UserName == app.Request.Cookies["ausername"].Value &&
            a.Password == app.Request.Cookies["apassword"].Value);

        if (Admin.AdminLevel == 0)
        {
            return false;
        }
        else if (Admin.AdminLevel == 1)
        {
            return true;
        }

        return false;
    }

    #endregion

    #region Delete Sans

    public static void DeleteSansNotD()
    {
        DataClassesDataContext Data = new DataClassesDataContext();

        var SansNotDate = Data.tbl_Sans.Where(s =>
            s.Deleted == 0 &&
            Convert.ToDateTime(s.D_End) < Convert.ToDateTime(DateTime()))
            .ToList();

        for (int i = 0; i < SansNotDate.Count; i++)
        {
            SansNotDate[i].Deleted = 0;
        }

        Data.SubmitChanges();
    }

    #endregion

    #region #####

    public static string StringFormat()
    {
        string Value = null;
        int CountFormat = FormatImg.Count();
        int CountForech = 0;
        foreach (var Item in FormatImg)
        {
            CountForech++;

            Value += Item.Replace(".", "");
            if (CountFormat != CountForech)
            {
                Value += " و ";
            }
            else
            {
                Value += " ";
            }

        }

        return Value;
    }

    public static void SmsInsertUser(int IDUser, bool Admin)
    {
        DataClassesDataContext Data = new DataClassesDataContext();
        string TextSms = String.Empty;
        var Cms = Data.tbl_CMs.Single();
        var DataUser = Data.tbl_Users.Single(u =>
            u.Deleted == 0 &&
            u.ID == IDUser);

        if (!Admin)
        {
            TextSms = DataUser.FullName + "\n" + " شما در سایت " +Cms.PanelTitel+" "+" ثبت نام شده اید. نام کاربری شما کد ملی و رمز عبورتان شماره تلفن شما است. پس از تایید مدیریت باشگاه میتوانید وارد حساب کاربری خود شوید.";
        }
        else
        {
            TextSms = DataUser.FullName +"\n"+ " شما در سایت " + Cms.PanelTitel +" "+ " ثبت نام شده اید. نام کاربری شما کد ملی و رمز عبورتان شماره تلفن شما است. میتوانید وارد حساب کاربری خود شوید.";
        } 

          SendSms(DataUser.N_Phone,TextSms);
    }

    public static void SendSms(string phone, string sms)
    {
        long exit = 0;
        try
        {
            string[] mobiles = new string[1];
            mobiles[0] = phone;

            string[] messages = new string[1] { sms };

            string[] origs = new string[1] { Line };
            int[] encodings = new int[1] { -1 };
            string[] UDH = new string[1] { "" };
            int[] mclass = new int[1] { 1 };
            int[] priorities = new int[1] { -1 };

            long[] result =_service.sendSMSEnquee(Username, Password, Domain, messages, mobiles, origs, encodings, UDH, mclass, priorities);

        }

        catch (Exception ex)
        {

        }

    }

     static  smsWebService _service = new smsWebService();
    private const string Username = "ehsan1807";
    private const string Password = "123456";
    private const string Domain = "sms.smsnegar";
    private const string Line = "10003000630006";

    #endregion
}