using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Forrumonline
{
    public partial class Kaydol : System.Web.UI.Page
    {
        SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings[0].ConnectionString);
        string sorgu = "Insert into Kullanicilar (Ad, Soyad, KullaniciAdi, Sifre, Email,Rol, Hatirlatmasoru, Hatirlatmacevap) Values (@Ad, @Soyad, @KullaniciAdi, @Sifre, @Email,@Rol, @Hatirlatmasoru, @Hatirlatmacevap)";
        protected void Page_Load(object sender, EventArgs e)
        {

            btngizle.Visible = false;

        }

        protected void btntemizle_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void btngöster_Click(object sender, EventArgs e)
        {
            txtsifre.TextMode = TextBoxMode.SingleLine;

            txtsifretekrar.TextMode = TextBoxMode.SingleLine;

            btngizle.Visible = true;
            btngöster.Visible = false;
        }

        protected void btngizle_Click(object sender, EventArgs e)
        {
            string parola = txtsifre.Text;
            txtsifre.TextMode = TextBoxMode.Password;
            txtsifre.Attributes.Add("value", parola);

            string parola2 = txtsifretekrar.Text;
            txtsifretekrar.TextMode = TextBoxMode.Password;
            txtsifretekrar.Attributes.Add("value", parola2);

            btngöster.Visible = true;
            btngizle.Visible = false;
        }

        protected void btniptalet_Click(object sender, EventArgs e)
        {
            Response.Redirect("Forumlar.aspx");
        }

        protected void btnkayit_Click(object sender, EventArgs e)
        {
            string ad = txtad.Text;
            string soyad = txtsoyad.Text;
            string kullaniciAdi = txtkullaniciadi.Text;
            string sifre = txtsifre.Text;
            string email = txtemail.Text;
            string sifretekrar = txtsifretekrar.Text;
            string rol = lblrol.Text;
            string hatirlatmasoru = drplisthatirlatma.SelectedItem.Text;
            string hatirlatmacevap = txtcevap.Text;
            if (soyad.Contains(" ") == true | kullaniciAdi.Contains(" ") == true | sifre.Contains(" ") == true | sifretekrar.Contains(" ") == true | email.Contains(" ") == true)
            {
                lblsonuc.Text = "Soyad, Kullanıcı adı, e-mail, şifre şifre tekrar veya cevap  kutucuğunda boşluk harfi olamaz.";
            }

            else
            {
                if (txtad.Text != "" && txtsoyad.Text != "" && txtkullaniciadi.Text != "" && txtsifre.Text != "" && txtsifretekrar.Text != "" && txtemail.Text != "" && txtcevap.Text != "" && sifre == sifretekrar)
                {



                    SqlCommand cmd = new SqlCommand(sorgu, cnn);
                    cnn.Open();

                    try
                    {


                        cmd.Parameters.AddWithValue("@KullaniciAdi", txtkullaniciadi.Text);
                        cmd.Parameters.AddWithValue("@Ad", txtad.Text);
                        cmd.Parameters.AddWithValue("@Soyad", txtsoyad.Text);
                        cmd.Parameters.AddWithValue("@Sifre", txtsifre.Text);
                        cmd.Parameters.AddWithValue("@Email", txtemail.Text);
                        cmd.Parameters.AddWithValue("@Rol", lblrol.Text);
                        cmd.Parameters.AddWithValue("@Hatirlatmasoru", drplisthatirlatma.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@Hatirlatmacevap", txtcevap.Text);



                        cmd.ExecuteNonQuery();
                        cnn.Close();



                        Session.Add("kullaniciadi", txtkullaniciadi.Text);
                        Session.Add("sifre", txtsifre.Text);
                        Session.Add("rol", lblrol.Text);

                        Session.Abandon();

                        pnlkayit.Visible = false;
                        lbldurum.Text = "Kayıt işleminiz başarıyla sonuçlanmıştır...";
                    }

                    catch (Exception)
                    {
                        lblsonuc.Text = "Kaydınız yapılamamıştır.Girdiğiniz kullanıcı adı kullanılmakta olabilir.";
                    }
                }
                else
                {
                    lblsonuc.Text = "Şifreler uyuşmuyor olabilir ve/veya Boş alanları doldurmanız gerekmektedir.";
                }
            }
        }
    }
}