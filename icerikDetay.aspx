<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="icerikDetay.aspx.cs" Inherits="Forrumonline.icerikDetay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Label ID="lblgelenid" runat="server" Text=""></asp:Label>


    <asp:Label ID="lblrol" runat="server" Text=""></asp:Label>


        <asp:ListView ID="listdetaylar" runat="server">

        <ItemTemplate>

            <strong><asp:Label ID="Label2" runat="server" Text='<%#Eval("forumuacan") %>'></asp:Label></strong>
            <strong> <h3><asp:Label ID="Label3" runat="server" Text='<%#Eval("baslik") %>'></asp:Label></h3></strong> <br />
            <asp:Label ID="Label4" runat="server" Text='<%#Eval("icerik") %>'></asp:Label><br /><br />
            <asp:Label ID="Label5" runat="server" Text='<%#Eval("tarih") %>'></asp:Label><br />

        </ItemTemplate>

    </asp:ListView>
    <br /><br />
    
    <asp:Panel ID="pnlyöneticivemoderatoryorumsilme" runat="server">

        Silinecek Yorumun ID Numarası : <asp:TextBox ID="txtsilinecekyorumunidnumarasi" TextMode="SingleLine" BorderWidth="1px" runat="server"></asp:TextBox>
        <asp:Button ID="btnyorumsil" runat="server" BackColor="White" ForeColor="DeepPink" Text="Yorumu Sil" OnClick="btnyorumsil_Click" />
        &nbsp &nbsp
        <asp:Label ID="lblyorumsilmesonuc" ForeColor="Red" runat="server" Text=""></asp:Label>
        
    </asp:Panel><br />
    

    <asp:Panel ID="pnlyorumyap" runat="server">

        <asp:Label ID="lblkullanici" runat="server" Text=""></asp:Label>
        Yorumunuz <br /> <asp:TextBox ID="txtyorum" runat="server" BorderWidth="1px" TextMode="MultiLine" Width="800" Height="100"></asp:TextBox><br />
        <asp:Label ID="lbltarih" runat="server" Text=""></asp:Label>
        <asp:Button ID="btnyorumupaylas" runat="server" BackColor="White" ForeColor="Green" Text="Yorumu Paylaş" OnClick="btnyorumupaylas_Click" />
        &nbsp &nbsp
        <asp:Label ID="lblyorumsonuc" ForeColor="Red" runat="server" Text=""></asp:Label><br /><br />

    </asp:Panel>

    <asp:Panel ID="pnlyorumüyelikuyari" runat="server">

        <asp:Label ID="lblyorumüyelikuyari" runat="server" ForeColor="Red" Text=""></asp:Label><br />

    </asp:Panel>

    <strong> Yorumlar </strong><br /><br />

    <asp:Panel ID="pnlherkesicinyorumlar" runat="server">


            <asp:ListView ID="listherkesicinyorumlar"  runat="server">

        <ItemTemplate>

            <div Class="uyelersekil" style="width:800px; height:auto;">

            <strong> <asp:Label ID="Label1" runat="server" Text='<%#Eval("yorumyapankullanici") %>'></asp:Label></strong><br />
            <asp:Label ID="Label6" runat="server" Text='<%#Eval("yorum") %>'></asp:Label><br />
            <asp:Label ID="Label7" runat="server" Text='<%#Eval("tarih") %>'></asp:Label><br /><br />

                </div>

        </ItemTemplate>

            </asp:ListView>

        
        
        
    </asp:Panel>


    <asp:Panel ID="pnlyöneticivemoderratorlericinyorumlar" runat="server" >

            <asp:ListView ID="listyöneticivemoderratorlericinyorumlar"  runat="server">

        <ItemTemplate>

            <div style="width:800px; height:auto;" Class="uyelersekil">

            <strong> Yorumun ID Numarası : </strong> &nbsp <strong> <asp:Label ID="Label8" runat="server" Text='<%#Eval("id") %>'></asp:Label></strong><br />
            <strong> <asp:Label ID="Label1" runat="server" Text='<%#Eval("yorumyapankullanici") %>'></asp:Label></strong><br />
            <asp:Label ID="Label6" runat="server" Text='<%#Eval("yorum") %>'></asp:Label><br />
            <asp:Label ID="Label7" runat="server" Text='<%#Eval("tarih") %>'></asp:Label><br /><br />

                </div>

        </ItemTemplate>

            </asp:ListView>

        
        
    </asp:Panel>


</asp:Content>
