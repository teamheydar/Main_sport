using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_CostType : System.Web.UI.Page
{
    DataClassesDataContext Data = new DataClassesDataContext();
    public static IEnumerable<tbl_CostType> CostList;
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
                var QEdit = Data.tbl_CostTypes.Single(E => E.ID == Editid);
                txt_Type.Value = QEdit.Type;
                txt_Code.Value = QEdit.Code;
                btn_submit.Text = "ثبت تغیرات";
                btn_submit.CssClass = "btn btn-warning me-2";
                btn_Cansel.Visible = true;
            }
        }

        CostList = Data.tbl_CostTypes.OrderByDescending(c => c.ID)
            .Where(c => c.Deleted == 0 && c.Gym == Tools.GetADminId()).Select(c => c);
    }

    [WebMethod]
    public static int btn_Delete(int id)
    {
        DataClassesDataContext db = new DataClassesDataContext();
        try
        {
            var q = (from k in db.tbl_CostTypes where k.ID == id select k).Single();
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

    protected void btn_submit_OnClick(object sender, EventArgs e)
    {
        if (Editid == null)
        {
            if (Data.tbl_CostTypes.Any(a => a.Code.ToLower() == txt_Code.Value.ToLower()))
            {
                string alert = "کد انتخاب شده تکراری است.";
                string type = "3";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction",
                    "toast('" + alert + "','" + type + "');", true);
                btn_Cansel.Visible = false;
                return;
            }

            tbl_CostType costType = new tbl_CostType();
            costType.Type = txt_Type.Value;
            costType.Code = txt_Code.Value;
            costType.Gym = Tools.GetADminId();
            Data.tbl_CostTypes.InsertOnSubmit(costType);
            Data.SubmitChanges();
            txt_Type.Value = "";
            txt_Code.Value = "";
        }
        else
        {
            var QEdit = Data.tbl_CostTypes.Single(E => E.ID == Editid && E.Deleted == 0);
            if (QEdit.Code.ToLower() != txt_Code.Value.ToLower())
            {
                if (Data.tbl_CostTypes.Any(a => a.Deleted == 0 && a.Code.ToLower() == txt_Code.Value.ToLower()))
                {
                    string alert = "کد انتخاب شده تکراری است.";
                    string type = "3";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
                    btn_Cansel.Visible = true;
                    return;
                }
            }
            QEdit.Type = txt_Type.Value;
            QEdit.Code = txt_Code.Value;
            QEdit.Gym = Tools.GetADminId();
            Data.SubmitChanges();
            txt_Type.Value = "";
            txt_Code.Value = "";
            Editid = null;
            btn_submit.Text = "ثبت";
            btn_submit.CssClass = "btn btn-primary me-2";
            btn_Cansel.Visible = false;
        }
        Response.Redirect("CostType.aspx");
    }

    protected void btn_Cansel_OnClick(object sender, EventArgs e)
    {
        txt_Type.Value = "";
        txt_Code.Value = "";
        Editid = null;
        btn_submit.Text = "ثبت";
        btn_submit.CssClass = "btn btn-primary me-2";
        btn_Cansel.Visible = false;
    }
}