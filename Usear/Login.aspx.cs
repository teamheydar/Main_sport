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

        var LoginAny = data.tbl_Users.Any(k =>

            k.UserName.ToLower() == txt_Username.Value.ToLower()
            &&
            k.Password == txt_Password.Value.ToLower()
            &&
            k.Deleted == 0);

        if (LoginAny)
        {
            //Ok Admin
            var OKAdmin = data.tbl_Users.Single(k =>
                k.UserName.ToLower() == txt_Username.Value.ToLower() &&
                k.Password == txt_Password.Value.ToLower() &&
                k.Deleted == 0);

            if (OKAdmin.OkAdmin == 0)
            {
                message.InnerText = "شما توسط مدیر باشگاه تاید نشده اید منتظر تاید مدیر بمانید!";
                message.Visible = true;
            }
            else
            {

                var UserData = data.tbl_Users.SingleOrDefault(k =>
                    k.UserName.ToLower() == txt_Username.Value.ToLower()
                    &&
                    k.Password == txt_Password.Value.ToLower()
                    &&
                    k.Deleted == 0);

                Response.Cookies["username"].Value = UserData.UserName.ToLower();
                Response.Cookies["password"].Value = UserData.Password.ToLower();

                Response.Cookies["username"].Expires = DateTime.Now.AddDays(1);
                Response.Cookies["password"].Expires = DateTime.Now.AddDays(1);

                Response.Redirect("Dashboard.aspx");
            }
        }
        else
        {
            message.InnerText = "نام کاربری یا رمز شما نادرست است.";
            message.Visible = true;
        }

        #endregion
    }

}