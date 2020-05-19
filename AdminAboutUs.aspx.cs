using _15thstreetpizza.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PizzaV5
{
    public partial class AdminAboutUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                try
                {
                    if ((Session["UserName"] == null) || (Session["UserName"].ToString() == string.Empty))
                    {
                        Response.Redirect("Login.aspx?ReturnUrl=%2fadminhome.aspx", false);
                    }
                    else
                    {
                        GetData();
                    }

                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                }
            }
        }

        private void GetData()
        {
            try
            {
                var db = new Pizza15Model();
                var AboutUs = db.tblAboutUs.FirstOrDefault(x => x.ID.Equals(1));
                if(AboutUs != null)
                {
                    txtAboutUs.Text = Server.HtmlEncode(AboutUs.AboutUs);
                }
            }
            catch
            {
                lblError.Text = "Internal server error";
            }
         }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var db = new Pizza15Model();
            tblAboutU About = db.tblAboutUs.FirstOrDefault(x => x.ID.Equals(1));
            if(About != null)
            {
                About.AboutUs = Server.HtmlDecode(txtAboutUs.Text);
                db.SaveChanges();
                lblError.Text = "Saved data successfully";
            }
        }
    }
}