using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.ServiceModel.Channels;
using System.Web;
using System.Web.Script.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_CMS : System.Web.UI.Page
{
    private DataClassesDataContext Data = new DataClassesDataContext();
    public tbl_CM Cms = new tbl_CM();
    public static bool[] Deleteimg = new bool[3];
    protected void Page_Load(object sender, EventArgs e)
    {

        Tools.CookiAdmin();
        Tools.AdminMain();

        if (!IsPostBack)
        {
            Cms = Data.tbl_CMs.SingleOrDefault();

            //show
            Titel.Value = Cms.PanelTitel;
            FoterPanel.Value = Cms.TextFoter;
            CartTitel.Value = Cms.TitelCart;
            CartText.Value = Cms.TextCart;
            AboutTitel.Value = Cms.TitelMinAbut;
            AboutText.Value = Cms.TextMinAbut;
            Address.Value = Cms.Address;
            Description.Value = Cms.Description;
            NumberPhone.Value = Cms.NumberPhone;
            Foter.Value = Cms.FoterMain;
            ATitel.Value = Cms.ATitel;
            AText.Value = Cms.AText;
            //ATitel1.Value = Cms.ATitel1;
            //ATitel2.Value = Cms.ATitel2;
            //ATitel3.Value = Cms.ATitel3;
            //AText1.Value = Cms.AText1;
            //AText2.Value = Cms.AText2;
            //AText3.Value = Cms.AText3;

        }
    }

    protected void btnOK_OnClick(object sender, EventArgs e)
    {
        Cms = Data.tbl_CMs.SingleOrDefault();

        Cms.PanelTitel = Titel.Value;
        Cms.TextFoter = FoterPanel.Value;
        Cms.TitelCart = CartTitel.Value;
        Cms.TextCart = CartText.Value;
        Cms.TitelMinAbut = AboutTitel.Value;
        Cms.TextMinAbut = AboutText.Value;
        Cms.Address = Address.Value;
        Cms.Description = Description.Value;
        Cms.NumberPhone = NumberPhone.Value;
        Cms.FoterMain = Foter.Value;
        Cms.ATitel = ATitel.Value;
        Cms.AText = AText.Value;
        //Cms.ATitel1 = ATitel1.Value;
        //Cms.ATitel2 = ATitel2.Value;
        //Cms.ATitel3 = ATitel3.Value;
        //Cms.AText1 = AText1.Value;
        //Cms.AText2 = AText2.Value;
        //Cms.AText3 = AText3.Value;

        if (Deleteimg[0])
        {
            Cms.Slidimg1 = "";

        }
        if (Deleteimg[1])
        {
            Cms.Slidimg2 = "";

        }
        if (Deleteimg[2])
        {
            Cms.Slidimg3 = "";

        }

        #region FileUpload

        if (FileLogo.HasFile)
        {
            if (Tools.FormatImg.Contains(Path.GetExtension(FileLogo.FileName)))
            {
                if ((FileLogo.PostedFile.ContentLength / 1024) / 1024 < Tools.Siseimg)
                {
                    string Logopath = Server.MapPath("/File/img/");
                    Logopath += "Logo.png";
                    FileLogo.SaveAs(Logopath);
                    Cms.imgTitel = "Logo.png";
                }
                else
                {
                    string alert = "فایل لوگو : حجم فایل زیاد است. ";
                    string type = "3";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
                }
            }
            else
            {
                string alert = "فایل لوگو : فرمت فایل نا معتبر است. ";
                string type = "3";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
            }
        }

        if (FileSlid1.HasFile)
        {
            if (Tools.FormatImg.Contains(Path.GetExtension(FileSlid1.FileName)))
            {
                if ((FileSlid1.PostedFile.ContentLength / 1024) / 1024 < Tools.Siseimg)
                {
                    string Logopath = Server.MapPath("/File/img/");
                    Logopath += "Slid1.png";
                    FileSlid1.SaveAs(Logopath);
                    Cms.Slidimg1 = "Slid1.png";
                }
                else
                {
                    string alert = "فایل اسلایدر 1 : حجم فایل زیاد است. ";
                    string type = "3";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
                }
            }
            else
            {
                string alert = "فایل اسلایدر 1 : فرمت فایل نا معتبر است. ";
                string type = "3";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
            }
        }

        if (FileSlid2.HasFile)
        {
            if (Tools.FormatImg.Contains(Path.GetExtension(FileSlid2.FileName)))
            {
                if ((FileSlid2.PostedFile.ContentLength / 1024) / 1024 < Tools.Siseimg)
                {
                    string Logopath = Server.MapPath("/File/img/");
                    Logopath += "Slid2.png";
                    FileSlid2.SaveAs(Logopath);
                    Cms.Slidimg2 = "Slid2.png";
                }
                else
                {
                    string alert = "فایل اسلایدر 2 : حجم فایل زیاد است. ";
                    string type = "3";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
                }
            }
            else
            {
                string alert = "فایل اسلایدر 2 : فرمت فایل نا معتبر است. ";
                string type = "3";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
            }
        }

        if (FileSlid3.HasFile)
        {
            if (Tools.FormatImg.Contains(Path.GetExtension(FileSlid3.FileName)))
            {
                if ((FileSlid3.PostedFile.ContentLength / 1024) / 1024 < Tools.Siseimg)
                {
                    string Logopath = Server.MapPath("/File/img/");
                    Logopath += "Slid3.png";
                    FileSlid3.SaveAs(Logopath);
                    Cms.Slidimg3 = "Slid3.png";
                }
                else
                {
                    string alert = "فایل اسلایدر 3 : حجم فایل زیاد است. ";
                    string type = "3";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
                }
            }
            else
            {
                string alert = "فایل اسلایدر 3 : فرمت فایل نا معتبر است. ";
                string type = "3";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
            }
        }

        if (FileAbout.HasFile)
        {
            if (Tools.FormatImg.Contains(Path.GetExtension(FileAbout.FileName)))
            {
                if ((FileAbout.PostedFile.ContentLength / 1024) / 1024 < Tools.Siseimg)
                {
                    string Logopath = Server.MapPath("/File/img/");
                    Logopath += "Aboutimg.png";
                    FileAbout.SaveAs(Logopath);
                    Cms.imgMinAbut = "Aboutimg.png";
                }
                else
                {
                    string alert = "فایل توضیحات : حجم فایل زیاد است. ";
                    string type = "3";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
                }
            }
            else
            {
                string alert = "فایل توضیحات : فرمت فایل نا معتبر است. ";
                string type = "3";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "toast('" + alert + "','" + type + "');", true);
            }
        }

        #endregion

        

        Cms.MapX = xx.Value;
        Cms.MapY = yy.Value;

        Data.SubmitChanges();

        //Response.Redirect("CMS.aspx");//Page Refresh
    }

    protected void BtnDeleteSlid1_OnClick(object sender, EventArgs e)
    {
        Deleteimg[0] = true;
    }

    protected void BtnDeleteSlid2_OnClick(object sender, EventArgs e)
    {
        Deleteimg[1] = true;
    }

    protected void BtnDeleteSlid3_OnClick(object sender, EventArgs e)
    {
        Deleteimg[2] = true;
    }
}