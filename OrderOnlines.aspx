<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderOnlines.aspx.cs" Inherits="PizzaV5.OrderOnline" %>

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
    <link rel="stylesheet" type="text/css" href="css/custom.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:100,300,400,700" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-fixed-top nav-15">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="col-lg-5 col-md-5 col-sm-5">
                <ul>
                    <li><a href="Default.aspx"><span class="glyphicon glyphicon-home"></span></a></li>
                    <li><a href="#">MENU </a>
                        <ul>
                            <li><a href="RegularMenu.aspx">REGULAR MENU</a>
                                <a class="pdfM" href="content/15thPDFMenu.pdf" target="new"><span class="glyphicon glyphicon-arrow-right"></span>PDF MENU</a>
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
                    <li><a href="#">GALLERY</a>
                        <ul>
                            <li><a href="Gallery.aspx">PICTURES</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="Videos.aspx">VIDEOS</a></li>
                        </ul>
                    </li>
                    <li><a href="#">EVENTS </a>
                    </li>
                    <li class="active"><a href="#">TESTIMONIALS</a>
                        <ul>
                            <li><a href="WriteaReview.aspx">WRITE A REVIEW</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="Testimonials.aspx">PAST REVIEW</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
            <div class="col-lg-2 col-md-2 col-sm-2 center-logo padding-left-right-0">
                <a href="Default.aspx">
                    <img src="images/15thstreetpizza-logo.png" border="0"></a>
            </div>
            <div class="col-lg-5 col-md-5 col-sm-5">
                <ul>
                    <li><a href="Register.aspx">CAREERS</a> </li>
                    <li><a href="Aboutus.aspx">ABOUT US</a> </li>
                    <li><a href="ContactUs.aspx">CONTACT US</a> </li>
                </ul>
            </div>
        <!--    <a href="OrderOnline.aspx" target="_blank" class="order-btn">
                <img src="images/orderonline-btn.png" class="img-responsive"></a> -->
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
                <p class="social">
                    <a href="http://www.facebook.com/pages/15th-Street-Pizza-Pub/186902627989620" target="_blank">
                        <img src="images/fb-icon.png"></a> <a href="https://plus.google.com/111880389239111882314/about?gl=US&hl=en-US" target="_blank">
                            <img src="images/gplus-icon.png"></a> <a href="https://twitter.com/15thStreetPizza" target="_blank">
                                <img src="images/twit-icon.png"></a> <a href="http://instagram.com/15thstreetpizza" target="_blank">
                                    <img src="images/insta-icon.png"></a> <a href="http://www.pinterest.com/15thstreetpizza" target="_blank">
                                        <img src="images/pin-icon.png"></a> <a href="http://www.tripadvisor.com/Restaurant_Review-g35102-d804735-Reviews-15th_Street_Pizza_Pub-McDonough_Georgia.html" target="_blank">
                                            <img src="images/trip-icon.png"></a><a href="https://www.youtube.com/channel/UCWeXWaB5NAalwl43dK49xog" target="_blank">
                                                <img src="images/YouTube.png"></a>
                </p>
                <div class="row">
                    <asp:Label ID="lblError" runat="server" Text="Label"></asp:Label>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="welcome clearfix" id="OrderOnline">
                            <h3> Order Online </h3>
                          <asp:Panel ID="pnl" runat="server" HorizontalAlign="Center" Height="510px">
    <!-- START BIGHOLLER ORDER ENGINE-->
           <%--<h3 align="center"> CURRENTLY ONLINE ORDER FACILITY IS NOT AVAILABLE </h3>--%>
    <%--<iframe id="bhOrders" name="bhOrders" src="http://bigholler.15thstreetpizza.com/15thstreetpizzapub" style="width:786px; height:500px; background-color:White;" marginwidth="0" marginheight="0" frameborder="0" scrolling="No"></iframe> --%>
    <!-- END BIGHOLLER ORDER ENGINE -->
    <a class='chownow-order-online' href='https://ordering.chownow.com/order/15147/locations' target='_blank'>Order Online</a>
    <!--<asp:ImageButton ID="btnHome" runat="server" ImageUrl="Images/Default_on.jpg" OnClick="btnHome_Click"/>-->
</asp:Panel> 
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
                        <p>
                            <a href="http://www.facebook.com/pages/15th-Street-Pizza-Pub/186902627989620" target="_blank">
                                <img src="images/fb-icon.png"></a> <a href="https://plus.google.com/111880389239111882314/about?gl=US&hl=en-US" target="_blank">
                                    <img src="images/gplus-icon.png"></a> <a href="https://twitter.com/15thStreetPizza" target="_blank">
                                        <img src="images/twit-icon.png"></a> <a href="http://instagram.com/15thstreetpizza" target="_blank">
                                            <img src="images/insta-icon.png"></a> <a href="http://www.pinterest.com/15thstreetpizza" target="_blank">
                                                <img src="images/pin-icon.png"></a> <a href="http://www.tripadvisor.com/Restaurant_Review-g35102-d804735-Reviews-15th_Street_Pizza_Pub-McDonough_Georgia.html" target="_blank">
                                                    <img src="images/trip-icon.png"></a><a href="https://www.youtube.com/channel/UCWeXWaB5NAalwl43dK49xog" target="_blank">
                                                <img src="images/YouTube.png"></a>
                        </p>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 text-right">
                        <p class="padding-top-10">Site Designed, Developed & Maintained by <a href="http://www.syssigma.com">SysSigma.com</a></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- jQuery Js -->
        <script src="js/jquery.min.js"></script>
        <!-- Bootstrap Js -->
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.mThumbnailScroller.js"></script>
        <script src="http://cdn.tinymce.com/4/tinymce.min.js"></script>
    </form>
     <script>
        $(document).ready(function () {
            $(".recBtn .btn-brand").click(function () {
                $(".coupForm").show();
                $(this).hide();
            });


            $("#content-slider").lightSlider({
                item: 5,
                speed: 8000,
                auto: true,
                loop: true,
                pause: 8000,

            });
        });

        $(window).scroll(function () {
            if ($(this).scrollTop() > 0) {
                $('p.social').css("z-index", "1");
                $('.special').css("z-index", "1");
                $('.nav-15 .center-logo img').addClass('maxH', 1000);
            }
            else {
                $('p.social').css("z-index", "9999");
                $('.special').css("z-index", "9999");
                $('.nav-15 .center-logo img').removeClass('maxH', 1000);
            }
        });

        $('a[href*="#"]:not([href="#"])').click(function () {
            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                if (target.length) {
                    $('html, body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    return false;
                }
            }
        });

        (function ($) {
            $(window).load(function () {

                $("#content-1").mThumbnailScroller({
                    type: "click-50",
                    theme: "buttons-out"
                });

            });
        })(jQuery);

    </script>
    <script src='https://cf.chownowcdn.com/latest/static/integrations/ordering-modal.min.js' data-chownow-company-id='15147'></script>
</body>
</html>
