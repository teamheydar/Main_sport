using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_View_ViewUser : System.Web.UI.Page
{
    public DataClassesDataContext Data = new DataClassesDataContext();
    public tbl_User DataUser = new tbl_User();
    public IEnumerable<tbl_ReportsBuyUser> RBU;
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

        bool AnyDataUser = Data.tbl_Users.Any(u =>
            u.Deleted == 0 &&
            u.ID == _id &&
            u.GymID == Tools.GetADminId());

        if (AnyDataUser)
        {
            if (!IsPostBack)
            {
                message.Visible = false;
            }

            DataUser = Data.tbl_Users.Single(u =>
                u.Deleted == 0 &&
                u.ID == _id &&
                u.GymID == Tools.GetADminId());

            RBU = Data.tbl_ReportsBuyUsers.Where(r =>
                r.Deleted == 0 &&
                r.UserID == DataUser.ID &&
                r.Deleted == 0);

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

    protected void Cancel_OnClick(object sender, EventArgs e)
    {
        Response.Redirect("../Reports/User.aspx");
    }

    protected void btnM_Enter_OnClick(object sender, EventArgs e)
    {
        if (Data.tbl_Users.Any(a => a.Deleted == 0 && a.Code.ToLower() == code.Value.ToLower()))
        {
            message.Visible = true;
        }
        else
        {
            DataUser = DataUser = Data.tbl_Users.Single(u =>
                u.Deleted == 0 &&
                u.ID == _id &&
                u.GymID == Tools.GetADminId());

            DataUser.Code = code.Value;
            DataUser.OkAdmin = 1;

            Data.SubmitChanges();

            Response.Redirect("ViewUser.aspx?id=" + DataUser.ID);//Page Refresh
        }
    }
}