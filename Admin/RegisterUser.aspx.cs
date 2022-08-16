using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_RegisterUser : System.Web.UI.Page
{
    private DataClassesDataContext Data = new DataClassesDataContext();
    public static IEnumerable<tbl_User> UserData;
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
                var QEdit = Data.tbl_Users.Single(E => E.ID == Editid && E.Deleted == 0);
                txt_Code.Value = QEdit.Code;
                txt_FullName.Value = QEdit.FullName;
                txt_Codey.Value = QEdit.Codey;
                txt_Phone.Value = QEdit.N_Phone;
                btnOK.Text = "ثبت تغیرات";
                btnOK.CssClass = "btn btn-warning me-2";
                btn_Cansel.Visible = true;
            }
        }
        UserData = Data.tbl_Users.Where(u => u.Deleted == 0 && u.GymID == Tools.GetADminId()).Select(u => u);
    }

    protected void btnOK_OnClick(object sender, EventArgs e)
    {


        if (Editid == null)
        {
            if (Data.tbl_Users.Any(a => a.Deleted == 0 && a.UserName.ToLower() == txt_Codey.Value.ToLower()))
            {
                string alert = "کد ملی وارد شده تکراری است.";
                string type = "3";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
                btn_Cansel.Visible = false;
            }
            else
            {

                if (Data.tbl_Users.Any(a => a.Deleted == 0 && a.Code.ToLower() == txt_Code.Value.ToLower()))
                {
                    string alert = "کد انتخاب شده تکراری است.";
                    string type = "3";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
                    btn_Cansel.Visible = false;
                    return;
                }
                tbl_User _tblUser = new tbl_User();
                _tblUser.Code = txt_Code.Value;
                _tblUser.FullName = txt_FullName.Value;
                _tblUser.Codey = txt_Codey.Value;
                _tblUser.N_Phone = txt_Phone.Value;
                _tblUser.UserName = txt_Codey.Value;
                _tblUser.Password = txt_Phone.Value;
                _tblUser.GymID = Tools.GetADminId();
                _tblUser.R_Date = Tools.DateTime();
                _tblUser.img = "DefaultUser.png";
                _tblUser.OkAdmin = 1;
                Data.tbl_Users.InsertOnSubmit(_tblUser);
                Data.SubmitChanges();

                #region SMS

                var IDUser = Data.tbl_Users.Single(u =>
                    u.Codey.ToLower() == txt_Codey.Value.ToLower() &&
                    u.N_Phone.ToLower() == txt_Phone.Value.ToLower()).ID;

                Tools.SmsInsertUser(IDUser , true);

                #endregion

                txt_FullName.Value = "";
                txt_Phone.Value = "";
                txt_Codey.Value = "";
                Response.Redirect("RegisterUser.aspx");
            }
        }
        else
        {
            var QEdit = Data.tbl_Users.Single(E => E.ID == Editid && E.Deleted == 0);
            if (QEdit.UserName.ToLower() != txt_Codey.Value.ToLower())
            {
                if (Data.tbl_Users.Any(a => a.Deleted == 0 && a.UserName.ToLower() == txt_Codey.Value.ToLower()))
                {
                    string alert = "نام کاربری انتخاب شده تکراری است.";
                    string type = "3";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
                    btn_Cansel.Visible = true;
                    return;
                }
            }
            if (QEdit.Code.ToLower() != txt_Code.Value.ToLower())
            {
                if (Data.tbl_Users.Any(a => a.Deleted == 0 && a.Code.ToLower() == txt_Code.Value.ToLower()))
                {
                    string alert = "کد انتخاب شده تکراری است.";
                    string type = "3";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
                    btn_Cansel.Visible = true;
                    return;
                }
            }
            QEdit.Code = txt_Code.Value;
            QEdit.FullName = txt_FullName.Value;
            QEdit.Codey = txt_Codey.Value;
            QEdit.N_Phone = txt_Phone.Value;
            QEdit.UserName = txt_Codey.Value;
            QEdit.Password = txt_Phone.Value;
            Data.SubmitChanges();
            txt_FullName.Value = "";
            txt_Phone.Value = "";
            txt_Codey.Value = "";
            Editid = null;
            btnOK.Text = "ثبت";
            btnOK.CssClass = "btn btn-primary me-2";
            btn_Cansel.Visible = false;
            Response.Redirect("RegisterUser.aspx");
        }
    }


    [WebMethod]
    public static int btn_Delete(int id)
    {
        DataClassesDataContext db = new DataClassesDataContext();
        try
        {
            var q = (from k in db.tbl_Users where k.Deleted == 0 && k.ID == id select k).Single();
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
        txt_Code.Value = "";
        txt_FullName.Value = "";
        txt_Codey.Value = "";
        txt_Phone.Value = "";
        Editid = null;
        btnOK.Text = "ثبت";
        btnOK.CssClass = "btn btn-primary me-2";
        btn_Cansel.Visible = false;
        Response.Redirect("RegisterUser.aspx");
    }

}