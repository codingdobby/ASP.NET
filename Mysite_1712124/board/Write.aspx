<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Write.aspx.cs" Inherits="Mysite_1712124.board.Write" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
        
        width:100%;
        }
        .auto-style9 {
            width: 107px;
            height:30px;
        }
        .auto-style11 {
            width: 107px;
            height: 20px;
        }
      
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style5">
        <tr>
            <td class="auto-style12"></td>
            <td class="auto-style13"><h1><asp:Label ID="lblTitle" runat="server" Text="Label"></asp:Label>
                </h1></td>
        </tr>
        <tr>
            <td >제목</td>
            <td>
                <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td >내용</td>
            <td>
                <asp:TextBox ID="txtMessage" runat="server" Height="299px" TextMode="MultiLine" Width="580px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td >이미지</td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td >파일 첨부</td>
            <td>
                <asp:FileUpload ID="FileUpload2" runat="server" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style11"></td>
            <td class="auto-style2">
                <asp:ImageButton ID="btnSave" runat="server" ImageUrl="~/images/btn_save.gif" OnClick="btnSave_Click" />
                <asp:ImageButton ID="btnList" runat="server" ImageUrl="~/images/btn_list.gif" />
            </td>
        </tr>
        <tr>
            <td >&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td >&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td >&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
