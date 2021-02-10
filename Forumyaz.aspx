<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Forumyaz.aspx.cs" Inherits="Forrumonline.Forumyaz" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="lblkullaniciadi" runat="server" Text=""></asp:Label>
    <asp:Label ID="lbltarih" runat="server" Text=""></asp:Label>
    <asp:Label ID="lblrol" runat="server" Text=""></asp:Label>

    <div style="width:100%;height:auto;float:left;">

    Forum Başlığı <br />
    <asp:TextBox ID="txtbaslik" Width="40%" TextMode="SingleLine" BorderWidth="1px" MaxLength="100" runat="server"></asp:TextBox><br /><br />
    
    </div>

    <div style="width:100%;height:auto;float:left;">
    Forum İçeriği <br />
    <asp:TextBox ID="txticerik" Width="75%" Height="100" BorderWidth="1px" runat="server" TextMode="MultiLine"></asp:TextBox><br />

    </div>

    <asp:Button ID="btnyayimla" runat="server" Text="Yayımla       " BackColor="White" ForeColor="Green" OnClick="btnyayimla_Click" />
    <asp:Button ID="btntemizle" runat="server" Text="Temizle       " BackColor="white" ForeColor="HotPink" OnClick="btntemizle_Click" />
    <asp:Button ID="btngeridon" runat="server" Text="Geri Dön" BackColor="white" ForeColor="OrangeRed" OnClick="btngeridon_Click" /><br />

    <asp:Label ID="lblyayimlasonuc" runat="server" Text="" ForeColor="DarkRed"></asp:Label>
</asp:Content>
