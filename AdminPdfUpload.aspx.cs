using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PizzaV5
{
    public partial class AdminPdfUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["UserName"].ToString() == string.Empty))
            {
                Response.Redirect("Login.aspx?ReturnUrl=%2fadminhome.aspx", false);
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            try
            {
                if (FileUpload1.HasFile)
                {
                    string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    string extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("/content/") + "15thPDFMenu" + extension);
                    lblerror.ForeColor = System.Drawing.Color.Green;
                    lblerror.Text = "PDF File Uploaded Succesfully";
                }
                else
                {
                    lblerror.ForeColor = System.Drawing.Color.Red;
                    lblerror.Text = "Please Select PDF File and Upload";
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
        }
    }
}