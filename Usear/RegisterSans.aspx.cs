using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Usear_RegisterSans : System.Web.UI.Page
{
    public static DataClassesDataContext data = new DataClassesDataContext();
    public static IEnumerable<tbl_San> Sans;
    public static tbl_User User;
    protected void Page_Load(object sender, EventArgs e)
    {
        Tools.CookiUser();

        Tools.FullItemUser();

        if (!IsPostBack)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Name");
            dt.Columns.Add("ID");
            dt.Rows.Add("رشته ورزشی", "0");

            foreach (var item in data.tbl_SportFilds.Select(k => k))
            {
                dt.Rows.Add(item.Name, item.ID);
            }

            SportFild.DataSource = dt;
            SportFild.DataTextField = "Name";
            SportFild.DataValueField = "ID";
            SportFild.DataBind();
            SportFild.Items[0].Selected = true;

            //Get User
            User = data.tbl_Users.Single(k =>
            k.UserName.ToLower() == Request.Cookies["username"].Value &&
            k.Password.ToLower() == Request.Cookies["password"].Value &&
            k.Deleted == 0);


            Sans = data.tbl_Sans.Where(s => s.GymID == User.GymID && s.Deleted == 0).Select(k => k);

        }
        SportFild.Items[0].Attributes["disabled"] = "disabled";
    }

    protected void SerchSans_OnClick(object sender, EventArgs e)
    {
        Sans = data.tbl_Sans
            .Where(s =>
                s.SportFildID == int.Parse(SportFild.Value) &&
                s.GymID == User.GymID &&
                s.Deleted == 0)
            .Select(k => k);
    }
}