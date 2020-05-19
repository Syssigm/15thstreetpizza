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
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    GetContactDetails();
                }
            }
            catch
            {
                String strAppMsg = ConfigurationManager.AppSettings["GenericSystemError"];
                //lblError.Text = strAppMsg;
            }
        }

        private void GetContactDetails()
        {
            try
            {
                var db = new Pizza15Model();
                var ContactDetails = db.tblContactUs.ToList();
                if (ContactDetails.Count > 0)
                {
                    lblCall.Text = ContactDetails[0].Call;
                    lblEmails.Text = "<a href='mailto:" + ContactDetails[0].Email + "'>" + ContactDetails[0].Email + "</a>";
                    //lblEmail1.Text = ContactDetails[0].Email;
                    //lblEmail2.Text = ContactDetails[0].Email;
                    
                    lblHour1.Text = ContactDetails[0].HoursLine1;

                    //  Change 1 07/04/2020
                    if (lblHour1.Text == string.Empty)
                    {
                        time1.Visible = false;
                    } else
                    {
                        time1.Visible =true;
                    }

                    lblHour2.Text = ContactDetails[0].HoursLine2;
                    //  Change 1 07/04/2020
                    if (lblHour2.Text == string.Empty)
                    {
                        time2.Visible = false;
                    }else
                    {
                        time2.Visible = true;
                    }
                    lblHour3.Text = ContactDetails[0].HoursLine3;
                    //  Change 1 07/04/2020
                    if (lblHour3.Text == string.Empty)
                    {
                        liid.Visible = false;
                    }
                    else
                    {
                        liid.Visible = true;
                    }
                    lblLine1.Text = ContactDetails[0].FindLine1;
                    lblLine2.Text = ContactDetails[0].FindLine2;
                    lblLine3.Text = ContactDetails[0].FindLine3;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}