<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FindId.aspx.cs" Inherits="Mysite_1712124.member.FindId" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style12 {
        font-size: xx-large;
    }
    .auto-style13 {
        text-align: center;
        width: 202px;
        height: 31px;
    }
    .auto-style14 {
        text-align: center;
        width: 202px;
        height: 24px;
    }
    .auto-style15 {
        text-align: left;
        height: 24px;
        width: 119px;
    }
    .auto-style16 {
        height: 24px;
    }
    .auto-style17 {
        height: 31px;
    }
    .auto-style18 {
        text-align: center;
        height: 24px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="right" class="auto-style5">
    <tr>
        <td class="auto-style8" colspan="3">
            <asp:Label ID="lblTitle" runat="server" CssClass="auto-style12" Font-Bold="True" Text="Label"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style13">전화번호 입력</td>
        <td class="auto-style17" colspan="2">
            <asp:TextBox ID="txtNameID" runat="server"></asp:TextBox>
            <asp:Button ID="btnFind" runat="server" OnClick="btnFind_Click" Text="아이디 찾기" />
        </td>
    </tr>
    <tr>
        <td class="auto-style14"></td>
        <td class="auto-style15">
            <asp:Label ID="lblResult" runat="server"></asp:Label>
        </td>
        <td class="auto-style16">
            <asp:LinkButton ID="LinkButton11" runat="server" CssClass="underline" PostBackUrl="~/member/FindPwd.aspx" BackColor="#CCCCFF">비밀번호 재설정</asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td class="auto-style18" colspan="3">
            &nbsp;</td>
    </tr>
</table>
</asp:Content>
