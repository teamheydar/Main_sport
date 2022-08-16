using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Master_Pages_Panel : System.Web.UI.MasterPage
{

    DataClassesDataContext Data = new DataClassesDataContext();


    public void Page_Load(object sender, EventArgs e)
    {
        #region Get_User_Data


        //Enter User
        var UserAny = Data.tbl_Teachers.Any(k =>
            k.UserName.ToLower() == Request.Cookies["tusername"].Value
            &&
            k.Password.ToLower() == Request.Cookies["tpassword"].Value
            &&
            k.Deleted == 0);

        if (UserAny == true)
        {

            var UserData = Data.tbl_Teachers.Single(k =>
                k.ID == Tools.GetIDTeacher() &&
                k.Deleted == 0
            );

            P_FullName.InnerText = UserData.FullName;
            imgPanel.Src = "File/img/" + UserData.img;
            imgPanelHed.Src = "File/img/" + UserData.img;

            #region Show CMS

            try
            {

                var CMS = Data.tbl_CMs.Single();

                MainTitel.InnerText = CMS.PanelTitel;
                FoterTitel.InnerText = CMS.PanelTitel;
                TextFoter.InnerText = CMS.TextFoter;
            }
            catch (Exception exception) { }

            #endregion

        }
        else
        {
            Response.Redirect("Login.aspx");
        }


        #endregion

    }

    protected void Exit_OnClick(object sender, EventArgs e)
    {
        Response.Cookies["tusername"].Expires = DateTime.Now.AddDays(-1);
        Response.Cookies["tpassword"].Expires = DateTime.Now.AddDays(-1);

        Response.Redirect("Login.aspx");

    }

}
