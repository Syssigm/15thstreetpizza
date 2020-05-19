<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="WriteaReview.aspx.cs" Inherits="_15thstreetpizza.WriteaReview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid main-section">
            <div class="container">
                <%--<p class="social"><a href="http://www.facebook.com/pages/15th-Street-Pizza-Pub/186902627989620" target="_blank">
                    <img src="images/fb-icon.png"></a> <a href="https://plus.google.com/111880389239111882314/about?gl=US&hl=en-US" target="_blank">
                        <img src="images/gplus-icon.png"></a> <a href="https://twitter.com/15thStreetPizza" target="_blank">
                            <img src="images/twit-icon.png"></a> <a href="http://instagram.com/15thstreetpizza" target="_blank">
                                <img src="images/insta-icon.png"></a> <a href="http://www.pinterest.com/15thstreetpizza" target="_blank">
                                    <img src="images/pin-icon.png"></a> <a href="http://www.tripadvisor.com/Restaurant_Review-g35102-d804735-Reviews-15th_Street_Pizza_Pub-McDonough_Georgia.html" target="_blank">
                                        <img src="images/trip-icon.png"></a> <a href="https://www.youtube.com/channel/UCWeXWaB5NAalwl43dK49xog" target="_blank">
                                                <img src="images/YouTube.png"></a></p>--%>
                <div class="row">
                    <asp:Label ID="lblError" runat="server" ></asp:Label>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="welcome clearfix" id="WRITE">
                            <h3>Write a Review </h3>
                            <p class="text-right"><a href="Testimonials.aspx" class="btn btn-info">View Past Reviews <span class="glyphicon glyphicon-hand-right" aria-hidden="true"></span></a></p>
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <label for="inputEmail3" class="col-lg-3 col-md-3 col-sm-3 col-xs-12 control-label">Your Name</label>
                                    <div class="col-lg-5 col-md-6 col-sm-9 col-xs-12">
                                        <!-- <input type="text" class="form-control" id="input1" placeholder="Name">-->
                                        <asp:TextBox ID="txtName" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputPassword3" class="col-lg-3 col-md-3 col-sm-3 col-xs-12 control-label">Title of Your Review</label>
                                    <div class="col-lg-5 col-md-6 col-sm-9 col-xs-12">
                                        <!--<input type="text" class="form-control" id="input2" placeholder="Title">-->
                                         <asp:TextBox ID="txtTitle" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="inputPassword3" class="col-lg-3 col-md-3 col-sm-3 col-xs-12 control-label">Your Review</label>
                                    <div class="col-lg-5 col-md-6 col-sm-9 col-xs-12">
                                        <!--<textarea runat="server" Id="txtComments">
	                                    </textarea>-->
                                        <asp:TextBox ID="txtComment" runat="server" ValidateRequestMode="Disabled" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-lg-offset-3 col-md-offset-3 col-sm-offset-3 col-lg-5 col-md-6 col-sm-9 col-xs-12">
                                        <asp:Button ID="btnSubmit" class="btn btn-lg btn-warning" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnReset" class="btn  btn-lg btn-default" runat="server" Text="Clear" OnClick="btnReset_Click" />
                                       <%-- <button type="submit" class="btn btn-lg btn-warning">Submit</button>
                                        <button type="reset" class="btn  btn-lg btn-default">Clear</button>--%>
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
</asp:Content>
