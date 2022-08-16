using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MainePanel : System.Web.UI.MasterPage
{
    DataClassesDataContext Data = new DataClassesDataContext();
    public tbl_CM Cms = new tbl_CM();
    protected void Page_Load(object sender, EventArgs e)
    {
        Cms = Data.tbl_CMs.SingleOrDefault();
    }
}
