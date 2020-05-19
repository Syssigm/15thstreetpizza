<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="_15thstreetpizza.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid main-section">
            <div class="container">
                <%--<p class="social">
                    <a href="http://www.facebook.com/pages/15th-Street-Pizza-Pub/186902627989620" target="_blank">
                        <img src="images/fb-icon.png"></a> <a href="https://plus.google.com/111880389239111882314/about?gl=US&hl=en-US" target="_blank">
                            <img src="images/gplus-icon.png"></a> <a href="https://twitter.com/15thStreetPizza" target="_blank">
                                <img src="images/twit-icon.png"></a> <a href="http://instagram.com/15thstreetpizza" target="_blank">
                                    <img src="images/insta-icon.png"></a> <a href="http://www.pinterest.com/15thstreetpizza" target="_blank">
                                        <img src="images/pin-icon.png"></a> <a href="http://www.tripadvisor.com/Restaurant_Review-g35102-d804735-Reviews-15th_Street_Pizza_Pub-McDonough_Georgia.html" target="_blank">
                                            <img src="images/trip-icon.png"></a><a href="https://www.youtube.com/channel/UCWeXWaB5NAalwl43dK49xog" target="_blank">
                                                <img src="images/YouTube.png"></a>
                </p>--%>
                <div class="row" runat="server" id="carepage">
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="welcome clearfix" id="CAREERS">
                            <h3>Careers </h3>
                            <div >
                                <div class="text-danger" style="padding-left:16px;">* Required fields</div>
                            <!--=============Personal Information=====================-->
                            <div class="row center">
                                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 ">
                                    <div class="form-group">
                                        <h4 class="bold orange">Personal Information:</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="row center">
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 ">
                                    <div class="form-group">
                                        <label for="email">First Name<span class="orange">*</span></label>
                                        <asp:TextBox ID="txtFirstName" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Enter the Feild!!" Display="Dynamic" ForeColor="#FF0000" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label for="phone">Last Name<span class="orange">*</span></label>
                                        <asp:TextBox ID="txtLastName" class="form-control" runat="server" placeholder="Last Name"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName" ErrorMessage="Enter the Feild!!" Display="Dynamic" ForeColor="#FF0000" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label for="street">Address<span class="orange">*</span></label>
                                        <asp:TextBox ID="txtAddress" runat="server" class="form-control" placeholder="Address"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAddress" ErrorMessage="Enter the Feild!!" Display="Dynamic" ForeColor="#FF0000" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label for="city">City<span class="orange">*</span></label>
                                        <asp:TextBox ID="txtCity" class="form-control" runat="server" placeholder="City"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtCity" ErrorMessage="Enter the Feild!!" Display="Dynamic" ForeColor="#FF0000" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label for="state">State<span class="orange">*</span></label>
                                        <asp:TextBox ID="txtState" class="form-control" runat="server" placeholder="State"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtState" ErrorMessage="Enter the Feild!!" Display="Dynamic" ForeColor="#FF0000" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label for="zip">ZIP/Postal Code<span class="orange">*</span></label>
                                        <asp:TextBox ID="txtzip" runat="server" class="form-control" placeholder="Zip/Postal Code"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtzip" ErrorMessage="Enter the Feild!!" Display="Dynamic" ForeColor="#FF0000" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label for="fname">Phone<span class="orange">*</span></label>
                                        <asp:TextBox ID="txtMobile" runat="server" class="form-control" placeholder="Phone"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMobile" ErrorMessage="Enter the Feild!!" Display="Dynamic" ForeColor="#FF0000" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label for="lname">Email Address<span class="orange">*</span></label>
                                        <asp:TextBox ID="txtEmailID" runat="server" class="form-control" placeholder="Email Address"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmailID" Display="Dynamic" ErrorMessage="Enter Valid Email ID" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </div>
                                    <div class="form-group">
                                        <label for="anni">Referred By</label>
                                        <asp:TextBox ID="txtref" runat="server" class="form-control" placeholder="Referred By"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="birth">Are you employed?</label>
                                        <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" placeholder="--Select--">
                                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label for="birth">May we inquire of your present employer?</label>
                                        <asp:DropDownList ID="DropDownList2" runat="server" class="form-control" placeholder="--Select--">
                                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <!--=============Employment Desired=====================-->
                            <div class="row center">
                                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 ">
                                    <div class="form-group">
                                        <h4 class="bold orange">Employment Desired:</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="row center">
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 ">
                                    <div class="form-group">
                                        <label for="email">Position</label>
                                        <asp:TextBox ID="txtpos" runat="server" class="form-control" placeholder="Position"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Date you can start</label>
                                        <asp:TextBox ID="txtstartdate" runat="server" class="form-control" placeholder="Date you can start"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Desired Salary</label>
                                        <asp:TextBox ID="txtsalary" runat="server" class="form-control" placeholder="Desired Salary"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label for="email">Ever applied to 15th Street Pizza</label>
                                        <asp:DropDownList ID="DropDownList3" runat="server" class="form-control" placeholder="--Select--">
                                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">If yes, where?</label>
                                        <asp:TextBox ID="txtwhere" runat="server" class="form-control" placeholder="If yes, where?"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">If yes, when?</label>
                                        <asp:TextBox ID="txtwhen" runat="server" class="form-control" placeholder="If yes, when?"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <!--=============Educational History=====================-->
                            <div class="row center">
                                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 ">
                                    <div class="form-group">
                                        <h4 class="bold orange">Educational History:</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="row center">
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 ">
                                    <div class="form-group">
                                        <label for="email">School Name</label>
                                        <asp:TextBox ID="txtschool" runat="server" class="form-control" placeholder="School Name"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">School Location</label>
                                        <asp:TextBox ID="txtscloc" runat="server" class="form-control" placeholder="School Location"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Years Attended</label>
                                        <asp:TextBox ID="txtattend" runat="server" class="form-control" placeholder="Years Attended"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Did you graduate?</label>
                                        <asp:DropDownList ID="DropDownList4" runat="server" class="form-control" placeholder="--Select--">
                                            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                            <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label for="email">Subject Studied</label>
                                        <asp:TextBox ID="txtsub" runat="server" class="form-control" placeholder="Subject Studied"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">High School</label>
                                        <asp:TextBox ID="txthighscl" runat="server" class="form-control" placeholder="High School"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Other Schools</label>
                                        <asp:TextBox ID="txtotherscl" runat="server" class="form-control" placeholder="Other Schools"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <!--=============General Information=====================-->
                            <div class="row center">
                                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 ">
                                    <div class="form-group">
                                        <h4 class="bold orange">General Information:</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="row center">
                                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 ">
                                    <div class="form-group">
                                        <label for="email">Subjects of Special Study/Research Work or Special Training/Skills</label>
                                        <asp:TextBox ID="txtspec" runat="server" class="form-control" placeholder="Subjects"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row center">
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label for="email">US Military or Naval Service?</label>
                                        <asp:TextBox ID="txtus" runat="server" class="form-control" placeholder="Service"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label for="email">Rank</label>
                                        <asp:TextBox ID="txtrank" runat="server" class="form-control" placeholder="Rank"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                                <div class="row center">
                                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 ">
                                    <div class="form-group">
                                        <h4 class="orange bold">Availability Details:</h4>
                                    </div>
                                      
                                        <div class="form-group">
                                            <table class="table table-bordered table-hover">
  <tr>
    <th scope="col">Time Slots </th>
    <th scope="col">AM (CST)</th>
    <th scope="col">PM (CST)</th>
  </tr>
  <tr>
    <th scope="row">MON</th>
    <td><asp:TextBox ID="Txtmonmor" class="form-control text-center"  Text="" runat="server"></asp:TextBox><%--<input type="text" class="form-control" />--%></td>
    <td style="align-content:center"><asp:TextBox ID="Txtmonafter" class="form-control text-center" Text="" runat="server"></asp:TextBox><%--<input type="text" class="form-control" />--%></td>
  </tr>
  <tr>
    <th scope="row">TUE</th>
    <td><asp:TextBox ID="Txttuemor" class="form-control text-center" Text="" runat="server"></asp:TextBox></td>
    <td><asp:TextBox ID="Txttueafter" class="form-control text-center" Text="" runat="server"></asp:TextBox></td>
  </tr>
  <tr>
    <th scope="row">WED</th>
    <td><asp:TextBox ID="Txtwedmor" Text="" class="form-control text-center" runat="server"></asp:TextBox></td>
    <td><asp:TextBox ID="Txtwedafter" Text="" class="form-control text-center" runat="server"></asp:TextBox></td>
  </tr>
  <tr>
    <th scope="row">THU</th>
    <td><asp:TextBox ID="Txtthumor" Text="" class="form-control text-center" runat="server"></asp:TextBox></td>
    <td><asp:TextBox ID="Txtthuafter" Text="" class="form-control text-center" runat="server"></asp:TextBox></td>
  </tr>
  <tr>
    <th scope="row">FRI</th>
    <td><asp:TextBox ID="Txtfrimor" Text="" class="form-control text-center" runat="server"></asp:TextBox></td>
    <td><asp:TextBox ID="Txtfriafter" Text="" class="form-control text-center" runat="server"></asp:TextBox></td>
  </tr>
  <tr>
    <th scope="row">SAT</th>
    <td><asp:TextBox ID="Txtsatmor" Text="" class="form-control text-center" runat="server"></asp:TextBox></td>
    <td><asp:TextBox ID="Txtsatafter" Text="" class="form-control text-center" runat="server"></asp:TextBox></td>
  </tr>
  <tr>
    <th scope="row">SUN</th>
    <td><asp:TextBox ID="Txtsunmor" Text="" class="form-control text-center" runat="server"></asp:TextBox></td>
    <td><asp:TextBox ID="Txtsunafter" Text="" class="form-control text-center" runat="server"></asp:TextBox></td>
  </tr>
</table>
                                            </div>
                                </div>
                                </div>
                            <!--=============Employer #1=====================-->
                            <div class="row center">
                                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 ">
                                    <div class="form-group">
                                        <h4 class="orange bold">Employer #1:</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="row center">
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 ">
                                    <div class="form-group">
                                        <label for="email">Name</label>
                                        <asp:TextBox ID="txtnam" runat="server" class="form-control" placeholder="Name"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="phone">Supervisor</label>
                                        <asp:TextBox ID="txtSupervisor" class="form-control" runat="server" placeholder="Supervisor"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="street">Phone</label>
                                        <asp:TextBox ID="txtph" runat="server" class="form-control" placeholder="Phone"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="city">City</label>
                                        <asp:TextBox ID="txtCty" class="form-control" runat="server" placeholder="City"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="state">State</label>
                                        <asp:TextBox ID="txtStat" class="form-control" runat="server" placeholder="State"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label for="fname">ZIP/Postal Code</label>
                                        <asp:TextBox ID="txtPostalCode" runat="server" class="form-control" placeholder="Phone"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="lname">Position</label>
                                        <asp:TextBox ID="txtPosition" runat="server" class="form-control" placeholder="Position"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="anni">Reason for Leaving</label>
                                        <asp:TextBox ID="txtreson" runat="server" class="form-control" placeholder="Reason for Leaving"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="birth">Start Date</label>
                                        <asp:TextBox ID="txtstrtdate" runat="server" class="form-control" placeholder="Start Date"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="birth">End Date</label>
                                        <asp:TextBox ID="txtEnDate" runat="server" class="form-control" placeholder="End Date"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <!--=============Employer #2=====================-->
                            <div class="row center">
                                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 ">
                                    <div class="form-group">
                                        <h4 class="bold orange">Employer #2:</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="row center">
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 ">
                                    <div class="form-group">
                                        <label for="email">Name</label>
                                        <asp:TextBox ID="txtemp2name" runat="server" class="form-control" placeholder="Name"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="phone">Supervisor</label>
                                        <asp:TextBox ID="txtemp2sup" class="form-control" runat="server" placeholder="Supervisor"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="street">Phone</label>
                                        <asp:TextBox ID="txtemp2phon" runat="server" class="form-control" placeholder="Phone"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="city">City</label>
                                        <asp:TextBox ID="txtemp2city" class="form-control" runat="server" placeholder="City"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="state">State</label>
                                        <asp:TextBox ID="txtemp2state" class="form-control" runat="server" placeholder="State"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4    col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label for="fname">ZIP/Postal Code</label>
                                        <asp:TextBox ID="txtemp2zip" runat="server" class="form-control" placeholder="Phone"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="lname">Position</label>
                                        <asp:TextBox ID="txtemp2pos" runat="server" class="form-control" placeholder="Position"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="anni">Reason for Leaving</label>
                                        <asp:TextBox ID="txtemp2res" runat="server" class="form-control" placeholder="Reason for Leaving"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="birth">Start Date</label>
                                        <asp:TextBox ID="txtemp2sdate" runat="server" class="form-control" placeholder="Start Date"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <label for="birth">End Date</label>
                                        <asp:TextBox ID="txtemp2edate" runat="server" class="form-control" placeholder="End Date"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <!--=============Submit Button=====================-->
                            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 ">
                                <div class="form-group text-center">
                                    <asp:Button ID="btnSubmit" runat="server" Text="SUBMIT" class="btn btn-block btn-brand" OnClick="btnSubmit_Click"/>
                                </div>
                            </div>
                           </div>
                        </div>
                        
        </div>
        </div>
                <div class="row" id="hiremsg" runat="server">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="welcome clearfix">
                    <div class="center">
                            <h3>Careers </h3>
                        <div style="padding-left:193px;font-size: large;">Currently we are not hiring as soon as we start hiring, you will be able to register your application.</div>
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
