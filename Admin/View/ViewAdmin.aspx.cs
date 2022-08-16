using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_View_ViewAdmin : System.Web.UI.Page
{
    public DataClassesDataContext Data = new DataClassesDataContext();
    public tbl_Admin DataUser = new tbl_Admin();
    private int _id;
    protected void Page_Load(object sender, EventArgs e)
    {

        Tools.CookiAdmin();
        Tools.AdminMain();

        if (Request.QueryString["id"] == null)
        {
            Tools.Error();
        }

        try
        {
            _id = int.Parse(Request.QueryString["id"]);
        }
        catch (Exception exception) { Tools.Error(); }

        bool AnyDataUser = Data.tbl_Admins.Any(u =>
            u.Deleted == 0 &&
            u.ID == _id);

        if (AnyDataUser)
        {
            DataUser = Data.tbl_Admins.Single(u =>
                u.Deleted == 0 &&
                u.ID == _id);


            //Show
            spanDateNow.InnerText = Tools.DateTime();
            hIdUser.InnerText = ("کد: " + DataUser.Code);
            spanNameUser.InnerText = DataUser.FullName;
            pUserCodey.InnerText = ("کد ملی: " + DataUser.Codey);
            pRDate.InnerText = (DataUser.R_DateGym);
            pEdate.InnerText = (DataUser.E_DateGym);
            pNPhone.InnerText = ("شماره تلفن: " + DataUser.N_Phone);
            pNHome.InnerText = ("شماره تلفن منزل: " + DataUser.N_Home);
            pDateBrith.InnerText = ("تاریخ تولد: " + DataUser.D_Birth);
            pGender.InnerText = ("جنسیت: " + (DataUser.Gender == 0 ? "مرد" : DataUser.Gender == 1 ? "زن" : ""));
            pMarital.InnerText = ("وضعیت تاهل: " + (DataUser.Gender == 0 ? "مجرد" : DataUser.Gender == 1 ? "متاهل" : ""));
            tNameGym.InnerText = (DataUser.FullNameGym);
            tNPhoneGym.InnerText = DataUser.N_PhoneGym;
            spanDescription.InnerText = DataUser.DescriptionGym;
            spanAddress.InnerText = DataUser.Address;
            spanAddressGym.InnerText = DataUser.AddressGym;

        }
        else
        {
            Tools.Error();
        }
    }

    protected void OKUser_OnClick(object sender, EventArgs e)
    {
    }

    protected void Cancel_OnClick(object sender, EventArgs e)
    {
        Response.Redirect("../Reports/User.aspx");
    }
}