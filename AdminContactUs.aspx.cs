
using _15thstreetpizza.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PizzaV5
{
    public partial class AdminContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                try
                {
                    if ((Session["UserName"] == null) || (Session["UserName"].ToString() == string.Empty))
                    {
                        Response.Redirect("Login.aspx?ReturnUrl=%2fadminhome.aspx", false);
                    }
                    else
                    {
                        GetData();
                    }

                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                }
            }
        }

        private void GetData()
        {
            try
            {
                var db = new Pizza15Model();
                var ContactUs = db.tblContactUs.FirstOrDefault(x => x.ID.Equals(1));
                if(ContactUs != null)
                {
                    txtCall.Text = ContactUs.Call.ToString();
                    txtFind1.Text = ContactUs.FindLine1.ToString();
                    txtFind2.Text = ContactUs.FindLine2.ToString();
                    txtFind3.Text = ContactUs.FindLine3.ToString();
                    txtFind4.Text = ContactUs.FindLine4.ToString();
                    //txtFind5.Text = ContactUs.FindLine5.ToString();
                    txtHours1.Text = ContactUs.HoursLine1.ToString();
                    txtHours2.Text = ContactUs.HoursLine2.ToString();
                    txtHours3.Text = ContactUs.HoursLine3.ToString();
                    //txtHours4.Text = ContactUs.HoursLine4.ToString();
                    txtEmail.Text = ContactUs.Email.ToString();
                }
                else
                {
                    lblError.Text = "Internal Server Error";
                }
            }
            catch
            {
                lblError.Text = "Internal Server Error";
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                var db = new Pizza15Model();
                tblContactU Contact = db.tblContactUs.FirstOrDefault(x => x.ID.Equals(1));
                if (Contact != null)
                {
                    Contact.Call = txtCall.Text;
                    Contact.FindLine1 = txtFind1.Text;
                    Contact.FindLine2 = txtFind2.Text;
                    Contact.FindLine3 = txtFind3.Text;
                    Contact.FindLine4 = txtFind4.Text;
                    //Contact.FindLine5 = txtFind5.Text;
                    Contact.HoursLine1 = txtHours1.Text;
                    Contact.HoursLine2 = txtHours2.Text;
                    Contact.HoursLine3 = txtHours3.Text;
                    //Contact.HoursLine4 = txtHours4.Text;
                    Contact.Email = txtEmail.Text;
                    lblError.Text = "Update Succes";
                    // Change 1 07/04/2020
                    db.SaveChanges();
                }
            }
            catch
            {
                lblError.Text = "Internal server error";
            }
           
        }
    }
}