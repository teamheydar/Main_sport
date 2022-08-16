using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Reports_Timex : System.Web.UI.Page
{
    DataClassesDataContext Data = new DataClassesDataContext();
    public static IEnumerable<tbl_TimeUser> Timex;
    protected void Page_Load(object sender, EventArgs e)
    {
        Tools.CookiAdmin();
        Tools.AdminNotMain();
        if (!IsPostBack)
        {
            Timex = Data.tbl_TimeUsers.Where(t => t.Deleted == 0).Select(t => t);
        }
    }

    protected void btnOK_OnClick(object sender, EventArgs e)
    {
        try
        {
            int Codey = int.Parse(txt_Codey.Value);
        }
        catch (Exception exception)
        {
            string alert = "لطفا کد ملی را به درستی وارد کنید.";
            string type = "2";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
            return;
        }

        if (!txt_Codey.Value.Any())
        {
            Timex = Data.tbl_TimeUsers.Where(t => t.Deleted == 0).Select(t => t);
        }
        else
        {
            Timex = Data.tbl_TimeUsers.Where(t => t.Deleted == 0).Where(t => t.UserCodey == txt_Codey.Value).Select(t => t);
        }
    }
}