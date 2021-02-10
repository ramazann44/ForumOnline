<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="sifremiunuttum.aspx.cs" Inherits="Forrumonline.sifremiunuttum" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:Panel ID="pnlkullanicionaylama" runat="server">

    Kullanıcı Adınız <br /> <asp:TextBox ID="txtkullaniciadi" TextMode="SingleLine" MaxLength="15" Minlength="6" BorderWidth="1px" runat="server"></asp:TextBox>
    <asp:Button ID="btnhatirlatmakullaniciadi" runat="server" Backcolor="White" ForeColor="Blue" Text="Tamam" Onclick="btnhatirlatmakullaniciadi_Click" />
    <asp:Label ID="lblkullanicionaylama" runat="server" Text=""></asp:Label>

        </asp:Panel>



        <asp:Panel ID="pnlsorucevaponaylama" runat="server">

    Kişinin Hatırlatma Sorusu : <asp:Label ID="lblhatirlatmasoru" runat="server" Text=""></asp:Label><br /><br />
    Kişinin Cevabı <br /> <asp:TextBox ID="txtcevap" TextMode="SingleLine" runat="server" BorderWidth="1px"></asp:TextBox>
    <asp:Button ID="btnhatirlatmacevap" runat="server" Backcolor="White" ForeColor="Blue" Text="Tamam" OnClick="btnhatirlatmacevap_Click" />
    <asp:Label ID="lblcevap" runat="server" Text="" ForeColor="Red"></asp:Label>
    </asp:Panel>
    

    <asp:Panel ID="pnlsifredegistir" runat="server">

        Yeni Şifre : <br /> <asp:TextBox ID="txtyenisifre" TextMode="Password" MinLength="6" MaxLength="20" BorderWidth="1px" runat="server"></asp:TextBox><br /><br />
        Yeni Şifre Tekrar : <br /> <asp:TextBox ID="txtyenisifretekrar" TextMode="Password" MinLength="6" MaxLength="20" BorderWidth="1px" runat="server"></asp:TextBox>
        <asp:Button ID="btnsifredegistir" runat="server" Backcolor="White" ForeColor="Blue" Text="Şifremi Değiştir" OnClick="btnsifredegistir_Click" />
        <asp:Label ID="lblsifreeslestirme" ForeColor="Red" runat="server" Text=""></asp:Label>

    </asp:Panel>


    <asp:Panel ID="pnlsifredegistirbasarili" runat="server">

        <asp:Label ID="lblsifredegistirbasarili" runat="server" Text=""></asp:Label>

    </asp:Panel>


</asp:Content>
