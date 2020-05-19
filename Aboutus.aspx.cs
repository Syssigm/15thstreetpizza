using _15thstreetpizza.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _15thstreetpizza
{
    public partial class Aboutus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    GetAboutUs();
                }
            }
            catch
            {
                String strAppMsg = ConfigurationManager.AppSettings["GenericSystemError"];
                //lblError.Text = strAppMsg;
            }
        }

        private void GetAboutUs()
        {
            try
            {
                var db = new Pizza15Model();
                var Abouts = db.tblAboutUs.ToList();
                if (Abouts.Count > 0)
                {
                    lblAboutUs.Text = Server.HtmlDecode(Abouts[0].AboutUs);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}