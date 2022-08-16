using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Reports_User : System.Web.UI.Page
{
    DataClassesDataContext Data = new DataClassesDataContext();
    public static IEnumerable<tbl_San> SansData;

    protected void Page_Load(object sender, EventArgs e)
    {
        Tools.CookiAdmin();
        Tools.AdminNotMain();

        if (!IsPostBack)
        {
            h2_cont_o.InnerText = Data.tbl_Teachers.Count(c => 
                c.Gym_ID == Tools.GetADminId() && c.Deleted == 0).ToString();
            SansData = Data.tbl_Sans
                .Where(u =>
                    u.Deleted == 0 &&
                    u.GymID == Tools.GetADminId())
                .Select(u => u);

            //Selector
            DataTable T = new DataTable();
            T.Columns.Add("ID");
            T.Columns.Add("Text");
            T.Rows.Add("-1", "مربی");
            var DataT = Data.tbl_Teachers.Where(s =>
                s.Deleted == 0 && s.Gym_ID == Tools.GetADminId()).Select(s => s);
            foreach (var item in DataT)
            {
                T.Rows.Add(item.ID, item.FullName);
            }

            Teacher.DataSource = T;
            Teacher.DataTextField = "Text";
            Teacher.DataValueField = "ID";
            Teacher.DataBind();
            Teacher.Items[0].Selected = true;
        }
    }


    protected void btnOK_OnClick(object sender, EventArgs e)
    {
        if (Teacher.Value == "-1")
        {
            SansData = Data.tbl_Sans
                .Where(u =>
                    u.Deleted == 0 &&
                    u.GymID == Tools.GetADminId())
                .Select(u => u);
        }
        else
        {
            SansData = Data.tbl_Sans
                .Where(u =>
                    u.Deleted == 0 &&
                    u.GymID == Tools.GetADminId() &&
                    u.TechareID == (int.Parse(Teacher.Value)))
                .Select(u => u);
        }
    }
}
