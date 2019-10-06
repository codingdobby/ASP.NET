<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="company_info.aspx.cs" Inherits="Mysite_1712124.company.company_info" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style10 {
            width: 253px;
            text-align: left;
            height: 276px;
        }
        .auto-style13 {
            width: 253px;
            height: 24px;
        }
        .auto-style14 {
            height: 24px;
            text-align: center;
        }
        .auto-style15 {
            text-align: center;
            font-size: xx-large;
        }
        .auto-style16 {
            height: 276px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" class="auto-style5">
        <tr>
            <td class="auto-style15" colspan="2">
                <strong>회사 소개</strong><br />
                </td>
        </tr>
        <tr>
            <td class="auto-style10">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/images/uc.PNG" OnClick="ImageButton1_Click" />
                <br />
                클릭시 사이트 이동</td>
            <td style="font-family: 'KoPub돋움체 Light'"; class="auto-style16">&nbsp; 
                <strong>울산과학대학교</strong>는 <strong>동부캠퍼스, 서부 캠퍼스</strong>로 나뉜다.<br />
&nbsp;<strong style="background-color: #FF6666">서부캠퍼스</strong>는 <strong style="background-color: #C0C0C0">전기/전자공학과, 화학공학과, 기계공학과와 안전및산업경영공학과</strong>(산업경영과)가 있는 <strong>공학 중점</strong> 캠퍼스이고 1972년에 먼저 세워졌다. 
                <br />
                <br />
&nbsp;제 1~2 공학관, 산학협력관, 대학매점, 대학회관, 용접기술교육센터, 잔디구장이 위치해 있다.<br />
                <br />
&nbsp;<strong style="background-color: #FF6666">동부 캠퍼스</strong>는 주로 <strong style="background-color: #C0C0C0">인문, 자연, 예체능 계열과 일부 공과계열 학부</strong>가 동부캠퍼스에 위치한다.<br />
                <br />
&nbsp;제 1~3 대학관, 행정본관, 학생생활관(기숙사), 잔디구장과 다목적구장, 청운/아산체육관, 평생 교육원이 있다.</td>
        </tr>
        <tr>
            <td class="auto-style15" colspan="2"><strong>
                <br />
                찾아오시는 길</strong></td>
        </tr>
        <tr>
            <td class="auto-style13">
                <asp:Image ID="Image2" runat="server" Height="400px" ImageUrl="~/images/su.png" Width="400px" />
            </td>
            <td class="auto-style14">
                <asp:Image ID="Image3" runat="server" Height="400px" ImageUrl="~/images/dong.png" Width="400px" />
            </td>
        </tr>
    </table>
</asp:Content>
