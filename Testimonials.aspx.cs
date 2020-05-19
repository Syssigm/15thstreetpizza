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
    public partial class Testimonials : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    GetTestimonials();
                }
            }
            catch (Exception)
            {
                String strAppMsg = ConfigurationManager.AppSettings["GenericSystemError"];
                //lblError.Text = strAppMsg;
            }
        }

        private void GetTestimonials()
        {
            try
            {
                var db = new Pizza15Model();
                var reviews = db.tbl_Testimonials.OrderByDescending(x => x.Dates).Where(x => x.IsVerified == true).Select(t => new
                {
                    ID = t.ID,
                    Names = t.Names,
                    Title = t.Title,
                    Review = t.Review,
                    Dates = t.Dates
                }
                    ).ToList();
                rptRepeater.DataSource = reviews;
                rptRepeater.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}