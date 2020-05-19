
using _15thstreetpizza.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PizzaV5
{
    public partial class AdminEventsNews : System.Web.UI.Page
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
            var Events = db.tblNewsEvents.Select(x => new
            {
                NewsID = x.NewsID,
                News = x.News,
                Indx = x.Indx,
                Active = x.Active
            }).OrderBy(x => x.Indx).ToList();

            dg.DataSource = Events;
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
                var DeleteEvents = db.tblNewsEvents.FirstOrDefault(x => x.NewsID.Equals(ID));
                if (DeleteEvents != null)
                {
                    db.tblNewsEvents.Remove(DeleteEvents);
                    db.SaveChanges();
                }

                dg.ShowFooter = true;
                Session["Events"] = null;
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
                    TextBox txtNewsF = e.Item.FindControl("txtNewsF") as TextBox;
                    CheckBox chkActiveF = e.Item.FindControl("chkActiveF") as CheckBox;

                    if (txtNewsF != null && chkActiveF != null)
                    {
                        int nMaxID = 0;
                        try
                        {
                            var strQueryMax = db.tblNewsEvents.Max(x => x.NewsID);
                            nMaxID = Convert.ToInt32(strQueryMax);
                        }
                        catch
                        {
                            nMaxID = 0;
                        }

                        var strQuery = new tblNewsEvent();
                        if (nMaxID != 0)
                        {
                            strQuery.NewsID = nMaxID + 1;
                        }
                        else
                        {
                            strQuery.NewsID = 1;
                        }

                        strQuery.News = txtNewsF.Text;
                        strQuery.Indx = nMaxID + 1;
                        strQuery.Active = Convert.ToBoolean(chkActiveF.Checked);
                        db.tblNewsEvents.Add(strQuery);
                        db.SaveChanges();
                    }
                    else
                    {
                        lblError.Text = "Error finding the News & Events";
                    }

                    Session["Event"] = null;
                    GetData();
                }

                if (e.CommandName == "MoveUp")
                {
                    if (e.Item.ItemIndex == 0)
                    {
                        lblError.Text = "This item cannot be moved further up";
                    }
                    else
                    {
                        int nNewsID = Convert.ToInt32((e.Item.FindControl("lblNewsID") as Label).Text);
                        int nIndex = Convert.ToInt32((e.Item.FindControl("lblIndex") as Label).Text);

                        int nNewsIDAbove = Convert.ToInt32((dg.Items[e.Item.ItemIndex - 1].FindControl("lblNewsID") as Label).Text);
                        int nIndexAbove = Convert.ToInt32((dg.Items[e.Item.ItemIndex - 1].FindControl("lblIndex") as Label).Text);
                        
                        SwapIndex(nNewsIDAbove, nIndexAbove, nNewsID, nIndex);
                        Session["Event"] = null;
                        GetData();
                    }
                }

                if (e.CommandName == "MoveDown")
                {
                    if (e.Item.ItemIndex == (dg.Items.Count - 1))
                    {
                        lblError.Text = "This item cannot be moved further down";
                    }
                    else
                    {
                        int nNewsID = Convert.ToInt32((e.Item.FindControl("lblNewsID") as Label).Text);
                        int nIndex = Convert.ToInt32((e.Item.FindControl("lblIndex") as Label).Text.Trim().ToString());

                        int nNewsIDBelow = Convert.ToInt16((dg.Items[e.Item.ItemIndex + 1].FindControl("lblNewsID") as Label).Text);
                        int nIndexBelow = Convert.ToInt16((dg.Items[e.Item.ItemIndex + 1].FindControl("lblIndex") as Label).Text.Trim().ToString());

                        SwapIndex(nNewsID, nIndex, nNewsIDBelow, nIndexBelow);
                        Session["Event"] = null;
                        GetData();
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
                //lblError.Text = ex.Message;
            }
        }

        protected void dg_UpdateCommand(object source, DataGridCommandEventArgs e)
        {
            try
            {
                string strID = dg.DataKeys[e.Item.ItemIndex].ToString();
                int nStrID = Convert.ToInt32(strID);

                TextBox txtNewsE = e.Item.FindControl("txtNewsE") as TextBox;
                CheckBox chkActiveE = e.Item.FindControl("chkActiveE") as CheckBox;

                if (txtNewsE != null && chkActiveE != null)
                {
                    var db = new Pizza15Model();
                    tblNewsEvent Events = db.tblNewsEvents.FirstOrDefault(x => x.NewsID.Equals(nStrID));

                    if (Events != null)
                    {
                        Events.News = txtNewsE.Text;
                        Events.Active = Convert.ToBoolean(chkActiveE.Checked);
                        db.SaveChanges();
                    }
                }
                else
                {
                    lblError.Text = "Error finding the News & Event";
                }

                dg.EditItemIndex = -1;
                dg.ShowFooter = true;
                Session["Event"] = null;
                GetData();
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

        private void SwapIndex(int nNewsID1, int nIndex1, int nNewsID2, int nIndex2)
        {
            try
            {
                var db = new Pizza15Model();
                tblNewsEvent Events = db.tblNewsEvents.Single(x => x.NewsID.Equals(nNewsID1));
                if(Events != null)
                {
                    Events.Indx = nIndex2;
                    db.SaveChanges();
                }

                tblNewsEvent NewsEvents = db.tblNewsEvents.Single(x => x.NewsID.Equals(nNewsID2));
                if (NewsEvents != null)
                {
                    NewsEvents.Indx = nIndex1;
                    db.SaveChanges();
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}