using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Test : System.Web.UI.Page
{[WebMethod]
    public static void Method()
    {
        HttpContext.Current.Response.Redirect("Login.aspx");
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        txtdatestart.Value=txtdatestart.Value.Replace("-", "/");
    }

    protected void btnM_Enter_OnClick(object sender, EventArgs e)
    {
        if (code.Value == "amir")
        {
            Response.Redirect("CMS.aspx");
        }
        else
        {
            string alert = "کد ملی وارد شده تکراری است.";
            string type = "3";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
        }
    }
}