<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Kaydol.aspx.cs" Inherits="Forrumonline.Kaydol" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="pnlkayit" runat="server">

                    <div style="height:600px;text-align:left;">

                        <div style="width:100%;height:auto;float:left;">
                        <h3 style="text-align:center;"><strong>Kayıt OL</strong></h3>
                        </div>

                        <div style="width:50%;height:auto;float:left;">

                            <span>Ad</span><br />
                            <asp:TextBox ID="txtad" TextMode="SingleLine" runat="server" Minlength="3" CssClass="textbox" BorderWidth="1px"></asp:TextBox>

                        </div>

                        <div style="width:50%;height:auto;float:left;">

                            <span>Soyad</span><br />
                            <asp:TextBox ID="txtsoyad" Minlength="2" TextMode="SingleLine" runat="server" CssClass="textbox" BorderWidth="1px"></asp:TextBox>

                        </div>

                        <div style="width:100%;height:20px;float:left;"></div>

                        <div style="width:50%;height:auto;float:left;">

                            <span>Kullanıcı Adı</span><br />
                            <asp:TextBox ID="txtkullaniciadi" TextMode="SingleLine" Minlength="6" Maxlength="15" runat="server" CssClass="textbox" BorderWidth="1px"></asp:TextBox>

                        </div>

                        <div style="width:50%;height:auto;float:left;">

                            <span>E-mail Adresiniz</span><br />
                            <asp:TextBox ID="txtemail" runat="server" TextMode="Email" CssClass="textbox" BorderWidth="1px"></asp:TextBox>

                        </div>

                        <div style="width:100%;height:20px;float:left;"></div>

                        <div style="width:50%;height:auto;float:left;">

                            <span>Şifre</span><br />
                            <asp:TextBox ID="txtsifre" runat="server" CssClass="textbox" Textmode="Password" minlength="6" maxlength="20" BorderWidth="1px"></asp:TextBox>

                        </div>                        
                               
                        <div style="width:40%;height:auto;float:left;">

                            <span>Şifre Tekrar</span><br />
                            <asp:TextBox ID="txtsifretekrar" runat="server" CssClass="textbox" Textmode="Password" minlength="6" maxlength="20" BorderWidth="1px"></asp:TextBox>
                            <asp:Button ID="btngöster" runat="server" Text="Şifreleri Göster" Backcolor="White" ForeColor="DeepPink" OnClick="btngöster_Click" />
                            <asp:Button ID="btngizle" runat="server" Text="Şifreleri Gizle" Backcolor="White" ForeColor="DeepPink" OnClick="btngizle_Click" />                       

                        </div>

                        <div style="width:100%;height:20px;float:left;"></div>
                                 
                        <div style="width:100%;height:auto;float:left; text-align:left;">

                            <span>Rolünüz : <asp:Label ID="lblrol" runat="server" Text="Üye" ForeColor="Lime"></asp:Label></span><br />

                        </div>

                        <div style="width:100%;height:20px;float:left;"></div>

                        <div style="width:50%;height:auto;float:left;">

                            <span>Hatırlatma Sorunuzu Seçiniz</span><br />
                            <asp:DropDownList ID="drplisthatirlatma" runat="server">
                                     <asp:ListItem>En sevdiğiniz yemek?</asp:ListItem>
                                     <asp:ListItem>En sevdiğiniz hayvan?</asp:ListItem>
                                     <asp:ListItem>İlkokul öğretmeninizin adı?</asp:ListItem>
                                     <asp:ListItem>Annenizin kızlık soy ismi?</asp:ListItem>
                            </asp:DropDownList>

                        </div>

                        <div style="width:50%;height:auto;float:left;">

                            <span>Cevabınız</span><br />
                            <asp:TextBox ID="txtcevap" TextMode="SingleLine" Minlength="2" runat="server" CssClass="textbox" BorderWidth="1px"></asp:TextBox>

                        </div>

                        <div style="width:100%;height:20px;float:left;"></div>

                        <div style="width:100%;height:auto;float:left;">

                            <asp:Button ID="btnkayit" BackColor="White" ForeColor="Green" runat="server" Text="Kayıt OL        " OnClick="btnkayit_Click" />
                            <asp:Button ID="btntemizle" BackColor="White" ForeColor="HotPink" runat="server" Text="Temizle        " OnClick="btntemizle_Click" />
                            <asp:Button ID="btniptalet" BackColor="White" ForeColor="OrangeRed" runat="server" Text="İptal Et" OnClick="btniptalet_Click" /><br />
                                                                               
                            <asp:Label ID="lblsonuc" runat="server" Text="" ForeColor="Red"></asp:Label>

                        </div>
                                     
                    </div></asp:Panel>
                    

                        <asp:Label ID="lbldurum" runat="server" Text="" ForeColor="Red"></asp:Label> 
                        
                       

                       
                           

               
        


</asp:Content>



        