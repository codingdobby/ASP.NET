<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Mysite_1712124.board.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
       
        .auto-style9 {
            height: 346px;
        }
       
        .auto-style10 {
            height: 20px;
            text-align: center;
            font-size: xx-large;
        }
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <table class="auto-style5">
        <tr>
            <td class="auto-style10"><strong>게시판</strong></td>
        </tr>
        <tr>
            <td class="auto-style9">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="serial_no" DataSourceID="SqlDataSource1" Width="100%">
                   

                     <EmptyDataTemplate>
                등록된 게시물이 없습니다.
            </EmptyDataTemplate>

           <Columns>
                <asp:BoundField DataField="serial_no" HeaderText="번호">
                    <HeaderStyle Width="60px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField> 

                <asp:TemplateField HeaderText="제목" HeaderStyle-Width="330px">
                    <ItemTemplate>
                        <%# ShowDepth((int)Eval("depth")) %>
                        <%# ShowReplayIcon((int)Eval("inner_id")) %>

                        <%# ShowTitle( Eval("serial_no").ToString(),
                            Eval("title").ToString(),
                            Eval("del_flag").ToString()) %>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:BoundField DataField="writer" HeaderText="이름">
                    <HeaderStyle Width="70px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField> 

                 <asp:TemplateField HeaderText="날짜" HeaderStyle-Width="70px">
                    <ItemTemplate>
                        <%# ShowDate(Eval("reg_date").ToString()) %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="read_count" HeaderText="조회">
                    <HeaderStyle Width="40px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField> 



            </Columns>


                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:webdb %>" ProviderName="<%$ ConnectionStrings:webdb.ProviderName %>" SelectCommand="SELECT * FROM [board] order by ref_id desc, inner_id"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ImageButton ID="btnWrite" runat="server" ImageUrl="~/images/btn_write.gif" PostBackUrl="~/board/Write.aspx" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
   
</asp:Content>
