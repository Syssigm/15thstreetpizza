using _15thstreetpizza.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace PizzaV6
{
    public partial class AdminPictureCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["UserName"] == null) || (Session["UserName"].ToString() == string.Empty))
            {
                Response.Redirect("Login.aspx?ReturnUrl=%2fadminhome.aspx", false);
            }
            lblerror.Text = string.Empty;

        }
        protected void lnkNewCategory_Click(object sender, EventArgs e)
        {
            lblCategory.Visible = true;
            TxtCategory.Visible = true;
            btnCategorySave.Visible = true;
            btnCategoryCancel.Visible = true;

            lblSelectCategory.Visible = false;
            lblnewSubCategory.Visible = false;
            ddlCategory.Visible = false;
            TxtNewSubcategory.Visible = false;
            btnSubCategorySave.Visible = false;
            btnSubCategoryCancel.Visible = false;

            lnkNewCategory.Visible = false;
            lnkNewSubCategory.Visible = false;
        }

        protected void lnkNewSubCategory_Click(object sender, EventArgs e)
        {
            lblSelectCategory.Visible = true;
            lblnewSubCategory.Visible = true;
            ddlCategory.Visible = true;
            TxtNewSubcategory.Visible = true;
            btnSubCategorySave.Visible = true;
            btnSubCategoryCancel.Visible = true;

            lblCategory.Visible = false;
            TxtCategory.Visible = false;
            btnCategorySave.Visible = false;
            btnCategoryCancel.Visible = false;

            lnkNewCategory.Visible = false;
            lnkNewSubCategory.Visible = false;

            ddlcategorypopulate();
        }

        protected void btnCategoryCancel_Click(object sender, EventArgs e)
        {
             
            lblCategory.Visible = false;
            TxtCategory.Visible = false;
            btnCategorySave.Visible = false;
            btnCategoryCancel.Visible = false;
            lnkNewCategory.Visible = true;
            lnkNewSubCategory.Visible = true;
        }

        protected void btnSubCategoryCancel_Click(object sender, EventArgs e)
        {
            lblSelectCategory.Visible = false;
            lblnewSubCategory.Visible = false;
            ddlCategory.Visible = false;
            TxtNewSubcategory.Visible = false;
            btnSubCategorySave.Visible = false;
            btnSubCategoryCancel.Visible = false;
            lnkNewCategory.Visible = true;
            lnkNewSubCategory.Visible = true;
        }

        protected void btnCategorySave_Click(object sender, EventArgs e)
        {
            try
            { 
            var db = new Pizza15Model();
            var imgCategory = new tbl_ImageCategory();

            var maxid = (from q in db.tbl_ImageCategory
                         select new { q.ID }).ToList();

            
            if (maxid.Count != 0)
            {
                imgCategory.ID = maxid.Max(x => x.ID) + 1;
            }

            imgCategory.CategoryID = imgCategory.ID;
            imgCategory.CategoryName = TxtCategory.Text;
            imgCategory.SubCategoryID = 1;
            imgCategory.SubCategoryName = imgCategory.CategoryName;
            if (TxtCategory.Text == "")
                {
                    lblerror.Text = "Please enter a category name ";
                    lblerror.ForeColor = System.Drawing.Color.Red;
                    lblCategory.Visible = true;
                    TxtCategory.Visible = true;
                    btnCategorySave.Visible = true;
                    btnCategoryCancel.Visible = true;
                   }
                else
                {
                    var duplicatecatid = (from q in db.tbl_ImageCategory
                                          where  q.CategoryName==TxtCategory.Text
                                          select new { }).Count();
                    if (duplicatecatid == 0) { 

                    db.tbl_ImageCategory.Add(imgCategory);
                    db.SaveChanges();
                    lblerror.Text = "New Category Created Successfully";
                    lblerror.ForeColor = System.Drawing.Color.ForestGreen;
                    lblCategory.Visible = false;
                    TxtCategory.Visible = false;
                    btnCategorySave.Visible = false;
                    btnCategoryCancel.Visible = false;
                    lnkNewCategory.Visible = true;
                    lnkNewSubCategory.Visible = true;
                    TxtCategory.Text = string.Empty;
                    }
                    else
                    {
                        lblerror.Text = " The Category Name Already exists, Please choose a different One";
                        lblerror.ForeColor = System.Drawing.Color.Red;
                        lblCategory.Visible = true;
                        TxtCategory.Visible = true;
                        btnCategorySave.Visible = true;
                        btnCategoryCancel.Visible = true;

                    }

                }
               
            }
            catch(Exception ex)
            {
                lblerror.Text = ex.Message;
            }
        }

        public void ddlcategorypopulate()
        {
            try
            {
                var db = new Pizza15Model();

                ddlCategory.DataSource = db.tbl_ImageCategory.Select(x => new { x.CategoryName, x.CategoryID }).ToList().Distinct();
                ddlCategory.DataTextField = "CategoryName";
                ddlCategory.DataValueField = "CategoryID";
                ddlCategory.DataBind();
                ddlCategory.Items.Insert(0, new ListItem("--Select Category Name--", "0"));
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
        protected void btnSubCategorySave_Click(object sender, EventArgs e)
        {
            try
            { 
            var db = new Pizza15Model();
            var imgSubCategory = new tbl_ImageCategory();

            var maxid = (from q in db.tbl_ImageCategory
                         select new { q.ID }).ToList();


            if (maxid.Count != 0)
            {
                imgSubCategory.ID = maxid.Max(x => x.ID) + 1;
            }
             
            imgSubCategory.CategoryID = Convert.ToInt32(ddlCategory.SelectedValue);
               
                var maxSubCategoryid = (from q in db.tbl_ImageCategory
                                    where q.CategoryID == imgSubCategory.CategoryID
                                    select new { q.SubCategoryID }).ToList();

            if (maxSubCategoryid.Count != 0)
            {
                imgSubCategory.SubCategoryID = maxSubCategoryid.Max(x => x.SubCategoryID) + 1;
            }

            imgSubCategory.CategoryName = ddlCategory.SelectedItem.Text;
            imgSubCategory.SubCategoryName = TxtNewSubcategory.Text;

                var DuplicateSubCat = (from q in db.tbl_ImageCategory
                                       where q.CategoryName == imgSubCategory.CategoryName && q.SubCategoryName == imgSubCategory.SubCategoryName
                                       select new { }).Count();
                if(DuplicateSubCat == 0)
                { 
                if(ddlCategory.SelectedValue !="0")
                { 


                        db.tbl_ImageCategory.Add(imgSubCategory);
                        db.SaveChanges();
                        lblerror.Text = "New Sub Category Created Successfully";
                        lblerror.ForeColor = System.Drawing.Color.ForestGreen;
                        lblSelectCategory.Visible = false;
                        lblnewSubCategory.Visible = false;
                        ddlCategory.Visible = false;
                        TxtNewSubcategory.Visible = false;
                        btnSubCategorySave.Visible = false;
                        btnSubCategoryCancel.Visible = false;
                        lnkNewCategory.Visible = true;
                        lnkNewSubCategory.Visible = true;

                        TxtNewSubcategory.Text = string.Empty;
                    }
                else
                    {
                        lblerror.Text = "Please Select Category";
                        lblerror.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    lblerror.Text = "Sub Category Name already exists";
                    lblerror.ForeColor = System.Drawing.Color.Red;
                }
                

               
            }
            catch(Exception ex)
            {
                lblerror.Text = ex.Message;
            }
        }
    }
}