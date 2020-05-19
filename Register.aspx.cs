using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using _15thstreetpizza.Models;

namespace _15thstreetpizza
{
    public partial class Register : System.Web.UI.Page
    {
        MailMessage message;
        SmtpClient smtp;
        protected void Page_Load(object sender, EventArgs e)
        {
            var db = new Pizza15Model();

            var careerpgflg = (from q in db.Careerapplies
                               select new { q.careerflgindicator }).SingleOrDefault();

            if(careerpgflg.careerflgindicator == "Y")
            {
                carepage.Visible = true;
                hiremsg.Visible = false;
            }
            else if(careerpgflg.careerflgindicator == "N")
            {
                carepage.Visible = false;
                hiremsg.Visible = true;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            message = new MailMessage();
            message.To.Add("patrick@15thstreetpizza.com");
            message.To.Add("dennis@15thstreetpizza.com");
            message.To.Add("sesh@syssigma.com");
           //message.To.Add("Katie@15thstreetpizza.com");
            message.To.Add("phani@syssigma.com");
           // message.To.Add("naveen@syssigma.com");
            message.Subject = "Job application";
            message.From = new MailAddress("recruit15thstreetpizza@gmail.com");
            message.Body = "<b><font color=" + "#0077B3" + ">Name:</font></b>" + "&nbsp;" + txtFirstName.Text + "<br/>" +
                           "<b><font color=" + "#0077B3" + ">Last Name:</font></b>" + "&nbsp;" + txtLastName.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">EmailID:</font></b>" + "&nbsp;" + txtEmailID.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">Mobile:</font></b>" + "&nbsp;" + txtMobile.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">Address:</font></b>" + "&nbsp;" + txtAddress.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">City:</font></b>" + "&nbsp;" + txtCity.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">State:</font></b>" + "&nbsp;" + txtState.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">Zip:</font></b>" + "&nbsp;" + txtzip.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">Referred By:</font></b>" + "&nbsp;" + txtref.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">Are you employed?:</font></b>" + "&nbsp;" + DropDownList1.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">May we inquire of your present employer? :</font></b>" + "&nbsp;" + DropDownList2.Text +
                           "<br/>" + "<br/>" + "<b><font color=" + "#00416E" + ">Employment Desired</font></b>" + "<br/>" +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">Position:</font></b>" + "&nbsp;" + txtpos.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">Date you can start:</font></b>" + "&nbsp;" + txtstartdate.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">Desired Salary:</font></b>" + "&nbsp;" + txtsalary.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">Ever applied to 15th Street Pizza & Pub Before? :</font></b>" + "&nbsp;" + DropDownList3.Text + "<br/>" +
                           "<b><font color=" + "#0077B3" + ">If yes, where?:</font></b>" + "&nbsp;" + txtwhere.Text + "<br/>" +
                           "<b><font color=" + "#0077B3" + ">If yes, when?:</font></b>" + "&nbsp;" + txtwhen.Text +
                           "<br/>" + "<br/>" + "<b><font color=" + "#00416E" + ">Educational History</font></b>" + "<br/>" + "<br/>" +
                           "<b><font color=" + "#0077B3" + ">School Name:</font></b>" + "&nbsp;" + txtschool.Text + "<br/>" +
                           "<b><font color=" + "#0077B3" + ">School Location:</font></b>" + "&nbsp;" + txtscloc.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">Years Attended:</font></b>" + "&nbsp;" + txtattend.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">Did you graduate? :</font></b>" + "&nbsp;" + DropDownList4.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">Subject Studied:</font></b>" + "&nbsp;" + txtsub.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">High School:</font></b>" + "&nbsp;" + txthighscl.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">Other Schools:</font></b>" + "&nbsp;" + txtotherscl.Text +
                           "<br/>" + "<br/>" + "<b><font color=" + "#00416E" + ">General Information</font></b>" + "<br/>" + "<br/>" +
                           "<b><font color=" + "#0077B3" + ">Subjects of Special Study/Research Work or Special Training/Skills:</font></b>" +
                           "&nbsp;" + txtspec.Text + "<br/>" + "<b><font color=" + "#0077B3" + ">US Military or Naval Service?:</font></b>" + "&nbsp;" + txtus.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">Rank :</font></b>" + "&nbsp;" + txtrank.Text + "<br/>" +
                           // Career calender integration start 05/11/2019
                           "<br/>" + "<br/>" + "<b><font color=" + "#00416E" + ">Availability Details:</font></b>" + "<br/>" + "<br/>" +
                           "<table border=" + 1 + " cellpadding=" + 0 + " cellspacing=" + 0 + " valign="+"middle"+ " width = " + 400 + "><tr><th>Time Slots</th><th> AM (EST) in hours</th><th> PM (EST) in hours</th></tr>" +
                                                                                                                   "<tr><th>MON</th><td align='center'>" + Txtmonmor.Text.Trim() + " </td><td align='center'>" + Txtmonafter.Text.Trim() + "</td></tr>" +
                                                                                                                   "<tr><th>TUE</th><td align='center'>" + Txttuemor.Text.Trim() + " </td><td align='center'>" + Txttueafter.Text.Trim() + "</td></tr>" +
                                                                                                                   "<tr><th>WED</th><td align='center'>" + Txtwedmor.Text.Trim() + " </td><td align='center'>" + Txtwedafter.Text.Trim() + "</td></tr>" +
                                                                                                                   "<tr><th>THU</th><td align='center'>" + Txtthumor.Text.Trim() + " </td><td align='center'>" + Txtthuafter.Text.Trim() + "</td></tr>" +
                                                                                                                   "<tr><th>FRI</th><td align='center'>" + Txtfrimor.Text.Trim() + " </td><td align='center'>" + Txtfriafter.Text.Trim() + "</td></tr>" +
                                                                                                                   "<tr><th>SAT</th><td align='center'>" + Txtsatmor.Text.Trim() + " </td><td align='center'>" + Txtsatafter.Text.Trim() + "</td></tr>" +
                                                                                                                   "<tr><th>SUN</th><td align='center'>" + Txtsunmor.Text.Trim() + " </td><td align='center'>" + Txtsunafter.Text.Trim() + "</td></tr></table>" +

                           // Career calender integration end 05/11/2019

                           "<br/>" + "<b><font color=" + "#00416E" + ">Employer #1</font></b>" + "<br/>" + "<br/>" +
                           "<b><font color=" + "#0077B3" + ">Name:</font></b>" + "&nbsp;" + txtnam.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">Supervisor:</font></b>" + "&nbsp;" + txtSupervisor.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">Phone:</font></b>" + "&nbsp;" + txtph.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">City:</font></b>" + "&nbsp;" + txtCty.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">State:</font></b>" + "&nbsp;" + txtStat.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">ZIP/Postal Code:</font></b>" + "&nbsp;" + txtPostalCode.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">Position:</font></b>" + "&nbsp;" + txtPosition.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">Reason for Leaving:</font></b>" + "&nbsp;" + txtreson.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">Start Date:</font></b>" + "&nbsp;" + txtstrtdate.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">End Date:</font></b>" + "&nbsp;" + txtEnDate.Text +
                           "<br/>" + "<br/>" + "<b><font color=" + "#00416E" + ">Employer #2</font></b>" + "<br/>" + "<br/>" +
                           "<b><font color=" + "#0077B3" + ">Name:</font></b>" + "&nbsp;" + txtemp2name.Text + "<br/>" +
                           "<b><font color=" + "#0077B3" + ">Supervisor:</font></b>" + "&nbsp;" + txtemp2sup.Text + "<br/>" +
                           "<b><font color=" + "#0077B3" + ">Phone:</font></b>" + "&nbsp;" + txtemp2phon.Text + "<br/>" +
                           "<b><font color=" + "#0077B3" + ">City:</font></b>" + "&nbsp;" + txtemp2city.Text + "<br/>" +
                           "<b><font color=" + "#0077B3" + ">State:</font></b>" + "&nbsp;" + txtemp2state.Text + "<br/>" +
                           "<b><font color=" + "#0077B3" + ">ZIP/Postal Code:</font></b>" + "&nbsp;" + txtemp2zip.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">Position:</font></b>" + "&nbsp;" + txtemp2pos.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">Reason for Leaving:</font></b>" + "&nbsp;" + txtemp2res.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">Start Date:</font></b>" + "&nbsp;" + txtemp2sdate.Text +
                           "<br/>" + "<b><font color=" + "#0077B3" + ">End Date:</font></b>" + "&nbsp;" + txtemp2edate.Text;
            message.IsBodyHtml = true;
        //    smtp = new SmtpClient("smtp.gmail.com");
           System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient("relay-hosting.secureserver.net", 25);
            //    smtp.Port = 25;
            System.Net.NetworkCredential ntwd = new NetworkCredential();
            ntwd.UserName = "recruit15thstreetpizza@gmail.com";// "syssigma12345@gmail.com"; //Your Email ID  
            ntwd.Password = "Friday@55";
            smtp.Credentials = ntwd;
            smtp.EnableSsl = false;
            smtp.UseDefaultCredentials = false;
       //   smtp.Credentials = new NetworkCredential("syssigma12345@gmail.com", "sys123456");
            try
            {
                smtp.Send(message);
                Page.RegisterStartupScript("UserMsg", "<script>alert('Successfully Send...');if(alert){ window.location='Register.aspx';}</script>");
            }
            catch (Exception ex)
            {
                Exception ex2 = ex;
                string errorMessage = string.Empty;
                while (ex2 != null)
                {
                    errorMessage += ex2.ToString();
                    ex2 = ex2.InnerException;
                }
                Page.RegisterStartupScript("UserMsg", "<script>alert('Sending Failed...');if(alert){ window.location='Register.aspx';}</script>");
            }

        }
    }
}