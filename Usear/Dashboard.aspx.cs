using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Usear_Profile : System.Web.UI.Page
{
    public DataClassesDataContext Data = new DataClassesDataContext();
    public tbl_User UserData = new tbl_User();
    public IEnumerable<tbl_SansBuy> SansBuy;
    public IEnumerable<tbl_ReportsBuyUser> RBU;

    protected void Page_Load(object sender, EventArgs e)
    {
        #region Get_Usear_Data

        Tools.CookiUser();

        Tools.FullItemUser();

        //Enter User
        var UserAny = Data.tbl_Users.Any(k =>
            k.UserName.ToLower() == Request.Cookies["username"].Value
            &&
            k.Password.ToLower() == Request.Cookies["password"].Value
            &&
            k.Deleted == 0
        );

        if (UserAny == true)
        {

            var UserData = Data.tbl_Users.Single(k =>
                k.UserName.ToLower() == Request.Cookies["username"].Value &&
                k.Password.ToLower() == Request.Cookies["password"].Value &&
                k.Deleted == 0);

            //Get Sans Buy
            SansBuy = Data.tbl_SansBuys.Where(s =>
                s.UserID == UserData.ID &&
                s.Deleted == 0);

            RBU = Data.tbl_ReportsBuyUsers.Where(r =>
                r.UserID == Tools.GetIDUser() &&
                r.Deleted == 0);

            #region Show

            ImgUser.ImageUrl = "File/img/" + UserData.img;
            h4_FullName.InnerText = UserData.FullName;
            Span_FullName.InnerText = UserData.FullName;
            span_NumberPhone.InnerText = UserData.N_Phone;
            span_Codey.InnerText = UserData.Codey;
            span_NumberHome.InnerHtml = UserData.N_Home;
            span_UserName.InnerText = UserData.UserName;
            spanCountSans.InnerText = SansBuy.Count().ToString();

            #endregion

        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    #endregion

}