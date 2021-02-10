<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Forumlar.aspx.cs" Inherits="Forrumonline.Bloglar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="lblkullanici" runat="server" Text=""></asp:Label>
    <asp:Label ID="lblrol" runat="server" Text=""></asp:Label>


    <asp:Panel ID="pnlforumlar" runat="server">

        <asp:Panel ID="pnlyöneticivemoderatorforumsilme" runat="server">

        Silinecek Forumun ID Numarası : <asp:TextBox ID="txtsilinecekforumunidnumarasi" TextMode="SingleLine" BorderWidth="1px" runat="server"></asp:TextBox>
        <asp:Button ID="btnforumsil" runat="server" BackColor="White" ForeColor="DeepPink" Text="Forumu Sil" OnClick="btnforumsil_Click" /><br />
        <asp:Label ID="lblforumsilmesonuc" runat="server" Text="" ForeColor="Red"></asp:Label>
        <br />
    </asp:Panel>

        <asp:Panel ID="pnlyöneticivemoderatorforumlar" runat="server">

            <asp:ListView ID="listyöneticivemoderatorforumlar" runat="server">

            <ItemTemplate>


                <table border="0" style="width:100%">

                    <tr>

                        <td style="width:5%;"><asp:Label ID="Label4" runat="server" Text='<%# Eval("id") %>'></asp:Label></td>
                        <td style="width:15%;"><asp:Label ID="Label1" runat="server" Text='<%# Eval("forumuacan") %>'></asp:Label></td>
                        <td style="width:50%;"><asp:HyperLink ID="HyperLink1" ForeColor="Black" runat="server" NavigateUrl='<%# string.Format("~/icerikDetay.aspx?id={0}", Eval("id")) %>'>  <asp:Label ID="Label2" runat="server" Text='<%# Eval("baslik") %>'></asp:Label></asp:HyperLink></td>
                        <td style="width:15%;"><img src="resimler/goruntulenme.png" width="25" height="25"><asp:Label ID="Label6" runat="server" Text='<%# Eval("forumokunmasayisi") %>'></asp:Label></td>
                        <td style="width:15%;"><asp:Label ID="Label3" runat="server" Text='<%# Eval("tarih") %>'></asp:Label><br /></td>

                    </tr>

                </table>

            </ItemTemplate>

        </asp:ListView>
        </asp:Panel>

        <asp:Panel ID="forumbasliklari" runat="server">

            <asp:ListView ID="listüyeleringozundenforumlar" runat="server">

            <ItemTemplate>

                <table border="0" style="width:100%">

                    <tr>

                        <td style="width:15%"><asp:Label ID="Label1" runat="server" Text='<%# Eval("forumuacan") %>'></asp:Label></td>
                        <td style="width:50%"><asp:HyperLink ID="HyperLink2" ForeColor="Black" runat="server" NavigateUrl='<%# string.Format("~/icerikDetay.aspx?id={0}", Eval("id")) %>'>  <asp:Label ID="Label2" runat="server" Text='<%# Eval("baslik") %>'></asp:Label></asp:HyperLink></td>
                        <td style="width:15%"><img src="resimler/goruntulenme.png" width="25" height="25"><asp:Label ID="Label5" runat="server" Text='<%# Eval("forumokunmasayisi") %>'></asp:Label></td>
                        <td style="width:20%"><asp:Label ID="Label3" runat="server" Text='<%# Eval("tarih") %>'></asp:Label><br /></td>

                    </tr>

                </table>

                

            </ItemTemplate>

        </asp:ListView>
        </asp:Panel>

        

    </asp:Panel>


</asp:Content>
