using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Usear_Edit : System.Web.UI.Page
{
    private DataClassesDataContext Data = new DataClassesDataContext();
    private tbl_Teacher UserItem;
    private static bool Deleteimg;
    protected void Page_Load(object sender, EventArgs e)
    {
        message.Visible = false;

        if (!IsPostBack)
        {
            Deleteimg = false;
        }

        Tools.CookiTeacher();

        var UserAny = Data.tbl_Teachers.Any(k =>
            k.UserName.ToLower() == Request.Cookies["tusername"].Value &&
            k.Password.ToLower() == Request.Cookies["tpassword"].Value &&
            k.Deleted == 0);
        if (UserAny == true)
        {
            if (!IsPostBack)
            {
                //GetUser
                UserItem = Data.tbl_Teachers.Single(u =>
                    u.UserName == Request.Cookies["tusername"].Value.ToLower() &&
                    u.Password == Request.Cookies["tpassword"].Value.ToLower() &&
                    u.Deleted == 0);

                #region ShowItem

                txtFullName.Value = UserItem.FullName;
                txtctCody.Value = UserItem.Codey;
                txtUserName.Value = UserItem.UserName;
                txtPassword.Value = UserItem.Password;
                txtDateBirth.Value = UserItem.D_Birth;
                txtNumberPhone.Value = UserItem.N_Phone;
                txtNumberHome.Value = UserItem.N_Home;
                txtDateRegister.Value = UserItem.R_Date;
                txtNumberInsurance.Value = UserItem.N_Insurance;
                txtDateEInsurance.Value = UserItem.D_E_Insurance;
                txtDescription.Value = UserItem.Description;
                txtAddress.Value = UserItem.Address;

                if (UserItem.Gender != null) slcGender.Items[(int)UserItem.Gender].Selected = true;
                if (UserItem.Marital != null) slcMarital.Items[(int)UserItem.Marital].Selected = true;


                imgUser.Src = "File/img/" + UserItem.img;

                #endregion
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void btnEditForm_OnClick(object sender, EventArgs e)
    {
        #region Update
        bool OkUserName = false;

        //GetUser
        var UserItem1 = Data.tbl_Teachers.Single(u =>
            u.UserName == Request.Cookies["tusername"].Value.ToLower() &&
            u.Password == Request.Cookies["tpassword"].Value.ToLower() &&
            u.Deleted == 0);

        if (UserItem1.UserName.ToLower() == txtUserName.Value.ToLower())
        {
            OkUserName = true;
        }
        else
        {
            var AnyUserName = Data.tbl_Teachers.Any(a =>
                a.Deleted == 0 &&
                a.UserName.ToLower() == txtUserName.Value.ToLower());

            if (AnyUserName)
            {
                OkUserName = false;

                string alert = "نام کاربری تکراری است. ";
                string type = "3";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
            }
            else
            {
                OkUserName = true;
            }
        }


        if (OkUserName)
        {
            if (txtDateBirth.Value == String.Empty || txtDateEInsurance.Value == String.Empty)
            {
                string alert = "لطفا تاریخ تولد و تاریخ اعتبار بیمه را انتخاب کنید.";
                string type = "2";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
            }
            else if (slcMarital.Value == "-1" || slcGender.Value == "-1")
            {
                string alert = "لطفا وضعیت تاهل و جنسیت را انتخاب کنید.";
                string type = "2";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
            }
            else
            {
                
                //GetUser
                UserItem = Data.tbl_Teachers.Single(u =>
                    u.UserName == Request.Cookies["tusername"].Value.ToLower()
                    &&
                    u.Password == Request.Cookies["tpassword"].Value.ToLower() &&
                    u.Deleted == 0);

                UserItem.FullName = txtFullName.Value.ToLower();
                UserItem.Codey = txtctCody.Value.ToLower();
                UserItem.UserName = txtUserName.Value.ToLower();
                UserItem.Password = txtPassword.Value.ToLower();
                UserItem.D_Birth = txtDateBirth.Value.ToLower();
                UserItem.N_Phone = txtNumberPhone.Value.ToLower();
                UserItem.N_Home = txtNumberHome.Value;
                UserItem.R_Date = txtDateRegister.Value.ToLower();
                UserItem.N_Insurance = txtNumberInsurance.Value.ToLower();
                UserItem.D_E_Insurance = txtDateEInsurance.Value.ToLower();
                UserItem.Description = txtDescription.Value.ToLower();
                UserItem.Address = txtAddress.Value.ToLower();

                UserItem.Gender = int.Parse(slcGender.Value.ToLower());
                UserItem.Marital = int.Parse(slcMarital.Value.ToLower());

                if (Deleteimg == false)
                {
                    if (IMG_User.HasFile)
                    {
                        if (Tools.FormatImg.Contains(Path.GetExtension(IMG_User.FileName)))
                        {
                            if ((IMG_User.PostedFile.ContentLength / 1024) / 1024 < Tools.Siseimg)
                            {
                                string imgpath = Server.MapPath("/Teacher/File/img/");
                                imgpath += UserItem.ID + ".png";
                                IMG_User.SaveAs(imgpath);
                                UserItem.img = UserItem.ID + ".png";
                            }
                        }
                    }
                }
                else
                {
                    UserItem.img = "DefaultTeacher.png";//Default img
                }

                Response.Cookies["tusername"].Value = txtUserName.Value.ToLower();
                Response.Cookies["tpassword"].Value = txtPassword.Value.ToLower();

                Data.SubmitChanges();

                #endregion

                Response.Redirect("Dashboard.aspx");

            }
        }
    }

    protected void btnDeleteimg_OnClick(object sender, EventArgs e)
    {
        imgUser.Src = "File/img/DefaultTeacher.png";
        Deleteimg = true;
    }
}