using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using _15thstreetpizza.Models;

namespace _15thstreetpizza
{
    public partial class Albumsubpictures : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populatesubalbums();
            }
        }

        protected void populatesubalbums()
        {
            string id;
            var db = new Pizza15Model();

            id = Request.QueryString["id"].Trim();

            if (id== "Food Pictures")
            { 
            var subcatalbum = (from q in db.tbl_ImageCategory
                               where q.CategoryName == id
                               select new { q.SubCategoryName, q.Subcatgimgurl }).ToList().Distinct();

            albumsubrpt.DataSource = subcatalbum;
            albumsubrpt.DataBind();
            }



        }



        protected void albumsubrpt_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }

        protected void Lnkalbum_Click(object sender, EventArgs e)
        {
            try
            {
                string subalbimid = string.Empty;

                Session["subData"] = (sender as LinkButton).CommandArgument;
                subalbimid = Convert.ToString(Session["subData"]);

                Response.Redirect("ViewAlbumPictures.aspx?id=" + subalbimid);
            }
            catch
            {

            }
        }

        
    }
}