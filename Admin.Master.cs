using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PizzaV5
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var UserName = Session["UserName"];
            lblWelcome.Text = "Welcome, " + UserName;
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("Logout.aspx", false);
        }
    }
}