using _15thstreetpizza.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _15thstreetpizza
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    FillSpecialsRepeater();
                    FillVideosRepeater();
                    //GetTopTestimonial();
                    poputimedetails();
                    disphrsect();
                }
                
            }
            catch
            {
                //Put error label and error message here, make sure to capture the error message in web.config
                String strAppMsg = ConfigurationManager.AppSettings["GenericSystemError"];
                //lblError.Text = strAppMsg;

            }
        }


        protected void disphrsect()
        {
            var db = new Pizza15Model();

            var selflag = (from q in db.tblMainPageItems
                           where q.ItemID == 31
                           select new { q.Link }).FirstOrDefault();

            if (selflag.Link == "Y")
            {
                hrsct.Visible = true;
            }
            else
            {
                hrsct.Visible = false;
            }
        }

        private void FillVideosRepeater()
        {
            try
            {
                var db = new Pizza15Model();
                var Videos = db.tbl_Vedios.Select(x => new
                {
                    VideoURL = x.VideoUrl
                }).ToList();
                rptVideo.DataSource = Videos;
                rptVideo.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void FillSpecialsRepeater()
        {
            try
            {
                var db = new Pizza15Model();
                var Specials = db.tblMainPageItems.OrderBy(x => x.Indx).Where(x => x.ItemID < 31).Select(x => new
                {
                    ItemID = x.ItemID,
                    Item = x.Item,
                    Link = x.Link,
                    Indx = x.Indx
                }).ToList();

                rptSpecials.DataSource = Specials;
                rptSpecials.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //private void GetTopTestimonial()
        //{
        //    try
        //    {
        //        //String strID = ConfigurationManager.AppSettings["TopTestimonialID"];
        //        //int nID = Convert.ToInt32(strID);
        //        var db = new Pizza15Model();
        //        //var Testimonial = db.tbl_Testimonials.Where(x => x.ID == nID).OrderByDescending(x => x.Dates).ToList();
        //        var Testimonial = db.tbl_Testimonials.Where(x => x.IsVerified == true).OrderByDescending(x => x.Dates).ToList();
        //        if (Testimonial.Count > 0)
        //        {
        //            Random rand = new Random();
        //            int nIndex = rand.Next(Testimonial.Count - 1);
        //            lblTestimonialName.Text = Testimonial[nIndex].Names;
        //            lblTestimonialDate.Text = Convert.ToDateTime(Testimonial[nIndex].Dates).ToString("dd MMM"); //dd MMM yyyy - Removed year now
        //            lblTestimonialTitle.Text = Testimonial[nIndex].Title;
        //            lblTestimonial.Text = Testimonial[nIndex].Review;
        //        }
        //        else
        //        {
        //            lblTestimonialName.Text = "Angelina";
        //            lblTestimonialDate.Text = "9/24/2015";
        //            lblTestimonialTitle.Text = "First Experience and Amazing!!!";
        //            lblTestimonial.Text = "I had the wings (Garlic Parmesean) and fried pickles.. OMG sooooo good. I'm ordering now. I will definetely put the word out for this place. An the delivery was fast as well!!! Keep up the great work guys.";
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        protected void rptSpecials_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    int nItemID = Convert.ToInt32(DataBinder.Eval(e.Item.DataItem, "ItemID"));
                    var db = new Pizza15Model();
                    var SubItems = db.tblMainPageSubItems.Where(x => x.ItemID == nItemID).OrderBy(x => x.Indx).Select(t => new
                    {
                        SubItemID = t.SubItemID,
                        SubItem = t.SubItem,
                        Indx = t.Indx
                    }).ToList();
                    if (SubItems.Count > 0)
                    {
                        Repeater rptSubSpecials = (Repeater)(e.Item.FindControl("rptSubSpecials"));
                        rptSubSpecials.DataSource = SubItems;
                        rptSubSpecials.DataBind();
                    }
                }
            }
            catch
            {
                //Put error label and error message here, make sure to capture the error message in web.config
                String strAppMsg = ConfigurationManager.AppSettings["GenericSystemError"];
                //lblError.Text = strAppMsg;
            }
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("http://visitor.r20.constantcontact.com/manage/optin/ea?v=001l2E62PqC4Z0JrjYvXTqU7ki4Re5uW20w53Q6s2jw4GCJVJQfC0--KrCS-4r7GQdLWzhXnKw9NBSTEfQ5r1sevzv-JF2oVcnqzLrRBshlAeE%3D", false);
        }

        // Facebook Login button customer details capture start 05/11/2019

        protected void lnkFBcust_Click(object sender, EventArgs e)
        {
            tbl_FBcustdet addFBcustdtls = new tbl_FBcustdet();
            Pizza15Model db = new Pizza15Model();
            var excustdtls = (from q in db.tbl_FBcustdet
                              where q.CustemailID == Lblemail.Text.Trim()
                              select new { q.CustemailID }).ToList();

            if (excustdtls.Count == 0)
            {
                addFBcustdtls.CustemailID = Lblemail.Text.Trim();
                addFBcustdtls.CustName = Lblname.Text.Trim();
                addFBcustdtls.Custgend = Lblgend.Text.Trim();
                addFBcustdtls.Custcreats = DateTime.Now;
                addFBcustdtls.CustFBID = LblFBid.Text.Trim();

                db.tbl_FBcustdet.Add(addFBcustdtls);
                db.SaveChanges();
            }
            else
            {
                Response.Redirect("Default.aspx", false);

            }
        }

        protected void poputimedetails()
        {
            Pizza15Model db = new Pizza15Model();

            var timdetl = (from q in db.tblContactUs
                           select new { q.HoursLine1,q.HoursLine2,q.HoursLine3 }).FirstOrDefault();

            Lbltim1.Text = timdetl.HoursLine1;

            if (Lbltim1.Text == string.Empty)
            {
                tim1.Visible = false;
            }
            else
            {
                tim1.Visible = true;
            }

            Lbltim2.Text = timdetl.HoursLine2;

            if (Lbltim2.Text == string.Empty)
            {
                tim2.Visible = false;
            }
            else
            {
                tim2.Visible = true;
            }

            Lbltim3.Text = timdetl.HoursLine3;

            if (Lbltim3.Text == string.Empty)
            {
                tim3.Visible = false;
            }
            else
            {
                tim3.Visible = true;
            }

        }

        protected void AddFBcustdetails()
        {
            tbl_FBcustdet addFBcustdtls = new tbl_FBcustdet();
            Pizza15Model db = new Pizza15Model();
            var excustdtls = (from q in db.tbl_FBcustdet
                              where q.CustemailID == Lblemail.Text.Trim()
                              select new { q.CustemailID }).ToList();

            if (excustdtls.Count == 0)
            {
                addFBcustdtls.CustemailID = Lblemail.Text.Trim();
                addFBcustdtls.CustName = Lblname.Text.Trim();
                addFBcustdtls.Custgend = Lblgend.Text.Trim();
                addFBcustdtls.Custcreats = DateTime.Now;
                addFBcustdtls.CustFBID = LblFBid.Text.Trim();

                db.tbl_FBcustdet.Add(addFBcustdtls);
                db.SaveChanges();
            }
            else
            {
                Response.Redirect("Default.aspx", false);

            }
        }

        // Facebook Login button customer details capture end 05/11/2019
    }
}