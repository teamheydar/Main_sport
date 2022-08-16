using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    DataClassesDataContext data = new DataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        message.Visible = false;
    }

    protected void btn_Login_OnClick(object sender, EventArgs e)
    {
        #region Login

        var LoginAny = data.tbl_Teachers.Any(k =>

            k.UserName.ToLower() == txt_Username.Value.ToLower()
            &&
            k.Password == txt_Password.Value.ToLower()
            &&
            k.Deleted == 0);

        if (LoginAny)
        {

            var UserData = data.tbl_Teachers.SingleOrDefault(k =>
                k.UserName.ToLower() == txt_Username.Value.ToLower()
                &&
                k.Password == txt_Password.Value.ToLower()
                &&
                k.Deleted == 0);

            Response.Cookies["tusername"].Value = UserData.UserName.ToLower();
            Response.Cookies["tpassword"].Value = UserData.Password.ToLower();

            Response.Cookies["tusername"].Expires = DateTime.Now.AddDays(1);
            Response.Cookies["tpassword"].Expires = DateTime.Now.AddDays(1);

            Response.Redirect("Dashboard.aspx");
        }
        else
        {
            message.InnerText = "نام کاربری یا رمز شما نادرست است.";
            message.Visible = true;
        }

        #endregion
    }

}