using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_View_ViewTeacher : System.Web.UI.Page
{
    public DataClassesDataContext Data = new DataClassesDataContext();
    public tbl_Teacher DataUser = new tbl_Teacher();
    private int _id;
    protected void Page_Load(object sender, EventArgs e)
    {
        Tools.CookiAdmin();
        Tools.AdminNotMain();

        if (Request.QueryString["id"] == null)
        {
            Tools.Error();
        }

        try
        {
            _id = int.Parse(Request.QueryString["id"]);
        }
        catch (Exception exception) { Tools.Error(); }

        bool AnyDataUser = Data.tbl_Teachers.Any(u =>
            u.Deleted == 0 &&
        u.ID == _id &&
        u.Gym_ID == Tools.GetADminId());

        if (AnyDataUser)
        {
            DataUser = Data.tbl_Teachers.Single(u =>
            u.Deleted == 0 &&
            u.ID == _id &&
            u.Gym_ID == Tools.GetADminId());

            //Show
            spanDateNow.InnerText = Tools.DateTime();
            hIdUser.InnerText = ("کد کاربر: " + DataUser.Code);
            spanNameUser.InnerText = DataUser.FullName;
            pUserCodey.InnerText = ("کد ملی: " + DataUser.Codey);
            pRDate.InnerText = (DataUser.R_Date);
            pNPhone.InnerText = ("شماره تلفن: " + DataUser.N_Phone);
            pNHome.InnerText = ("شماره تلفن منزل: " + DataUser.N_Home);
            pDateBrith.InnerText = ("تاریخ تولد: " + DataUser.D_Birth);
            pGender.InnerText = ("جنسیت: " + (DataUser.Gender == 0 ? "مرد" : DataUser.Gender == 1 ? "زن" : ""));
            pMarital.InnerText = ("وضعیت تاهل: " + (DataUser.Gender == 0 ? "مجرد" : DataUser.Gender == 1 ? "متاهل" : ""));
            tNInsurance.InnerText = (DataUser.N_Insurance);
            tDEInsurance.InnerText = DataUser.D_E_Insurance;
            spanDescription.InnerText = DataUser.Description;
            spanAddress.InnerText = DataUser.Address;

        }
        else
        {
            Tools.Error();
        }
    }
}