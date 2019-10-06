<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Read.aspx.cs" Inherits="Mysite_1712124.board.Read" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style9 {
            width: 100px;
        }
        .auto-style10 {
            width: 111px;
            height: 20px;
        }
        .auto-style11 {
            width: 111px;
            height: 26px;
        }
        .auto-style12 {
            height: 26px;
        }
        .auto-style13 {
            width: 111px;
        }
        .auto-style14 {
            width: 111px;
            height: 359px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style5">
        <tr>
            <td class="auto-style13"></td>
            <td class="auto-style2"><h1>글보기 </h1></td>
        </tr>
        <tr>
            <td>아이디</td>
            <td>
                <asp:Label ID="lblWriter" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td >일자/조회수</td>
            <td>
                <asp:Label ID="lblRegDate" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 조회수 :
                <asp:Label ID="lblCount" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td >제목</td>
            <td>
                <asp:Label ID="lblTitle" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style10">내용</td>
            <td class="auto-style2">
                <br />
                <br />
                <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
                <br />
                <asp:Image ID="imgFile1" runat="server" />
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
            </td>
        </tr>
        <tr>
            <td>파일 첨부</td>
            <td>
                <asp:Label ID="lblFile2" runat="server" Text="Label"></asp:Label>
                <asp:Button ID="btnDownload" runat="server" Text="다운로드" />
            </td>
        </tr>
        <tr>
            <td class="auto-style11"></td>
            <td class="auto-style12">
                <asp:ImageButton ID="btnEdit" runat="server" ImageUrl="~/images/btn_edit.gif" OnClick="btnEdit_Click" />
&nbsp;
                <asp:ImageButton ID="btnReply" runat="server" ImageUrl="~/images/btn_reply.gif" PostBackUrl="~/board/Reply.aspx" />
&nbsp;
                <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="~/images/btn_delete.gif" OnClick="btnDelete_Click" />
&nbsp;
                <asp:ImageButton ID="btnLis" runat="server" ImageUrl="~/images/btn_list.gif" PostBackUrl="~/board/Default.aspx" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td >&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
