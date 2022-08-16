using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel.Description;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    public DataClassesDataContext Data = new DataClassesDataContext();
    public tbl_CM Cms = new tbl_CM();
    public IEnumerable<tbl_Admin> Gym = new List<tbl_Admin>();
    public IEnumerable<tbl_Teacher> Teacher = new List<tbl_Teacher>();
    public IEnumerable<tbl_User> User = new List<tbl_User>();
    public int Sans;
    protected void Page_Load(object sender, EventArgs e)
    {
        Cms = Data.tbl_CMs.SingleOrDefault();
        Gym = Data.tbl_Admins.Where(g => g.AdminLevel == 0 && g.Deleted == 0);
        Teacher = Data.tbl_Teachers.Where(t => t.Deleted == 0);
        User = Data.tbl_Users.Where(u => u.Deleted == 0);
        Sans = Data.tbl_Sans.Count(s => s.Deleted == 0);
    }
}