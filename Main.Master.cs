using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using _15thstreetpizza.Models;

namespace _15thstreetpizza
{
    public partial class Main : System.Web.UI.MasterPage
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            
            lblVisitor.Text = "Visitor Count : " + Convert.ToString(Application["NoOfVisitors"]);
        }

       protected void Btnsearch_Click(object sender, EventArgs e)
       {
            var db = new Pizza15Model();
            string srchstr = Txtsearch.Text.Trim();
       //     string filepath = Server.MapPath("/content/") + "15thPDFMenu.pdf";
      //      searchFortext(filepath, srchstr);

            string actflg = string.Empty;
            
            var appsearch = (from q in db.tbl_Srchmenu
                             join p in db.tbl_Srchrmenuitem on q.Srchmenuid equals p.Srchmenuid
                             where p.Srch_itemcategory == "APPETIZERS"
                             where p.Srch_Itemname.Contains(srchstr)
                             select new { p.Srch_Itemname }).ToList();

            if (appsearch.Count != 0)
            {
                actflg = "A";
                Response.Redirect("http://15thstreetpizza.com/RegularMenu.aspx?actflag=" + actflg);
            }

            var chknsrch = (from q in db.tbl_Srchmenu
                            join p in db.tbl_Srchrmenuitem on q.Srchmenuid equals p.Srchmenuid
                            where p.Srch_itemcategory == "CHICKEN"
                            where p.Srch_Itemname.Contains(srchstr)
                            select new { p.Srch_Itemname }).ToList();

            if (chknsrch.Count != 0)
            {
                actflg = "CH";
                Response.Redirect("http://15thstreetpizza.com/RegularMenu.aspx?actflag=" + actflg);
            }


            var burgsearch = (from q in db.tbl_Srchmenu
                             join p in db.tbl_Srchrmenuitem on q.Srchmenuid equals p.Srchmenuid
                             where p.Srch_itemcategory == "BURGERS"
                              where p.Srch_Itemname.Contains(srchstr)
                             select new { p.Srch_Itemname }).ToList();

            if (burgsearch.Count != 0)
            {
                actflg = "B";
                Response.Redirect("http://15thstreetpizza.com/RegularMenu.aspx?actflag=" + actflg);
            }

            var saldsrch = (from q in db.tbl_Srchmenu
                            join p in db.tbl_Srchrmenuitem on q.Srchmenuid equals p.Srchmenuid
                            where p.Srch_itemcategory == "SALADS"
                            where p.Srch_Itemname.Contains(srchstr)
                            select new { p.Srch_Itemname }).ToList();

            if (saldsrch.Count != 0)
            {
                actflg = "SD";
                Response.Redirect("http://15thstreetpizza.com/RegularMenu.aspx?actflag=" + actflg);
            }

            var pizsrch = (from q in db.tbl_Srchmenu
                           join p in db.tbl_Srchrmenuitem on q.Srchmenuid equals p.Srchmenuid
                           where p.Srch_itemcategory == "PIZZAS"
                           where p.Srch_Itemname.Contains(srchstr)
                           select new { p.Srch_Itemname }).ToList();
            if (pizsrch.Count != 0)
            {
                actflg = "P";
                Response.Redirect("http://15thstreetpizza.com/RegularMenu.aspx?actflag=" + actflg);
            }

            var subsearch = (from q in db.tbl_Srchmenu
                             join p in db.tbl_Srchrmenuitem on q.Srchmenuid equals p.Srchmenuid
                             where p.Srch_itemcategory == "SUBS"
                             where p.Srch_Itemname.Contains(srchstr)
                             select new { p.Srch_Itemname }).ToList();

            if (subsearch.Count != 0)
            {
                actflg = "S";
                Response.Redirect("http://15thstreetpizza.com/RegularMenu.aspx?actflag=" + actflg);

            }

            var entsrch = (from q in db.tbl_Srchmenu
                           join p in db.tbl_Srchrmenuitem on q.Srchmenuid equals p.Srchmenuid
                           where p.Srch_itemcategory == "ENTREES"
                           where p.Srch_Itemname.Contains(srchstr)
                           select new { p.Srch_Itemname }).ToList();

            if (entsrch.Count != 0)
            {
                actflg = "E";
                Response.Redirect("http://15thstreetpizza.com/RegularMenu.aspx?actflag=" + actflg);
            }

            var calzsrch = (from q in db.tbl_Srchmenu
                            join p in db.tbl_Srchrmenuitem on q.Srchmenuid equals p.Srchmenuid
                            where p.Srch_itemcategory == "CALZONE"
                            where p.Srch_Itemname.Contains(srchstr)
                            select new { p.Srch_Itemname }).ToList();

            if (calzsrch.Count != 0)
            {
                actflg = "C";
                Response.Redirect("http://15thstreetpizza.com/RegularMenu.aspx?actflag=" + actflg);
            }
                 

            var desbevsrch = (from q in db.tbl_Srchmenu
                              join p in db.tbl_Srchrmenuitem on q.Srchmenuid equals p.Srchmenuid
                              where p.Srch_itemcategory == "BEVERAGES"
                              where p.Srch_Itemname.Contains(srchstr)
                              select new { p.Srch_Itemname }).ToList();


            if (desbevsrch.Count != 0)
            {
                actflg = "BV";
                Response.Redirect("http://15thstreetpizza.com/RegularMenu.aspx?actflag=" + actflg);
            }

            var kdmnusrch = (from q in db.tbl_Srchmenu
                             join p in db.tbl_Srchrmenuitem on q.Srchmenuid equals p.Srchmenuid
                             where p.Srch_itemcategory == "KIDS MENU"
                             where p.Srch_Itemname.Contains(srchstr)
                             select new { p.Srch_Itemname }).ToList();

            if (kdmnusrch.Count != 0)
            {
                actflg = "KM";
                Response.Redirect("http://15thstreetpizza.com/RegularMenu.aspx?actflag=" + actflg);
            }


        }

        protected void searchFortext(string path, string text)
        {
            using (Spire.Pdf.PdfDocument pdf = new Spire.Pdf.PdfDocument((path)))
            {
                for (int i = 0; i < pdf.Pages.Count; i++)
                {
                    string pageText = pdf.Pages[i].ExtractText().Trim();
                    string varfried = "TATER";
                    if (pageText.Contains(text))
                    {
                        string flsg = "Y";
                    }
                    
                    int index = pageText.IndexOf(text, 0, StringComparison.CurrentCultureIgnoreCase);
                    if (index != -1)
                    {
                        Response.Redirect("RegularMenu.aspx", false);
                    }
                        
                }
            }
        }
    }
}