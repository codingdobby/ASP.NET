<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Reply.aspx.cs" Inherits="Mysite_1712124.board.Reply" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style9 {
            width: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style5">
        <tr>
            <td>&nbsp;</td>
            <td>답변 글쓰기</td>
        </tr>
        <tr>
            <td >제목</td>
            <td>
                <asp:TextBox ID="txtTitle" runat="server" MaxLength="20" Width="384px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td >내용</td>
            <td>
                <asp:TextBox ID="txtMessage" runat="server" Height="95px" TextMode="MultiLine" Width="685px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td >&nbsp;</td>
            <td>
                <asp:ImageButton ID="btnSave" runat="server" ImageUrl="~/images/btn_save.gif" OnClick="btnSave_Click" />
            </td>
        </tr>
        <tr>
            <td >&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
