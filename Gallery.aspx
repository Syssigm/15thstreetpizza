<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="_15thstreetpizza.Gallery" %>

<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>15th Street Pizza</title>
        <%--START:Added for getting Tracked and to see the results in Google Analytics--%>
    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-28177522-1']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

    </script>
    <%--END:Added for getting Tracked and to see the results in Google Analytics--%>

<!-- Bootstrap Css -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/prettyCheckable.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" href="css/jquery.mThumbnailScroller.css">
<link rel="stylesheet" href="http://blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
<link rel="stylesheet" href="https://raw.github.com/blueimp/Bootstrap-Image-Gallery/master/css/bootstrap-image-gallery.css">
<link rel="stylesheet" type="text/css" href="css/custom.css">
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:100,300,400,700" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
<nav class="navbar navbar-fixed-top nav-15">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="col-lg-5 col-md-5 col-sm-5">
    <ul>
      <li> <a href="Default.aspx"><span class="glyphicon glyphicon-home"></span></a> </li> <li> <a href="#">MENU </a>
        <ul>
          <li><a href="RegularMenu.aspx">REGULAR MENU</a>
				<a class="pdfM" href="content/15thPDFMenu.pdf" target="new"><span class="glyphicon glyphicon-arrow-right"></span> PDF MENU</a>
		  </li>
          <li role="separator" class="divider"></li>
          <li><a href="CateringMenu.aspx">CATERING MENU</a></li>
          <li role="separator" class="divider"></li>
          <li><a href="BeerMenu.aspx">BEER MENU</a></li>
          <li role="separator" class="divider"></li>
          <li><a href="WineMenu.aspx">WINE MENU</a></li>
          <li role="separator" class="divider"></li>
        </ul>
      </li>
      <li class="active"> <a href="#">GALLERY</a>
        <ul>
          <li><a href="Gallery.aspx">PICTURES</a></li>
          <li role="separator" class="divider"></li>
          <li><a href="Videos.aspx">VIDEOS</a></li>
        </ul>
      </li>      
      <li> <a href="Events.aspx">EVENTS </a>      </li>
<li> <a href="#">TESTIMONIALS</a>
        <ul>
          <li><a href="WriteaReview.aspx">WRITE A REVIEW</a></li>
          <li role="separator" class="divider"></li>
          <li><a href="Testimonials.aspx">PAST REVIEW</a></li>
        </ul>
      </li>
    </ul>
  </div>
  <!-- /.navbar-collapse -->
  <div class="col-lg-2 col-md-2 col-sm-2 center-logo padding-left-right-0"> <a href="Default.aspx"><img src="images/15thstreetpizza-logo.png" border="0" ></a> </div>
  <div class="col-lg-5 col-md-5 col-sm-5">
    <ul>
      <li> <a href="Register.aspx">CAREERS</a> </li>
      <li> <a href="Aboutus.aspx">ABOUT US</a> </li>
      <li> <a href="ContactUs.aspx">CONTACT US</a> </li>
    </ul>
  </div>
 <!-- <a href="OrderOnline.aspx" target="_blank" class="order-btn"><img src="images/orderonline-btn.png" class="img-responsive"></a> -->
  <!-- /.container-fluid -->
</nav>
 <nav class="nav-15m">
            <div class="text-center"><a href="#top">
                <img src="images/15thstreetpizza-logo.png" border="0"></a></div>
        <!--    <div class="text-center padding-bottom-20"><a href="OrderOnline.aspx">
                <img src="images/orderonline-btn.png"></a></div> -->
            <nav class="nav" role="navigation">
                <ul class="nav__list">
                    <li><a href="Default.aspx">HOME</a> </li>
                    <li>
                        <input id="group-1" type="checkbox" hidden />
                        <label for="group-1"><span class="glyphicon glyphicon-menu-right"></span>MENU</label>
                        <ul class="group-list">
                            <li><a href="RegularMenu.aspx#MENU">REGULAR MENU</a></li>
                            <li><a href="CateringMenu.aspx#CATERING">CATERING MENU</a></li>
                            <li><a href="BeerMenu.aspx#BEER">BEER MENU</a></li>
                            <li><a href="WineMenu.aspx#WINE">WINE MENU</a></li>
                        </ul>
                    </li>
                    <li>
                        <input id="group-2" type="checkbox" hidden />
                        <label for="group-2"><span class="glyphicon glyphicon-menu-right"></span>GALLERY</label>
                        <ul class="group-list">
                            <li><a href="Gallery.aspx#PICTURES">PICTURES</a></li>
                            <li><a href="Videos.aspx#VIDEOS">VIDEOS</a></li>
                        </ul>
                    </li>
                    <li><a href="Events.aspx#EVENTS">EVENTS </a></li>

                    <li>
                        <input id="group-4" type="checkbox" hidden />
                        <label for="group-4"><span class="glyphicon glyphicon-menu-right"></span>TESTIMONIALS </label>
                        <ul class="group-list">
                            <li><a href="WriteaReview.aspx#WRITE">WRITE A REVIEW</a></li>
                            <li><a href="Testimonials.aspx#PAST">PAST REVIEW</a></li>
                        </ul>
                    </li>
                    <li><a href="Register.aspx#CAREERS">CAREERS</a> </li>
                    <li><a href="Aboutus.aspx#ABOUT">ABOUT US</a> </li>
                    <li><a href="ContactUs.aspx#CONTACT">CONTACT US</a> </li>
                </ul>
            </nav>
        </nav>
<div class="container-fluid main-section">
  <div class="container">
    <p class="social"> <a href="http://www.facebook.com/pages/15th-Street-Pizza-Pub/186902627989620" target="_blank"><img src="images/fb-icon.png"></a> <a href="https://plus.google.com/111880389239111882314/about?gl=US&hl=en-US" target="_blank"><img src="images/gplus-icon.png"></a> <a href="https://twitter.com/15thStreetPizza" target="_blank"><img src="images/twit-icon.png"></a> <a href="http://instagram.com/15thstreetpizza" target="_blank"><img src="images/insta-icon.png"></a> <a href="http://www.pinterest.com/15thstreetpizza" target="_blank"><img src="images/pin-icon.png"></a> <a href="http://www.tripadvisor.com/Restaurant_Review-g35102-d804735-Reviews-15th_Street_Pizza_Pub-McDonough_Georgia.html" target="_blank"><img src="images/trip-icon.png"></a><a href="https://www.youtube.com/channel/UCWeXWaB5NAalwl43dK49xog" target="_blank">
                                                <img src="images/YouTube.png"></a> </p>
    <div class="row">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 map-col">
        <div class="welcome clearfix" id="PICTURES">
          <h3>Gallery Pictures</h3>
          <ul class="tabs">
            <%--<li class="active" rel="tab1">Brew Fest </li>--%>
            <li class="active" rel="tab2">Employees </li>
            <li rel="tab3">Food Pictures </li>
            <li rel="tab4">Our Friends</li>
            <li rel="tab5">Pub Pictures</li>
            <li rel="tab6">Random Stuff</li>
          </ul>
          <div class="tab_container">
            <%--<h3 class="d_active tab_drawer_heading" rel="tab1">Brew Fest</h3>--%>
              <%--<div id="tab1" class="tab_content">
                <asp:Repeater runat="server" ID="OuterRptBrewFest" OnItemDataBound="OuterRptBrewFest_OnItemDataBound"><ItemTemplate>
              <h4 class="orange"><%# Eval("SubCategoryName") %></h4>
                    <asp:HiddenField ID="HiddenBrewFest" runat="server" Value='<%# Eval("SubCategoryID") %>' />
              <div id="links"> 
                  <asp:Repeater runat="server" ID="innerRepBrewFest" >
              <ItemTemplate>
                  <a data-toggle="modal" data-target="#myModalBrewFest">
                      <img src='<%# Eval("ImageUrl") %>'>
                  </a>  
                </ItemTemplate></asp:Repeater>
                  </div>
                    </ItemTemplate></asp:Repeater>
                
            </div>--%>
            
            <h3 class="d_active tab_drawer_heading" rel="tab2">Employees</h3>
            <div id="tab2" class="tab_content">
                <asp:Repeater runat="server" ID="OuterRptEmployees" OnItemDataBound="OuterRptEmployees_OnItemDataBound"><ItemTemplate>
              <h4 class="orange"><%# Eval("SubCategoryName") %></h4>
                    <asp:HiddenField ID="HiddenEmployees" runat="server" Value='<%# Eval("SubCategoryID") %>' />
              <div id="links"> 
                  <asp:Repeater runat="server" ID="innerRepEmployees" >
              <ItemTemplate>
                  <a data-toggle="modal" data-target="#myModalEmployees">
                      <img src='<%# Eval("ImageUrl") %>'>
                  </a>  
                </ItemTemplate></asp:Repeater>
                  </div>
                    </ItemTemplate></asp:Repeater>
                
            </div>
            <h3 class="d_active tab_drawer_heading" rel="tab3">Food Pictures</h3>
            <div id="tab3" class="tab_content">
                <asp:Repeater runat="server" ID="OuterRptFoodPictures" OnItemDataBound="OuterRptFoodPictures_OnItemDataBound"><ItemTemplate>
              <h4 class="orange"><%# Eval("SubCategoryName") %></h4>
                    <asp:HiddenField ID="HiddenFoodPictures" runat="server" Value='<%# Eval("SubCategoryID") %>' />
              <div id="links"> 
                  <asp:Repeater runat="server" ID="innerRepFoodPictures" >
              <ItemTemplate>
                  <a data-toggle="modal" data-target="#myModalFoodPictures">
                      <img src='<%# Eval("ImageUrl") %>'>
                  </a>  
                </ItemTemplate></asp:Repeater>
                  </div>
                    </ItemTemplate></asp:Repeater>
                
            </div>
            <h3 class="d_active tab_drawer_heading" rel="tab4">Our Friends</h3>
            <div id="tab4" class="tab_content">
                <asp:Repeater runat="server" ID="OuterRptOurFriends" OnItemDataBound="OuterRptOurFriends_OnItemDataBound"><ItemTemplate>
              <h4 class="orange"><%# Eval("SubCategoryName") %></h4>
                    <asp:HiddenField ID="HiddenOurFriends" runat="server" Value='<%# Eval("SubCategoryID") %>' />
              <div id="links"> 
                  <asp:Repeater runat="server" ID="innerRepOurFriends" >
              <ItemTemplate>
                  <a data-toggle="modal" data-target="#myModalOurFriends">
                      <img src='<%# Eval("ImageUrl") %>'>
                  </a>  
                </ItemTemplate></asp:Repeater>
                  </div>
                    </ItemTemplate></asp:Repeater>
                
            </div>
            <h3 class="d_active tab_drawer_heading" rel="tab5">Pub Pictures</h3>
            <div id="tab5" class="tab_content">
                <asp:Repeater runat="server" ID="OuterRptPubPictures" OnItemDataBound="OuterRptPubPictures_OnItemDataBound"><ItemTemplate>
              <h4 class="orange"><%# Eval("SubCategoryName") %></h4>
                    <asp:HiddenField ID="HiddenPubPictures" runat="server" Value='<%# Eval("SubCategoryID") %>' />
              <div id="links"> 
                  <asp:Repeater runat="server" ID="innerRepPubPictures" >
              <ItemTemplate>
                  <a data-toggle="modal" data-target="#myModalPubPictures">
                      <img src='<%# Eval("ImageUrl") %>'>
                  </a>  
                </ItemTemplate></asp:Repeater>
                  </div>
                    </ItemTemplate></asp:Repeater>
                
            </div>
            <h3 class="d_active tab_drawer_heading" rel="tab6">Random Stuff</h3>
            <div id="tab6" class="tab_content">
                <asp:Repeater runat="server" ID="OuterRptRandomStuff" OnItemDataBound="OuterRptRandomStuff_OnItemDataBound"><ItemTemplate>
              <h4 class="orange"><%# Eval("SubCategoryName") %></h4>
                    <asp:HiddenField ID="HiddenRandomStuff" runat="server" Value='<%# Eval("SubCategoryID") %>' />
              <div id="links"> 
                  <asp:Repeater runat="server" ID="innerRepRandomStuff" >
              <ItemTemplate>
                  <a data-toggle="modal" data-target="#myModalRandomStuff">
                      <img src='<%# Eval("ImageUrl") %>'>
                  </a>  
                </ItemTemplate></asp:Repeater>
                  </div>
                    </ItemTemplate></asp:Repeater>
                
            </div>
          </div>
          <!-- The Bootstrap Image Gallery lightbox, should be a child element of the document body -->
          <div id="blueimp-gallery" class="blueimp-gallery">
            <!-- The container for the modal slides -->
            <div class="slides"></div>
            <!-- Controls for the borderless lightbox -->
            <%--<h3 class="title">h3title</h3>--%>
            <%--<a class="prev">‹</a> <a class="next">›</a> <a class="close">×</a> <a class="play-pause"></a>
            <ol class="indicator">
            </ol>--%>
            <!-- The modal dialog, which will be used to wrap the lightbox content -->
            <div class="modal fade">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" aria-hidden="true">×</button>
                    <h4 class="modal-title">asasa</h4>
                  </div>
                  <div class="modal-body next"></div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-left prev"> <i class="glyphicon glyphicon-chevron-left"></i> Previous </button>
                    <button type="button" class="btn btn-primary next"> Next <i class="glyphicon glyphicon-chevron-right"></i> </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
<div class="container-fluid content-section">
  <div class="container">
    <div class="row text-center">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <ul>
          <li><strong>We're Open:</strong></li>
          <li><span>Mon to Thu:</span> 11am-9:30pm</li>
          <li><span>Fri & Sat:</span> 11am-10:30pm</li>
          <li><span>Sun:</span> 11am-8:30pm</li>
        </ul>
      </div>
    </div>
  </div>
</div>
<div class="container-fluid copyrights-section">
  <div class="container">
    <div class="row">
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
        <p class="padding-top-10">© 2018 15th street pizza.</p>
      </div>
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 text-center">
        <p> <a href="http://www.facebook.com/pages/15th-Street-Pizza-Pub/186902627989620" target="_blank"><img src="images/fb-icon.png"></a> <a href="https://plus.google.com/111880389239111882314/about?gl=US&hl=en-US" target="_blank"><img src="images/gplus-icon.png"></a> <a href="https://twitter.com/15thStreetPizza" target="_blank"><img src="images/twit-icon.png"></a> <a href="http://instagram.com/15thstreetpizza" target="_blank"><img src="images/insta-icon.png"></a> <a href="http://www.pinterest.com/15thstreetpizza" target="_blank"><img src="images/pin-icon.png"></a> <a href="http://www.tripadvisor.com/Restaurant_Review-g35102-d804735-Reviews-15th_Street_Pizza_Pub-McDonough_Georgia.html" target="_blank"><img src="images/trip-icon.png"></a><a href="https://www.youtube.com/channel/UCWeXWaB5NAalwl43dK49xog" target="_blank">
                                                <img src="images/YouTube.png"></a></p>
      </div>
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 text-right">
        <p class="padding-top-10"> Site Designed, Developed & Maintained by <a href="http://www.syssigma.com">SysSigma.com</a></p>
      </div>
    </div>
  </div>
</div>
    


<!-- Slider Modal -->
<div class="modal fade" id="myModalBrewFest" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Brew Fest</h4>
      </div>
      <div class="modal-body">
        <!-- bootstrap carousel -->
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="false">

	  <!-- Wrapper for slides -->
	  <div class="carousel-inner">
          <asp:Repeater runat="server" ID="RptcarouselBrewFest" >
              <ItemTemplate>
        <div class="item <%# (Container.ItemIndex == 0 ? "active" : "") %> srle">
          <img src='<%# Eval("ImageUrl") %>' alt="1.jpg" class="img-responsive center-block">
        </div>
              </ItemTemplate></asp:Repeater>
           </div>

	  <!-- Controls -->
	  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
	    <span class="glyphicon glyphicon-chevron-left"></span>
	  </a>
	  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
	    <span class="glyphicon glyphicon-chevron-right"></span>
	  </a>

	  <!-- Thumbnails --> 
	  <ul class="thumbnails-carousel clearfix">
	  	<li>
             <%--<asp:Repeater runat="server" ID="RptThumbnails"><ItemTemplate>--%>
            <img src="<%#Eval("ImageUrl") %>" alt="<%#Eval("ImageUrl") %>">
                  <%--</ItemTemplate></asp:Repeater>--%>
        </li>
		</ul>
	</div>
      </div>

    </div>
  </div>
</div>

    <!-- Slider Modal -->
<div class="modal fade" id="myModalEmployees" tabindex="-1" role="dialog" aria-labelledby="myModalblEmp">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalblEmp">Employees</h4>
      </div>
      <div class="modal-body">
        <!-- bootstrap carousel -->
	<div id="carousel-example-genericEmp" class="carousel slide" data-ride="carousel" data-interval="false">

	  <!-- Wrapper for slides -->
	  <div class="carousel-inner">
          <asp:Repeater runat="server" ID="RptcarouselEmployees">
              <ItemTemplate>
	    <div class="item <%# (Container.ItemIndex == 0 ? "active" : "") %> srle">
          <img src='<%# Eval("ImageUrl") %>' alt="1.jpg" class="img-responsive center-block">
        </div>
              </ItemTemplate></asp:Repeater>
           </div>

	  <!-- Controls -->
	  <a class="left carousel-control" href="#carousel-example-genericEmp" role="button" data-slide="prev">
	    <span class="glyphicon glyphicon-chevron-left"></span>
	  </a>
	  <a class="right carousel-control" href="#carousel-example-genericEmp" role="button" data-slide="next">
	    <span class="glyphicon glyphicon-chevron-right"></span>
	  </a>

	  <!-- Thumbnails --> 
	  <ul class="thumbnails-carousel clearfix">
	  	<li>
             <%--<asp:Repeater runat="server" ID="RptThumbnails"><ItemTemplate>--%>
            <img src="<%#Eval("ImageUrl") %>" alt="<%#Eval("ImageUrl") %>">
                  <%--</ItemTemplate></asp:Repeater>--%>
        </li>
		</ul>
	</div>
      </div>

    </div>
  </div>
</div>

<!-- Slider Modal -->
<div class="modal fade" id="myModalFoodPictures" tabindex="-1" role="dialog" aria-labelledby="myModalblEmp">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalblFp">Food Pictures</h4>
      </div>
      <div class="modal-body">
        <!-- bootstrap carousel -->
	<div id="carousel-example-genericFp" class="carousel slide" data-ride="carousel" data-interval="false">

	  <!-- Wrapper for slides -->
	  <div class="carousel-inner">
          <asp:Repeater runat="server" ID="RptcarouselFoodPictures">
              <ItemTemplate>
	    <div class="item <%# (Container.ItemIndex == 0 ? "active" : "") %> srle">
          <img src='<%# Eval("ImageUrl") %>' alt="1.jpg" class="img-responsive center-block">
        </div>
              </ItemTemplate></asp:Repeater>
           </div>

	  <!-- Controls -->
	  <a class="left carousel-control" href="#carousel-example-genericFp" role="button" data-slide="prev">
	    <span class="glyphicon glyphicon-chevron-left"></span>
	  </a>
	  <a class="right carousel-control" href="#carousel-example-genericFp" role="button" data-slide="next">
	    <span class="glyphicon glyphicon-chevron-right"></span>
	  </a>

	  <!-- Thumbnails --> 
	  <ul class="thumbnails-carousel clearfix">
	  	<li>
             <%--<asp:Repeater runat="server" ID="RptThumbnails"><ItemTemplate>--%>
            <img src="<%#Eval("ImageUrl") %>" alt="<%#Eval("ImageUrl") %>">
                  <%--</ItemTemplate></asp:Repeater>--%>
        </li>
		</ul>
	</div>
      </div>

    </div>
  </div>
</div>

    <!-- Slider Modal -->
<div class="modal fade" id="myModalOurFriends" tabindex="-1" role="dialog" aria-labelledby="myModalblEmp">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalblOf">Our Friends</h4>
      </div>
      <div class="modal-body">
        <!-- bootstrap carousel -->
	<div id="carousel-example-genericOf" class="carousel slide" data-ride="carousel" data-interval="false">

	  <!-- Wrapper for slides -->
	  <div class="carousel-inner">
          <asp:Repeater runat="server" ID="RptcarouselOurFriends">
              <ItemTemplate>
	    <div class="item <%# (Container.ItemIndex == 0 ? "active" : "") %> srle">
          <img src='<%# Eval("ImageUrl") %>' alt="1.jpg" class="img-responsive center-block">
        </div>
              </ItemTemplate></asp:Repeater>
           </div>

	  <!-- Controls -->
	  <a class="left carousel-control" href="#carousel-example-genericOf" role="button" data-slide="prev">
	    <span class="glyphicon glyphicon-chevron-left"></span>
	  </a>
	  <a class="right carousel-control" href="#carousel-example-genericOf" role="button" data-slide="next">
	    <span class="glyphicon glyphicon-chevron-right"></span>
	  </a>

	  <!-- Thumbnails --> 
	  <ul class="thumbnails-carousel clearfix">
	  	<li>
             <%--<asp:Repeater runat="server" ID="RptThumbnails"><ItemTemplate>--%>
            <img src="<%#Eval("ImageUrl") %>" alt="<%#Eval("ImageUrl") %>">
                  <%--</ItemTemplate></asp:Repeater>--%>
        </li>
		</ul>
	</div>
      </div>

    </div>
  </div>
</div>

    <!-- Slider Modal -->
<div class="modal fade" id="myModalPubPictures" tabindex="-1" role="dialog" aria-labelledby="myModalblEmp">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalblPp">Pub Pictures</h4>
      </div>
      <div class="modal-body">
        <!-- bootstrap carousel -->
	<div id="carousel-example-genericPp" class="carousel slide" data-ride="carousel" data-interval="false">

	  <!-- Wrapper for slides -->
	  <div class="carousel-inner">
          <asp:Repeater runat="server" ID="RptcarouselPubPictures">
              <ItemTemplate>
	    <div class="item <%# (Container.ItemIndex == 0 ? "active" : "") %> srle">
          <img src='<%# Eval("ImageUrl") %>' alt="1.jpg" class="img-responsive center-block">
        </div>
              </ItemTemplate></asp:Repeater>
           </div>

	  <!-- Controls -->
	  <a class="left carousel-control" href="#carousel-example-genericPp" role="button" data-slide="prev">
	    <span class="glyphicon glyphicon-chevron-left"></span>
	  </a>
	  <a class="right carousel-control" href="#carousel-example-genericPp" role="button" data-slide="next">
	    <span class="glyphicon glyphicon-chevron-right"></span>
	  </a>

	  <!-- Thumbnails --> 
	  <ul class="thumbnails-carousel clearfix">
	  	<li>
             <%--<asp:Repeater runat="server" ID="RptThumbnails"><ItemTemplate>--%>
            <img src="<%#Eval("ImageUrl") %>" alt="<%#Eval("ImageUrl") %>">
                  <%--</ItemTemplate></asp:Repeater>--%>
        </li>
		</ul>
	</div>
      </div>

    </div>
  </div>
</div>

    <!-- Slider Modal -->
<div class="modal fade" id="myModalRandomStuff" tabindex="-1" role="dialog" aria-labelledby="myModalblEmp">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalblRs">Random Stuff</h4>
      </div>
      <div class="modal-body">
        <!-- bootstrap carousel -->
	<div id="carousel-example-genericRs" class="carousel slide" data-ride="carousel" data-interval="false">

	  <!-- Wrapper for slides -->
	  <div class="carousel-inner">
          <asp:Repeater runat="server" ID="RptcarouselRandomStuff">
              <ItemTemplate>
	    <div class="item <%# (Container.ItemIndex == 0 ? "active" : "") %> srle">
          <img src='<%# Eval("ImageUrl") %>' alt="1.jpg" class="img-responsive center-block">
        </div>
              </ItemTemplate></asp:Repeater>
           </div>

	  <!-- Controls -->
	  <a class="left carousel-control" href="#carousel-example-genericRs" role="button" data-slide="prev">
	    <span class="glyphicon glyphicon-chevron-left"></span>
	  </a>
	  <a class="right carousel-control" href="#carousel-example-genericRs" role="button" data-slide="next">
	    <span class="glyphicon glyphicon-chevron-right"></span>
	  </a>

	  <!-- Thumbnails --> 
	  <ul class="thumbnails-carousel clearfix">
	  	<li>
             <%--<asp:Repeater runat="server" ID="RptThumbnails"><ItemTemplate>--%>
            <img src="<%#Eval("ImageUrl") %>" alt="<%#Eval("ImageUrl") %>">
                  <%--</ItemTemplate></asp:Repeater>--%>
        </li>
		</ul>
	</div>
      </div>

    </div>
  </div>
</div>
</form>

<!-- jQuery Js -->
<script src="js/jquery.min.js"></script>
<!-- Bootstrap Js -->
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.mThumbnailScroller.js"></script>
<script src="http://blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>
<script src="https://raw.github.com/blueimp/Bootstrap-Image-Gallery/master/js/bootstrap-image-gallery.js"></script>
<script>
$(document).ready(function(){
$(".tab_content").hide();
    $(".tab_content:first").show();

  /* if in tab mode */
    $("ul.tabs li").click(function() {
		
      $(".tab_content").hide();
      var activeTab = $(this).attr("rel"); 
      $("#"+activeTab).fadeIn();		
		
      $("ul.tabs li").removeClass("active");
      $(this).addClass("active");

	  $(".tab_drawer_heading").removeClass("d_active");
	  $(".tab_drawer_heading[rel^='"+activeTab+"']").addClass("d_active");
	  
    });
	/* if in drawer mode */
	$(".tab_drawer_heading").click(function() {
      
      $(".tab_content").hide();
      var d_activeTab = $(this).attr("rel"); 
      $("#"+d_activeTab).fadeIn();
	  
	  $(".tab_drawer_heading").removeClass("d_active");
      $(this).addClass("d_active");
	  
	  $("ul.tabs li").removeClass("active");
	  $("ul.tabs li[rel^='"+d_activeTab+"']").addClass("active");
    });
	
	$('ul.tabs li').last().addClass("tab_last");
	
	  });
 $(window).scroll(function() {
    if ($(this).scrollTop()>0)
     {
        $('p.social').css("z-index", "1");
        $('.special').css("z-index", "1");
        $('.nav-15 .center-logo img').addClass('maxH', 1000); 
     }
    else
     {
      $('p.social').css("z-index", "9999");
      $('.special').css("z-index", "9999");
        $('.nav-15 .center-logo img').removeClass('maxH', 1000); 
     }
 });
		(function($){
			$(window).load(function(){
				
				$("#content-1").mThumbnailScroller({
					type:"click-50",
					theme:"buttons-out"
				});
				
			});
		})(jQuery);


// thumbnails.carousel.js jQuery plugin
		(function (window, $, undefined) {
		    // thumbnails.carousel.js jQuery plugin
		    (function (window, $, undefined) {
		        var conf = {
		            center: true,
		            backgroundControl: false
		        };

		        var cache = {
		            $carouselContainer: $(".thumbnails-carousel").parent(),
		            $thumbnailsLi: $(".thumbnails-carousel li"),
		            $controls: $(".thumbnails-carousel")
                      .parent()
                      .find(".carousel-control")
		        };

		        function init() {
		            cache.$carouselContainer
                      .find("ol.carousel-indicators")
                      .addClass("indicators-fix");
		            cache.$thumbnailsLi.first().addClass("active-thumbnail");

		            if (!conf.backgroundControl) {
		                cache.$carouselContainer
                          .find(".carousel-control")
                          .addClass("controls-background-reset");
		            } else {
		                cache.$controls.height(
                          cache.$carouselContainer.find(".carousel-inner").height()
                        );
		            }

		            if (conf.center) {
		                cache.$thumbnailsLi.wrapAll("<div class='center clearfix'></div>");
		            }
		        }

		        function refreshOpacities(domEl) {
		            cache.$thumbnailsLi.removeClass("active-thumbnail");
		            cache.$thumbnailsLi.eq($(domEl).index()).addClass("active-thumbnail");
		        }

		        function bindUiActions() {
		            cache.$carouselContainer.on("slide.bs.carousel", function (e) {
		                refreshOpacities(e.relatedTarget);
		            });

		            cache.$thumbnailsLi.click(function () {
		                cache.$carouselContainer.carousel($(this).index());
		            });
		        }

		        $.fn.thumbnailsCarousel = function (options) {
		            conf = $.extend(conf, options);

		            init();
		            bindUiActions();

		            return this;
		        };
		    })(window, jQuery);

		    $(".thumbnails-carousel").thumbnailsCarousel();

		    var conf = {
		        center: true,
		        backgroundControl: false
		    };

		    var cache = {
		        $carouselContainer: $(".thumbnails-carousel").parent(),
		        $thumbnailsLi: $(".thumbnails-carousel li"),
		        $controls: $(".thumbnails-carousel")
                  .parent()
                  .find(".carousel-control")
		    };

		    function init() {
		        cache.$carouselContainer
                  .find("ol.carousel-indicators")
                  .addClass("indicators-fix");
		        cache.$thumbnailsLi.first().addClass("active-thumbnail");

		        if (!conf.backgroundControl) {
		            cache.$carouselContainer
                      .find(".carousel-control")
                      .addClass("controls-background-reset");
		        } else {
		            cache.$controls.height(
                      cache.$carouselContainer.find(".carousel-inner").height()
                    );
		        }

		        if (conf.center) {
		            cache.$thumbnailsLi.wrapAll("<div class='center clearfix'></div>");
		        }
		    }

		    function refreshOpacities(domEl) {
		        cache.$thumbnailsLi.removeClass("active-thumbnail");
		        cache.$thumbnailsLi.eq($(domEl).index()).addClass("active-thumbnail");
		    }

		    function bindUiActions() {
		        cache.$carouselContainer.on("slide.bs.carousel", function (e) {
		            refreshOpacities(e.relatedTarget);
		        });

		        cache.$thumbnailsLi.click(function () {
		            cache.$carouselContainer.carousel($(this).index());
		        });
		    }

		    $.fn.thumbnailsCarousel = function (options) {
		        conf = $.extend(conf, options);

		        init();
		        bindUiActions();

		        return this;
		    };
		})(window, jQuery);

		$(".thumbnails-carousel").thumbnailsCarousel();

	</script>
</body>
</html>

