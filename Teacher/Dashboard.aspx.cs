using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Profile : System.Web.UI.Page
{
    public DataClassesDataContext Data = new DataClassesDataContext();
    public tbl_User UserData = new tbl_User();

    public IEnumerable<tbl_San> TeacherSans = new List<tbl_San>();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region Get_User_Data

        Tools.CookiTeacher();

        //Enter User
        var UserAny = Data.tbl_Teachers.Any(k =>
            k.UserName.ToLower() == Request.Cookies["tusername"].Value
            &&
            k.Password.ToLower() == Request.Cookies["tpassword"].Value
            &&
            k.Deleted == 0
        );

        if (UserAny == true)
        {

            var UserData = Data.tbl_Teachers.Single(k =>
                k.UserName.ToLower() == Request.Cookies["tusername"].Value &&
                k.Password.ToLower() == Request.Cookies["tpassword"].Value &&
                k.Deleted == 0);

            TeacherSans = Data.tbl_Sans.Where(s =>
                s.Deleted == 0 &&
                s.TechareID == UserData.ID);

            #region Show

            ImgUser.ImageUrl = "File/img/" + UserData.img;
            h4_FullName.InnerText = UserData.FullName;
            Span_FullName.InnerText = UserData.FullName;
            span_NumberPhone.InnerText = UserData.N_Phone;
            span_Codey.InnerText = UserData.Codey;
            span_NumberHome.InnerHtml = UserData.N_Home;
            span_UserName.InnerText = UserData.UserName;

            #endregion

        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    #endregion

}