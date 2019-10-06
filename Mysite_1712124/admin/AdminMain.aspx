<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminMain.aspx.cs" Inherits="Mysite_1712124.admin.AdminMain" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style12 {
            height: 24px;
        }
        .auto-style13 {
            font-size: x-large;
        }
        .align {
        margin:0 auto;
        text-align:center;
        
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    




    <table class="auto-style5">
    <tr>
        <td class="auto-style12">
            <div class="auto-style8">
                <strong><span class="auto-style13">관리자 페이지<br />
                <br />
                </span></strong>
            </div>
            <div class="align">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="m_id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowPaging="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100%">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="m_id" HeaderText="m_id" ReadOnly="True" SortExpression="m_id" />
                    <asp:BoundField DataField="m_name" HeaderText="m_name" SortExpression="m_name" />
                    <asp:BoundField DataField="m_email" HeaderText="m_email" SortExpression="m_email" />
                    <asp:BoundField DataField="m_phone" HeaderText="m_phone" SortExpression="m_phone" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            </div>
        </td>
        
    </tr>
    <tr>
        <td colspan="2">
            <div class="auto-style8">
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT [m_id], [m_name], [m_email], [m_phone] FROM [member]"></asp:SqlDataSource>
        </td>
    </tr>
</table>
    




</asp:Content>
