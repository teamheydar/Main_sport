using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_RegisterSuns : System.Web.UI.Page
{
    private DataClassesDataContext Data = new DataClassesDataContext();
    public static IEnumerable<tbl_San> SansList;
    public static int? Editid = null;
    private static int? Modal = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        Tools.CookiAdmin();
        Tools.AdminNotMain();
        TI = this;

        btn_Cansel.Visible = false;
        if (!IsPostBack)
        {

            if (Editid != null)
            {
                var QEdit = Data.tbl_Sans.Single(E =>
                    E.ID == Editid);

                txt_name.Value = QEdit.FullName;
                txt_code.Value = QEdit.Code;
                //Select_CostType.Items[QEdit.CostTypeID].Selected = true;
                //Selector_Teacher.Items[QEdit.TechareID].Selected = true;
                Gender.Items[QEdit.Gender].Selected = true;
                Day.Items[Convert.ToInt32(QEdit.Gender.ToString() == "مرد" ? "0" : "1")].Selected = true;
                D_End.Value = QEdit.D_End;
                D_start.Value = QEdit.D_Start;
                txt_Mony.Value = QEdit.Mony.ToString();

                btnOK.Text = "ثبت تغیرات";
                btnOK.CssClass = "btn btn-warning me-2";
                btn_Cansel.Visible = true;
            }

            if (Modal != null)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "ShowModal('" + Modal + "');", true);
                
            }

            //Full selector
            DataTable DtSportfild = new DataTable();
            DtSportfild.Columns.Add("ID");
            DtSportfild.Columns.Add("Text");
            DtSportfild.Rows.Add("-1", "رشته ورزشی");
            var DataSport = Data.tbl_SportFilds.Where(s =>
                s.Deleted == 0).Select(s => s);
            foreach (var item in DataSport)
            {
                DtSportfild.Rows.Add(item.ID, item.Name);
            }
            Selector_SportFild.DataSource = DtSportfild;
            Selector_SportFild.DataTextField = "Text";
            Selector_SportFild.DataValueField = "ID";
            Selector_SportFild.DataBind();
            Selector_SportFild.Items[0].Selected = true;

            //-----
            DataTable T = new DataTable();
            T.Columns.Add("ID");
            T.Columns.Add("Text");
            T.Rows.Add("-1", "مربی");
            var DataT = Data.tbl_Teachers.Where(s => s.Deleted == 0 && s.Gym_ID == Tools.GetADminId()).Select(s => s);
            foreach (var item in DataT)
            {
                T.Rows.Add(item.ID, item.FullName);
            }

            Selector_Teacher.DataSource = T;
            Selector_Teacher.DataTextField = "Text";
            Selector_Teacher.DataValueField = "ID";
            Selector_Teacher.DataBind();
            Selector_Teacher.Items[0].Selected = true;

            T.Rows[0].Delete();
            Mo_Teacher.DataSource = T;
            Mo_Teacher.DataTextField = "Text";
            Mo_Teacher.DataValueField = "ID";
            Mo_Teacher.DataBind();
            Mo_Teacher.Items[0].Selected = true;

            //get Data
            SansList = Data.tbl_Sans.Where(s =>
                s.GymID == Tools.GetADminId()).Select(s => s);
        }

        Selector_SportFild.Items[0].Attributes["disabled"] = "disabled";
        Selector_Teacher.Items[0].Attributes["disabled"] = "disabled";
    }

    protected void btnOK_OnClick(object sender, EventArgs e)
    {
        try
        {
            int Mony = int.Parse(txt_Mony.Value);
        }
        catch (Exception exception)
        {
            string alert = "لطفا هزینه سانس را درست وارد کنید.";
            string type = "2";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);

            return;
        }
        if (D_start.Value == String.Empty || D_End.Value == String.Empty)
        {
            string alert = "لطفا تاریخ شروع و تاریخ پایان را انتخاب کنید.";
            string type = "2";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
        }
        else if (Gender.Value == "-1" ||
                 Selector_SportFild.Value == "-1" ||
                 Selector_Teacher.Value == "-1" ||
                 Day.Value == "-1")
        {
            string alert = "لطفا رشته ورزشی ، جنسیت ، مربی و روز برگزاری را انتخاب کنید.";
            string type = "2";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
            btn_Cansel.Visible = false;
        }
        else if (Editid == null)
        {
            if (Data.tbl_Sans.Any(a => a.Code.ToLower() == txt_code.Value.ToLower()))
            {
                string alert = "کد انتخاب شده تکراری است.";
                string type = "3";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
                btn_Cansel.Visible = false;
                return;
            }
            tbl_San san = new tbl_San();
            san.FullName = txt_name.Value;
            san.SportFildID = int.Parse(Selector_SportFild.Value);
            san.SportFild = Data.tbl_SportFilds.Select(s => new { s.ID, s.Name, s.Deleted }).Single(s => s.Deleted == 0 && s.ID == int.Parse(Selector_SportFild.Value)).Name;
            san.TechareID = int.Parse(Selector_Teacher.Value);
            san.Techare = Data.tbl_Teachers.Select(s => new { s.ID, s.FullName, s.Deleted }).Single(s => s.Deleted == 0 && s.ID == int.Parse(Selector_Teacher.Value)).FullName;
            san.Gender = Gender.SelectedIndex == 0 ? 0 : 1;
            san.D_Start = D_start.Value;
            san.D_End = D_End.Value;
            san.Mony = int.Parse(txt_Mony.Value);
            san.Days = Day.Value;
            san.GymID = Tools.GetADminId();
            san.Gym = Data.tbl_Admins.Single(a => a.Deleted == 0 && a.ID == Tools.GetADminId()).FullNameGym;
            san.Code = txt_code.Value;

            Data.tbl_Sans.InsertOnSubmit(san);
            Data.SubmitChanges();

            Response.Redirect("~/Admin/RegisterSuns.aspx");
        }
        else
        {
            var san = Data.tbl_Sans.Single(E => E.ID == Editid);
            if (san.Code.ToLower() != txt_code.Value.ToLower())
            {
                if (Data.tbl_Sans.Any(a => a.Deleted == 0 && a.Code.ToLower() == txt_code.Value.ToLower()))
                {
                    string alert = "کد انتخاب شده تکراری است.";
                    string type = "3";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
                    btn_Cansel.Visible = true;
                    return;
                }
            }
            san.FullName = txt_name.Value;
            san.SportFildID = int.Parse(Selector_SportFild.Value);
            san.SportFild = Data.tbl_SportFilds.Select(s => new { s.ID, s.Name, s.Deleted }).Single(s => s.Deleted == 0 && s.ID == int.Parse(Selector_SportFild.Value)).Name;
            san.TechareID = int.Parse(Selector_Teacher.Value);
            san.Techare = Data.tbl_Teachers.Select(s => new { s.ID, s.FullName, s.Deleted }).Single(s => s.Deleted == 0 && s.ID == int.Parse(Selector_Teacher.Value)).FullName;
            san.Gender = Gender.SelectedIndex == 0 ? 0 : 1;
            san.D_Start = D_start.Value;
            san.D_End = D_End.Value;
            san.Mony = int.Parse(txt_Mony.Value);
            san.Days = Day.Value;
            san.GymID = Tools.GetADminId();
            san.Gym = Data.tbl_Admins.Single(a => a.Deleted == 0 && a.ID == Tools.GetADminId()).FullNameGym;
            san.Code = txt_code.Value;
            Data.SubmitChanges();

            txt_name.Value = "";
            Selector_Teacher.Items[0].Selected = true;
            Gender.Items[0].Selected = true;
            Day.Items[0].Selected = true;
            D_End.Value = "";
            D_start.Value = "";
            txt_Mony.Value = "";

            Editid = null;
            btnOK.Text = "ثبت";
            btnOK.CssClass = "btn btn-primary me-2";
            btn_Cansel.Visible = false;
            Response.Redirect("~/Admin/RegisterSuns.aspx");
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
    [WebMethod]
    public static int btn_Delete(int id)
    {
        DataClassesDataContext db = new DataClassesDataContext();
        try
        {
            var q = (from k in db.tbl_Sans where k.ID == id && k.Deleted == 0 select k).Single();
            var SansBuy = db.tbl_SansBuys.Where(s =>
                       s.SansID == id &&
                       s.Deleted == 0).ToList();

            for (int i = 0; i < SansBuy.Count(); i++)
            {
                SansBuy[i].Deleted = 1;
            }
            db.tbl_Sans.DeleteOnSubmit(q);
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
        txt_name.Value = "";
        Selector_Teacher.Items[0].Selected = true;
        Gender.Items[0].Selected = true;
        Day.Items[0].Selected = true;
        D_End.Value = "";
        D_start.Value = "";
        txt_Mony.Value = "";

        Editid = null;
        btnOK.Text = "ثبت";
        btnOK.CssClass = "btn btn-primary me-2";
        btn_Cansel.Visible = false;
        Response.Redirect("RegisterSuns.aspx");

    }

    [WebMethod]
    public static int _NotActive(int id)
    {
        DataClassesDataContext Data = new DataClassesDataContext();
        var Admin = Data.tbl_Sans.Single(a =>
            a.Deleted == 0 &&
            a.ID == id);
        var qsansby = Data.tbl_SansBuys.Where(a => a.Deleted == 0 && a.SansID == Admin.ID).ToList();
        for (int i = 0; i < qsansby.Count(); i++)
        {
            qsansby[i].Deleted = 1;
        }
        Admin.Deleted = 1;
        Data.SubmitChanges();
        return 1;

    }

    public static Page P = new Page();
    public static dynamic TI = new Page();

    [WebMethod]
    public static int _Active(int id)
    {
        DataClassesDataContext Data = new DataClassesDataContext();
        var Admin = Data.tbl_Sans.Single(a =>
            a.ID == id);
        if (Admin.Techare == null && Admin.TechareID == null)
        {
            P.ClientScript.RegisterStartupScript(TI.GetType(), "CallMyFunction", "ShowModal();", true);
            Modal = id;
            return 1;
        }
        else
        {
            var qsansby = Data.tbl_SansBuys.Where(a => a.Deleted == 0 && a.SansID == Admin.ID).ToList();
            for (int i = 0; i < qsansby.Count(); i++)
            {
                qsansby[i].Deleted = 0;
            }
            Admin.Deleted = 0;
            Data.SubmitChanges();
            return 1;
        }
    }

    protected void Mo_Enter_OnClick(object sender, EventArgs e)
    {
        int id = -1;
        if (Modal != null)
        {
            id = Modal.Value;
        }

        var Admin = Data.tbl_Sans.Single(a =>
            a.ID == id);
        var qsansby = Data.tbl_SansBuys.Where(a => a.Deleted == 0 && a.SansID == Admin.ID).ToList();
        for (int i = 0; i < qsansby.Count(); i++)
        {
            qsansby[i].Deleted = 0;
        }
        Admin.Deleted = 0;
        Admin.TechareID = int.Parse(Mo_Teacher.Value);
        Admin.Techare = Data.tbl_Teachers.Select(s => new { s.ID, s.FullName, s.Deleted }).Single(s => s.Deleted == 0 && s.ID == int.Parse(Mo_Teacher.Value)).FullName;
        Modal = null;
        Data.SubmitChanges();
        Response.Redirect("RegisterSuns.aspx");
    }
}