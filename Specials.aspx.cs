using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using _15thstreetpizza.Models;

namespace _15thstreetpizza
{
    public partial class Specials : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populatedrpdown();
                Vlddatesload();
                getspecialdata();
                
            }
        }

        public void populatedrpdown()
        {
            var db = new Pizza15Model();
            drpspllist.Items.Insert(0, new ListItem("DailySpecials", "0"));
            drpspllist.Items.Insert(1, new ListItem("LunchSpecials", "1"));
            //drpspllist.Items.Insert(2, new ListItem("PizzaSpecials", "2"));

            //drpspllist.DataSource = db.tblSpecialsVlddates.ToList().Distinct();
            //drpspllist.DataTextField = "Specialtype";
            //drpspllist.DataValueField = "Specialtype";
            //drpspllist.DataBind();
        }
        public void Vlddatesload()
        {
            var db = new Pizza15Model();

            if (drpspllist.SelectedItem.Text == "DailySpecials")
            { 
         
            var dsdates = (from q in db.tblSpecialsVlddates
                           where q.Specialtype == "DailySpecials"
                           select new {q.vldenddate }).Max(x=> x.vldenddate);
                string date = dsdates.ToString();
                string dsstdate = date.Substring(0, 10);


            var dsstdates = (from q in db.tblSpecialsVlddates
                             where q.Specialtype == "DailySpecials"
                             select new { q.vldstartdate }).Min(x => x.vldstartdate);

                string enddate = dsstdates.ToString();
                string dsenddate = enddate.Substring(0, 10);


                lblstartdate.Text = dsenddate;
                lblenddate.Text = dsstdate;
            }

            if (drpspllist.SelectedItem.Text == "LunchSpecials")
            {

                var lsdates = (from q in db.tblSpecialsVlddates
                               where q.Specialtype == "LunchSpecials"
                               select new { q.vldenddate }).Max(x=> x.vldenddate);

                string lsstdate = lsdates.ToString();
                string lsstmoddate = lsstdate.Substring(0, 10);

                var lsstdates = (from q in db.tblSpecialsVlddates
                                 where q.Specialtype == "LunchSpecials"
                                 select new { q.vldstartdate }).Min(x=> x.vldstartdate);

                string lsenddate = lsstdates.ToString();
                string lsendmoddate = lsenddate.Substring(0, 10);

                lblstartdate.Text = lsendmoddate;
                lblenddate.Text = lsstmoddate;
            }

            if (drpspllist.SelectedItem.Text == "PizzaSpecials")
            {

                var psdates = (from q in db.tblSpecialsVlddates
                               where q.Specialtype == "PizzaSpecials"
                               select new {q.vldenddate }).Max(x=> x.vldenddate);
                var psstdates = (from q in db.tblSpecialsVlddates
                                 where q.Specialtype == "PizzaSpecials"
                                 select new { q.vldstartdate }).Min(x=> x.vldstartdate);


                lblstartdate.Text = Convert.ToString(psstdates);
                lblenddate.Text = Convert.ToString(psdates);
            }
        }

        public void getspecialdata()
        {
            var db = new Pizza15Model();
            List<ListItem> specials = new List<ListItem>();

            if (drpspllist.SelectedItem.Text=="DailySpecials")
            {

                var dailysp = (from q in db.tblDailySpecials
                               select new { daiID = q.DailyID,
                                   daiday = q.Day,
                                   daispe = q.Special }).ToList();
                Rptspecials.DataSource = dailysp;
                Rptspecials.DataBind();
                dailid.Visible = true;
                LunchID.Visible = false;
                PizzaID.Visible = false;
            }
            if (drpspllist.SelectedItem.Text == "LunchSpecials")
            {
                var lunchsp = (from q in db.tblLunchSpecials
                               select new { dailday=q.day,
                                            dailitem=q.Item,
                                            dailprics=q.Price,
                                            indx=q.Indx}).OrderBy(x=>x.indx).ToList();
                Rptlunsp.DataSource = lunchsp;
                Rptlunsp.DataBind();
                dailid.Visible = false;
                LunchID.Visible = true;
                PizzaID.Visible = false;

            }
            if (drpspllist.SelectedItem.Text == "PizzaSpecials")
            {
                var pizzasp = (from q in db.tbl_pizzaspecials
                               select new
                               {
                                   Pizzaitem = q.Name,
                                   Pizzaday = q.day,
                                   Pizsmlpric = q.col_Small,
                                   Pizpersopric = q.col_Personal,
                                   Pizzamedpric = q.col_Medium,
                                   Pizzalargpric = q.col_large
                               }).ToList();
                Rptpizza.DataSource = pizzasp;
                Rptpizza.DataBind();
                dailid.Visible = false;
                LunchID.Visible = false;
                PizzaID.Visible = true;
                

            }
        }

        protected void drpspllist_SelectedIndexChanged(object sender, EventArgs e)
        {
            getspecialdata();
            Vlddatesload();
        }
    }
}