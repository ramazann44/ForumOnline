<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Mesajlasma.aspx.cs" Inherits="Forrumonline.Mesajlasma" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:Label ID="lbltarih" runat="server" Text=""></asp:Label>
    <asp:Label ID="lblrol" runat="server" Text=""></asp:Label>
    <asp:Label ID="lblgönderen" runat="server" Text=""></asp:Label>

    <asp:Panel ID="pnlyöneticiolmayanlaricinbilgiler" runat="server">

        <h5 style="text-align:center;"><strong>Buradan istediğiniz herhangi bir kullanıcı ile o kullanıcının kullanıcı adı ile mesajlaşabilirsiniz...</strong></h5> <br /> 
    <asp:Panel ID="pnladminler" runat="server">
       <strong> Ulaşabileceğiniz Yönetici ve Moderatörlerin Kullanıcı Adları </strong>  <br />
        <div class="uyelersekil">
            
            <asp:ListView ID="listadminler" runat="server">

                <ItemTemplate>

                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Rol") %>'></asp:Label>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("KullaniciAdi") %>'></asp:Label><br />

                </ItemTemplate>

            </asp:ListView>

        </div>

    </asp:Panel>

    </asp:Panel>
    <br />
    

    <asp:Panel ID="pnlmesajgönder" runat="server">

    Mesaj Atacağınız Kullanıcının Kullanıcı adı <br /> <asp:TextBox ID="txtalici" Width="10%" TextMode="SingleLine" MinLength="6" MaxLength="15" BorderWidth="1px" runat="server"></asp:TextBox><br /><br />
    Mesajınız <br /> <asp:TextBox ID="txtmesaj" Width="75%" Height="150px" BorderWidth="1px" runat="server" TextMode="MultiLine"></asp:TextBox><br />
    <asp:Button ID="btngönder" runat="server" Text="Gönder" BackColor="White"  ForeColor="Green" OnClick="btngönder_Click" /><br />
    <asp:Label ID="lblmesajgöndermesonuc" runat="server" Text="" ForeColor="Red"></asp:Label>

    </asp:Panel><br />

    <asp:Panel ID="pnlgelenmesajlar" runat="server">

       <strong> Gelen Mesajlarınız </strong> &nbsp &nbsp
        <asp:Button ID="btngelenmesajlarisil" runat="server" BackColor="White" ForeColor="DeepPink" Text="Gelen Mesajları Sil" OnClick="btngelenmesajlarisil_Click" /><br /><br />



        <asp:ListView ID="listgelenmesajlar" runat="server">

            <ItemTemplate>
                <div class="duyuru-wrap">
                <strong> Gönderen Kullanıcı : </strong> <asp:Label ID="Label1" runat="server" Text='<%# Eval("Kimden") %>'></asp:Label><br />
                <strong> Kullanıcının Mesajı : </strong> <asp:Label ID="Label2" runat="server" Text='<%# Eval("Mesaj") %>'></asp:Label><br />
                <strong> Gönderme Zamanı : </strong> <asp:Label ID="Label4" runat="server" Text='<%# Eval("Tarih") %>'></asp:Label><br /><br />
                </div>

            </ItemTemplate>

        </asp:ListView>

    </asp:Panel>

</asp:Content>
