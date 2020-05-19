
using _15thstreetpizza.Models;
using System;
using System.Linq;

namespace PizzaV5
{
    public partial class AdminCareers : System.Web.UI.Page
    {
        Pizza15Model db = new Pizza15Model();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var db = new Pizza15Model();
                try
                {
                    if ((Session["UserName"] == null) || (Session["UserName"].ToString() == string.Empty))
                    {
                        Response.Redirect("Login.aspx?ReturnUrl=%2fadminhome.aspx", false);
                    }
                    else
                    {
                        var flg = (from q in db.Careerapplies
                                   select new { q.careerflgindicator }).SingleOrDefault();

                        if(flg.careerflgindicator == "Y")
                        {
                            Enablerradio.Checked = true;
                        }
                        else if(flg.careerflgindicator == "N")
                        {
                            Disableradio.Checked = true;
                        }
                    }
                }
                catch (Exception ex)
                {

                    lblmsg.Text = Convert.ToString(ex);
                }
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            try
            {
                
                string flgindicator = string.Empty; ;
                if (Enablerradio.Checked == true)
                {
                    flgindicator = "Y";
                }
                else if (Disableradio.Checked == true)
                {
                    flgindicator = "N";
                }

                var updateCareer = (from q in db.Careerapplies
                                    select new { q }).SingleOrDefault();

                updateCareer.q.careerflgindicator = flgindicator;
                db.SaveChanges();
                lblmsg.Text = "Details have been saved successfully";
            }
            catch(Exception ex)
            {
                lblmsg.Text = "Internal Server Issue please try again";
            }
        }

        //protected void Reset_Click(object sender, EventArgs e)
        //{
        //    Enablerradio.Checked = false;
        //    Disableradio.Checked = false;
        //    Label1.Text = "";
        //}

        //void check()
        //{
        //    if (Disableradio.Checked == true)
        //    {
        //        radio2();
        //    }
        //    else if (Enablerradio.Checked == true)
        //    {
        //        radio1();
        //    }
        //}

        //void radio1()
        //{
        //    try
        //    {
        //        var db = new Pizza15Model();
        //        Career Hiring = db.Careers.Single(x => x.Career1.Equals(false));
        //        if(Hiring != null)
        //        {
        //            Hiring.Career1 = Convert.ToBoolean(Enablerradio.Text);
        //            db.SaveChanges();
        //            Label1.Text = "Data entered successfully!!!";
        //        }
        //    }
        //    catch 
        //    {
        //        Label1.Text = "Internal Server Issue please try again";
        //    }
        //}

        //void radio2()
        //{
        //    try
        //    {
        //        var db = new Pizza15Model();
        //        Career NotHiring = db.Careers.Single(x => x.Career1.Equals(true));
        //        if(NotHiring != null)
        //        {
        //            NotHiring.Career1 = Convert.ToBoolean(Disableradio.Text);
        //            db.Careers.Add(NotHiring);
        //            db.SaveChanges();
        //            Label1.Text = "Data entered successfully!!!";
        //        }
        //    }
        //    catch 
        //    {
        //       Label1.Text = "Internal Server Issue please try again";
        //    }
        //}
    }
}