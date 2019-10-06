<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="Mysite_1712124.member.Modify" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style11 {
        width: 100%;
        height: 331px;
    }
    .auto-style9 {
        width: 100px;
    }
    .auto-style10 {
        width: 105px;
        height: 20px;
    }
      
       
     
        .auto-style13 {
            height: 25px;
            text-align: center;
        }

   
        .auto-style12 {
            height: 25px;
        }

   
         
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style11">
    <tr>
        <td class="auto-style17"></td>
        <td class="auto-style15">회원 정보 변경</td>
    </tr>
    <tr>
        <td class="auto-style19" style="text-align: center">아이디</td>
        <td class="auto-style20">
            <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style21" style="text-align: center">이름</td>
        <td class="auto-style22">
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style23" style="text-align: center">암호</td>
        <td class="auto-style24">
            <asp:TextBox ID="txtPWD" runat="server"></asp:TextBox>
&nbsp;&nbsp; 암호 확인
            <asp:TextBox ID="txtPWD2" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style10" style="text-align: center">E-mail</td>
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
        <td class="auto-style27"></td>
        <td class="auto-style28">
            <asp:ImageButton ID="btnSave" runat="server" ImageUrl="~/images/btn_save.gif" OnClick="btnSave_Click" />
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/btn_delete.gif" OnClick="ImageButton1_Click" />
        </td>
    </tr>
    <tr>
        <td class="auto-style18">&nbsp;</td>
        <td>
            <asp:Label ID="msg" runat="server" ForeColor="#CC0066"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="auto-style18">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style18">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>
