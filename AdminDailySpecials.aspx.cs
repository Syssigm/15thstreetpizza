
using _15thstreetpizza.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PizzaV5
{
    public partial class AdminDailySpecials : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblError.Text = "";
                lblmsg.Text = string.Empty;
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
            Itmdrplist.DataSource = db.tblDailySpecials.ToList();
            Itmdrplist.DataTextField = "Special";
            Itmdrplist.DataValueField = "Special";
            Itmdrplist.DataBind();
            Itmdrplist.Items.Insert(0, new ListItem("Select the Item"));
        }
        void GetData()
        {
            var db = new Pizza15Model();
            var DailySpecials = db.tblDailySpecials.Select(x => new
            {
                DailyID = x.DailyID,
                Special = x.Special,
                Day = x.Day
            }).ToList();

            dg.DataSource = DailySpecials;
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
                var DailySpecials = db.tblDailySpecials.FirstOrDefault(x => x.DailyID.Equals(ID));
                if (DailySpecials != null)
                {
                    db.tblDailySpecials.Remove(DailySpecials);
                    db.SaveChanges();
                }

                dg.ShowFooter = true;
                Session["DailySpecial"] = null;
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
                    TextBox txtDay = e.Item.FindControl("txtDayF") as TextBox;
                    TextBox txtSpecial = e.Item.FindControl("txtSpecialF") as TextBox;

                    if (txtDay != null && txtSpecial != null)
                    {
                        var DailySpecials = db.tblDailySpecials.Select(x => new
                        {
                            DailyID = x.DailyID,
                            Day = x.Day,
                            Special = x.Special,
                        }).ToList();
                        if (DailySpecials.Count != 0)
                        {
                            var strQueryMax = db.tblDailySpecials.Max(x => x.DailyID);
                            int nMaxID = Convert.ToInt32(strQueryMax);

                            var strQuery = new tblDailySpecial();
                            strQuery.DailyID = nMaxID + 1;
                            strQuery.Day = txtDay.Text;
                            strQuery.Special = txtSpecial.Text;
                            db.tblDailySpecials.Add(strQuery);
                            db.SaveChanges();
                        }
                        else
                        {
                            var strQueryMax = db.tblDailySpecials;
                            var strQuery = new tblDailySpecial();
                            strQuery.Day = txtDay.Text;
                            strQuery.Special = txtSpecial.Text;
                            db.tblDailySpecials.Add(strQuery);
                            db.SaveChanges();
                        }
                    }
                    else
                    {
                        lblError.Text = "Error finding the Daily Specials";
                    }

                    Session["DailySpecial"] = null;
                    GetData();
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

                TextBox txtDay = e.Item.FindControl("txtDayE") as TextBox;
                TextBox txtSpecial = e.Item.FindControl("txtSpecialE") as TextBox;

                if (txtDay != null && txtSpecial != null)
                {
                    var db = new Pizza15Model();
                    tblDailySpecial UpdateDailySpecial = db.tblDailySpecials.FirstOrDefault(x => x.DailyID.Equals(nStrID));

                    if (UpdateDailySpecial != null)
                    {
                        UpdateDailySpecial.Day = txtDay.Text.Trim();
                        UpdateDailySpecial.Special = txtSpecial.Text.Trim();
                        db.SaveChanges();
                    }
                }
                else
                {
                    lblError.Text = "Error finding the Daily Special";
                }

                dg.EditItemIndex = -1;
                dg.ShowFooter = true;
                Session["DailySpecial"] = null;
                GetData();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
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

                var dailysplcount = (from q in db.tblSpecialsVlddates
                                     where q.Itemname == itemname
                                     where q.Specialtype == "DailySpecials"
                                     select new { q }).Count();
                if (dailysplcount == 0)
                {
                    if (enddate >= startdate)
                    {
                        if (enddate >= System.DateTime.Today & startdate >= System.DateTime.Today)
                        {
                            itemvlddates.Itemname = itemname;
                            itemvlddates.Specialtype = "DailySpecials";
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
                            lblmsg.Text = "Start date & End date cannot be less than today's date.";
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
                            var dailysp = (from q in db.tblSpecialsVlddates
                                           where q.Itemname == itemname
                                           where q.Specialtype == "DailySpecials"
                                           select new { q }).FirstOrDefault();
                            dailysp.q.vldstartdate = startdate;
                            dailysp.q.vldenddate = enddate;
                            db.SaveChanges();
                            lblmsg.Text = "Details saved successfully.";
                            lblmsg.ForeColor = System.Drawing.Color.Green;
                        }else
                        {
                            lblmsg.Text = "Start date & End date cannot be less than today's date.";
                            lblmsg.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    else
                    {
                        lblmsg.Text = "Start date cannot be greater than end date.";
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
                            where q.Specialtype == "DailySpecials"
                            select new { q.vldstartdate, q.vldenddate }).FirstOrDefault();
            if (vlddates != null)
            { 
            DateTime vldstrtval = Convert.ToDateTime(vlddates.vldstartdate);
            DateTime vldendval = Convert.ToDateTime(vlddates.vldenddate);
            TxtVldst.Value = vldstrtval.ToString("yyyy-MM-dd");
            TxtVldend.Value = vldendval.ToString("yyyy-MM-dd");
            }

        }
    }
}