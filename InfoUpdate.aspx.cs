using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using _15thstreetpizza.Models;

namespace _15thstreetpizza
{
    
    public partial class InfoUpdate : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["UserName"].ToString() == string.Empty))
            {
                Response.Redirect("Login.aspx?ReturnUrl=%2fadminhome.aspx", false);
            }
            lblerror.Text = string.Empty;
        }

        protected void lnkupdtCategory_Click(object sender, EventArgs e)
        {
            var db = new Pizza15Model();

            lblCategory.Visible = true;
            TxtCategory.Visible = true;
            btnCategoryupdate.Visible = true;
            btnCategoryCancel.Visible = true;
            lnkupdtCategory.Visible = false;

            var subcatname = (from q in db.tbl_ImageCategory
                              where q.CategoryID==19 
                              select new { q.SubCategoryName }).FirstOrDefault();

            TxtCategory.Text = subcatname.SubCategoryName;

        }

        protected void btnCategoryupdate_Click(object sender, EventArgs e)
        {
            var db = new Pizza15Model();

            var extsubcatgname = (from q in db.tbl_ImageCategory
                                  where q.CategoryID == 19
                                  select new { q }).FirstOrDefault();
            if (TxtCategory.Text.Trim() != null)
            { 
              extsubcatgname.q.SubCategoryName = TxtCategory.Text;
            }

            db.SaveChanges();

            lblerror.Text = " The new name been updated successfully";
            lblerror.ForeColor = System.Drawing.Color.ForestGreen;

            lblCategory.Visible = false;
            TxtCategory.Visible = false;
            btnCategoryupdate.Visible = false;
            btnCategoryCancel.Visible = false;
            lnkupdtCategory.Visible = true;

        }

        protected void btnCategoryCancel_Click(object sender, EventArgs e)
        {
            lblCategory.Visible = false;
            TxtCategory.Visible = false;
            TxtCategory.Text = string.Empty;
            btnCategoryupdate.Visible = false;
            btnCategoryCancel.Visible = false;
            lnkupdtCategory.Visible = true;
        }
    }
}