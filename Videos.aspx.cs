using _15thstreetpizza.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _15thstreetpizza
{
    public partial class Videos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    GetVideos();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void GetVideos()
        {
            try
            {
                var db = new Pizza15Model();
                var Videos = db.tbl_Vedios.Select(x => new
                {
                    VideoUrl = x.VideoUrl,

                }).ToList();
                rptRepeater.DataSource = Videos;
                rptRepeater.DataBind();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}