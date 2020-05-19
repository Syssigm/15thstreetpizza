﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CateringMenu.aspx.cs" Inherits="_15thstreetpizza.CateringMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid main-section">
            <div class="container">
                <%--<p class="social">
                    <a href="http://www.facebook.com/pages/15th-Street-Pizza-Pub/186902627989620" target="_blank">
                        <img src="images/fb-icon.png"></a> <a href="https://plus.google.com/111880389239111882314/about?gl=US&hl=en-US" target="_blank">
                            <img src="images/gplus-icon.png"></a>
                    <a href="https://twitter.com/15thStreetPizza" target="_blank">
                        <img src="images/twit-icon.png"></a>
                    <a href="http://instagram.com/15thstreetpizza" target="_blank">
                        <img src="images/insta-icon.png"></a>
                    <a href="http://www.pinterest.com/15thstreetpizza" target="_blank">
                        <img src="images/pin-icon.png"></a>
                    <a href="http://www.tripadvisor.com/Restaurant_Review-g35102-d804735-Reviews-15th_Street_Pizza_Pub-McDonough_Georgia.html" target="_blank">
                        <img src="images/trip-icon.png"></a>
                    <a href="https://www.youtube.com/channel/UCWeXWaB5NAalwl43dK49xog" target="_blank">
                                                <img src="images/YouTube.png"></a>
                </p>--%>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 map-col">
                        <div class="welcome clearfix" id="CATERING">
                            <h3>Catering Menu</h3>
                            <div id="menusContainer" style="overflow-y: scroll; height:600px;"></div>
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
    <!-- jQuery Js -->
    <script src="js/jquery.min.js"></script>
    <!-- Bootstrap Js -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.mThumbnailScroller.js"></script>
    <script>
        var options = {};
        options['PrimaryBackgroundColor'] = '#d9d9d9';
        options['MenuDescBackgroundColor'] = '#d9d9d9';
        options['SectionTitleBackgroundColor'] = '#f1f1f1';
        options['SectionDescBackgroundColor'] = '#f1f1f1';
        options['ItemBackgroundColor'] = '#ffffff';
        options['PrimaryFontFamily'] = 'Roboto';
        options['BaseFontSize'] = '15px';
        options['FontCasing'] = 'Default';
        options['PrimaryFontColor'] = '#000000';
        options['MenuDescFontColor'] = '#000000';
        options['SectionTitleFontColor'] = '#555555';
        options['SectionDescFontColor'] = '#555555';
        options['ItemTitleFontColor'] = '#555555';
        options['FeedbackFontColor'] = '#555555';
        options['ItemDescFontColor'] = '#555555';
        options['ItemPriceFontColor'] = '#555555';
        options['HideDisplayOptionAnnouncements'] = 'true';
        options['HideDisplayOptionPhotos'] = 'true';
        options['MenuTemplate'] = '2';
        options['MenuIframe'] = 'true';
        options['DisplayMenu'] = '2140395';
        new BusinessView("15th-street-pizza--pub", "menusContainer", options);
    </script>
    <script>
        $(document).ready(function () {
            $(".tab_content").hide();
            $(".tab_content:first").show();

            /* if in tab mode */
            $("ul.tabs li").click(function () {

                $(".tab_content").hide();
                var activeTab = $(this).attr("rel");
                $("#" + activeTab).fadeIn();

                $("ul.tabs li").removeClass("active");
                $(this).addClass("active");

                $(".tab_drawer_heading").removeClass("d_active");
                $(".tab_drawer_heading[rel^='" + activeTab + "']").addClass("d_active");

            });
            /* if in drawer mode */
            $(".tab_drawer_heading").click(function () {

                $(".tab_content").hide();
                var d_activeTab = $(this).attr("rel");
                $("#" + d_activeTab).fadeIn();

                $(".tab_drawer_heading").removeClass("d_active");
                $(this).addClass("d_active");

                $("ul.tabs li").removeClass("active");
                $("ul.tabs li[rel^='" + d_activeTab + "']").addClass("active");
            });

            $('ul.tabs li').last().addClass("tab_last");

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
        (function ($) {
            $(window).load(function () {

                $("#content-1").mThumbnailScroller({
                    type: "click-50",
                    theme: "buttons-out"
                });

            });
        })(jQuery);

    </script>
</asp:Content>
