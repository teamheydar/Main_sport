using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    private DataClassesDataContext Data = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        message.Visible = false;

        if (!IsPostBack)
        {
            DataTable DT = new DataTable();
            DT.Columns.Add("Text");
            DT.Columns.Add("Value");
            DT.Rows.Add("0", "انتخاب باشگاه");

            var Admis = Data.tbl_Admins
                .Select(a => new { a.ID, a.FullNameGym, a.Deleted, a.AdminLevel })
                .Where(a => a.Deleted == 0 && a.AdminLevel == 0);

            foreach (var Item in Admis)
            {
                DT.Rows.Add(Item.ID, Item.FullNameGym);
            }

            selectGym.DataSource = DT;
            selectGym.DataTextField = "Value";
            selectGym.DataValueField = "Text";
            selectGym.DataBind();
            selectGym.Items[0].Selected = true;
            selectGym.Items[0].Attributes["disabled"] = "disabled";
        }
    }


    protected void btnRegister_OnClick(object sender, EventArgs e)
    {
        if (txtFulName.Value == "" ||
            txtCodey.Value == "" ||
            txtNumberPhone.Value == "" ||
            selectGym.Value == "0")
        //Not Null Inputs
        {
            //Message Error
            message.InnerText = "لطفا اطلاعات را به درستی وارد کنید!";
            message.Visible = true;

        }
        else
        {
            var UserAny = Data.tbl_Users.Any(u => u.UserName == txtCodey.Value
            && u.Deleted == 0);
            if (UserAny)
            {
                message.InnerText = "کد ملی شما تکراری میباشد.";
                message.Visible = true;
            }
            else
            {

                #region Insert

                tbl_User user = new tbl_User();

                user.FullName = txtFulName.Value.ToLower();
                user.Codey = txtCodey.Value.ToLower();
                user.N_Phone = txtNumberPhone.Value.ToLower();
                user.R_Date = Tools.DateTime();
                user.img = "DefaultUser.png";
                user.GymID = int.Parse(selectGym.Value);

                user.UserName = txtCodey.Value.ToLower();
                user.Password = txtNumberPhone.Value.ToLower();

                Data.tbl_Users.InsertOnSubmit(user);
                Data.SubmitChanges();

                #endregion

                #region SMS

                var IDUser = Data.tbl_Users.Single(u =>
                    u.Codey.ToLower() == txtCodey.Value.ToLower() &&
                    u.N_Phone.ToLower() == txtNumberPhone.Value.ToLower()).ID;

                Tools.SmsInsertUser(IDUser , false);

                #endregion

                Response.Redirect("Login.aspx");
            }
        }
    }
}