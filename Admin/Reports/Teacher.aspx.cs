using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Reports_User : System.Web.UI.Page
{
    DataClassesDataContext Data = new DataClassesDataContext();
    public static IEnumerable<tbl_Teacher> TeacherData;

    protected void Page_Load(object sender, EventArgs e)
    {
        Tools.CookiAdmin();
        Tools.AdminNotMain();

        if (!IsPostBack)
        {
            h2_cont_o.InnerText = Data.tbl_Teachers.Count(c => 
                c.Gym_ID == Tools.GetADminId() && c.Deleted == 0).ToString();
            TeacherData = Data.tbl_Teachers.Where(u => u.Deleted == 0 && u.Gym_ID == Tools.GetADminId())
                .Select(u => u);
        }
    }


    protected void btnOK_OnClick(object sender, EventArgs e)
    {
        if (txt_Codey.Value.Length != 0)
        {
            TeacherData = Data.tbl_Teachers
                .Where(u =>
                    u.Deleted == 0 &&
                    u.Gym_ID == Tools.GetADminId() &&
                    u.Codey == txt_Codey.Value);
        }
        else
        {
            TeacherData = Data.tbl_Teachers.Where(u => u.Deleted == 0 && u.Gym_ID == Tools.GetADminId())
                .Select(u => u);
        }
    }
}
