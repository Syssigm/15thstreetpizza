using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using _15thstreetpizza.Models;

namespace _15thstreetpizza
{
    public partial class AdminPizzaSpecials : System.Web.UI.Page
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
                        populatedrpdown();
                    }

                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        public void populatedrpdown()
        {
            var db = new Pizza15Model();
            Itmdrplist.DataSource = db.tbl_pizzaspecials.ToList();
            Itmdrplist.DataTextField = "Name";
            Itmdrplist.DataValueField = "Name";
            Itmdrplist.DataBind();
            Itmdrplist.Items.Insert(0, new ListItem("Select the Item"));
        }
        void GetData()
        {
            var db = new Pizza15Model();
            var PizzaSpecials = db.tbl_pizzaspecials.Select(x => new
            {
                PizzaID =x.PizzaSpecID,
                Day = x.day,
                Item = x.Name,
                Itemid =x.ItemId,
                Sizsml = x.col_Small,
                Sizpers = x.col_Personal,
                Sizmed=x.col_Medium,
                Sizlarge=x.col_large
                
            }).ToList();

            dg.DataSource = PizzaSpecials;
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
                var PizzaSpecials = db.tbl_pizzaspecials.FirstOrDefault(x => x.PizzaSpecID.Equals(ID));
                if (PizzaSpecials != null)
                {
                    db.tbl_pizzaspecials.Remove(PizzaSpecials);
                    db.SaveChanges();
                }

                dg.ShowFooter = true;
                Session["PizzaSpecial"] = null;
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
                    TextBox txtItem = e.Item.FindControl("txtpizzItemF") as TextBox;
                    TextBox txtday = e.Item.FindControl("txtpizzdayF") as TextBox;
                    TextBox txtsmlPrice = e.Item.FindControl("txtsmlPriceF") as TextBox;
                    TextBox txtperPrice = e.Item.FindControl("txtperPriceF") as TextBox;
                    TextBox txtmedPrice = e.Item.FindControl("txtmedPriceF") as TextBox;
                    TextBox txtlrgPrice = e.Item.FindControl("txtlrgPriceF") as TextBox;

                    if (txtItem != null && txtday!=null&& txtsmlPrice != null && txtperPrice != null && txtmedPrice !=null && txtlrgPrice !=null)
                    {
                        var PizzaSpecials = db.tbl_pizzaspecials.Select(x => new
                        {
                            PizzaID=x.PizzaSpecID,
                            Day = x.day,
                            Item = x.Name,
                            Itemid =x.ItemId,
                            Sizsml = x.col_Small,
                            Sizpers = x.col_Personal,
                            Sizmed = x.col_Medium,
                            Sizlarge = x.col_large
                        }).ToList();
                        if (PizzaSpecials.Count != 0)
                        {
                            var strQueryMax = db.tbl_pizzaspecials.Max(x => x.PizzaSpecID);
                            int nMaxID = Convert.ToInt32(strQueryMax);

                            var strQuery = new tbl_pizzaspecials();
                            strQuery.PizzaSpecID= nMaxID + 1;
                            strQuery.day = txtday.Text;
                            strQuery.ItemId = 2;
                            strQuery.Name = txtItem.Text;
                            strQuery.col_Small = txtsmlPrice.Text;
                            strQuery.col_Medium = txtmedPrice.Text;
                            strQuery.col_Personal = txtperPrice.Text;
                            strQuery.col_large = txtlrgPrice.Text;
                            db.tbl_pizzaspecials.Add(strQuery);
                            db.SaveChanges();
                        }
                        else
                        {
                            var strQuery = new tbl_pizzaspecials();
                            strQuery.PizzaSpecID = 1;
                            strQuery.day = txtday.Text;
                            strQuery.ItemId = 2;
                            strQuery.Name = txtItem.Text;
                            strQuery.col_Small = txtsmlPrice.Text;
                            strQuery.col_Medium = txtmedPrice.Text;
                            strQuery.col_Personal = txtperPrice.Text;
                            strQuery.col_large = txtlrgPrice.Text;
                            db.tbl_pizzaspecials.Add(strQuery);
                            db.SaveChanges();
                        }
                    }
                    else
                    {
                        lblError.Text = "Error finding the Pizza Specials";
                    }

                    Session["PizzaSpecial"] = null;
                    GetData();
                }
                if (e.CommandName == "Update")
                {
                    string strID = dg.DataKeys[e.Item.ItemIndex].ToString();
                    int nStrID = Convert.ToInt32(strID);

                    TextBox txtItem = e.Item.FindControl("txtpizzItemE") as TextBox;
                    TextBox txtday = e.Item.FindControl("txtpizzdayE") as TextBox;
                    TextBox txtsmlPrice = e.Item.FindControl("txtsmlPriceE") as TextBox;
                    TextBox txtperPrice = e.Item.FindControl("txtperPriceE") as TextBox;
                    TextBox txtmedPrice = e.Item.FindControl("txtmedPriceE") as TextBox;
                    TextBox txtlrgPrice = e.Item.FindControl("txtlrgPriceE") as TextBox;


                    if (txtItem != null && txtday !=null && txtsmlPrice !=null && txtperPrice !=null && txtmedPrice !=null && txtlrgPrice !=null)
                    {
                        var db = new Pizza15Model();
                        tbl_pizzaspecials UpdatePizzaSpecial = db.tbl_pizzaspecials.FirstOrDefault(x => x.PizzaSpecID.Equals(nStrID));

                        if (UpdatePizzaSpecial != null)
                        {
                            UpdatePizzaSpecial.Name = txtItem.Text.Trim();
                            UpdatePizzaSpecial.day = txtday.Text.Trim();
                            UpdatePizzaSpecial.col_Small = txtsmlPrice.Text.Trim();
                            UpdatePizzaSpecial.col_Personal = txtperPrice.Text.Trim();
                            UpdatePizzaSpecial.col_Medium = txtmedPrice.Text.Trim();
                            UpdatePizzaSpecial.col_large = txtlrgPrice.Text.Trim();
                            db.SaveChanges();
                        }
                    }
                    else
                    {
                        lblError.Text = "Error finding the Pizza Special";
                    }

                    dg.EditItemIndex = -1;
                    dg.ShowFooter = true;
                    Session["PizzaSpecial"] = null;
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
                        int nPizzaID = Convert.ToInt32((e.Item.FindControl("lblPizzaID") as Label).Text);
                        int nIndex = Convert.ToInt32((e.Item.FindControl("lblIndex") as Label).Text);

                        int nPizzaIDAbove = Convert.ToInt32((dg.Items[e.Item.ItemIndex - 1].FindControl("lblPizzaID") as Label).Text);
                        int nIndexAbove = Convert.ToInt32((dg.Items[e.Item.ItemIndex - 1].FindControl("lblIndex") as Label).Text);

                        SwapIndex(nPizzaIDAbove, nIndexAbove,nPizzaID, nIndex);
                        Session["PizzaSpecial"] = null;
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
                        int nPizzaID = Convert.ToInt32((e.Item.FindControl("lblPizzaID") as Label).Text);
                        int nIndex = Convert.ToInt32((e.Item.FindControl("lblIndex") as Label).Text);

                        int nPizzaIDAbove = Convert.ToInt32((dg.Items[e.Item.ItemIndex + 1].FindControl("lblPizzaID") as Label).Text);
                        
                        int nIndexBelow = Convert.ToInt16((dg.Items[e.Item.ItemIndex + 1].FindControl("lblIndex") as Label).Text.Trim().ToString());

                        SwapIndex(nPizzaID, nIndex, nPizzaIDAbove, nIndexBelow);
                        Session["Event"] = null;
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
            //    try
            //    {
            //        string strID = dg.DataKeys[e.Item.ItemIndex].ToString();
            //        int nStrID = Convert.ToInt32(strID);

            //        //TextBox txtItem = e.Item.FindControl("txtpizzItemF") as TextBox;
            //        //TextBox txtday = e.Item.FindControl("txtpizzdayF") as TextBox;
            //        //TextBox txtsmlPrice = e.Item.FindControl("txtsmlPriceF") as TextBox;
            //        //TextBox txtperPrice = e.Item.FindControl("txtperPriceF") as TextBox;
            //        //TextBox txtmedPrice = e.Item.FindControl("txtmedPriceF") as TextBox;
            //        //TextBox txtlrgPrice = e.Item.FindControl("txtlrgPriceF") as TextBox;

            //        TextBox txtItem = e.Item.FindControl("txtpizzItemF") as TextBox;


            //        if (txtItem != null)
            //        {
            //            var db = new Pizza15Model();
            //            tbl_pizzaspecials UpdatePizzaSpecial = db.tbl_pizzaspecials.FirstOrDefault(x => x.PizzaSpecID.Equals(nStrID));

            //            if (UpdatePizzaSpecial != null)
            //            {
            //                UpdatePizzaSpecial.Name = txtItem.Text.Trim();
            //                //UpdatePizzaSpecial.day = txtday.Text.Trim();
            //                //UpdatePizzaSpecial.col_Small = txtsmlPrice.Text.Trim();
            //                //UpdatePizzaSpecial.col_Personal = txtperPrice.Text.Trim();
            //                //UpdatePizzaSpecial.col_Medium = txtmedPrice.Text.Trim();
            //                //UpdatePizzaSpecial.col_large = txtlrgPrice.Text.Trim();
            //                db.SaveChanges();
            //            }
            //        }
            //        else
            //        {
            //            lblError.Text = "Error finding the Pizza Special";
            //        }

            //        dg.EditItemIndex = -1;
            //        dg.ShowFooter = true;
            //        Session["PizzaSpecial"] = null;
            //        GetData();
            //    }
            //    catch (Exception ex)
            //    {
            //        lblError.Text = ex.Message;
            //    }
        }

        private void SwapIndex(int nPizzaID1, int nIndex1, int nPizzaID2, int nIndex2)
        {
            try
            {
                var db = new Pizza15Model();
                tbl_pizzaspecials PizzaSpecial = db.tbl_pizzaspecials.Single(x => x.PizzaSpecID.Equals(nPizzaID1));
                if (PizzaSpecial != null)
                {
                    PizzaSpecial.ItemId = nIndex2;
                    db.SaveChanges();
                }
                tbl_pizzaspecials Pizzaspec = db.tbl_pizzaspecials.Single(x => x.PizzaSpecID.Equals(nPizzaID2));
                
                if (Pizzaspec != null)
                {
                    Pizzaspec.ItemId = nIndex1;
                    db.SaveChanges();
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void clearfields()
        {
            populatedrpdown();
            TxtVldst.Value = string.Empty;
            TxtVldend.Value = string.Empty;
        }
        protected void Save_Click(object sender, EventArgs e)
        {
            try
            {
                var db = new Pizza15Model();
                tblSpecialsVlddate itemvlddates = new tblSpecialsVlddate();
                string itemname = Itmdrplist.SelectedItem.Text.ToString();
                DateTime startdate = Convert.ToDateTime(TxtVldst.Value);
                DateTime enddate = Convert.ToDateTime(TxtVldend.Value);

                var lunchsplcount = (from q in db.tblSpecialsVlddates
                                     where q.Itemname == itemname
                                     where q.Specialtype == "PizzaSpecials"
                                     select new { q }).Count();
                if (lunchsplcount == 0)
                {
                    if (enddate >= startdate)
                    {
                        if (enddate >= System.DateTime.Today & startdate >= System.DateTime.Today)
                        {
                            itemvlddates.Itemname = itemname;
                            itemvlddates.Specialtype = "PizzaSpecials";
                            itemvlddates.vldstartdate = startdate;
                            itemvlddates.vldenddate = enddate;
                            db.tblSpecialsVlddates.Add(itemvlddates);
                            db.SaveChanges();
                            lblmsg.Text = "Details saved successfully.";
                            lblmsg.ForeColor = System.Drawing.Color.Green;
                            clearfields();
                        }
                        else
                        {
                            lblmsg.Text = "Start Date & End Date cannot be less than today.";
                            lblmsg.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    else
                    {
                        lblmsg.Text = "Start date cannot be greater than end date.";
                        lblmsg.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    if (enddate >= startdate)
                    {
                        if (enddate >= System.DateTime.Today & startdate >= System.DateTime.Today)
                        {
                            var Pizzasp = (from q in db.tblSpecialsVlddates
                                           where q.Itemname == itemname
                                           where q.Specialtype == "PizzaSpecials"
                                           select new { q }).FirstOrDefault();
                            Pizzasp.q.vldstartdate = startdate;
                            Pizzasp.q.vldenddate = enddate;
                            db.SaveChanges();
                            lblmsg.Text = "Details saved successfully.";
                            lblmsg.ForeColor = System.Drawing.Color.Green;
                            clearfields();
                        }
                        else
                        {
                            lblmsg.Text = "Start Date & End Date cannot be less than today.";
                            lblmsg.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    else
                    {
                        lblmsg.Text = "Start Date & End Date cannot be less than today.";
                        lblmsg.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        protected void Itmdrplist_SelectedIndexChanged(object sender, EventArgs e)
        {
            var db = new Pizza15Model();
            string itemnam = Itmdrplist.SelectedItem.Text.ToString();
            var vlddates = (from q in db.tblSpecialsVlddates
                            where q.Itemname == itemnam
                            where q.Specialtype == "PizzaSpecials"
                            select new { q.vldstartdate, q.vldenddate }).FirstOrDefault();
            if (vlddates != null)
            {
                DateTime vldstrtval = Convert.ToDateTime(vlddates.vldstartdate);
                DateTime vldendval = Convert.ToDateTime(vlddates.vldenddate);
                TxtVldst.Value = vldstrtval.ToString("yyyy-MM-dd");
                TxtVldend.Value = vldendval.ToString("yyyy-MM-dd");
            }
            else
            {
                TxtVldst.Value = string.Empty;
                TxtVldend.Value = string.Empty;
            }

        }
    }
}
