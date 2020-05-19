using _15thstreetpizza.Models;
using System;
using System.Data;
using System.Linq;
using System.Web.UI.WebControls;

namespace PizzaV5
{
    public partial class Admin_Keywords : System.Web.UI.Page
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
            var Keywords = db.tblKeywords.Select(x => new
            {
                Id = x.ID,
                KeyWord = x.Keyword,
            }).ToList();
            if (Keywords.Count != 0)
            {
                dg.DataSource = Keywords;
                dg.DataBind();
            }
            else
            {
                lblError.Text = "No Data"; //Need to get Error Message From Web.Config File.
            }
            
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
                var DeleteKeyWord = db.tblKeywords.FirstOrDefault(x => x.ID.Equals(ID));
                if(DeleteKeyWord != null)
                {
                    db.tblKeywords.Remove(DeleteKeyWord);
                    db.SaveChanges();
                }

                dg.ShowFooter = true;
                Session["Keyword"] = null;
                this.GetData();
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
                    string strKeyword = "";
                    TextBox txtKeyword = e.Item.FindControl("txtKeywordF") as TextBox;
                    if ((txtKeyword != null))
                    {
                        var strQueryMax = db.tblKeywords.Max(x => x.ID);
                        int nMaxID = Convert.ToInt32(strQueryMax);
                        strKeyword = txtKeyword.Text;

                        var strQuery = new tblKeyword();    
                        strQuery.ID = nMaxID + 1;
                        strQuery.Keyword = strKeyword;
                        db.tblKeywords.Add(strQuery);
                        db.SaveChanges();
                    }
                    else
                    {
                        lblError.Text = "Error finding the Keyword";
                    }

                    Session["Keyword"] = null;
                    GetData();
                }
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
                string strKeyword = "";
                TextBox txtKeyword = e.Item.FindControl("txtKeywordE") as TextBox;
                if ((txtKeyword != null))
                {
                    strKeyword = txtKeyword.Text;
                    var db = new Pizza15Model();
                    tblKeyword UpdateKeyWord = db.tblKeywords.FirstOrDefault(x => x.ID.Equals(nStrID));

                    if (UpdateKeyWord != null)
                    {
                        UpdateKeyWord.Keyword = txtKeyword.Text.Trim();
                        db.SaveChanges();
                    }
                }
                else
                {
                    lblError.Text = "Error finding the Keyword";
                }

                dg.EditItemIndex = -1;
                dg.ShowFooter = true;
                Session["Keyword"] = null;
                GetData();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
    }
}