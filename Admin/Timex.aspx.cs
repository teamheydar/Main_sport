using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Timex : System.Web.UI.Page
{
    private DataClassesDataContext Data = new DataClassesDataContext();
    public static IEnumerable<tbl_TimeUser> TimeUser;
    public static int? Editid = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        Tools.CookiAdmin();
        Tools.AdminNotMain();

        btn_Cansel.Visible = false;
        if (!IsPostBack)
        {
            if (Editid != null)
            {
                var QEdit = Data.tbl_TimeUsers.Single(E => E.ID == Editid && E.Deleted == 0);
                txtCody.Value = QEdit.UserCodey;
                txtDate.Value = QEdit.Date;
                TimeLogin.Value = QEdit.TimeLogin;
                TimeOut.Value = QEdit.TimeOut;
                btnOK.Text = "ثبت تغیرات";
                btnOK.CssClass = "btn btn-warning me-2";
                btn_Cansel.Visible = true;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction",
                    "SetDate('" + QEdit.Date.Replace("/", "-") + "');", true);
            }

            TimeUser = Data.tbl_TimeUsers.Where(k => k.GymID == Tools.GetADminId() && k.Deleted == 0).Select(k => k);
        }
    }

    protected void btnOK_OnClick(object sender, EventArgs e)
    {
        if (txtDate.Value == string.Empty || TimeLogin.Value == string.Empty || TimeOut.Value == string.Empty)
        {
            string alert = "لطفا تاریخ ، ساعت ورود و ساعت خروج را انتخاب کنید.";
            string type = "2";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
        }

        else if (Editid == null)
        {
            tbl_TimeUser _timeUser = new tbl_TimeUser();

            _timeUser.UserCodey = txtCody.Value;
            _timeUser.Date = txtDate.Value;
            _timeUser.TimeLogin = TimeLogin.Value;
            _timeUser.TimeOut = TimeOut.Value;
            _timeUser.GymID = Tools.GetADminId();
            _timeUser.DateWek = Tools.DateWek(Convert.ToDateTime(txtDate.Value));

            Data.tbl_TimeUsers.InsertOnSubmit(_timeUser);
            Data.SubmitChanges();
            txtCody.Value = "";
            txtDate.Value = "";
            TimeLogin.Value = "";
            TimeOut.Value = "";
            Editid = null;
            btnOK.Text = "ثبت";
            btnOK.CssClass = "btn btn-primary me-2";
            btn_Cansel.Visible = false;
            Response.Redirect("Timex.aspx");
        }
        else
        {
            var _timeUser = Data.tbl_TimeUsers.Single(E => E.ID == Editid && E.Deleted == 0);

            _timeUser.UserCodey = txtCody.Value;
            _timeUser.Date = txtDate.Value;
            _timeUser.TimeLogin = TimeLogin.Value;
            _timeUser.TimeOut = TimeOut.Value;
            _timeUser.GymID = Tools.GetADminId();
            _timeUser.DateWek = Tools.DateWek(Convert.ToDateTime(txtDate.Value));
            Data.SubmitChanges();
            txtCody.Value = "";
            txtDate.Value = "";
            TimeLogin.Value = "";
            TimeOut.Value = "";
            Editid = null;
            btnOK.Text = "ثبت";
            btnOK.CssClass = "btn btn-primary me-2";
            btn_Cansel.Visible = false;
            Response.Redirect("Timex.aspx");
        }
    }

    [WebMethod]
    public static int btn_Delete(int id)
    {
        DataClassesDataContext db = new DataClassesDataContext();
        try
        {
            var q = (from k in db.tbl_TimeUsers where k.Deleted == 0 && k.ID == id select k).Single();
            q.Deleted = 1;
            db.SubmitChanges();
            //HttpContext.Current.Response.Redirect("CostType.aspx");
            return 1;

        }
        catch (Exception e)
        {
            string d = e.Message;
            return 0;
        }

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
    protected void btn_Cansel_OnClick(object sender, EventArgs e)
    {
        txtCody.Value = "";
        txtDate.Value = "";
        TimeLogin.Value = "";
        TimeOut.Value = "";
        Editid = null;
        btnOK.Text = "ثبت";
        btnOK.CssClass = "btn btn-primary me-2";
        btn_Cansel.Visible = false;
        Response.Redirect("Timex.aspx");
    }
}