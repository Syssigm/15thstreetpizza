using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PizzaV5
{
    public partial class AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if( (Session["UserName"] == null ) || ( Session["UserName"].ToString() == string.Empty))
                    Response.Redirect("Login.aspx?ReturnUrl=%2fadminhome.aspx", false);
            }
        }

        protected void imgHome_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Default.aspx", false);
        }
    }
}