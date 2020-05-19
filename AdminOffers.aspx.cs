using _15thstreetpizza.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PizzaV5
{
    public partial class AdminOffers : System.Web.UI.Page
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
            var Offers = db.tblOffers.Select(x => new
            {
                OfferID = x.OfferID,
                Heading = x.Heading,
                Offer = x.Offer,
                EndLine = x.EndLine,
                Active = x.Active
            }).ToList();
           
                dg.DataSource = Offers;
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
                var DeleteOffer = db.tblOffers.FirstOrDefault(x => x.OfferID.Equals(ID));
                if (DeleteOffer != null)
                {
                    db.tblOffers.Remove(DeleteOffer);
                    db.SaveChanges();
                }

                dg.ShowFooter = true;
                Session["Offer"] = null;
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
                    TextBox txtHeadingF = e.Item.FindControl("txtHeadingF") as TextBox;
                    TextBox txtOfferF = e.Item.FindControl("txtOfferF") as TextBox;
                    TextBox txtEndLineF = e.Item.FindControl("txtEndLineF") as TextBox;
                    CheckBox chkActiveF = e.Item.FindControl("chkActiveF") as CheckBox;

                    if (txtHeadingF != null && txtOfferF != null && txtEndLineF != null && chkActiveF != null )
                    {
                        var strQueryMax = db.tblOffers.Max(x => x.OfferID );
                        int nMaxID = Convert.ToInt32(strQueryMax);
                      
                        var strQuery = new tblOffer();
                        if(nMaxID != 0)
                        {
                            strQuery.OfferID = nMaxID + 1;
                        }
                        else
                        {
                            strQuery.OfferID = 1;
                        }
                       
                        strQuery.Heading = txtHeadingF.Text;
                        strQuery.Offer = txtOfferF.Text;
                        strQuery.EndLine = txtEndLineF.Text;
                        strQuery.Active = Convert.ToBoolean(chkActiveF.Checked);
                        db.tblOffers.Add(strQuery);
                        db.SaveChanges();
                    }
                    else
                    {
                        lblError.Text = "Error finding the Offers";
                    }

                    Session["Offer"] = null;
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

                TextBox txtHeadingE = e.Item.FindControl("txtHeadingE") as TextBox;
                TextBox txtOfferE = e.Item.FindControl("txtOfferE") as TextBox;
                TextBox txtEndLineE = e.Item.FindControl("txtEndLineE") as TextBox;
                CheckBox chkActiveE = e.Item.FindControl("chkActiveE") as CheckBox;

                if (txtHeadingE != null && txtOfferE != null && txtEndLineE != null && chkActiveE != null)
                {
                    var db = new Pizza15Model();
                    tblOffer UpdateOffer = db.tblOffers.FirstOrDefault(x => x.OfferID.Equals(nStrID));

                    if (UpdateOffer != null)
                    {
                        UpdateOffer.Heading = txtHeadingE.Text.Trim();
                        UpdateOffer.Offer = txtOfferE.Text.Trim();
                        UpdateOffer.EndLine = txtEndLineE.Text.Trim();
                        UpdateOffer.Active =  Convert.ToBoolean(chkActiveE.Checked);
                        db.SaveChanges();
                    }
                }
                else
                {
                    lblError.Text = "Error finding the Offers";
                }

                dg.EditItemIndex = -1;
                dg.ShowFooter = true;
                Session["Offer"] = null;
                GetData();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
    }
}