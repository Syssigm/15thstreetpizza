using _15thstreetpizza.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PizzaV5
{
    public partial class AdminTestimonials : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblError.Text = "";
                if (!IsPostBack)
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
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

      private void GetData()
        {
            var db = new Pizza15Model();
            var Offers = db.tbl_ClientReviews.Select(x => new
            {
                ID = x.ReviewID,
                Dates = x.CreateDates,
                Names = x.ClientNames,
                Title = x.ClientTitle,
                Review = x.ClientReview,
                IsVerified = x.ReviewIsVerified
            }).OrderByDescending(x=>x.Dates).ToList();
            if(Offers.Count > 0)
            {
                int nID = Offers[0].ID;
                string Dates = Offers[0].Dates.ToString();
                string Names = Offers[0].Names;
                string Title = Offers[0].Title;
                //string Review = Server.HtmlDecode(Offers[0].Review.ToString());
                Boolean IsVerified = Offers[0].IsVerified;
                dg1.DataSource = Offers;
                dg1.DataBind();
            }
           
        }

        protected void dg1_CancelCommand(object source, DataGridCommandEventArgs e)
        {
            try
            {
                dg1.EditItemIndex = -1;
                dg1.ShowFooter = true;
                GetData();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void dg1_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
            try
            {
                string strID = dg1.DataKeys[e.Item.ItemIndex].ToString();
                var db = new Pizza15Model();
                int ID = Convert.ToInt32(strID);
                var DeleteTestimonials = db.tbl_ClientReviews.FirstOrDefault(x => x.ReviewID.Equals(ID));
                if (DeleteTestimonials != null)
                {
                    db.tbl_ClientReviews.Remove(DeleteTestimonials);
                    db.SaveChanges();
                }

                dg1.ShowFooter = true;
                Session["Testimonial"] = null;
                GetData();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void dg1_EditCommand(object source, DataGridCommandEventArgs e)
        {
            try
            {
                dg1.EditItemIndex = Convert.ToInt32(e.Item.ItemIndex);
                dg1.ShowFooter = false;
                GetData();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void dg1_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "AddANewRow")
                {
                    var db = new Pizza15Model();
                    TextBox txtName = e.Item.FindControl("txtNamesF") as TextBox;
                    TextBox txtTitle = e.Item.FindControl("txttitleF") as TextBox;
                    TextBox txtReview = e.Item.FindControl("txtReviewF") as TextBox;
                    bool IsVerified = false;
                    CheckBox cbVerify = e.Item.FindControl("cbverify") as CheckBox;

                    if (txtName != null && txtTitle != null && txtReview != null)
                    {
                        var strQueryMax = db.tbl_ClientReviews.Max(x => x.ReviewID);
                        int nMaxID = Convert.ToInt32(strQueryMax);

                        var strQuery = new tbl_ClientReviews();
                        if (nMaxID != 0)
                        {
                            strQuery.ReviewID = nMaxID + 1;
                        }
                        else
                        {
                            strQuery.ReviewID = 1;
                        }

                        strQuery.ClientNames = txtName.Text;
                        strQuery.ClientReview = Server.HtmlDecode(txtReview.Text);
                        strQuery.ClientTitle = txtTitle.Text;
                        IsVerified = true;
                        strQuery.ReviewIsVerified = IsVerified;
                        strQuery.CreateDates = DateTime.Now;
                        db.tbl_ClientReviews.Add(strQuery);
                        db.SaveChanges();
                    }
                    else
                    {
                        lblError.Text = "Error finding the Testimonials";
                    }

                    Session["Testimonial"] = null;
                    GetData();
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void dg1_SortCommand(object source, DataGridSortCommandEventArgs e)
        {
            try
            {
                string strSortOrder = e.SortExpression.ToString();
                ViewState["SortOrder"] = strSortOrder;
                GetData();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void dg1_UpdateCommand(object source, DataGridCommandEventArgs e)
        {
            try
            {
                string strID = dg1.DataKeys[e.Item.ItemIndex].ToString();
                int nStrID = Convert.ToInt32(strID);

                TextBox txtName = e.Item.FindControl("txtNamesE") as TextBox;
                TextBox txtTitle = e.Item.FindControl("txttitleE") as TextBox;
                TextBox txtReview = e.Item.FindControl("txtReviewE") as TextBox;
                CheckBox cbVerify = e.Item.FindControl("cbVerifyE") as CheckBox;

                if (txtName != null && txtTitle != null && txtReview != null)
                {
                    var db = new Pizza15Model();
                    tbl_ClientReviews UpdateTestimonials = db.tbl_ClientReviews.FirstOrDefault(x => x.ReviewID.Equals(nStrID));


                    if (UpdateTestimonials != null)
                    {
                        UpdateTestimonials.ClientNames = txtName.Text.Trim();
                        UpdateTestimonials.ClientReview = Server.HtmlDecode(txtReview.Text.Trim());
                        UpdateTestimonials.ClientTitle = txtTitle.Text.Trim();
                        UpdateTestimonials.ReviewIsVerified = Convert.ToBoolean(cbVerify.Checked);
                        UpdateTestimonials.CreateDates = DateTime.Now;
                        db.SaveChanges();
                    }
                }
                else
                {
                    lblError.Text = "Error finding the Testimonials";
                }

                dg1.EditItemIndex = -1;
                dg1.ShowFooter = true;
                Session["Testimonial"] = null;
                GetData();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
        
    }
}