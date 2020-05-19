
using _15thstreetpizza.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PizzaV5
{
    public partial class AdminRegularSpecials : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblError.Text = "";
                if (!this.IsPostBack)
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

        void GetData()
        {
            var db = new Pizza15Model();
            var RegularSpecials = db.tblRegularSpecials.Select(x => new
            {
                RegularID = x.RegularID,
                Item = x.Item,
                Price = x.Price,
                Comment = x.Comment
            }).ToList();

            dg.DataSource = RegularSpecials;
            dg.DataBind();

        }

        protected void dg_CancelCommand(object source, DataGridCommandEventArgs e)
        {
            try
            {
                dg.EditItemIndex = -1;
                dg.ShowFooter = true;
                GetData();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void dg_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
            try
            {
                string strID = dg.DataKeys[e.Item.ItemIndex].ToString();
                var db = new Pizza15Model();
                int ID = Convert.ToInt32(strID);
                var RegularSpecials = db.tblRegularSpecials.FirstOrDefault(x => x.RegularID.Equals(ID));
                if (RegularSpecials != null)
                {
                    db.tblRegularSpecials.Remove(RegularSpecials);
                    db.SaveChanges();
                }

                dg.ShowFooter = true;
                Session["RegularSpecial"] = null;
                GetData();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void dg_EditCommand(object source, DataGridCommandEventArgs e)
        {
            try
            {
                dg.EditItemIndex = Convert.ToInt32(e.Item.ItemIndex);
                dg.ShowFooter = false;
                GetData();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void dg_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "AddANewRow")
                {
                    var db = new Pizza15Model();
                    TextBox txtItem = e.Item.FindControl("txtItemF") as TextBox;
                    TextBox txtPrice = e.Item.FindControl("txtPriceF") as TextBox;
                    TextBox txtComment = e.Item.FindControl("txtCommentF") as TextBox;
                    
                    if (txtItem != null && txtPrice != null && txtComment != null)
                    {
                        var RegularSpecials = db.tblRegularSpecials.Select(x => new
                        {
                            RegularID = x.RegularID,
                            Item = x.Item,
                            Price = x.Price,
                            Comment = x.Comment
                        }).ToList();
                        if (RegularSpecials.Count != 0)
                        {
                            var strQueryMax = db.tblRegularSpecials.Max(x => x.RegularID);
                            int nMaxID = Convert.ToInt32(strQueryMax);

                            var strQuery = new tblRegularSpecial();
                            strQuery.RegularID = nMaxID + 1;
                            strQuery.Item = txtItem.Text;
                            strQuery.Price = txtPrice.Text;
                            strQuery.Comment = txtComment.Text;
                            db.tblRegularSpecials.Add(strQuery);
                            db.SaveChanges();
                        }
                        else
                        {
                            var strQueryMax = db.tblRegularSpecials;
                            var strQuery = new tblRegularSpecial();
                            strQuery.Item = txtItem.Text;
                            strQuery.Price = txtPrice.Text;
                            strQuery.Comment = txtComment.Text;
                            db.tblRegularSpecials.Add(strQuery);
                            db.SaveChanges();
                        }
                    }
                    else
                    {
                        lblError.Text = "Error finding the Regular Specials";
                    }

                    Session["RegularSpecial"] = null;
                    GetData();
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void dg_SortCommand(object source, DataGridSortCommandEventArgs e)
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

        protected void dg_UpdateCommand(object source, DataGridCommandEventArgs e)
        {
            try
            {
                string strID = dg.DataKeys[e.Item.ItemIndex].ToString();
                int nStrID = Convert.ToInt32(strID);

                TextBox txtItem = e.Item.FindControl("txtItemE") as TextBox;
                TextBox txtPrice = e.Item.FindControl("txtPriceE") as TextBox;
                TextBox txtComment = e.Item.FindControl("txtCommentE") as TextBox;

                if (txtItem != null && txtPrice != null && txtComment != null)
                {
                    var db = new Pizza15Model();
                    tblRegularSpecial UpdateRegularSpecial = db.tblRegularSpecials.FirstOrDefault(x => x.RegularID.Equals(nStrID));

                    if (UpdateRegularSpecial != null)
                    {
                        UpdateRegularSpecial.Item = txtItem.Text.Trim();
                        UpdateRegularSpecial.Price = txtPrice.Text.Trim();
                        UpdateRegularSpecial.Comment = txtComment.Text.Trim();
                        db.SaveChanges();
                    }
                }
                else
                {
                    lblError.Text = "Error finding the Regular Special";
                }

                dg.EditItemIndex = -1;
                dg.ShowFooter = true;
                Session["RegularSpecial"] = null;
                GetData();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
    }
}