using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Services;
using System.Web.UI.WebControls;

public partial class Admin_RegisterTeacher : System.Web.UI.Page
{
    DataClassesDataContext Data = new DataClassesDataContext();
    public static IEnumerable<tbl_Teacher> DataTeacher;
    public static int? Editid = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        #region Temp


        //var q = Data.tbl_Teachers.Single(t => t.ID == 3);
        //var qsans = Data.tbl_Sans.Where(s => s.TechareID == q.ID).Select(s => s).ToList();
        //for (int i = 0; i < qsans.Count(); i++)
        //{
        //    qsans[i].Deleted = 0;
        //    qsans[i].TechareID = null;
        //    qsans[i].Techare = null;
        //    var qsansby = Data.tbl_SansBuys.Where(s => s.SansID == qsans[i].ID && s.Deleted == 0).Select(s => s).ToList();
        //    for (int j = 0; j < qsansby.Count(); j++)
        //    {
        //        qsansby[j].Deleted = 0;
        //    }
        //}

        //q.Deleted = 0;
        //Data.SubmitChanges();        

        #endregion

        Tools.CookiAdmin();
        Tools.AdminNotMain();

        btn_Cansel.Visible = false;
        if (!IsPostBack)
        {

            if (Editid != null)
            {
                var QEdit = Data.tbl_Teachers.Single(E => E.ID == Editid && E.Deleted == 0);

                txtFullName.Value = QEdit.FullName;
                txtCode.Value = QEdit.Code;
                txtctCody.Value = QEdit.Codey;
                txtDateBirth.Value = QEdit.D_Birth;
                txtNumberPhone.Value = QEdit.N_Phone;
                txtNumberHome.Value = QEdit.N_Home;
                txtDateBirth.Value = QEdit.D_Birth;
                txtNumberInsurance.Value = QEdit.N_Insurance;
                txtDateEInsurance.Value = QEdit.D_E_Insurance;
                txtDescription.Value = QEdit.Description;
                txtAddress.Value = QEdit.Address;

                slcGender.Items[QEdit.Gender.ToString() == "0" ? 1 : 2].Selected = true;
                slcMarital.Items[QEdit.Marital.ToString() == "0" ? 1 : 2].Selected = true;


                btn_submit.Text = "ثبت تغیرات";
                btn_submit.CssClass = "btn btn-warning me-2";
                btn_Cansel.Visible = true;
            }
        }

        DataTeacher = Data.tbl_Teachers.Where(t => t.Deleted == 0 && t.Gym_ID == Tools.GetADminId()).Select(k => k);
    }

    protected void btn_submit_OnClick(object sender, EventArgs e)
    {
        if (txtDateBirth.Value == String.Empty || txtDateEInsurance.Value == String.Empty)
        {
            string alert = "لطفا تاریخ تولد و تاریخ اعتبار بیمه را انتخاب کنید.";
            string type = "2";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
        }
        else if (slcGender.Value == "-1" || slcMarital.Value == "-1")
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
                if (Data.tbl_Teachers.Any(a => a.Deleted == 0 && a.UserName.ToLower() == txtctCody.Value.ToLower()))
                {
                    string alert = "کد ملی وارد شده تکراری است.";
                    string type = "3";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
                    btn_Cansel.Visible = false;
                }
                else
                {

                    if (Data.tbl_Teachers.Any(a => a.Deleted == 0 && a.Code.ToLower() == txtCode.Value.ToLower()))
                    {
                        string alert = "کد انتخاب شده تکراری است.";
                        string type = "3";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
                        btn_Cansel.Visible = false;
                        return;
                    }
                    //GetUser
                    tbl_Teacher UserItem = new tbl_Teacher();

                    UserItem.Code = txtCode.Value.ToLower();
                    UserItem.FullName = txtFullName.Value.ToLower();
                    UserItem.Codey = txtctCody.Value.ToLower();
                    UserItem.UserName = txtctCody.Value.ToLower();
                    UserItem.Password = txtNumberPhone.Value.ToLower();
                    UserItem.D_Birth = txtDateBirth.Value.ToLower();
                    UserItem.N_Phone = txtNumberPhone.Value.ToLower();
                    UserItem.N_Home = txtNumberHome.Value;
                    UserItem.R_Date = Tools.DateTime();
                    UserItem.N_Insurance = txtNumberInsurance.Value.ToLower();
                    UserItem.D_E_Insurance = txtDateEInsurance.Value.ToLower();
                    UserItem.Description = txtDescription.Value.ToLower();
                    UserItem.Address = txtAddress.Value.ToLower();

                    UserItem.Gym_ID = Tools.GetADminId();

                    UserItem.img = "DefaultTeacher.png";

                    UserItem.Gender = int.Parse(slcGender.Value.ToLower());
                    UserItem.Marital = int.Parse(slcMarital.Value.ToLower());

                    Data.tbl_Teachers.InsertOnSubmit(UserItem);
                    Data.SubmitChanges();
                    Response.Redirect("RegisterTeacher.aspx");
                }
            }
            else
            {
                var QEdit = Data.tbl_Teachers.Single(E => E.ID == Editid && E.Deleted == 0);
                if (QEdit.UserName.ToLower() != txtctCody.Value.ToLower())
                {
                    if (Data.tbl_Teachers.Any(a => a.Deleted == 0 && a.UserName.ToLower() == txtctCody.Value.ToLower()))
                    {
                        string alert = "نام کاربری انتخاب شده تکراری است.";
                        string type = "3";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
                        btn_Cansel.Visible = true;
                        return;
                    }
                }
                if (QEdit.Code.ToLower() != txtCode.Value.ToLower())
                {
                    if (Data.tbl_Teachers.Any(a => a.Deleted == 0 && a.Code.ToLower() == txtCode.Value.ToLower()))
                    {
                        string alert = "کد انتخاب شده تکراری است.";
                        string type = "3";
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
                        btn_Cansel.Visible = true;
                        return;
                    }
                }
                //GetUser
                var UserItem = Data.tbl_Teachers.Single(E => E.ID == Editid && E.Deleted == 0);

                UserItem.Code = txtCode.Value.ToLower();
                UserItem.FullName = txtFullName.Value.ToLower();
                UserItem.Codey = txtctCody.Value.ToLower();
                UserItem.UserName = txtctCody.Value.ToLower();
                UserItem.Password = txtNumberPhone.Value.ToLower();
                UserItem.D_Birth = txtDateBirth.Value.ToLower();
                UserItem.N_Phone = txtNumberPhone.Value.ToLower();
                UserItem.N_Home = txtNumberHome.Value;
                UserItem.R_Date = Tools.DateTime();
                UserItem.N_Insurance = txtNumberInsurance.Value.ToLower();
                UserItem.D_E_Insurance = txtDateEInsurance.Value.ToLower();
                UserItem.Description = txtDescription.Value.ToLower();
                UserItem.Address = txtAddress.Value.ToLower();
                UserItem.Gym_ID = Tools.GetADminId();
                

                UserItem.Gender = int.Parse(slcGender.Value.ToLower());
                UserItem.Marital = int.Parse(slcMarital.Value.ToLower());
                
                Data.SubmitChanges();
                Editid = null;
                btn_submit.Text = "ثبت";
                btn_submit.CssClass = "btn btn-primary me-2";
                btn_Cansel.Visible = false;
                Response.Redirect("RegisterTeacher.aspx");
            }
        }
    }
    [WebMethod]
    public static int btn_Delete(int id)
    {
        DataClassesDataContext db = new DataClassesDataContext();
        try
        {
            var q = db.tbl_Teachers.Single(t => t.ID == id);
            var qsans = db.tbl_Sans.Where(s => s.TechareID == q.ID).Select(s=>s).ToList();
            for (int i = 0; i < qsans.Count(); i++)
            {
                qsans[i].Deleted = 1;
                qsans[i].TechareID = null;
                qsans[i].Techare = null;
                var qsansby = db.tbl_SansBuys.Where(s => s.SansID == qsans[i].ID && s.Deleted == 0).Select(s => s).ToList();
                for (int j = 0; j < qsansby.Count(); j++)
                {
                    qsansby[j].Deleted = 1;
                }
            }

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
        btn_submit.Text = "ثبت";
        btn_submit.CssClass = "btn btn-primary me-2";
        btn_Cansel.Visible = false;
        Response.Redirect("RegisterTeacher.aspx");
    }
}