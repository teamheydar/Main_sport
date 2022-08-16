using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_RegisterGym : System.Web.UI.Page
{
    DataClassesDataContext Data = new DataClassesDataContext();
    public IEnumerable<tbl_Admin> ListAdmin = new List<tbl_Admin>();
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
                var QEdit = Data.tbl_Admins.Single(E => E.ID == Editid && E.Deleted == 0);

                Code.Value = QEdit.Code;
                NameGym.Value = QEdit.FullNameGym;
                NPhoneGym.Value = QEdit.N_PhoneGym;
                AddressGym.Value = QEdit.AddressGym;
                DescriptionGym.Value = QEdit.DescriptionGym;
                Name.Value = QEdit.FullName;
                UserName.Value = QEdit.UserName;
                Password.Value = QEdit.Password;
                Codey.Value = QEdit.Codey;
                DateBirth.Value = QEdit.D_Birth;
                NPhone.Value = QEdit.N_Phone;
                NHome.Value = QEdit.N_Home;
                DateE.Value = QEdit.E_DateGym;
                Address.Value = QEdit.Address;
                

                Insert.Text = "ثبت تغیرات";
                Insert.CssClass = "btn btn-warning me-2";
                btn_Cansel.Visible = true;
            }

        }

        ListAdmin = Data.tbl_Admins.Where(a =>
            a.Deleted == 0 &&
            a.AdminLevel == 0);
    }

    protected void Insert_OnClick(object sender, EventArgs e)
    {
        if (DateBirth.Value == String.Empty || DateE.Value == String.Empty)
        {
            string alert = "لطفا تاریخ تولد و تاریخ اعتبار بیمه را انتخاب کنید.";
            string type = "2";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
        }
        else if (Marital.Value == "-1" || Gender.Value == "-1")
        {
            string alert = "لطفا وضعیت تاهل و جنسیت را انتخاب کنید.";
            string type = "2";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
            btn_Cansel.Visible = true;
        }
        else
        {
            if (Editid == null)
            {
                if (Data.tbl_Admins.Any(a =>
                        a.UserName.ToLower() == UserName.Value.ToLower() &&
                        a.Deleted == 0))
                {
                    string alert = "نام کاربری انتخاب شده تکراری است.";
                    string type = "3";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
                    btn_Cansel.Visible = true;
                }
                else
                {

                    if (Data.tbl_Admins.Any(a => a.Deleted == 0 && a.Code.ToLower() == Code.Value.ToLower()))
                    {
                        string alert = "کد انتخاب شده تکراری است.";
                        string type = "3";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
                        btn_Cansel.Visible = true;
                        return;
                    }
                    tbl_Admin _Admin = new tbl_Admin();

                    //Gym
                    _Admin.FullNameGym = NameGym.Value;
                    _Admin.N_PhoneGym = NPhoneGym.Value;
                    _Admin.AddressGym = AddressGym.Value;
                    _Admin.DescriptionGym = DescriptionGym.Value;

                    //Admin
                    _Admin.FullName = Name.Value;
                    _Admin.UserName = UserName.Value;
                    _Admin.Password = Password.Value;
                    _Admin.Codey = Codey.Value;
                    _Admin.D_Birth = DateBirth.Value;
                    _Admin.N_Phone = NPhone.Value;
                    _Admin.N_Home = NHome.Value;
                    _Admin.Gender = int.Parse(Gender.Value);
                    _Admin.Marital = int.Parse(Marital.Value);
                    _Admin.E_DateGym = DateE.Value;
                    _Admin.Address = Address.Value;

                    _Admin.Code = Code.Value;

                    _Admin.R_DateGym = Tools.DateTime();

                    _Admin.img = "DefaultAdmin.png";

                    Data.tbl_Admins.InsertOnSubmit(_Admin);
                    Data.SubmitChanges();
                }

            }
            else
            {
                var _Admin = Data.tbl_Admins.Single(E => E.ID == Editid && E.Deleted == 0);
                if (_Admin.UserName.ToLower() != UserName.Value.ToLower())
                {
                    if (Data.tbl_Admins.Any(a =>
                            a.UserName.ToLower() == UserName.Value.ToLower() && a.Deleted == 0))
                    {
                        string alert = "نام کاربری انتخاب شده تکراری است.";
                        string type = "3";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
                        btn_Cansel.Visible = true;
                        return;
                    }
                }
                if (_Admin.Code.ToLower() != Code.Value.ToLower())
                {
                    if (Data.tbl_Admins.Any(a => a.Deleted == 0 && a.Code.ToLower() == Code.Value.ToLower()))
                    {
                        string alert = "کد انتخاب شده تکراری است.";
                        string type = "3";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
                        btn_Cansel.Visible = true;
                        return;
                    }
                }

                //Gym
                _Admin.FullNameGym = NameGym.Value;
                _Admin.N_PhoneGym = NPhoneGym.Value;
                _Admin.AddressGym = AddressGym.Value;
                _Admin.DescriptionGym = DescriptionGym.Value;

                //Admin
                _Admin.FullName = Name.Value;
                _Admin.UserName = UserName.Value;
                _Admin.Password = Password.Value;
                _Admin.Codey = Codey.Value;
                _Admin.D_Birth = DateBirth.Value;
                _Admin.N_Phone = NPhone.Value;
                _Admin.N_Home = NHome.Value;
                _Admin.Gender = int.Parse(Gender.Value);
                _Admin.Marital = int.Parse(Marital.Value);
                _Admin.E_DateGym = DateE.Value;
                _Admin.Address = Address.Value;
                _Admin.Code = Code.Value;
                Data.SubmitChanges();

                Editid = null;
                Insert.Text = "ثبت";
                Insert.CssClass = "btn btn-primary me-2";
                btn_Cansel.Visible = false;

            }
            Response.Redirect("RegisterGym.aspx");
        }
    }

    [WebMethod]
    public static int btn_Delete(int id)
    {
        DataClassesDataContext db = new DataClassesDataContext();
        try
        {
            var q = (from k in db.tbl_Admins where k.ID == id select k).Single();
            var UserAdmin = db.tbl_Users.Where(u =>
                u.GymID == q.ID &&
                u.Deleted == 0);
            var SansAdmin = db.tbl_Sans.Where(s =>
                s.Deleted == 0 &&
                s.GymID == q.ID);
            var SansBuyAdmin = db.tbl_SansBuys.Where(b =>
                b.Deleted == 0);

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

        Editid = null;
        Insert.Text = "ثبت";
        Insert.CssClass = "btn btn-primary me-2";
        btn_Cansel.Visible = false;
        Response.Redirect("RegisterGym.aspx");
    }
    [WebMethod]
    public static int _NotActive(int id)
    {
        DataClassesDataContext Data = new DataClassesDataContext();
        var Admin = Data.tbl_Admins.Single(a =>
            a.Deleted == 0 &&
            a.ID == id);
        Admin.Active = 1;
        Data.SubmitChanges();
        return 1;

    }
    [WebMethod]
    public static int _Active(int id)
    {
        DataClassesDataContext Data = new DataClassesDataContext();
        var Admin = Data.tbl_Admins.Single(a =>
            a.Deleted == 0 &&
            a.ID == id);
        Admin.Active = 0;
        Data.SubmitChanges();
        return 1;
    }
}