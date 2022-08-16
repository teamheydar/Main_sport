using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_RegisterSportFild : System.Web.UI.Page
{
    DataClassesDataContext Data = new DataClassesDataContext();
    public static IEnumerable<tbl_SportFild> sportFild;
    public static int? Editid = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        Tools.CookiAdmin();
        Tools.AdminMain();

        btn_Cansel.Visible = false;
        if (!IsPostBack)
        {
            if (Editid != null)
            {
                var QEdit = Data.tbl_SportFilds.Single(E => 
                    E.ID == Editid&&
                    E.Deleted == 0);
                txtFullName.Value = QEdit.Name;
                txtCode.Value = QEdit.Code;
                btn_submit.Text = "ثبت تغیرات";
                btn_submit.CssClass = "btn btn-warning me-2";
                btn_Cansel.Visible = true;
            }
        }
        sportFild = Data.tbl_SportFilds.Where(k =>
            k.Deleted == 0).Select(k => k);
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {

        if (Editid == null)
        {

            if (Data.tbl_SportFilds.Any(a => a.Code.ToLower() == txtCode.Value.ToLower()))
            {
                string alert = "کد انتخاب شده تکراری است.";
                string type = "3";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction",
                    "toast('" + alert + "','" + type + "');", true);
                btn_Cansel.Visible = false;
                return;
            }
            tbl_SportFild tblSportFild = new tbl_SportFild();
            tblSportFild.Name = txtFullName.Value;
            tblSportFild.Code = txtCode.Value;
            Data.tbl_SportFilds.InsertOnSubmit(tblSportFild);
            Data.SubmitChanges();
            txtFullName.Value = "";
            txtCode.Value = "";
        }
        else
        {
            var QEdit = Data.tbl_SportFilds.Single(E => 
                E.ID == Editid&&
                E.Deleted == 0);
            if (QEdit.Code.ToLower() != txtCode.Value.ToLower())
            {
                if (Data.tbl_SportFilds.Any(a => a.Deleted == 0 && a.Code.ToLower() == txtCode.Value.ToLower()))
                {
                    string alert = "کد انتخاب شده تکراری است.";
                    string type = "3";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
                    btn_Cansel.Visible = true;
                    return;
                }
            }
            QEdit.Name = txtFullName.Value;
            QEdit.Code = txtCode.Value;
            Data.SubmitChanges();
            txtFullName.Value = "";
            txtCode.Value = "";
            Editid = null;
            btn_submit.Text = "ثبت";
            btn_submit.CssClass = "btn btn-primary me-2";
            btn_Cansel.Visible = false;
        }
        Response.Redirect("RegisterSportFild.aspx");

    }
    [WebMethod]
    public static int btn_Delete(int id)
    {
        DataClassesDataContext db = new DataClassesDataContext();
        try
        {
            var q = (from k in db.tbl_SportFilds where k.ID == id && k.Deleted == 0 select k).Single();
            q.Deleted = 1;
            db.SubmitChanges();
            return 1;

        }
        catch (Exception e)
        {
            string d = e.Message;
            return 0;
        }

    }
    protected void btn_Cansel_OnClick(object sender, EventArgs e)
    {
        txtFullName.Value = "";
        txtCode.Value = "";
        Editid = null;
        btn_submit.Text = "ثبت";
        btn_submit.CssClass = "btn btn-primary me-2";
        btn_Cansel.Visible = false;
    }
    [WebMethod]
    public static int btn_Edit(int id)
    {
        try
        {
            Editid = id;
            return 1;

        }
        catch (Exception e)
        {
            string d = e.Message;
            return 0;
        }


    }
}