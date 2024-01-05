<%@ Page Title="Fee Collection | e-IMS | Smart ERP | Sainaatech IT Solutions LLP" Language="C#" MasterPageFile="~/Admin/Home.master" AutoEventWireup="true" CodeFile="FeeCollection.aspx.cs" Inherits="Admin_Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <section class="content-header">
            <h3 class="MyFavColor">Admin Dashboard | Fee Collection</h3>
            <ol class="breadcrumb">
                <li><a href="Default.aspx"><i class="fa fa-home"></i></a>Home</li>
                <li class="active">Manage Payment</li>
                <li class="active">Fee Collection</li>
            </ol>
        </section>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="panel-title">
                                    <div class="row">
                                        <div class="col-lg-9 col-md-6 col-sm-6 col-xs-6">
                                            <div class="pull-left">
                                                <h4 class="BoldFont">Fee Collection</h4>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-6">
                                            <asp:UpdateProgress runat="server" ID="ProgressBar" AssociatedUpdatePanelID="UpdatePanel1">
                                                <ProgressTemplate>
                                                    <div class="progress-bar progress-bar-striped active" style="width: 100%; margin-top: 5px; font-weight: 700; height: 30px; line-height: 30px">
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
                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                        <div class="form-floating mb-3">
                                            <asp:DropDownList ID="DropDownListTrainingCentre" OnSelectedIndexChanged="DropDownListTrainingCentre_SelectedIndexChanged" AutoPostBack="true" Width="100%" AppendDataBoundItems="true" DataSourceID="SqlDataSource4" DataTextField="CentreName" DataValueField="TCUid" CssClass="form-control select2 DropDown" runat="server">
                                                <asp:ListItem Value="0">Choose Centre Name</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:HMS %>" SelectCommand="SELECT CentreName+' ('+TCCode+') ' as CentreName, TCUid FROM tblTrainingCentreMaster where Status = 'Active' and TCStatus = 'Regd. Done' order by CentreName desc"></asp:SqlDataSource>
                                            <label for="DropDownListTrainingCentre">
                                                Training Centre Name                                                      
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="DropDownListTrainingCentre" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                        <div class="form-floating mb-3">
                                            <asp:DropDownList ID="DropDownListBatchName" OnSelectedIndexChanged="DropDownListBatchName_SelectedIndexChanged" AutoPostBack="true" Enabled="false" Width="100%" AppendDataBoundItems="true" DataTextField="BatchName" DataValueField="BatchUid" CssClass="form-control select2 DropDown" runat="server">
                                                <asp:ListItem Value="0">Choose Batch Name</asp:ListItem>
                                            </asp:DropDownList>
                                            <label for="DropDownListBatchName">
                                                Batch Name                                                      
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="DropDownListBatchName" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                        <div class="form-floating mb-3">
                                            <asp:DropDownList ID="DropDownListStudentName" OnSelectedIndexChanged="DropDownListStudentName_SelectedIndexChanged" AutoPostBack="true" Enabled="false" Width="100%" AppendDataBoundItems="true" DataTextField="StudentName" DataValueField="SUid" CssClass="form-control select2 DropDown" runat="server">
                                                <asp:ListItem Value="0">Choose Student Name</asp:ListItem>
                                            </asp:DropDownList>
                                            <label for="DropDownListStudentName">
                                                Student Name                                                      
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="DropDownListStudentName" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 form-group">
                                        <div class="table-responsive">
                                            <asp:GridView ID="gvDetails" ShowHeaderWhenEmpty="true" EmptyDataText="No Candidate Found..." runat="server" DataKeyNames="SUid" AutoGenerateColumns="False" AllowPaging="False"
                                                AllowSorting="false" PageSize="100" CssClass="table table-condensed table-bordered table-striped">
                                                <HeaderStyle />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sl_No." HeaderStyle-Wrap="true">
                                                        <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                        <ItemTemplate><%#Container.DataItemIndex+1%></ItemTemplate>
                                                        <ItemStyle Font-Size="Small" Font-Bold="true" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="View">
                                                        <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ImageButton1" OnClick="ImageButton1_Click" data-target="#ModalAdvance" data-toggle="modal" runat="server" Height="13px" ImageUrl="../img/EditIcon.png" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="CentreName" HeaderText="Centre Name" SortExpression="CentreName" NullDisplayText="N/A" ReadOnly="True">
                                                        <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                        <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="StudentID" HeaderText="Student ID" SortExpression="StudentID" NullDisplayText="N/A" ReadOnly="True">
                                                        <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                        <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="StudentName" HeaderText="Student Name" SortExpression="StudentName" NullDisplayText="N/A" ReadOnly="True">
                                                        <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                        <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="DateOfRegd" HeaderText="Date Of Regd" DataFormatString="{0:dd-MMM-yyyy}" SortExpression="DateOfRegd" NullDisplayText="N/A" ReadOnly="True">
                                                        <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                        <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="MobileNumber" HeaderText="Mobile No" SortExpression="MobileNumber" NullDisplayText="N/A" ReadOnly="True">
                                                        <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                        <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" NullDisplayText="N/A" ReadOnly="True">
                                                        <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                        <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="AadhaarNo" HeaderText="Aadhaar No" SortExpression="AadhaarNo" NullDisplayText="N/A" ReadOnly="True">
                                                        <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                        <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="BatchName" HeaderText="Batch Name" SortExpression="BatchName" NullDisplayText="N/A" ReadOnly="True">
                                                        <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                        <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="SubjectName" HeaderText="Subject Name" SortExpression="SubjectName" NullDisplayText="N/A" ReadOnly="True">
                                                        <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                        <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                    </asp:BoundField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="modal fade" id="ModalAdvance" data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="modal-title">
                        <h4>Receive Payment</h4>
                    </div>
                </div>
                <div class="modal-body ModalBodyHeight">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:Label ID="lblUid" runat="server" Visible="false"></asp:Label>
                            <asp:Label ID="lblTCUid" runat="server" Visible="false"></asp:Label>
                            <asp:Label ID="lblBranchCode" runat="server" Visible="false"></asp:Label>
                            <asp:Label ID="lblMRNumber" runat="server" Visible="false"></asp:Label>
                            <div class="row">
                                <div class="col-lg-2 col-md-2 col-sm-3 col-xs-12">
                                    <div class="form-group">
                                        <asp:Image ID="ImageProfilePhoto" ImageUrl="../img/StudentIcon.png" CssClass="img-responsive img-thumbnail ProfilePhoto" runat="server" />
                                    </div>
                                </div>
                                <div class="col-lg-10 col-md-10 col-sm-9 col-xs-12">
                                    <div class="row">
                                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:TextBox ID="txtStudentName" Enabled="false" CssClass="form-control text-capitalize" placeholder="Type Student Name" runat="server"></asp:TextBox>
                                                <label>
                                                    Student Name                                                      
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtStudentName" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:TextBox ID="txtGuardianName" Enabled="false" CssClass="form-control text-capitalize" placeholder="Type Guardian Name" runat="server"></asp:TextBox>
                                                <label>
                                                    Guardian Name                                                      
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtGuardianName" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:TextBox ID="txtDateOfRegd" Enabled="false" CssClass="form-control" placeholder="Type Date in DD-MM-YYYY Format..." runat="server"></asp:TextBox>
                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" Format="dd-MM-yyyy" runat="server" BehaviorID="txtDateOfRegd_CalendarExtender11" TargetControlID="txtDateOfRegd"></ajaxToolkit:CalendarExtender>
                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderss6" TargetControlID="txtDateOfRegd" FilterType="Custom" ValidChars="1234567890-" runat="server" />
                                                <label for="txtDateOfRegd">
                                                    Date of Regd.                                                     
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8ss" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtDateOfRegd" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:TextBox ID="txtDateOfBirth" Enabled="false" CssClass="form-control" placeholder="Type Date in DD-MM-YYYY Format..." runat="server"></asp:TextBox>
                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" Format="dd-MM-yyyy" runat="server" BehaviorID="txtDateOfBirth_CalendarExtender11" TargetControlID="txtDateOfBirth"></ajaxToolkit:CalendarExtender>
                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" TargetControlID="txtDateOfBirth" FilterType="Custom" ValidChars="1234567890-" runat="server" />
                                                <label for="txtDateOfBirth">
                                                    Date of Birth                                                     
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtDateOfBirth" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:TextBox ID="txtEmail" Enabled="false" CssClass="form-control text-lowercase" placeholder="Type Email" runat="server"></asp:TextBox>
                                                <label for="txtEmail">
                                                    Email                                                   
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtEmail" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="Error" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email" SetFocusOnError="true" ForeColor="Red" Display="Dynamic" ValidationExpression="^[a-z0-9][-a-z0-9._]+@([-a-z0-9]+.)+[a-z]{2,5}$"></asp:RegularExpressionValidator>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:TextBox ID="txtMobileNumber" Enabled="false" CssClass="form-control" placeholder="Type Mobile Number" MaxLength="10" runat="server"></asp:TextBox>
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
                                                <asp:DropDownList ID="DropDownListGender" Enabled="false" Height="48" AppendDataBoundItems="true" Width="100%" CssClass="form-select select2" aria-label="Floating label select example" runat="server">
                                                    <asp:ListItem Value="0">Choose Gender</asp:ListItem>
                                                    <asp:ListItem>Male</asp:ListItem>
                                                    <asp:ListItem>Female</asp:ListItem>
                                                    <asp:ListItem>Other</asp:ListItem>
                                                </asp:DropDownList>
                                                <label for="DropDownListGender">
                                                    Gender                                            
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="DropDownListGender" InitialValue="0" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:DropDownList ID="DropDownListCaste" Enabled="false" Height="48" AppendDataBoundItems="true" Width="100%" CssClass="form-select select2" aria-label="Floating label select example" runat="server">
                                                    <asp:ListItem Value="0">Choose Caste</asp:ListItem>
                                                    <asp:ListItem>General</asp:ListItem>
                                                    <asp:ListItem>ST</asp:ListItem>
                                                    <asp:ListItem>SC</asp:ListItem>
                                                    <asp:ListItem>OBC</asp:ListItem>
                                                </asp:DropDownList>
                                                <label for="DropDownListCaste">
                                                    Caste                                            
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="DropDownListCaste" InitialValue="0" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:DropDownList ID="DropDownListReligion" Enabled="false" Height="48" AppendDataBoundItems="true" Width="100%" CssClass="form-select select2" aria-label="Floating label select example" runat="server">
                                                    <asp:ListItem Value="0">Choose Religion</asp:ListItem>
                                                    <asp:ListItem>Hindu</asp:ListItem>
                                                    <asp:ListItem>Muslim</asp:ListItem>
                                                    <asp:ListItem>Christian</asp:ListItem>
                                                    <asp:ListItem>Other</asp:ListItem>
                                                </asp:DropDownList>
                                                <label for="DropDownListReligion">
                                                    Religion                                            
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="DropDownListReligion" InitialValue="0" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:DropDownList ID="DropDownListMotherTounge" Enabled="false" Height="48" AppendDataBoundItems="true" Width="100%" CssClass="form-select select2" aria-label="Floating label select example" runat="server">
                                                    <asp:ListItem Value="0">Choose Mother Tounge</asp:ListItem>
                                                    <asp:ListItem>Oriya</asp:ListItem>
                                                    <asp:ListItem>Hindi</asp:ListItem>
                                                    <asp:ListItem>English</asp:ListItem>
                                                    <asp:ListItem>Other</asp:ListItem>
                                                </asp:DropDownList>
                                                <label for="DropDownListReligion">
                                                    Mother Tounge                                            
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="DropDownListMotherTounge" InitialValue="0" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:TextBox ID="txtPresentAddress" Enabled="false" CssClass="form-control text-capitalize" placeholder="Type Present Address" runat="server"></asp:TextBox>
                                                <label>
                                                    Present Address                                                     
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ControlToValidate="txtPresentAddress" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:TextBox ID="txtPermanentAddress" Enabled="false" CssClass="form-control text-capitalize" placeholder="Type Permanent Address" runat="server"></asp:TextBox>
                                                <label>
                                                    Permanent Address                                                     
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator16" ControlToValidate="txtPermanentAddress" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row NavTab">
                                <div class="col-md-12">
                                    <div class="panel with-nav-tabs panel-default">
                                        <div class="panel-heading single-project-nav">
                                            <ul class="nav nav-tabs">
                                                <li class="active">
                                                    <a href="#Current" data-toggle="tab">Receive Current Payment Details</a>
                                                </li>
                                                <li>
                                                    <a href="#Previous" data-toggle="tab">Previous Payment Details</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="panel-body">
                                            <div class="tab-content">
                                                <div class="tab-pane fade in active" id="Current">
                                                    <div class="row Col5">
                                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                            <div class="form-floating mb-3">
                                                                <asp:DropDownList ID="DropDownListCourseName" Enabled="false" Width="100%" AppendDataBoundItems="true" DataTextField="SubjectName" DataValueField="SubjectUid" CssClass="form-control select2 DropDown" runat="server">
                                                                    <asp:ListItem Value="0">Choose Course Name</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <label for="DropDownListCourseName">
                                                                    Course Name                                                   
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator12" InitialValue="0" ControlToValidate="DropDownListCourseName" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                            <div class="form-floating mb-3">
                                                                <asp:TextBox ID="txtCourseFee" Enabled="false" CssClass="form-control Total" placeholder="Type Course Fee" runat="server"></asp:TextBox>
                                                                <label for="txtCourseFee">
                                                                    Course Fee       
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator22" ValidationGroup="Error" runat="server" ErrorMessage="*" ControlToValidate="txtCourseFee" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" TargetControlID="txtCourseFee" FilterType="Numbers" ValidChars="0123456789" runat="server" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                            <div class="form-floating mb-3">
                                                                <asp:TextBox ID="txtPreviousPayment" Enabled="false" Text="0" CssClass="form-control Previous" placeholder="Type Privious Fee" MaxLength="10" runat="server"></asp:TextBox>
                                                                <label for="txtPreviousPayment">
                                                                    Previous Fee       
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator17" ValidationGroup="Error" runat="server" ErrorMessage="*" ControlToValidate="txtPreviousPayment" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" TargetControlID="txtPreviousPayment" FilterType="Numbers" ValidChars="0123456789" runat="server" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                            <div class="form-floating mb-3">
                                                                <asp:DropDownList ID="DropDownListPaymentMode" Height="48" AppendDataBoundItems="true" Width="100%" CssClass="form-select select2" aria-label="Floating label select example" runat="server">
                                                                    <asp:ListItem Value="0">Choose Payment Mode</asp:ListItem>
                                                                    <asp:ListItem>Cash</asp:ListItem>
                                                                    <asp:ListItem>Card</asp:ListItem>
                                                                    <asp:ListItem>UPI</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <label for="DropDownListPaymentMode">
                                                                    Payment Mode                                            
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ControlToValidate="DropDownListPaymentMode" InitialValue="0" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                            <div class="form-floating mb-3">
                                                                <asp:TextBox ID="txtDateOfPayment" CssClass="form-control" placeholder="Type Date in DD-MM-YYYY Format..." runat="server"></asp:TextBox>
                                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender3" Format="dd-MM-yyyy" runat="server" BehaviorID="txtDateOfPayment_CalendarExtender11" TargetControlID="txtDateOfPayment"></ajaxToolkit:CalendarExtender>
                                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" TargetControlID="txtDateOfPayment" FilterType="Custom" ValidChars="1234567890-" runat="server" />
                                                                <label for="txtDateOfPayment">
                                                                    Date of Payment                                                     
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtDateOfPayment" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row Col5">
                                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                            <div class="form-floating mb-3">
                                                                <asp:DropDownList ID="DropDownListPaymentHead" Height="48" AppendDataBoundItems="true" Width="100%" CssClass="form-select select2" aria-label="Floating label select example" runat="server">
                                                                    <asp:ListItem Value="0">Choose Payment Head</asp:ListItem>
                                                                    <asp:ListItem>Advnace Payment</asp:ListItem>
                                                                    <asp:ListItem>Part Payment</asp:ListItem>
                                                                    <asp:ListItem>Final Payment</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <label for="DropDownListPaymentHead">
                                                                    Payment Head                                            
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="DropDownListPaymentHead" InitialValue="0" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                            <div class="form-floating mb-3">
                                                                <asp:TextBox ID="txtCurrentPayment" CssClass="form-control Current" placeholder="Type Current Fee" MaxLength="10" runat="server"></asp:TextBox>
                                                                <label for="txtCurrentPayment">
                                                                    Current Fee       
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator18" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtCurrentPayment" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                    <asp:RangeValidator ID="RangeValidator1_txtCurrentPayment" ValidationGroup="Error" runat="server" MinimumValue="0" ControlToValidate="txtCurrentPayment" ErrorMessage="Invalid Fee" ForeColor="Red" SetFocusOnError="True" Display="Dynamic" Type="Double"></asp:RangeValidator>
                                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" TargetControlID="txtCurrentPayment" FilterType="Numbers" ValidChars="0123456789" runat="server" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                            <div class="form-floating mb-3">
                                                                <asp:TextBox ID="txtRemainingFee" Enabled="false" CssClass="form-control Remaining" placeholder="Type Remaining Fee" MaxLength="10" runat="server"></asp:TextBox>
                                                                <label for="txtRemainingFee">
                                                                    Remaining Fee       
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator21" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtRemainingFee" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" TargetControlID="txtRemainingFee" FilterType="Numbers, Custom" ValidChars="0123456789,.-" runat="server" />
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                            <div class="form-floating mb-3">
                                                                <asp:DropDownList ID="DropDownListNextPaymentOn" Height="48" AppendDataBoundItems="true" Width="100%" CssClass="NextPaymentOn form-select select2" aria-label="Floating label select example" runat="server">
                                                                    <asp:ListItem Value="0">Choose Next Payment</asp:ListItem>
                                                                    <asp:ListItem Value="1">N/A</asp:ListItem>
                                                                    <asp:ListItem Value="3">After 3 Days</asp:ListItem>
                                                                    <asp:ListItem Value="7">After 7 Days</asp:ListItem>
                                                                    <asp:ListItem Value="10">After 10 Days</asp:ListItem>
                                                                    <asp:ListItem Value="15">After 15 Days</asp:ListItem>
                                                                    <asp:ListItem Value="20">After 20 Days</asp:ListItem>
                                                                    <asp:ListItem Value="30">Next Month</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <label for="DropDownListNextPaymentOn">
                                                                    Next Payment                                         
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator23" ControlToValidate="DropDownListNextPaymentOn" InitialValue="0" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="false" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row Col5">
                                                        <div class="col-lg-3 col-md-4 col-sm-5 col-xs-12">
                                                            <div class="form-group">
                                                                <asp:LinkButton ID="btnSubmit" ValidationGroup="Error" OnClick="btnSubmit_Click" CssClass="btn btn-info btn-block btn-lg" runat="server"><i class="fa fa-check"></i> Receive Payment</asp:LinkButton>
                                                            </div>
                                                        </div>
                                                    </div>
                                                     <div class="row">
                                                        <div class="col-lg-12">
                                                            <div class="table-responsive">
                                                                <asp:GridView ID="gvDetailsIPAdvance" ShowHeaderWhenEmpty="true" EmptyDataText="No Advance Added Yet..." DataKeyNames="AdvanceUid" runat="server" AutoGenerateColumns="False" AllowSorting="false" AllowPaging="false"
                                                                    CssClass="GridView table table-condensed table-bordered table-striped">
                                                                    <HeaderStyle />
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Remove">
                                                                            <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                            <ItemStyle Font-Size="Small" HorizontalAlign="Center" Font-Bold="true" />
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="ImageButtonRemove" runat="server" Height="13px" ImageUrl="../img/DeleteImage.png" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Print">
                                                                            <HeaderStyle ForeColor="Black" BackColor="#daddda" HorizontalAlign="Center" Font-Bold="true" Font-Size="Small" />
                                                                            <ItemStyle Font-Size="Small" HorizontalAlign="Center" Font-Bold="true" />
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="ImageButtonPrint" runat="server" Height="13px" ImageUrl="~/img/PrintImageIcon.png" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Sl No." HeaderStyle-Wrap="false">
                                                                            <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                            <ItemTemplate><%#Container.DataItemIndex+1%></ItemTemplate>
                                                                            <ItemStyle Font-Size="Small" Font-Bold="true" />
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="MRNumber" HeaderText="MR Number" SortExpression="MRNumber" NullDisplayText="" ReadOnly="True">
                                                                            <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                            <ItemStyle Font-Size="Small" Wrap="false" Font-Bold="true" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="PaymentHead" HeaderText="Payment Head" SortExpression="PaymentHead" NullDisplayText="" ReadOnly="True">
                                                                            <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                            <ItemStyle Font-Size="Small" Wrap="false" Font-Bold="true" />
                                                                        </asp:BoundField>
                                                                         <asp:BoundField DataField="PaymentDate" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Payment Date" SortExpression="PaymentDate" NullDisplayText="" ReadOnly="True">
                                                                            <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                            <ItemStyle Font-Size="Small" Wrap="false" Font-Bold="true" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="Fees" HeaderText="Total Amount" DataFormatString="{0:N2}" SortExpression="Fees" NullDisplayText="" ReadOnly="True">
                                                                            <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                            <ItemStyle Font-Size="Small" Wrap="false" Font-Bold="true" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="AdvanceAmount" HeaderText="Amount" DataFormatString="{0:N2}" SortExpression="AdvanceAmount" NullDisplayText="" ReadOnly="True">
                                                                            <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                            <ItemStyle Font-Size="Small" Wrap="false" Font-Bold="true" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="Remaining" HeaderText="Remaining" DataFormatString="{0:N2}" SortExpression="Remaining" NullDisplayText="" ReadOnly="True">
                                                                            <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                            <ItemStyle Font-Size="Small" Wrap="false" Font-Bold="true" />
                                                                        </asp:BoundField>
                                                                         <asp:BoundField DataField="PaymentMode" HeaderText="Payment Mode" SortExpression="PaymentMode" NullDisplayText="" ReadOnly="True">
                                                                            <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                            <ItemStyle Font-Size="Small" Wrap="false" Font-Bold="true" />
                                                                        </asp:BoundField>
                                                                      
                                                                        <asp:BoundField DataField="NextPaymentDate" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Next Payment Date" SortExpression="NextPaymentDate" NullDisplayText="" ReadOnly="True">
                                                                            <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                            <ItemStyle Font-Size="Small" Wrap="false" Font-Bold="true" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="tab-pane fade" id="Previous">
                                                   
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- <div class="row">
                                <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
                                    <h5 class="BoldFont">Receive Current Payment</h5>

                                </div>
                                <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
                                    <h5 class="BoldFont">Previous Advance Report</h5>
                                </div>
                            </div>--%>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="btnClose" CssClass="btn btn-danger" OnClick="btnClose_Click" runat="server"><span class="fa fa-power-off"></span> Close</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

