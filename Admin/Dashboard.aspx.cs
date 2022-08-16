using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Usear_Profile : System.Web.UI.Page
{
    DataClassesDataContext Data = new DataClassesDataContext();

    //Main Admin
    public int CountAllUser;
    public int CountAllTeacher;
    public int CountAllGym;
    //!Main Admin
    public int UserCount;
    public int UserMyGtmCount;
    public int UserNotOkAdmin;
    public int UserOkAdmin;
    public int Teacher;
    public int CountDayGym;
    protected void Page_Load(object sender, EventArgs e)
    {
        Tools.CookiAdmin();

        Tools.DateEAdmin();

        if (Tools.AdminLevel())
        {
            CountAllUser = Data.tbl_Users.Count(u =>
                u.Deleted == 0);

            CountAllTeacher = Data.tbl_Teachers.Count(t =>
                t.Deleted == 0);

            CountAllGym = Data.tbl_Admins.Count(g =>
                g.Deleted == 0);
        }
        else if (!Tools.AdminLevel())
        {
            UserCount = Data.tbl_Users.Count(u => u.Deleted == 0);

            UserMyGtmCount = Data.tbl_Users.Count(u =>
                u.Deleted == 0 &&
                u.GymID == Tools.GetADminId());

            UserNotOkAdmin = Data.tbl_Users.Count(u =>
                u.Deleted == 0 &&
                u.OkAdmin == 0 &&
                u.GymID == Tools.GetADminId());

            UserOkAdmin = Data.tbl_Users.Count(u =>
                u.Deleted == 0 &&
                u.OkAdmin == 1 &&
                u.GymID == Tools.GetADminId());

            Teacher = Data.tbl_Teachers.Count(t =>
                t.Deleted == 0 &&
                t.Gym_ID == Tools.GetADminId());

            var AdminE = Data.tbl_Admins.Single(k =>
                k.UserName.ToLower() == Request.Cookies["ausername"].Value &&
                k.Password.ToLower() == Request.Cookies["apassword"].Value &&
                k.Deleted == 0).E_DateGym;

            CountDayGym = (Convert.ToDateTime(AdminE) -
                           Convert.ToDateTime(Tools.DateTime())).Days;
        }


        #region Get_Usear_Data

        var Full = Data.tbl_Admins.Any(k =>
            k.UserName.ToLower() == Request.Cookies["ausername"].Value
            &&
            k.Password.ToLower() == Request.Cookies["apassword"].Value
            &&
            k.Deleted == 0);
        if (Full)
        {
            //Query
            var UserData = Data.tbl_Admins.SingleOrDefault(k =>
                k.UserName.ToLower() == Request.Cookies["ausername"].Value
                &&
                k.Password.ToLower() == Request.Cookies["apassword"].Value&&
                k.Deleted == 0);

            #region Show

            ImgUser.ImageUrl = "File/img/" + UserData.img;
            h4_FullName.InnerText = UserData.FullName;
            Span_FullName.InnerText = UserData.FullName;
            span_NumberPhone.InnerText = UserData.N_Phone;
            span_Codey.InnerText = UserData.Codey.ToString();
            span_NumberHome.InnerHtml = UserData.N_Home;
            span_UserName.InnerText = UserData.UserName;

            #endregion
        }
        else
        {
            Response.Redirect("EditProfile.aspx");
        }
    }

    #endregion
}