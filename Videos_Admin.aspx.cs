using _15thstreetpizza.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PizzaV5
{
    public partial class Videos_Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblError.Text = "";
                if (!this.IsPostBack)
                {
                    GetData();
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
            var Videos = db.tbl_Vedios.Select(x => new
            {
                Id = x.ID,
                Name = x.Name,
                VideoURL = x.VideoUrl
            }).ToList();
            if (Videos.Count != 0)
            {
                dgVedios.DataSource = Videos;
                dgVedios.DataBind();
            }
            else
            {
                lblError.Text = "No Data"; //Need to get Error Message From Web.Config File.
            }

        }

        protected void dgVedios_CancelCommand(object source, DataGridCommandEventArgs e)
        {
            try
            {
                dgVedios.EditItemIndex = -1;
                dgVedios.ShowFooter = true;
                GetData();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void dgVedios_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
            try
            {
                string strID = dgVedios.DataKeys[e.Item.ItemIndex].ToString();
                var db = new Pizza15Model();
                int ID = Convert.ToInt32(strID);
                var DeleteVideo = db.tbl_Vedios.FirstOrDefault(x => x.ID.Equals(ID));
                if (DeleteVideo != null)
                {
                    db.tbl_Vedios.Remove(DeleteVideo);
                    db.SaveChanges();
                }
                dgVedios.ShowFooter = true;
                Session["Videos"] = null;
                this.GetData();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void dgVedios_EditCommand(object source, DataGridCommandEventArgs e)
        {
            try
            {
                dgVedios.EditItemIndex = Convert.ToInt32(e.Item.ItemIndex);
                dgVedios.ShowFooter = false;
                GetData();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void dgVedios_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "AddANewRow")
                {
                    var db = new Pizza15Model();
                    TextBox txtNames = e.Item.FindControl("txtNamesF") as TextBox;
                    TextBox txtVideoURL = e.Item.FindControl("txtVideoURLF") as TextBox;
                    if (txtNames != null && txtVideoURL != null)
                    {
                        var strQueryMax = db.tbl_Vedios.Max(x => x.ID);
                        int nMaxID = Convert.ToInt32(strQueryMax);

                        var strQuery = new tbl_Vedios();
                        if (nMaxID != 0)
                        {
                            strQuery.ID = nMaxID + 1;
                        }
                        else
                        {
                            strQuery.ID = 1;
                        }

                        strQuery.Name = txtNames.Text;
                        strQuery.VideoUrl = txtVideoURL.Text;

                        db.tbl_Vedios.Add(strQuery);
                        db.SaveChanges();
                    }
                    else
                    {
                        lblError.Text = "Error finding the Videos";
                    }

                    Session["Vodeos"] = null;
                    GetData();
                }

            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void dgVedios_SortCommand(object source, DataGridSortCommandEventArgs e)
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

        protected void dgVedios_UpdateCommand(object source, DataGridCommandEventArgs e)
        {
            try
            {
                string strID = dgVedios.DataKeys[e.Item.ItemIndex].ToString();
                int nStrID = Convert.ToInt32(strID);
                string strVideos = "";
                TextBox txtNames = e.Item.FindControl("txtNamesE") as TextBox;
                TextBox txtVideoURL = e.Item.FindControl("txtVideoURLE") as TextBox;
                if ((txtNames != null && txtVideoURL != null))
                {
                    strVideos = txtNames.Text;
                    var db = new Pizza15Model();
                    tbl_Vedios UpdateVideos = db.tbl_Vedios.FirstOrDefault(x => x.ID.Equals(nStrID));

                    if (UpdateVideos != null)
                    {
                        UpdateVideos.Name = txtNames.Text.Trim();
                        UpdateVideos.VideoUrl = txtVideoURL.Text.Trim();

                        db.SaveChanges();
                    }
                }
                else
                {
                    lblError.Text = "Error finding the Video";
                }

                dgVedios.EditItemIndex = -1;
                dgVedios.ShowFooter = true;
                Session["Videos"] = null;
                GetData();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void dgVedios_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
    }
