<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Mysite_1712124.member.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style9 {
        width: 100px;
        height:1000px;
    }
    .auto-style10 {
        width: 166px;
        height: 20px;
            text-align: center;
        }
        .auto-style11 {
        width:100%;
        }

   
        .auto-style12 {
            height: 25px;
        }

   
        .auto-style13 {
            height: 25px;
            text-align: center;
        }

   
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style11">
    <tr>
        <td class="auto-style13"></td>
        <td class="auto-style14">
            <asp:Label ID="lbltitle" runat="server" Text="Label"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style8">아이디</td>
        <td class="auto-style16">
            <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="아이디 확인" OnClick="Button1_Click" />
        </td>
    </tr>
    <tr>
        <td class="auto-style8">이름</td>
        <td class="auto-style18">
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style13">암호</td>
        <td class="auto-style12">
            <asp:TextBox ID="txtPWD" runat="server"></asp:TextBox>
&nbsp;&nbsp; 암호 확인
            <asp:TextBox ID="txtPWD2" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style10">E-mail</td>
        <td class="auto-style2">
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
&nbsp; </td>
    </tr>
    <tr>
        <td class="auto-style13">전화번호</td>
        <td class="auto-style12">
            <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style12">&nbsp;</td>
        <td>
            <asp:ImageButton ID="btnSave" runat="server" ImageUrl="~/images/btn_save.gif" OnClick="btnSave_Click" />
        </td>
    </tr>
    <tr>
        <td class="auto-style12">&nbsp;</td>
        <td>
            <asp:Label ID="msg" runat="server" ForeColor="#CC0066" Text="Label"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style12">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style12">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>
