using _15thstreetpizza.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _15thstreetpizza
{
    public partial class Events : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Event();
            }
        }

        private void Event()
        {
            var db = new Pizza15Model();

            var Events = db.tblNewsEvents.Where(x => x.Active.Equals(true)).Select(x => new
            {
                NewsID = x.NewsID,
                News = x.News,
                Active = x.Active,
                Indx = x.Indx
            }).OrderBy(x => x.Indx).ToList();
            RepeaterEvents.DataSource = Events;
            RepeaterEvents.DataBind();

        }
    }
}