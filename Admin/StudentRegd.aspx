<%@ Page Title="Student Registration | e-IMS | Smart ERP | Sainaatech IT Solutions LLP" Language="C#" MasterPageFile="~/Admin/Home.master" AutoEventWireup="true" CodeFile="StudentRegd.aspx.cs" Inherits="Admin_Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <section class="content-header">
            <h3 class="MyFavColor">Admin Dashboard | Student Registration</h3>
            <ol class="breadcrumb">
                <li><a href="Default.aspx"><i class="fa fa-home"></i></a>Home</li>
                <li class="active">Manage Student</li>
                <li class="active">Student Registration</li>
            </ol>
        </section>
    </div>
    <div class="container">
        <asp:Label ID="lblPassword" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lblMonthName" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lblYearName" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lblAge" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lblBranchCode" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lblStudentID" runat="server" Visible="false"></asp:Label>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <div class="row">
                                <div class="col-lg-9 col-md-6 col-sm-6 col-xs-6">
                                    <div class="pull-left">
                                        <h4 class="BoldFont">Student Basic Details</h4>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-6">
                                    <asp:UpdateProgress runat="server" ID="ProgressBar" AssociatedUpdatePanelID="UpdatePanel1">
                                        <ProgressTemplate>
                                            <div class="progress-bar progress-bar-striped active">
                                                Please Wait... 
                                            </div>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                    <asp:Label ID="lblMessage" EnableViewState="true" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-2 col-md-2 col-sm-3 col-xs-12">
                                <div class="form-group">
                                    <asp:Image ID="ImageProfilePhoto" ImageUrl="../img/StudentIcon.png" CssClass="img-responsive img-thumbnail ProfilePhoto" runat="server" />
                                </div>
                                <div class="form-group">
                                     <label>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" Font-Bold="true" ValidationGroup="Error" runat="server" ControlToValidate="FileUpload1Phtoto" ErrorMessage="Only Image File Allowed" SetFocusOnError="true" ForeColor="Red" Display="Dynamic" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.PNG|.JPEG|.jpg|.jpeg|.JPG|.gif)$"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorStudentPhoto" Font-Bold="true" runat="server" ErrorMessage="Required" ControlToValidate="FileUpload1Phtoto" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </label>
                                    <asp:FileUpload ID="FileUpload1Phtoto" EnableViewState="true" ViewStateMode="Enabled" onchange="ShowImagePreviewProfilePhoto(this)" CssClass="form-control" runat="server" />
                                </div>
                                <div class="form-group">
                                    <asp:LinkButton ID="btnUpdatePhoto" OnClick="btnUpdatePhoto_Click" CssClass="btn btn-info btn-block" runat="server"><i class="fa fa-upload"></i> Upload Photo</asp:LinkButton>
                                </div>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div class="col-lg-10 col-md-10 col-sm-9 col-xs-12">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <div class="form-floating mb-3">
                                                    <asp:DropDownList ID="DropDownListTrainingCentre" OnSelectedIndexChanged="DropDownListTrainingCentre_SelectedIndexChanged" AutoPostBack="true" Width="100%" AppendDataBoundItems="true" DataTextField="CentreName" DataValueField="TCUid" CssClass="form-control select2 DropDown" runat="server">
                                                        <asp:ListItem Value="0">Choose Centre Name</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <label for="DropDownListTrainingCentre">
                                                        Centre Name                                                      
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" InitialValue="0" ControlToValidate="DropDownListTrainingCentre" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                <div class="form-floating mb-3">
                                                    <asp:TextBox ID="txtStudentName" CssClass="form-control text-capitalize" placeholder="Type Student Name" runat="server"></asp:TextBox>
                                                    <label>
                                                        Student Name                                                      
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtStudentName" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                <div class="form-floating mb-3">
                                                    <asp:TextBox ID="txtGuardianName" CssClass="form-control text-capitalize" placeholder="Type Guardian Name" runat="server"></asp:TextBox>
                                                    <label>
                                                        Guardian Name                                                      
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtGuardianName" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                <div class="form-floating mb-3">
                                                    <asp:TextBox ID="txtDateOfRegd" CssClass="form-control" placeholder="Type Date in DD-MM-YYYY Format..." runat="server"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" Format="dd-MM-yyyy" runat="server" BehaviorID="txtDateOfRegd_CalendarExtender11" TargetControlID="txtDateOfRegd"></ajaxToolkit:CalendarExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderss6" TargetControlID="txtDateOfRegd" FilterType="Custom" ValidChars="1234567890-" runat="server" />
                                                    <label for="txtDateOfRegd">
                                                        Date of Regd.                                                     
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8ss" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtDateOfRegd" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                <div class="form-floating mb-3">
                                                    <asp:TextBox ID="txtDateOfBirth" CssClass="form-control" placeholder="Type Date in DD-MM-YYYY Format..." runat="server"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender2" Format="dd-MM-yyyy" runat="server" BehaviorID="txtDateOfBirth_CalendarExtender11" TargetControlID="txtDateOfBirth"></ajaxToolkit:CalendarExtender>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" TargetControlID="txtDateOfBirth" FilterType="Custom" ValidChars="1234567890-" runat="server" />
                                                    <label for="txtDateOfBirth">
                                                        Date of Birth                                                     
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtDateOfBirth" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                <div class="form-floating mb-3">
                                                    <asp:TextBox ID="txtEmail" CssClass="form-control text-lowercase" placeholder="Type Email" runat="server"></asp:TextBox>
                                                    <label for="txtEmail">
                                                        Email                                                   
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtEmail" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="Error" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email" SetFocusOnError="true" ForeColor="Red" Display="Dynamic" ValidationExpression="^[a-z0-9][-a-z0-9._]+@([-a-z0-9]+.)+[a-z]{2,5}$"></asp:RegularExpressionValidator>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                <div class="form-floating mb-3">
                                                    <asp:TextBox ID="txtMobileNumber" CssClass="form-control" placeholder="Type Mobile Number" MaxLength="10" runat="server"></asp:TextBox>
                                                    <label for="txtMobileNumber">
                                                        Mobile      
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator19" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtMobileNumber" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ValidationGroup="Error" runat="server" ControlToValidate="txtMobileNumber" ErrorMessage="Invalid Mobile" SetFocusOnError="true" ForeColor="Red" Display="Dynamic" ValidationExpression="^[6-9]\d{9}$"></asp:RegularExpressionValidator>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" TargetControlID="txtMobileNumber" FilterType="Numbers" ValidChars="0123456789" runat="server" />
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                <div class="form-floating mb-3">
                                                    <asp:DropDownList ID="DropDownListGender" Height="48" AppendDataBoundItems="true" Width="100%" CssClass="form-select select2" aria-label="Floating label select example" runat="server">
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
                                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                <div class="form-floating mb-3">
                                                    <asp:DropDownList ID="DropDownListCaste" Height="48" AppendDataBoundItems="true" Width="100%" CssClass="form-select select2" aria-label="Floating label select example" runat="server">
                                                        <asp:ListItem Value="0">Choose Caste</asp:ListItem>
                                                        <asp:ListItem>General</asp:ListItem>
                                                        <asp:ListItem>ST</asp:ListItem>
                                                        <asp:ListItem>SC</asp:ListItem>
                                                        <asp:ListItem>OBC</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <label for="DropDownListCaste">
                                                        Caste                                            
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="DropDownListCaste" InitialValue="0" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                <div class="form-floating mb-3">
                                                    <asp:DropDownList ID="DropDownListReligion" Height="48" AppendDataBoundItems="true" Width="100%" CssClass="form-select select2" aria-label="Floating label select example" runat="server">
                                                        <asp:ListItem Value="0">Choose Religion</asp:ListItem>
                                                        <asp:ListItem>Hindu</asp:ListItem>
                                                        <asp:ListItem>Muslim</asp:ListItem>
                                                        <asp:ListItem>Christian</asp:ListItem>
                                                        <asp:ListItem>Other</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <label for="DropDownListReligion">
                                                        Religion                                            
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="DropDownListReligion" InitialValue="0" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                <div class="form-floating mb-3">
                                                    <asp:DropDownList ID="DropDownListMotherTounge" Height="48" AppendDataBoundItems="true" Width="100%" CssClass="form-select select2" aria-label="Floating label select example" runat="server">
                                                        <asp:ListItem Value="0">Choose Mother Tounge</asp:ListItem>
                                                        <asp:ListItem>Oriya</asp:ListItem>
                                                        <asp:ListItem>Hindi</asp:ListItem>
                                                        <asp:ListItem>English</asp:ListItem>
                                                        <asp:ListItem>Other</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <label for="DropDownListReligion">
                                                        Mother Tounge                                            
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="DropDownListMotherTounge" InitialValue="0" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                <div class="form-floating mb-3">
                                                    <asp:TextBox ID="txtPresentAddress" CssClass="form-control text-capitalize" placeholder="Type Present Address" runat="server"></asp:TextBox>
                                                    <label>
                                                        Present Address                                                     
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ControlToValidate="txtPresentAddress" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                <div class="form-floating mb-3">
                                                    <asp:TextBox ID="txtPermanentAddress" CssClass="form-control text-capitalize" placeholder="Type Permanent Address" runat="server"></asp:TextBox>
                                                    <label>
                                                        Permanent Address                                                     
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator16" ControlToValidate="txtPermanentAddress" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                                <div class="form-floating mb-3">
                                                    <asp:TextBox ID="txtAadharNumber" placeholder="Type Aadhaar No" autocomplete="off" MaxLength="12" CssClass="form-control" runat="server"></asp:TextBox>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" TargetControlID="txtAadharNumber" FilterType="Numbers" runat="server" />
                                                    <label>
                                                        Aadhaar No                                             
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator53" ValidationGroup="Error" runat="server" ControlToValidate="txtAadharNumber" ErrorMessage="Invalid No" SetFocusOnError="true" ForeColor="Red" Display="Dynamic" ValidationExpression="^[2-9]{1}[0-9]{3}[0-9]{4}[0-9]{4}$"></asp:RegularExpressionValidator>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtAadharNumber" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <h4 class="BoldFont">Student Admission Details</h4>
                        </div>
                    </div>
                    <div class="panel-body">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                        <div class="form-floating mb-3">
                                            <asp:DropDownList ID="DropDownListBatchName" Width="100%" AppendDataBoundItems="true" DataTextField="BatchName" DataValueField="BatchUid" CssClass="form-control select2 DropDown" runat="server">
                                                <asp:ListItem Value="0">Choose Batch Name</asp:ListItem>
                                            </asp:DropDownList>
                                            <label for="DropDownListBatchName">
                                                Batch Name                                                   
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" InitialValue="0" ControlToValidate="DropDownListBatchName" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                        <div class="form-floating mb-3">
                                            <asp:DropDownList ID="DropDownListCourseName" OnSelectedIndexChanged="DropDownListCourseName_SelectedIndexChanged" AutoPostBack="true" Width="100%" AppendDataBoundItems="true" DataTextField="SubjectName" DataValueField="SubjectUid" CssClass="form-control select2 DropDown" runat="server">
                                                <asp:ListItem Value="0">Choose Course Name</asp:ListItem>
                                            </asp:DropDownList>
                                            <label for="DropDownListCourseName">
                                                Course Name                                                   
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator10" InitialValue="0" ControlToValidate="DropDownListCourseName" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                        <div class="form-floating mb-3">
                                            <asp:TextBox ID="txtCourseFee" Enabled="false" CssClass="form-control" placeholder="Type Course Fee" MaxLength="10" runat="server"></asp:TextBox>
                                            <label for="txtCourseFee">
                                                Course Fee      
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtCourseFee" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" TargetControlID="txtCourseFee" FilterType="Numbers, Custom" ValidChars="0123456789,." runat="server" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                        <div class="form-floating mb-3">
                                            <asp:DropDownList ID="DropDownListCourseDuration" Enabled="false" Height="48" AppendDataBoundItems="true" Width="100%" CssClass="form-select select2" aria-label="Floating label select example" runat="server">
                                                <asp:ListItem Value="0">Choose Course Duration</asp:ListItem>
                                                <asp:ListItem Value="30">1 Month</asp:ListItem>
                                                <asp:ListItem Value="60">2 Month</asp:ListItem>
                                                <asp:ListItem Value="90">3 Month</asp:ListItem>
                                                <asp:ListItem Value="120">4 Month</asp:ListItem>
                                                <asp:ListItem Value="150">5 Month</asp:ListItem>
                                                <asp:ListItem Value="180">6 Month</asp:ListItem>
                                                <asp:ListItem Value="365">1 Year</asp:ListItem>
                                            </asp:DropDownList>
                                            <label for="DropDownListCourseDuration">
                                                Course Duration                                            
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator11" Enabled="false" ControlToValidate="DropDownListCourseDuration" InitialValue="0" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                                        <div class="form-floating mb-3">
                                            <asp:TextBox ID="txtAdmissionFee" CssClass="form-control" placeholder="Type Admission Fee" MaxLength="10" runat="server"></asp:TextBox>
                                            <label for="txtAdmissionFee">
                                                Fee      
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtAdmissionFee" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" TargetControlID="txtAdmissionFee" FilterType="Numbers, Custom" ValidChars="0123456789,." runat="server" />
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <asp:LinkButton ID="btnSubmit" OnClick="btnSubmit_Click" ValidationGroup="Error" CssClass="btn btn-info btn-lg" runat="server"><i class="fa fa-check"></i> Save & Next</asp:LinkButton>
                                            <asp:LinkButton ID="btnUpdate" OnClick="btnUpdate_Click" Visible="false" ValidationGroup="Error" CssClass="btn btn-success btn-lg" runat="server"><i class="fa fa-refresh"></i> Update & Proceed</asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:PostBackTrigger ControlID="btnSubmit" />
                                <asp:PostBackTrigger ControlID="btnUpdate" />
                                <asp:PostBackTrigger ControlID="btnUpdatePhoto" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

