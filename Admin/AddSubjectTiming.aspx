<%@ Page Title="Add Subejct Timing & Marks Details | e-IMS | Smart ERP | Sainaatech IT Solutions LLP" Language="C#" MasterPageFile="~/Admin/Home.master" AutoEventWireup="true" CodeFile="AddSubjectTiming.aspx.cs" Inherits="Admin_Default2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <section class="content-header">
            <h3 class="MyFavColor">Admin Dashboard | Add Subejct Timing & Marks Details</h3>
            <ol class="breadcrumb">
                <li><a href="Default.aspx"><i class="fa fa-home"></i></a>Home</li>
                <li class="active">Question & Exams</li>
                <li class="active">Add Subejct Timing & Marks Details</li>
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
                                    <h4 class="BoldFont">Add Subejct Timing & Marks Details</h4>
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
                                                        <asp:DropDownList ID="DropDownCourseName" Enabled="false" OnSelectedIndexChanged="DropDownCourseName_SelectedIndexChanged" AutoPostBack="true" Width="100%" AppendDataBoundItems="true" DataTextField="SubjectName" DataValueField="SubjectUid" CssClass="form-control select2 DropDown" runat="server">
                                                            <asp:ListItem Value="0">Choose Subject Name</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <label>
                                                            Subject Name
                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="Error" InitialValue="0" runat="server" ErrorMessage="Required" ControlToValidate="DropDownCourseName" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                    <div class="form-floating mb-3">
                                                        <asp:DropDownList ID="DropDownListSubSubject" AutoPostBack="true" Enabled="false" Width="100%" AppendDataBoundItems="true" DataTextField="SubjectName" DataValueField="SSUid" CssClass="form-control select2 DropDown" runat="server">
                                                            <asp:ListItem Value="0">Choose Sub Subject Name</asp:ListItem>
                                                        </asp:DropDownList>
                                                        <label>
                                                            Sub Subject Name
                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="DropDownListSubSubject" ValidationGroup="Error" InitialValue="0" runat="server" ErrorMessage="Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                    <div class="form-floating mb-3">
                                                        <asp:TextBox ID="txtTotalMark" CssClass="form-control Transferred" placeholder="Total Mark" runat="server"></asp:TextBox>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" TargetControlID="txtTotalMark" FilterType="Numbers" runat="server" />
                                                        <label>
                                                            Total Mark
                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtTotalMark" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                    <div class="form-floating mb-3">
                                                        <asp:TextBox ID="txtTotalTime" CssClass="form-control Transferred" placeholder="Total Time" runat="server"></asp:TextBox>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" TargetControlID="txtTotalTime" FilterType="Numbers" runat="server" />
                                                        <label>
                                                            Total Time (In Min)
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="Error" runat="server" ErrorMessage="Required" ControlToValidate="txtTotalTime" SetFocusOnError="true" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="form-group">
                                                        <asp:LinkButton ID="btnSubjectName" OnClick="btnSubjectName_Click" ValidationGroup="Error" CssClass="btn btn-info" runat="server"><span class="fa fa-check"></span> Add Subject & Mark Details</asp:LinkButton>
                                                        <asp:LinkButton ID="btnUpdateSubject" OnClick="btnUpdateSubject_Click" Visible="false" ValidationGroup="Error" CssClass="btn btn-primary" runat="server"><span class="fa fa-refresh"></span> Update Subject & Mark Details</asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                              <div class="row">
                                                <div class="col-lg-12 form-group">
                                                    <div class="table-responsive">
                                                        <asp:GridView ID="gvDetails" ShowHeaderWhenEmpty="true" EmptyDataText="No Data Found..." runat="server" DataKeyNames="MUid" AutoGenerateColumns="False" AllowPaging="True"
                                                            AllowSorting="false" PageSize="10" DataSourceID="dsDetails" CssClass="GridView table table-condensed table-bordered table-striped">
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
                                                                <asp:BoundField DataField="TotalMark" DataFormatString="{0:N0}" HeaderText="Total Marks" SortExpression="TotalMark" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="false" />
                                                                </asp:BoundField>
                                                                <asp:BoundField DataField="TotalTime" DataFormatString="{0:N0}" HeaderText="Total Time" SortExpression="TotalTime" NullDisplayText="N/A" ReadOnly="True">
                                                                    <HeaderStyle ForeColor="Black" Wrap="false" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                                    <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="false" />
                                                                </asp:BoundField>
                                                            </Columns>
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="dsDetails" runat="server" ConnectionString="<%$ConnectionStrings:HMS %>" SelectCommand="select m.MUid,ss.SubjectName +' (' +s.SubjectName+')' as SubjectName,m.TotalMark, m.TotalTime, TC.CentreName from tblMarkMaster m, tblSubjectMaster s, tblSubSubjectMaster ss, tblTrainingCentreMaster TC where s.TCUid = tc.TCUid and  m.SSUid = ss.SSUid and ss.SubjectUid = s.SubjectUid and m.Status = 'Active' ORDER BY m.MUid desc"></asp:SqlDataSource>
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

