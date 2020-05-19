using _15thstreetpizza.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _15thstreetpizza
{
    public partial class WriteaReview : System.Web.UI.Page
    {
        MailMessage message;
        SmtpClient smtp;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                var db = new Pizza15Model();
                var strQueryMax = db.tbl_Testimonials.Max(x => x.ID);
                if (strQueryMax != 0)
                {
                    int nMaxID = Convert.ToInt32(strQueryMax);
                    var Review = Server.HtmlDecode(txtComment.Text);
                    var strQuery = new tbl_Testimonials();
                    strQuery.ID = nMaxID + 1;
                    strQuery.Names = txtName.Text;
                    strQuery.Title = txtTitle.Text;
                    strQuery.Review = Server.HtmlDecode(Review);
                    strQuery.Dates = DateTime.Now;
                    db.tbl_Testimonials.Add(strQuery);
                    try
                    {
                        db.SaveChanges();
                        StringBuilder sb = new StringBuilder();
                        sb.Append("Testimonial written by " + " " + txtName.Text);
                        sb.Append("<br/>");
                        sb.AppendLine("Testimonial Title" + " " + txtTitle.Text);
                        sb.Append("<br/>");
                        sb.AppendLine("Testimonial Review " + " " + Server.HtmlDecode(txtComment.Text));
                        sb.Append("<br/>");
                        //sb.AppendLine("Please go to admin page http://www.15thstreetpizza.com/AdminHome.aspx " + "To Approve");
                        sb.AppendLine("Please go to admin page http://www.15thstreetpizza.com/Approve.aspx?ID=" + (nMaxID + 1).ToString());
                        string mailTosend = "";
                        mailTosend = sb.ToString();
                        SendMail(mailTosend);
                        Page.RegisterStartupScript("UserMsg", "<script>alert('Added Review Successfully...');if(alert){ window.location='WriteaReview.aspx';}</script>");
                        txtTitle.Text = "";
                        txtName.Text = "";
                        txtComment.Text = "";
                    }
                    catch
                    {
                        Page.RegisterStartupScript("UserMsg", "<script>alert('Failed, Try again...');if(alert){ window.location='WriteaReview.aspx';}</script>");
                    }

                }
            }
            catch
            {
                lblError.Text = "System Excpetion Please";
            }
        }

        private void SendMail(string mailbody)
        {
            message = new MailMessage();
            message.To.Add(ConfigurationManager.AppSettings["MailTo4"]);
            message.Subject = ConfigurationManager.AppSettings["MailSubject"];
            message.From = new MailAddress(ConfigurationManager.AppSettings["FromEmail"]);
            message.Body = mailbody;
            message.IsBodyHtml = true;
            smtp = new SmtpClient(ConfigurationManager.AppSettings["ServerHost"]);
            smtp.Port = Convert.ToInt32(ConfigurationManager.AppSettings["PortNumber"]);
            smtp.EnableSsl = true;
            smtp.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["FromEmail"], ConfigurationManager.AppSettings["Password"]);
            smtp.Send(message);
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtTitle.Text = "";
            txtName.Text = "";
            txtComment.Text = "";
        }
    }
}