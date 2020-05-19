
using _15thstreetpizza.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PizzaV5
{
    public partial class AdminMPSI : System.Web.UI.Page
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
                        FillMainItems();
                    }
                    
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        private void FillMainItems()
        {
            try
            {
                var db = new Pizza15Model();
                var MainPageItems = db.tblMainPageItems.Select(x => new
                {
                    ItemID = x.ItemID,
                    Item = x.Item,
                    Link = x.Link,
                    Indx = x.Indx
                }).OrderBy(x => x.Indx).ToList();

                ddlMainPageItem.DataSource = MainPageItems;
                ddlMainPageItem.DataValueField = "ItemID";
                ddlMainPageItem.DataTextField = "Item";
                ddlMainPageItem.DataBind();

                if( ddlMainPageItem.Items.Count > 0)
                {
                    ddlMainPageItem.SelectedIndex = 0;
                    GetData();
                }
            }
            catch( Exception ex )
            {
                throw ex;
            }
        }

        //string GetMainItem(int nItemID)
        //{
        //    try
        //    {
        //        var db = new Pizza15Model();
        //        var MainPageItems = db.tblMainPageItems.FirstOrDefault(x => x.ItemID.Equals(nItemID));
        //        if (MainPageItems != null)
        //        {
        //            return MainPageItems.Item;
        //        }
        //        else
        //        {
        //            return "";
        //        }
        //    }
        //    catch (Exception ex)
        //    {
                
        //        throw ex;
        //    }
        //}

        void GetData()
        {
            try
            {
                if (ddlMainPageItem.SelectedIndex < 0)
                {
                    lblError.Text = "Please select a Main Page Item, before continue. If no main page items, add one in that menu";
                    return;
                }
                int nItemID = Convert.ToInt32(ddlMainPageItem.SelectedItem.Value);
                var db = new Pizza15Model();
                var MainPageSubItems = db.tblMainPageSubItems.Select(x => new
                {
                    SubItemID = x.SubItemID,
                    Indx = x.Indx,
                    SubItem = x.SubItem,
                    IsSubItemBulleted = x.IsSubItemBulleted,
                    ItemID = x.ItemID
                }).Where(y => y.ItemID == nItemID).OrderBy(x => x.Indx).ToList();

                dg.DataSource = MainPageSubItems;
                dg.DataBind();
            }
            catch( Exception ex )
            {
                throw ex;
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
                var DeleteSubPage = db.tblMainPageSubItems.FirstOrDefault(x => x.SubItemID.Equals(ID));
                if (DeleteSubPage != null)
                {
                    db.tblMainPageSubItems.Remove(DeleteSubPage);
                    db.SaveChanges();
                }

                dg.ShowFooter = true;
                Session["SubPageItem"] = null;
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
                    TextBox txtItem = e.Item.FindControl("txtMPSubItemF") as TextBox;
                    CheckBox chkBull = e.Item.FindControl("chkMPIsSubItemBulletedF") as CheckBox;

                    if (txtItem != null && chkBull != null)
                    {
                        var strQueryMax = db.tblMainPageSubItems.Max(x => x.SubItemID);
                        int nMaxID = Convert.ToInt32(strQueryMax);

                        var strQuery = new tblMainPageSubItem();
                        if (nMaxID != 0)
                        {
                            strQuery.SubItemID = nMaxID + 1;
                        }
                        else
                        {
                            strQuery.SubItemID = 1;
                        }

                        strQuery.SubItem = txtItem.Text;
                        strQuery.ItemID = Convert.ToInt32(ddlMainPageItem.SelectedItem.Value);
                        strQuery.IsSubItemBulleted = false;
                        strQuery.Indx = nMaxID + 1;
                        db.tblMainPageSubItems.Add(strQuery);
                        db.SaveChanges();
                    }
                    else
                    {
                        lblError.Text = "Error finding the Main Page Sub Item";
                    }

                    Session["SubPageItem"] = null;
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
                        int nMPMItemID = Convert.ToInt32((e.Item.FindControl("lblMPSubItemID") as Label).Text);
                        int nIndex = Convert.ToInt32((e.Item.FindControl("lblIndex") as Label).Text);

                        int nMPMItemIDAbove = Convert.ToInt32((dg.Items[e.Item.ItemIndex - 1].FindControl("lblMPSubItemID") as Label).Text);
                        int nIndexAbove = Convert.ToInt32((dg.Items[e.Item.ItemIndex - 1].FindControl("lblIndex") as Label).Text);

                        SwapIndex(nMPMItemIDAbove, nIndexAbove, nMPMItemID, nIndex);
                        Session["SubPageItem"] = null;
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
                        int nMPMItemID = Convert.ToInt32((e.Item.FindControl("lblMPSubItemID") as Label).Text);
                        int nIndex = Convert.ToInt32((e.Item.FindControl("lblIndex") as Label).Text.Trim().ToString());

                        int nMPMItemIDBelow = Convert.ToInt16((dg.Items[e.Item.ItemIndex + 1].FindControl("lblMPSubItemID") as Label).Text);
                        int nIndexBelow = Convert.ToInt16((dg.Items[e.Item.ItemIndex + 1].FindControl("lblIndex") as Label).Text.Trim().ToString());

                        SwapIndex(nMPMItemID, nIndex, nMPMItemIDBelow, nIndexBelow);
                        Session["SubPageItem"] = null;
                        GetData();
                    }
                }
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

                TextBox txtItem = e.Item.FindControl("txtMPSubItemE") as TextBox;
                CheckBox chkBull = e.Item.FindControl("chkMPIsSubItemBulletedE") as CheckBox;

                if (txtItem != null && chkBull != null)
                {
                    var db = new Pizza15Model();
                    tblMainPageSubItem SubPageItem = db.tblMainPageSubItems.FirstOrDefault(x => x.SubItemID.Equals(nStrID));

                    if (SubPageItem != null)
                    {
                        SubPageItem.SubItem = txtItem.Text;
                        SubPageItem.IsSubItemBulleted = chkBull.Checked;
                        db.SaveChanges();
                    }
                }
                else
                {
                    lblError.Text = "Error finding the MainPageSubItem";
                }

                dg.EditItemIndex = -1;
                dg.ShowFooter = true;
                Session["SubPageItem"] = null;
                GetData();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void dg_ItemDataBound(object sender, DataGridItemEventArgs e)
        {

        }

        private void SwapIndex(int nID1, int nIndex1, int nID2, int nIndex2)
        {
            try
            {
                var db = new Pizza15Model();
                tblMainPageSubItem SubPage = db.tblMainPageSubItems.Single(x => x.SubItemID.Equals(nID1));
                if (SubPage != null)
                {
                    SubPage.Indx = nIndex2;
                    db.SaveChanges();
                }

                tblMainPageSubItem SubPageItem = db.tblMainPageSubItems.Single(x => x.SubItemID.Equals(nID2));
                if (SubPageItem != null)
                {
                    SubPageItem.Indx = nIndex1;
                    db.SaveChanges();
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void ddlMainPageItem_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                GetData();
            }
            catch( Exception ex )
            {
                lblError.Text = ex.Message;
            }
        }
    }
}