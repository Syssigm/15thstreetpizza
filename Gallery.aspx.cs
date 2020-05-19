using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using _15thstreetpizza.Models;

namespace _15thstreetpizza
{
    public partial class Gallery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getimgs();
        }
        public void getimgs()
        {
            var db = new Pizza15Model();

            //var BrewFestCat = (from q in db.tbl_ImageCategory
            //                   where q.CategoryID == 1
            //                   select new { q.CategoryID, q.SubCategoryID, q.SubCategoryName }).ToList();

            //OuterRptBrewFest.DataSource = BrewFestCat;
            //OuterRptBrewFest.DataBind();

            var EmployeesCat = (from q in db.tbl_ImageCategory
                                where q.CategoryID == 2
                                select new { q.CategoryID, q.SubCategoryID, q.SubCategoryName }).ToList();

            OuterRptEmployees.DataSource = EmployeesCat;
            OuterRptEmployees.DataBind();

            var FoodPicturesCat = (from q in db.tbl_ImageCategory
                                   where q.CategoryID == 3
                                   select new { q.CategoryID, q.SubCategoryID, q.SubCategoryName }).ToList();

            OuterRptFoodPictures.DataSource = FoodPicturesCat;
            OuterRptFoodPictures.DataBind();

            var OurFriendssCat = (from q in db.tbl_ImageCategory
                                  where q.CategoryID == 4
                                  select new { q.CategoryID, q.SubCategoryID, q.SubCategoryName }).ToList();

            OuterRptOurFriends.DataSource = OurFriendssCat;
            OuterRptOurFriends.DataBind();

            var PubPicturesCat = (from q in db.tbl_ImageCategory
                                  where q.CategoryID == 5
                                  select new { q.CategoryID, q.SubCategoryID, q.SubCategoryName }).ToList();

            OuterRptPubPictures.DataSource = PubPicturesCat;
            OuterRptPubPictures.DataBind();

            var RandomStuffCat = (from q in db.tbl_ImageCategory
                                  where q.CategoryID == 6
                                  select new { q.CategoryID, q.SubCategoryID, q.SubCategoryName }).ToList();

            OuterRptRandomStuff.DataSource = RandomStuffCat;
            OuterRptRandomStuff.DataBind();


            //carousel repeaters

            var BrewFestcarousel = (from q in db.tbl_Images
                                    where q.CategoryID == 1
                                    select new { q.ImageUrl }).ToList();

            RptcarouselBrewFest.DataSource = BrewFestcarousel;
            RptcarouselBrewFest.DataBind();

            var Employeescarousel = (from q in db.tbl_Images
                                     where q.CategoryID == 2
                                     select new { q.ImageUrl }).ToList();

            RptcarouselEmployees.DataSource = Employeescarousel;
            RptcarouselEmployees.DataBind();

            var FoodPicturescarousel = (from q in db.tbl_Images
                                        where q.CategoryID == 3
                                        select new { q.ImageUrl }).ToList();

            RptcarouselFoodPictures.DataSource = FoodPicturescarousel;
            RptcarouselFoodPictures.DataBind();

            var OurFriendscarousel = (from q in db.tbl_Images
                                      where q.CategoryID == 4
                                      select new { q.ImageUrl }).ToList();

            RptcarouselOurFriends.DataSource = OurFriendscarousel;
            RptcarouselOurFriends.DataBind();

            var PubPicturescarousel = (from q in db.tbl_Images
                                       where q.CategoryID == 5
                                       select new { q.ImageUrl }).ToList();

            RptcarouselPubPictures.DataSource = PubPicturescarousel;
            RptcarouselPubPictures.DataBind();

            var RandomStuffcarousel = (from q in db.tbl_Images
                                       where q.CategoryID == 6
                                       select new { q.ImageUrl }).ToList();

            RptcarouselRandomStuff.DataSource = RandomStuffcarousel;
            RptcarouselRandomStuff.DataBind();
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
                                          where q.CategoryID == 1 && q.SubCategoryID == subcat
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
        protected void OuterRptEmployees_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                var db = new Pizza15Model();
                RepeaterItem item = e.Item;
                if ((item.ItemType == ListItemType.Item) || (item.ItemType == ListItemType.AlternatingItem))
                {
                    HiddenField id = item.FindControl("HiddenEmployees") as HiddenField;
                    int subcat = Convert.ToInt32(id.Value);
                    Repeater innerRepEmployees = (Repeater)item.FindControl("innerRepEmployees");

                    var EmployeesImages = (from q in db.tbl_Images
                                           where q.CategoryID == 2 && q.SubCategoryID == subcat
                                           select new { q.ImageUrl }).ToList();
                    innerRepEmployees.DataSource = EmployeesImages;
                    innerRepEmployees.DataBind();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void OuterRptFoodPictures_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                var db = new Pizza15Model();
                RepeaterItem item = e.Item;
                if ((item.ItemType == ListItemType.Item) || (item.ItemType == ListItemType.AlternatingItem))
                {
                    HiddenField id = item.FindControl("HiddenFoodPictures") as HiddenField;
                    int subcat = Convert.ToInt32(id.Value);
                    Repeater innerRepFoodPictures = (Repeater)item.FindControl("innerRepFoodPictures");

                    var FoodPicturesImages = (from q in db.tbl_Images
                                              where q.CategoryID == 3 && q.SubCategoryID == subcat
                                              select new { q.ImageUrl }).ToList();
                    innerRepFoodPictures.DataSource = FoodPicturesImages;
                    innerRepFoodPictures.DataBind();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void OuterRptOurFriends_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                var db = new Pizza15Model();
                RepeaterItem item = e.Item;
                if ((item.ItemType == ListItemType.Item) || (item.ItemType == ListItemType.AlternatingItem))
                {
                    HiddenField id = item.FindControl("HiddenOurFriends") as HiddenField;
                    int subcat = Convert.ToInt32(id.Value);
                    Repeater innerRepOurFriends = (Repeater)item.FindControl("innerRepOurFriends");

                    var OurFriendsImages = (from q in db.tbl_Images
                                            where q.CategoryID == 4 && q.SubCategoryID == subcat
                                            select new { q.ImageUrl }).ToList();
                    innerRepOurFriends.DataSource = OurFriendsImages;
                    innerRepOurFriends.DataBind();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void OuterRptPubPictures_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                var db = new Pizza15Model();
                RepeaterItem item = e.Item;
                if ((item.ItemType == ListItemType.Item) || (item.ItemType == ListItemType.AlternatingItem))
                {
                    HiddenField id = item.FindControl("HiddenPubPictures") as HiddenField;
                    int subcat = Convert.ToInt32(id.Value);
                    Repeater innerRepPubPictures = (Repeater)item.FindControl("innerRepPubPictures");

                    var PubPicturesImages = (from q in db.tbl_Images
                                             where q.CategoryID == 5 && q.SubCategoryID == subcat
                                             select new { q.ImageUrl }).ToList();
                    innerRepPubPictures.DataSource = PubPicturesImages;
                    innerRepPubPictures.DataBind();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void OuterRptRandomStuff_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                var db = new Pizza15Model();
                RepeaterItem item = e.Item;
                if ((item.ItemType == ListItemType.Item) || (item.ItemType == ListItemType.AlternatingItem))
                {
                    HiddenField id = item.FindControl("HiddenRandomStuff") as HiddenField;
                    int subcat = Convert.ToInt32(id.Value);
                    Repeater innerRepRandomStuff = (Repeater)item.FindControl("innerRepRandomStuff");

                    var RandomStuffImages = (from q in db.tbl_Images
                                             where q.CategoryID == 6 && q.SubCategoryID == subcat
                                             select new { q.ImageUrl }).ToList();
                    innerRepRandomStuff.DataSource = RandomStuffImages;
                    innerRepRandomStuff.DataBind();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}