<%@ Page Title="Add Course Details | e-IMS | Smart ERP | Sainaatech IT Solutions LLP" Language="C#" MasterPageFile="~/Admin/Home.master" AutoEventWireup="true" CodeFile="AddCourse.aspx.cs" Inherits="Admin_Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <section class="content-header">
            <h3 class="MyFavColor">Admin Dashboard | Add Course Details</h3>
            <ol class="breadcrumb">
                <li><a href="Default.aspx"><i class="fa fa-home"></i></a>Home</li>
                <li class="active">Manage Master</li>
                <li class="active">Add Course Details</li>
            </ol>
        </section>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Label ID="lblSubjectCode" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="lblUid" runat="server" Visible="false"></asp:Label>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="panel-title">
                                    <h4 class="BoldFont">Add Course Details</h4>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="Body">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:DropDownList ID="DropDownListTrainingCentre" Width="100%" AppendDataBoundItems="true" DataSourceID="SqlDataSource4" DataTextField="CentreName" DataValueField="TCUid" CssClass="form-control select2 DropDown" runat="server">
                                                    <asp:ListItem Value="0">Choose Centre Name</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:HMS %>" SelectCommand="SELECT CentreName+' ('+TCCode+') ' as CentreName, TCUid FROM tblTrainingCentreMaster where Status = 'Active' and TCStatus = 'Regd. Done' order by CentreName desc"></asp:SqlDataSource>
                                                <label for="DropDownListTrainingCentre">
                                                     Centre Name                                                      
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" InitialValue="0" ControlToValidate="DropDownListTrainingCentre" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                    <div class="form-floating mb-3">
                                                        <asp:TextBox ID="txtSubjectName" CssClass="form-control" placeholder="Type Subject Name" runat="server"></asp:TextBox>
                                                        <label for="txtSubjectName">
                                                            Course Name                                                      
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ControlToValidate="txtSubjectName" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                    <div class="form-floating mb-3">
                                                        <asp:TextBox ID="txtCourseFee" CssClass="form-control" placeholder="Type Course Fee" MaxLength="10" runat="server"></asp:TextBox>
                                                        <label for="txtCourseFee">
                                                            Course Fee      
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator19" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtCourseFee" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" TargetControlID="txtCourseFee" FilterType="Numbers,Custom" ValidChars="0123456789,." runat="server" />
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                    <div class="form-floating mb-3">
                                                        <asp:DropDownList ID="DropDownListSubjectType" Height="48" AppendDataBoundItems="true" Width="100%" CssClass="form-select select2" aria-label="Floating label select example" runat="server">
                                                            <asp:ListItem Value="0">Choose Course Type</asp:ListItem>
                                                            <asp:ListItem>Short Term</asp:ListItem>
                                                            <asp:ListItem>Long Term</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <label for="DropDownListGender">
                                                            Course Type                                            
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="DropDownListSubjectType" InitialValue="0" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                    <div class="form-floating mb-3">
                                                        <asp:DropDownList ID="DropDownListCourseDuration" Height="48" AppendDataBoundItems="true" Width="100%" CssClass="form-select select2" aria-label="Floating label select example" runat="server">
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
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="DropDownListCourseDuration" InitialValue="0" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="form-group">
                                                        <asp:LinkButton ID="btnSubmit" ValidationGroup="Error" OnClick="btnSubmit_Click" CssClass="btn btn-info" runat="server"><i class="fa fa-check"></i> Add Course</asp:LinkButton>
                                                       <asp:LinkButton ID="btnUpdate" OnClick="btnUpdate_Click" Visible="false" ValidationGroup="Error" CssClass="btn btn-success" runat="server"><i class="fa fa-check"></i> Update Course</asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                            <div class="row">
                                                <div class="col-lg-12 form-group">
                                                    <div class="table-responsive">
                                                        <asp:GridView ID="gvDetails" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="SubjectUid" AutoGenerateColumns="False" AllowPaging="False"
                                                            AllowSorting="false" DataSourceID="dsDetails" PageSize="100" CssClass="GridView table table-condensed table-bordered table-striped">
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
                                                                        <asp:ImageButton ID="ImageButton1" OnClick="ImageButton1_Click" runat="server" Height="13px" ImageUrl="../img/EditIcon.png" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:BoundField DataField="SubjectCode" HeaderText="Course ID" SortExpression="SubjectCode" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="SubjectName" HeaderText="Course Name" SortExpression="SubjectName" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="Fees" HeaderText="Fees" DataFormatString="{0:N2}" SortExpression="Fees" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                                 <asp:BoundField DataField="CourseType" HeaderText="Course Type" SortExpression="CourseType" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                                </asp:BoundField>
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="dsDetails" runat="server" ConnectionString="<%$ConnectionStrings:HMS %>" SelectCommand="select * from tblSubjectMaster where Status = 'Active' ORDER BY SubjectUid desc"></asp:SqlDataSource>
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

