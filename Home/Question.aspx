<%@ Page Title="" Language="C#" MasterPageFile="~/Home/MasterPage.master" AutoEventWireup="true" CodeFile="Question.aspx.cs" Inherits="Home_Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
            <style>
        .well{
            margin-top:20px;
            border:10px solid;
            border-color:brown;
        }
        .head{
            background-color:brown;
            color:white;
            font-weight:bold;
            padding:10px;
            margin-bottom:30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Labeluid" Visible="false" runat="server" Text="Label"></asp:Label>
     <div class="container">
                <div class="row">
          <div class="well">
          <div class="col-lg-12">
              <h3 class="text-center head">Previous Year Question Set</h3>
              </div>
              <div class="border">
                                   <div class="row">
                                    <div class="col-lg-12 form-group">
                                        <div class="table-responsive">
                                            <asp:GridView ID="gvDetails" ShowHeaderWhenEmpty="true" HorizontalAlign="Center" EmptyDataText="No Data Found..." runat="server" DataKeyNames="QUid" AutoGenerateColumns="False" AllowPaging="False"
                                                AllowSorting="false" DataSourceID="dsDetails" PageSize="100" CssClass="GridView table table-condensed table-bordered table-striped">
                                                <HeaderStyle />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sl_No." HeaderStyle-Wrap="true">
                                                        <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                        <ItemTemplate><%#Container.DataItemIndex+1%></ItemTemplate>
                                                        <ItemStyle Font-Size="Small" Font-Bold="true" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="Subject" HeaderText="Questions Title" SortExpression="NoticeTitle" NullDisplayText="N/A" ReadOnly="True">
                                                        <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                        <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Qyear" HeaderText="Question Years" DataFormatString="{0:dd-MM-yyyy}" SortExpression="NoticeDate" NullDisplayText="N/A" ReadOnly="True">
                                                        <HeaderStyle ForeColor="Black" Wrap="true" BackColor="#daddda" Font-Bold="true" Font-Size="Small" />
                                                        <ItemStyle Font-Size="Small" Font-Bold="true" Wrap="true" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="View">
                                                        <HeaderStyle ForeColor="Black" BackColor="#daddda" Font-Bold="true" Font-Size="Larger" />
                                                        <ItemStyle Font-Size="Small" HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                <asp:LinkButton ID="btnMaterial" OnClick="btnMaterial_Click" Font-Bold="true" runat="server"><%#Eval("Question").ToString().Substring(12) %></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="dsDetails" runat="server" ConnectionString="<%$ConnectionStrings:HMS %>" SelectCommand="SELECT * FROM tbl_QuestionMaster WHERE Status='Active'  order by QUid DESC"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>
                       </div>
              </div>
          </div>
    </div>
</asp:Content>

