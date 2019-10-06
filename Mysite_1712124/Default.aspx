<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Mysite_1712124.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style10 {
        font-size: x-large;
    }
    .auto-style11 {
        font-size: xx-large;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="auto-style8">
        <span class="auto-style11"><strong>사이트를 방문해주셔서 감사합니다!</strong></span><br />
</p>
    <p class="auto-style8">
    <asp:Panel ID="Panel3" runat="server">
      </asp:Panel> 

    쿠키값 보기&nbsp;&nbsp;
    <asp:Label ID="printCookie" runat="server" Text="Label"></asp:Label>

    &nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />

    </p>
    
    <p class="auto-style8">접속자수 : <asp:Label ID="lblCounter" runat="server" Text="lblCounter"></asp:Label>
&nbsp;&nbsp; 현재 접속자 수 : <asp:Label ID="lblACounter" runat="server" Text="lblACounter"></asp:Label>
    </p>
    <br />
    <br />
</asp:Content>
