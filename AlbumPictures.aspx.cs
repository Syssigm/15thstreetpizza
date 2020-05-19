using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using _15thstreetpizza.Models;

namespace _15thstreetpizza
{
    public partial class AlbumPictures : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            var db = new Pizza15Model();

            if (!IsPostBack)
            {
                populatealbums();
            }

        }

        protected void populatealbums()
        {
            var db = new Pizza15Model();
            var albumnames = (from q in db.tbl_ImageCategory
                              where q.CategoryID <19
                              select new { q.CategoryName, q.Catgimgurl,q.Catdescription }).ToList().Distinct();
            albumrpt.DataSource = albumnames;
            albumrpt.DataBind();
            
        }

        protected void albumrpt_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }

        protected void Lnkalbum_Click(object sender, EventArgs e)
        {
            try
            {
                string albimid = string.Empty;

                Session["Data"] = (sender as LinkButton).CommandArgument;
                albimid = Convert.ToString(Session["Data"]);
                if (albimid== "Food Pictures")
                { 
                Response.Redirect("Albumsubpictures.aspx?id=" + albimid);
                }
                else
                {
                 Response.Redirect("ViewAlbumPictures.aspx?id=" + albimid);
                }

            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
    }
}