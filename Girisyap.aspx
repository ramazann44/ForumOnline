<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Girisyap.aspx.cs" Inherits="Forrumonline.Girisyap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Giriş Yap</title>
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />

    <style>

    body{
        margin:0;
        padding:0;
        font-family:sans-serif;
        background-color:#34495e;
    }

    .girispanel{
        width:30%;
        padding:40px;
        position:absolute;
        top:50%;
        left:50%;
        transform:translate(-50%, -50%);
        background-color:#191919;
        text-align:center;
    }

    .TextBox{
        border:0;
        background:none;
        display:block;
        margin: 20px auto;
        text-align:center;
        border: 2px solid #3498db;
        padding: 14px 10px;
        outline:none;
        color:white;
        border-radius:24px;
        transition:0.25s;
    }

    .girispanel h1{
        color:white;
        font-weight:500;
    }

    .TextBox:focus{
        border-color:#2ecc71;
    }

    .Button{
        border:0;
        background:none;
        margin:20px auto;
        text-align:center;
        border: 2px solid #3498db;
        padding: 14px 10px;
        outline:none;
        color:white;
        border-radius:24px;
        transition:0.25s;
        cursor:pointer;
    }

    .Button:hover{
        background:#2ecc71;
    }

    </style>


</head>
<body>
    <form id="form1" runat="server">

        <div class="girispanel">

            
                <h1><strong> Giriş Yapın </strong></h1>


                <asp:TextBox ID="txtkullaniciadi" CssClass="TextBox" Width="55%" TextMode="SingleLine" PlaceHolder="Kullanıcı Adınız" MaxLength="15" Minlength="6" runat="server" BorderWidth="1px" Text=""></asp:TextBox>

                <asp:TextBox ID="txtsifre" Width="55%" CssClass="TextBox" runat="server" BorderWidth="1px" PlaceHolder="Şifreniz" Text="Şifreniz" MinLength="6" TextMode="Password"></asp:TextBox>

                
                <asp:Button ID="btngirisyap" CssClass="Button" runat="server" Text="Giriş Yap" OnClick="btngirisyap_Click" />
                <asp:Button ID="btngeridön" CssClass="Button" runat="server" Text="Geri Dön" Onclick="btngeridön_Click"/><br />
                <a href="sifremiunuttum.aspx" style="color:deeppink;">Şifremi Unuttum</a>
                <asp:Label ID="lblsonuc" ForeColor="Red" runat="server" Text=""></asp:Label>

            

        </div>

    </form>
</body>
</html>
