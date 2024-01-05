<%@ Page Title="Add Sub Subejct Details | e-IMS | Smart ERP | Sainaatech IT Solutions LLP" Language="C#" MasterPageFile="~/Admin/Home.master" AutoEventWireup="true" CodeFile="AddSubSubjectDetails.aspx.cs" Inherits="Admin_Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <section class="content-header">
            <h3 class="MyFavColor">Admin Dashboard | Add Sub Subejct Details</h3>
            <ol class="breadcrumb">
                <li><a href="Default.aspx"><i class="fa fa-home"></i></a>Home</li>
                <li class="active">Manage Master</li>
                <li class="active">Add Sub Subejct Details</li>
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
                                    <h4 class="BoldFont">Add Sub Subejct Details</h4>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="Body">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                            <div class="form-floating mb-3">
                                                <asp:DropDownList ID="DropDownListTrainingCentre" OnSelectedIndexChanged="DropDownListTrainingCentre_SelectedIndexChanged" AutoPostBack="true" Width="100%" AppendDataBoundItems="true" DataSourceID="SqlDataSource4" DataTextField="CentreName" DataValueField="TCUid" CssClass="form-control select2 DropDown" runat="server">
                                                    <asp:ListItem Value="0">Choose Centre Name</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:HMS %>" SelectCommand="SELECT CentreName+' ('+TCCode+') ' as CentreName, TCUid FROM tblTrainingCentreMaster where Status = 'Active' and TCStatus = 'Regd. Done' order by CentreName desc"></asp:SqlDataSource>
                                                <label for="DropDownListTrainingCentre">
                                                    Centre Name                                                      
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" InitialValue="0" ControlToValidate="DropDownListTrainingCentre" ValidationGroup="Error" runat="server" ErrorMessage="Required" SetFocusOnError="false" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                    <div class="form-floating mb-3">
                                                        <asp:DropDownList ID="DropDownCourseName" Enabled="false" Width="100%" AppendDataBoundItems="true" DataTextField="SubjectName" DataValueField="SubjectUid" CssClass="form-control select2 DropDown" runat="server">
                                                            <asp:ListItem Value="0">Choose Subejct Name</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <label>
                                                            Subejct Name
                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="Error" InitialValue="0" runat="server" ErrorMessage="Required" ControlToValidate="DropDownCourseName" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                    <div class="form-floating mb-3">
                                                        <asp:TextBox ID="txtSubSubject" CssClass="form-control" placeholder="Sub Subject Name" runat="server"></asp:TextBox>
                                                        <label for="txtSubSubject">
                                                            Sub Subject Name
                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtSubSubject" ValidationGroup="Error" runat="server" ErrorMessage="Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="form-group">
                                                        <asp:LinkButton ID="btnAddSubSubject" OnClick="btnAddSubSubject_Click" ValidationGroup="Error" CssClass="btn btn-info" runat="server"><i class="fa fa-check"></i> Add Sub Subject</asp:LinkButton>
                                                       <asp:LinkButton ID="btnUpdateSubjectName" OnClick="btnUpdateSubjectName_Click" Visible="false" ValidationGroup="Error" CssClass="btn btn-primary" runat="server"><i class="fa fa-check"></i> Update Sub Subject</asp:LinkButton>
                                                   </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                            <div class="row">
                                                <div class="col-lg-12 form-group">
                                                    <div class="table-responsive">
                                                        <asp:GridView ID="gvDetails" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="SSUid" AutoGenerateColumns="False" AllowPaging="True"
                                                            AllowSorting="true" PageSize="10" DataSourceID="dsDetails" CssClass="GridView table table-condensed table-bordered table-striped">
                                                            <HeaderStyle />
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Sl No." HeaderStyle-Wrap="false">
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
                                                                <asp:BoundField DataField="CentreName" HeaderText="Centre Name" SortExpression="CentreName" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="false" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="SubjectName" HeaderText="Subject Name" SortExpression="SubjectName" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="false" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="SubSubject" HeaderText="Sub Subject" SortExpression="SubSubject" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="false" />
                                                                </asp:BoundField>
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="dsDetails" runat="server" ConnectionString="<%$ConnectionStrings:HMS %>" SelectCommand="select ss.SSUid, tc.CentreName, s.SubjectName, ss.SubjectName as SubSubject from tblSubjectMaster s, tblSubSubjectMaster ss, tblTrainingCentreMaster tc where s.TCUid = tc.TCUid and s.SubjectUid = ss.SubjectUid and ss.Status = 'Active' order by ss.SSUid desc"></asp:SqlDataSource>
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

