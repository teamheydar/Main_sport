using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Reports_User : System.Web.UI.Page
{
    DataClassesDataContext Data = new DataClassesDataContext();
    public static IEnumerable<tbl_User> UserData;
    public static IEnumerable<tbl_User> UserDataNot;

    protected void Page_Load(object sender, EventArgs e)
    {
        Tools.CookiAdmin();
        Tools.AdminNotMain();

        if (!IsPostBack)
        {
            h2_cont_o.InnerText = Data.tbl_Users.Count(c =>
                c.GymID == Tools.GetADminId() && c.Deleted == 0).ToString();
            h2_cont_A.InnerText = Data.tbl_Users
                .Count(c => c.OkAdmin == 1 && c.GymID == Tools.GetADminId() && c.Deleted == 0).ToString();
            h2_cont_NA.InnerText =
                Data.tbl_Users.Count(c =>
                    c.OkAdmin == 0 && c.GymID == Tools.GetADminId() && c.Deleted == 0).ToString();
        }

        UserDataNot = Data.tbl_Users.Where(u => u.Deleted == 0 && u.OkAdmin == 0 && u.GymID == Tools.GetADminId())
            .Select(u => u);
        UserData = Data.tbl_Users.Where(u => u.Deleted == 0 && u.OkAdmin == 1 && u.GymID == Tools.GetADminId())
            .Select(u => u);
    }


    protected void btnOK_OnClick(object sender, EventArgs e)
    {

        UserDataNot = Data.tbl_Users.Where(u => u.Deleted == 0 && u.OkAdmin == 0 && u.GymID == Tools.GetADminId())
            .Select(u => u);
        UserData = Data.tbl_Users.Where(u => u.Deleted == 0 && u.OkAdmin == 1 && u.GymID == Tools.GetADminId())
            .Select(u => u);
    }
}

