using _15thstreetpizza.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _15thstreetpizza
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblErrorMsg.Text = "";
            if ((Session["UserName"] != null) && (Session["UserName"].ToString() != ""))
            {
                Response.Redirect("AdminHome.aspx", false);
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var db = new Pizza15Model();
            var login = db.tbl_UserLogin.Where(x => x.UserName.Equals(txtUserName.Text.Trim()) && x.Password.Equals(txtPassword.Text.Trim())).Select(x => new
            {
                UserName = x.UserName
            }).ToList();
            if (login.Count != 0)
            {
                Session["UserName"] = login[0].UserName;
                FormsAuthentication.RedirectFromLoginPage(txtUserName.Text, true);
                //Response.Redirect("AdminHome.aspx", false);
            }

            //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Pizza15thConnectionString"].ConnectionString);
            //con.Open();
            //SqlCommand cmd = new SqlCommand("select * from tbl_UserLogin where UserName=@username and Password=@password", con);
            //cmd.Parameters.AddWithValue("@username", txtUserName.Text);
            //cmd.Parameters.AddWithValue("@password", txtPassword.Text);
            //SqlDataAdapter da = new SqlDataAdapter(cmd);
            //DataTable dt = new DataTable();
            //da.Fill(dt);
            //if (dt.Rows.Count > 0)
            //{
            //    Response.Redirect("~/Admin_Keywords.aspx");
            //}
            //else
            //{
            //    ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Invalid Username and Password')</script>");
            //}

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}