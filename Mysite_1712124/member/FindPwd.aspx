<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FindPwd.aspx.cs" Inherits="Mysite_1712124.member.FindPwd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style14 {
        font-size: xx-large;
    }
    .auto-style15 {
        height: 24px;
        text-align: center;
    }
    .auto-style16 {
        font-size: x-large;
    }
    .auto-style17 {
        text-align: right;
        width: 467px;
    }
    .auto-style18 {
        text-align: right;
        height: 30px;
        width: 467px;
    }
    .auto-style19 {
        text-align: center;
        height: 30px;
    }
     
     
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style5">
    <tr>
        <td class="auto-style15"><strong>
            <asp:Label ID="Label1" runat="server" CssClass="auto-style14" Text="Label"></asp:Label>
            </strong></td>
    </tr>
    <tr>
        <td class="auto-style15">
            <asp:Label ID="Label2" runat="server" Text="아이디 입력"></asp:Label>
        &nbsp;:
            <asp:TextBox ID="txtID" runat="server" CssClass="textbox"></asp:TextBox>
            &nbsp;
            <asp:Button ID="findID" runat="server" Text="아이디 찾기" OnClick="findID_Click" />
        </td>
    </tr>
    <tr>
        <td class="auto-style8">
            <br />
            <asp:Label ID="lblResult" runat="server" CssClass="auto-style16"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Panel ID="Panel3" runat="server">
                <table align="center" class="auto-style5">
                    <tr>
                        <td class="auto-style18">비밀번호 입력:&nbsp;<asp:TextBox ID="txtPWD" runat="server" CssClass="textbox"></asp:TextBox>
&nbsp; </td>
                        <td class="auto-style19">
                            <asp:Label ID="lblmsg" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style17">&nbsp;비밀번호 확인:
                            <asp:TextBox ID="txtPWD2" runat="server" CssClass="textbox"></asp:TextBox>
                            &nbsp; </td>
                        <td class="auto-style8">
                            <asp:Button ID="UpdatePwd" runat="server" OnClick="UpdatePwd_Click" Text="비밀번호 변경" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
</table>
</asp:Content>
