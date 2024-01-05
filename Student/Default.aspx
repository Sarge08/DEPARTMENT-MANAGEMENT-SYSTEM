<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Home.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Employee_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
       <link href="../css/Dashboard.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="container">
        <section class="content-header">
            <h3 class="MyFavColor">Student Dashboard</h3>
            <ol class="breadcrumb">
                <li><a href="Default.aspx"><i class="fa fa-home"></i></a>Home</li>
            </ol>
        </section>
    </div>
       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
   <ContentTemplate>
                        <asp:Label ID="lbluId" runat="server" Visible="false" Text="Label"></asp:Label>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="panel-title">
                                    <h4 class="BoldFont">Add Placement Details</h4>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-9">
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <div class="form-floating mb-3">
                                                    <asp:TextBox ID="txtName" Enabled="false" CssClass="form-control text-capitalize" placeholder="Type Training Centre Name" runat="server"></asp:TextBox>
                                                    <label for="txtName">
                                                       Student Name                                                      
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtName" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                </div>
                                            </div>
                                          <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <div class="form-floating mb-3">
                                                    <asp:TextBox ID="TxtEmail" Enabled="false" CssClass="form-control text-capitalize" placeholder="Type Training Centre Name" runat="server"></asp:TextBox>
                                                    <label for="TxtEmail">
                                                      Student Email    
                                           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="Error" runat="server" ControlToValidate="TxtEmail" ErrorMessage="Invalid E-mail" SetFocusOnError="true" ForeColor="Red" Display="Dynamic" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$"></asp:RegularExpressionValidator>                                              
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="TxtEmail" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                              </div>
                                            </div>
                                         <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:TextBox ID="txtClientMobile" Enabled="false" MaxLength="10" CssClass="form-control" placeholder="MOBILE" runat="server"></asp:TextBox>
                                                <label>
                                                    Mobile
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="Error" ControlToValidate="txtClientMobile" SetFocusOnError="true" runat="server" ForeColor="Red" ErrorMessage=" Required" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator10" ValidationGroup="Error" runat="server" ControlToValidate="txtClientMobile" ErrorMessage="Invalid Mobile No" SetFocusOnError="true" ForeColor="Red" Display="Dynamic" ValidationExpression="^[6-9]\d{9}$"></asp:RegularExpressionValidator>
                                                </label>
                                            </div>
                                        </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <div class="form-floating mb-3">
                                                    <asp:TextBox ID="txtPassword" Enabled="false" CssClass="form-control text-capitalize" placeholder="Type Training Centre Name" runat="server"></asp:TextBox>
                                                    <label for="txtPassword">
                                                     Password   
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtPassword" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                              </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <div class="form-floating mb-3">
                                                    <asp:TextBox ID="txtRollNo" Enabled="false" CssClass="form-control text-capitalize" placeholder="Type Training Centre Name" runat="server"></asp:TextBox>
                                                    <label for="txtRollNo">
                                                     Roll No   
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtRollNo" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                              </div>
                                            </div>
                                      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                                <div class="form-floating mb-3">
                                                    <asp:TextBox ID="txtAddress" Enabled="false" CssClass="form-control text-capitalize" placeholder="Type Training Centre Name" runat="server"></asp:TextBox>
                                                    <label for="txtAddress">
                                                     Address   
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtAddress" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                              </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <asp:Image ID="imagePreview" runat="server" CssClass="img-thumbnail Photo" ImageUrl="../img/profileimg.jpg" Width="150" Height="105px" BorderStyle="Solid" BorderColor="#2626a4" BorderWidth="2px" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                               <div class="row">
                                   <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                        <div class="form-floating mb-3">
                                            <asp:DropDownList ID="DropDownListCourse" Enabled="false" Height="48" AppendDataBoundItems="true" Width="100%" CssClass="form-select select2" aria-label="Floating label select example" runat="server">
                                                <asp:ListItem Value="0">Choose Course</asp:ListItem>
                                                <asp:ListItem>BSC ITM</asp:ListItem>
                                                <asp:ListItem>MIT</asp:ListItem>
                                                <asp:ListItem>DSM</asp:ListItem>
                                            </asp:DropDownList>
                                            <label for="DropDownListCourse">
                                                Course                                            
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="DropDownListCourse" InitialValue="0" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                        </div>
                                    </div>
                               <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                <div class="form-floating mb-3">
                                                    <asp:TextBox ID="txtsession" Enabled="false" CssClass="form-control text-capitalize" placeholder="Type Training Centre Name" runat="server"></asp:TextBox>
                                                    <label for="txtsession">
                                                     Session   
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtsession" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                              </div>
                                            </div>
                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                            <div class="form-floating mb-3">
                                            <asp:DropDownList ID="DropDownListGender" Enabled="false" Height="48" AppendDataBoundItems="true" Width="100%" CssClass="form-select select2" aria-label="Floating label select example" runat="server">
                                                <asp:ListItem Value="0">Choose Gender</asp:ListItem>
                                                <asp:ListItem>Male</asp:ListItem>
                                                <asp:ListItem>Female</asp:ListItem>
                                                <asp:ListItem>Other</asp:ListItem>
                                            </asp:DropDownList>
                                            <label for="DropDownListGender">
                                                Gender                                            
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="DropDownListGender" InitialValue="0" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                        </div>
                                                 </div>
                                     <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                        <div class="form-floating mb-3">
                                            <asp:TextBox ID="txtDateOfBirth" Enabled="false" CssClass="form-control" placeholder="Type Date in DD-MM-YYYY Format..." runat="server"></asp:TextBox>
                                            <label for="txtDateOfBirth">
                                                Date of Birth                                                     
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtDateOfBirth" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                        </div>
                                    </div>
                                            </div>
                                <div class="row">
                                         <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:DropDownList ID="DropDownListBloodGroup" Enabled="false" Height="48" AppendDataBoundItems="true" Width="100%" CssClass="form-select select2" aria-label="Floating label select example" runat="server">
                                                    <asp:ListItem Value="0">Choose Blood Group</asp:ListItem>
                                                    <asp:ListItem>A+</asp:ListItem>
                                                    <asp:ListItem>A-</asp:ListItem>
                                                    <asp:ListItem>AB+</asp:ListItem>
                                                    <asp:ListItem>AB-</asp:ListItem>
                                                    <asp:ListItem>B+</asp:ListItem>
                                                    <asp:ListItem>B-</asp:ListItem>
                                                    <asp:ListItem>O+</asp:ListItem>
                                                    <asp:ListItem>O-</asp:ListItem>
                                                </asp:DropDownList>
                                                <label for="DropDownListBloodGroup">
                                                    Blood Group                                            
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator12" InitialValue="0" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="DropDownListBloodGroup" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                        </div>
                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                        <div class="form-floating mb-3">
                                            <asp:DropDownList ID="DropDownListStudentName" OnSelectedIndexChanged="DropDownListStudentName_SelectedIndexChanged" AutoPostBack="true" Width="100%" AppendDataBoundItems="true" CssClass="form-control select2 DropDown" runat="server">
                                                <asp:ListItem Value="0">Choose Option</asp:ListItem>
                                                <asp:ListItem>Cheak Availability</asp:ListItem>
                                            </asp:DropDownList>
                                            <label>
                                                Data Availability
                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="Error" InitialValue="0" runat="server" ErrorMessage="Required" ControlToValidate="DropDownListStudentName" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                        </div>
                                    </div>
                                 <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:DropDownList ID="DropDownListcomany1" Height="48" AppendDataBoundItems="true" Width="100%" CssClass="form-select select2" aria-label="Floating label select example" runat="server">
                                                    <asp:ListItem Value="0">Choose Company Name</asp:ListItem>
                                                    <asp:ListItem>DELOITTE</asp:ListItem>
                                                    <asp:ListItem>WIPRO</asp:ListItem>
                                                    <asp:ListItem>TCS</asp:ListItem>
                                                    <asp:ListItem>INFOSYS</asp:ListItem>
                                                    <asp:ListItem>COGNIZANT</asp:ListItem>
                                                    <asp:ListItem>ACCENTURE</asp:ListItem>
                                                    <asp:ListItem>ICICI</asp:ListItem>
                                                    <asp:ListItem>OTHERS</asp:ListItem>
                                                    <asp:ListItem>NOT SELECTED</asp:ListItem>
                                                </asp:DropDownList>
                                                <label for="DropDownListplaced">
                                                   Company 1                                           
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator13" InitialValue="0" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="DropDownListplaced" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                        </div>
                                     <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:DropDownList ID="DropDownListcomp2" Height="48" AppendDataBoundItems="true" Width="100%" CssClass="form-select select2" aria-label="Floating label select example" runat="server">
                                                    <asp:ListItem Value="0">Choose Company Name</asp:ListItem>
                                                    <asp:ListItem>DELOITTE</asp:ListItem>
                                                    <asp:ListItem>WIPRO</asp:ListItem>
                                                    <asp:ListItem>TCS</asp:ListItem>
                                                    <asp:ListItem>INFOSYS</asp:ListItem>
                                                    <asp:ListItem>COGNIZANT</asp:ListItem>
                                                    <asp:ListItem>ACCENTURE</asp:ListItem>
                                                    <asp:ListItem>ICICI</asp:ListItem>
                                                    <asp:ListItem>OTHERS</asp:ListItem>
                                                    <asp:ListItem>NOT SELECTED</asp:ListItem>
                                                </asp:DropDownList>
                                                <label for="DropDownListcomp2">
                                                   Company 2                                           
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator14" InitialValue="0" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="DropDownListcomp2" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                        </div>
                                        </div>
                                        <div class="row">
                               <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:DropDownList ID="DropDownListcomp3" Height="48" AppendDataBoundItems="true" Width="100%" CssClass="form-select select2" aria-label="Floating label select example" runat="server">
                                                    <asp:ListItem Value="0">Choose Company Name</asp:ListItem>
                                                    <asp:ListItem>DELOITTE</asp:ListItem>
                                                    <asp:ListItem>WIPRO</asp:ListItem>
                                                    <asp:ListItem>TCS</asp:ListItem>
                                                    <asp:ListItem>INFOSYS</asp:ListItem>
                                                    <asp:ListItem>COGNIZANT</asp:ListItem>
                                                    <asp:ListItem>ACCENTURE</asp:ListItem>
                                                    <asp:ListItem>ICICI</asp:ListItem>
                                                    <asp:ListItem>OTHERS</asp:ListItem>
                                                    <asp:ListItem>NOT SELECTED</asp:ListItem>
                                                </asp:DropDownList>
                                                <label for="DropDownListcomp3">
                                                   Company 3                                           
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator15" InitialValue="0" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="DropDownListcomp3" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                        </div>
                             <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:DropDownList ID="DropDownListplaced" Height="48" AppendDataBoundItems="true" Width="100%" CssClass="form-select select2" aria-label="Floating label select example" runat="server">
                                                    <asp:ListItem Value="0">Choose Placement Status</asp:ListItem>
                                                    <asp:ListItem>Yes</asp:ListItem>
                                                    <asp:ListItem>No</asp:ListItem>
                                                </asp:DropDownList>
                                                <label for="DropDownListplaced">
                                                    Placement Status                                            
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator16" InitialValue="0" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="DropDownListplaced" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                        </div>
                                        </div>
                               <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                        <div class="form-group">
                                            <asp:LinkButton ID="btnSubmit" OnClick="btnSubmit_Click" ValidationGroup="Error" CssClass="btn btn-info" runat="server"><i class="fa fa-check"></i> Submit </asp:LinkButton>
                                            <asp:LinkButton ID="BtnUpdate" OnClick="BtnUpdate_Click" Visible="false" ValidationGroup="Error" CssClass="btn btn-success" runat="server"><i class="fa fa-check"></i> Update </asp:LinkButton>
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
       </ContentTemplate>
                                                   <Triggers>
            <asp:PostBackTrigger ControlID="btnSubmit" />
                    <asp:PostBackTrigger ControlID="BtnUpdate" />
        </Triggers>
           </asp:UpdatePanel>
</asp:Content>

