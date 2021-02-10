<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Hesapbilgileri.aspx.cs" Inherits="Forrumonline.Hesapbilgileri" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="pnlhesapkullanici" runat="server" CssClass="pnlkullanici">

                            <strong>Adınız : </strong> <asp:Label ID="lblhesapad" Text="" runat="server" /><br />
                            <strong>Soyadınız : </strong> <asp:Label ID="lblhesapsoyad" Text="" runat="server" /><br />
                            <strong>Kullanıcı Adınız : </strong><asp:Label ID="lblhesapkullaniciadi" Text="" runat="server" /> <br />
                            <strong>Şifreniz : </strong>******<br />
                            <strong>E-mail Adresiniz: </strong> <asp:Label ID="lblhesapemail" Text="" runat="server" /><br />
                            <strong>Rolünüz : </strong> <asp:Label ID="lblrol" Text="" runat="server" /> <br />
                            <strong>Hatırlatma Sorunuz : </strong> <asp:Label ID="lblhatirlatmasoru" Text="" runat="server" /> <br />
                            <strong>Cevabınız : </strong>******<br /><br />
                            

                        </asp:Panel>

    <asp:Panel ID="pnlhesap2" runat="server" CssClass="pnlkullanici">
        <strong>Uyarı!!!</strong><br />
        <asp:Label ID="lblhesapilkbilgi" runat="server" Text=""></asp:Label>        
                            
                        </asp:Panel>

</asp:Content>
