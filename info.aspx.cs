using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using _15thstreetpizza.Models;

namespace _15thstreetpizza
{
    public partial class EventsSpecialoffers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getimgs();
        }

        public void getimgs()
        {
            var db = new Pizza15Model();

            var BrewFestCat = (from q in db.tbl_ImageCategory
                               where q.CategoryID == 19
                               select new { q.CategoryID, q.SubCategoryID, q.SubCategoryName,q.CategoryName }).ToList();

            OuterRptBrewFest.DataSource = BrewFestCat;
            OuterRptBrewFest.DataBind();
                        
            //carousel repeaters

            var BrewFestcarousel = (from q in db.tbl_Images
                                    where q.CategoryID == 19
                                    select new { q.ImageUrl }).ToList();

            RptcarouselBrewFest.DataSource = BrewFestcarousel;
            RptcarouselBrewFest.DataBind();
                      
            

        }

        protected void OuterRptBrewFest_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                var db = new Pizza15Model();
                RepeaterItem item = e.Item;
                if ((item.ItemType == ListItemType.Item) || (item.ItemType == ListItemType.AlternatingItem))
                {
                    HiddenField id = item.FindControl("HiddenBrewFest") as HiddenField;
                    int subcat = Convert.ToInt32(id.Value);
                    Repeater innerRepBrewFest = (Repeater)item.FindControl("innerRepBrewFest");

                    var BrewFestImages = (from q in db.tbl_Images
                                          where q.CategoryID == 19 && q.SubCategoryID == subcat
                                          select new { q.ImageUrl }).ToList();
                    innerRepBrewFest.DataSource = BrewFestImages;
                    innerRepBrewFest.DataBind();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //protected void OuterRptEmployees_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    try
        //    {
        //        var db = new Pizza15Model();
        //        RepeaterItem item = e.Item;
        //        if ((item.ItemType == ListItemType.Item) || (item.ItemType == ListItemType.AlternatingItem))
        //        {
        //            HiddenField id = item.FindControl("HiddenEmployees") as HiddenField;
        //            int subcat = Convert.ToInt32(id.Value);
        //            Repeater innerRepEmployees = (Repeater)item.FindControl("innerRepEmployees");

        //            var EmployeesImages = (from q in db.tbl_Images
        //                                   where q.CategoryID == 21 && q.SubCategoryID == subcat
        //                                   select new { q.ImageUrl }).ToList();
        //            innerRepEmployees.DataSource = EmployeesImages;
        //            innerRepEmployees.DataBind();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}

        //protected void OuterRptFoodPictures_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    try
        //    {
        //        var db = new Pizza15Model();
        //        RepeaterItem item = e.Item;
        //        if ((item.ItemType == ListItemType.Item) || (item.ItemType == ListItemType.AlternatingItem))
        //        {
        //            HiddenField id = item.FindControl("HiddenFoodPictures") as HiddenField;
        //            int subcat = Convert.ToInt32(id.Value);
        //            Repeater innerRepFoodPictures = (Repeater)item.FindControl("innerRepFoodPictures");

        //            var FoodPicturesImages = (from q in db.tbl_Images
        //                                      where q.CategoryID == 22 && q.SubCategoryID == subcat
        //                                      select new { q.ImageUrl }).ToList();
        //            innerRepFoodPictures.DataSource = FoodPicturesImages;
        //            innerRepFoodPictures.DataBind();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}




    }
}