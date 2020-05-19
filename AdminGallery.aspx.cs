using _15thstreetpizza.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace PizzaV6
{
    public partial class AdminGallery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblError.Text = "";
                if (!this.IsPostBack)
                {

                    if ((Session["UserName"] == null) || (Session["UserName"].ToString() == string.Empty))
                    {
                        Response.Redirect("Login.aspx?ReturnUrl=%2fadminhome.aspx", false);
                    }
                    else
                    {
                        ddlcategory();
                    }
                    
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;
            }
        }
        public void ddlcategory()
        {
            try
            {
                var db = new Pizza15Model();

                ddlImageCategory.DataSource = db.tbl_ImageCategory.ToList().Select(x=> new { x.CategoryName, x.CategoryID }).Distinct();
                ddlImageCategory.DataTextField = "CategoryName";
                ddlImageCategory.DataValueField = "CategoryID";
                ddlImageCategory.DataBind();
                ddlImageCategory.Items.Insert(0, new ListItem("Select Category", "0"));
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
        public void ddlSubcategory()
        {
            try
            {
                var db = new Pizza15Model();

                int catid = Convert.ToInt32(ddlImageCategory.SelectedValue);
                               
                var ddlsubcatlist= db.tbl_ImageCategory.Where(x => x.CategoryID == catid).Select(x => new { x.SubCategoryName, x.SubCategoryID }).ToList();

                ddlImageSubCategory.DataSource = ddlsubcatlist;
                ddlImageSubCategory.DataTextField = "SubCategoryName";
                ddlImageSubCategory.DataValueField = "SubCategoryID";
                ddlImageSubCategory.DataBind();
                ddlImageSubCategory.Items.Insert(0, new ListItem("Select Sub Category", "0"));
              
              
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void Getdata()
        {
            try
            { 
            var db = new Pizza15Model();
                int Categoryvalue = Convert.ToInt32(ddlImageCategory.SelectedValue);
                int SubCategoryvalue = Convert.ToInt32(ddlImageSubCategory.SelectedValue);
                if (SubCategoryvalue != 0)
                {
                    var Images = (from q in db.tbl_Images
                                  where q.CategoryID==Categoryvalue && q.SubCategoryID == SubCategoryvalue
                                  select new
                                  {
                                      
                                      q.ImageHeader,
                                      q.Name,
                                      q.ImageUrl,
                                      q.ID,
                                  }).ToList();
                    dgImages.DataSource = Images;
                    dgImages.DataBind();
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
        protected void dgImages_CancelCommand(object source, DataGridCommandEventArgs e)
        {
            try
            {
                dgImages.EditItemIndex = -1;
                dgImages.ShowFooter = true;
                Getdata();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void dgImages_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
            try
            {
                string strID = dgImages.DataKeys[e.Item.ItemIndex].ToString();
                var db = new Pizza15Model();
                int ID = Convert.ToInt32(strID);

                var deleteimagefile = db.tbl_Images.SingleOrDefault(x => x.ID == ID);
                db.tbl_Images.Remove(deleteimagefile);
                db.SaveChanges();
                Getdata();
                lblError.Text = "Record Deleted Successfully";
                lblError.ForeColor = System.Drawing.Color.ForestGreen;
            }
            catch(Exception ex)
            {
                lblError.Text=ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void dgImages_EditCommand(object source, DataGridCommandEventArgs e)
        {
            try
            {
                dgImages.EditItemIndex = Convert.ToInt32(e.Item.ItemIndex);
                dgImages.ShowFooter = false;
                Getdata();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;
            }
        }
        
        protected void dgImages_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            try {
                if (e.CommandName == "AddANewRow")
                {
                    var db = new Pizza15Model();

                    var AddImage = new tbl_Images();

                    TextBox txtImageHeaderF = e.Item.FindControl("txtImageHeaderF") as TextBox;
                    TextBox txtNamesF = e.Item.FindControl("txtNamesF") as TextBox;
                    TextBox txtImageURLF = e.Item.FindControl("txtImageURLF") as TextBox;
                    FileUpload ImageuploadF = e.Item.FindControl("ImageuploadF") as FileUpload;
                    
                    if (ddlImageCategory.SelectedItem.Text=="Season Specials")
                    {
                        ImageuploadF.PostedFile.SaveAs(Server.MapPath("~/images/GalleryPhotos/Season Specials/Season Specials" + "/" + ImageuploadF.FileName));
                    }
                    else { 
                    ImageuploadF.PostedFile.SaveAs(Server.MapPath("~/images/GalleryPhotos/"+ddlImageCategory.SelectedItem.Text +"/"+ ddlImageSubCategory.SelectedItem.Text +"/"+ ImageuploadF.FileName));
                    }

                    var maxid = (from q in db.tbl_Images
                                 select new { q.ID }).ToList();
                    if (maxid.Count != 0)
                    {
                        AddImage.ID = maxid.Max(x => x.ID) + 1;
                    }
                    AddImage.CategoryID = Convert.ToInt32(ddlImageCategory.SelectedValue);
                    AddImage.SubCategoryID= Convert.ToInt32(ddlImageSubCategory.SelectedValue);
                    AddImage.ImageHeader = txtImageHeaderF.Text;
                    AddImage.Name = txtNamesF.Text;
                    if (ddlImageCategory.SelectedItem.Text == "Season Specials")
                    {
                        AddImage.ImageUrl = ("/images/GalleryPhotos/Season Specials/Season Specials" + "/" + ImageuploadF.FileName);
                        AddImage.ImageLink = ("/images/GalleryPhotos/Season Specials/Season Specials" + "/" + ImageuploadF.FileName);

                    } else
                    {
                        AddImage.ImageUrl = ("/images/GalleryPhotos/" + ddlImageCategory.SelectedItem.Text + "/" + ddlImageSubCategory.SelectedItem.Text + "/" + ImageuploadF.FileName);
                        AddImage.ImageLink = ("/images/GalleryPhotos/" + ddlImageCategory.SelectedItem.Text + "/" + ddlImageSubCategory.SelectedItem.Text + "/" + ImageuploadF.FileName);

                    }

                    db.tbl_Images.Add(AddImage);
                    db.SaveChanges();
                    Getdata();
                }
            }
            catch(Exception ex)
            {
                lblError.Text = ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void dgImages_UpdateCommand(object source, DataGridCommandEventArgs e)
        {
            try
            {
                string strID = dgImages.DataKeys[e.Item.ItemIndex].ToString();
                int nStrID = Convert.ToInt32(strID);

                TextBox txtImageHeaderE = e.Item.FindControl("txtImageHeaderE") as TextBox;
                TextBox txtNamesE = e.Item.FindControl("txtNamesE") as TextBox;
                TextBox txtImageURLE = e.Item.FindControl("txtImageURLE") as TextBox;
                FileUpload ImageuploadE = e.Item.FindControl("ImageuploadE") as FileUpload;

                
                    var db = new Pizza15Model();
                    tbl_Images imgtbl = db.tbl_Images.FirstOrDefault(x => x.ID == nStrID);

                    var infoimgid = (from q in db.tbl_Images
                                     join r in db.tbl_ImageCategory on q.CategoryID equals r.CategoryID
                                     where q.ID == nStrID
                                     where q.CategoryID == r.CategoryID
                                     select new { r.SubCategoryName, r.CategoryName }).FirstOrDefault();
                   string rowcatname = infoimgid.CategoryName;
                   string rowsubcatname = infoimgid.SubCategoryName;

                if (imgtbl != null)
                    {
                        imgtbl.ImageHeader = txtImageHeaderE.Text;
                        imgtbl.Name = txtNamesE.Text;
                        if (ImageuploadE.FileName != string.Empty)
                        {
                        if (rowcatname == "Season Specials")
                        {
                            ImageuploadE.PostedFile.SaveAs(Server.MapPath("~/images/GalleryPhotos/Season Specials/Season Specials/" + ImageuploadE.FileName));
                            imgtbl.ImageUrl = ("images/GalleryPhotos/Season Specials/Season Specials/" + ImageuploadE.FileName);
                            imgtbl.ImageLink = ("images/GalleryPhotos/Season Specials/Season Specials/" + ImageuploadE.FileName);
                        }
                        else
                        {
                            ImageuploadE.PostedFile.SaveAs(Server.MapPath("~/images/GalleryPhotos/" + ddlImageCategory.SelectedItem.Text + "/" + ddlImageSubCategory.SelectedItem.Text + "/" + ImageuploadE.FileName));
                            imgtbl.ImageUrl = ("images/GalleryPhotos/" + ddlImageCategory.SelectedItem.Text + "/" + ddlImageSubCategory.SelectedItem.Text + "/" + ImageuploadE.FileName);
                            imgtbl.ImageLink = ("images/GalleryPhotos/" + ddlImageCategory.SelectedItem.Text + "/" + ddlImageSubCategory.SelectedItem.Text + "/" + ImageuploadE.FileName);
                        }
                        }
                        else
                        {
                            imgtbl.ImageUrl = txtImageURLE.Text;
                            imgtbl.ImageLink = txtImageURLE.Text;
                        }
                        imgtbl.CategoryID=Convert.ToInt32(ddlImageCategory.SelectedValue);
                    imgtbl.SubCategoryID = Convert.ToInt32(ddlImageSubCategory.SelectedValue);
                    db.SaveChanges();
                        lblError.Text = "Record Updated Successfully";
                        lblError.ForeColor = System.Drawing.Color.ForestGreen;
                    }
                
                

                dgImages.EditItemIndex = -1;
                dgImages.ShowFooter = true;
                Getdata();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ddlImageCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ddlSubcategory();
            }
            catch(Exception ex)
            {
                lblError.Text = ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;
            }
        }
        protected void ddlImageSubCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
            Getdata();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}