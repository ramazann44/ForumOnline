using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace Forrumonline
{
    public partial class sifremiunuttum : System.Web.UI.Page
    {
        SqlConnection baglanti;
        SqlCommand komut;
        SqlDataReader oku;
        protected void Page_Load(object sender, EventArgs e)
        {


            baglanti = new SqlConnection(ConfigurationManager.ConnectionStrings[0].ConnectionString);

            pnlsifredegistir.Visible = false;
            pnlsorucevaponaylama.Visible = false;

        }

        protected void btnhatirlatmakullaniciadi_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            komut = new SqlCommand("select Hatirlatmasoru from Kullanicilar where KullaniciAdi=@kullaniciadi", baglanti);
            komut.Parameters.AddWithValue("kullaniciadi", txtkullaniciadi.Text);
            oku = komut.ExecuteReader();
            if (oku.Read())
            {
                pnlsorucevaponaylama.Visible = true;
                pnlkullanicionaylama.Visible = false;
                lblhatirlatmasoru.Text = oku["Hatirlatmasoru"].ToString();
            }
            else
            {
                lblkullanicionaylama.Text = "Girdiğiniz kullanıcı adı bulunmamaktadır...";
            }
            baglanti.Close();
        }

        protected void btnhatirlatmacevap_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            komut = new SqlCommand("select Sifre from Kullanicilar where KullaniciAdi=@kullaniciadi and Hatirlatmacevap=@hatirlatmacevap", baglanti);
            komut.Parameters.AddWithValue("kullaniciadi", txtkullaniciadi.Text);
            komut.Parameters.AddWithValue("hatirlatmacevap", txtcevap.Text);
            oku = komut.ExecuteReader();

            if (oku.Read())
            {

                pnlsifredegistir.Visible = true;

            }
            else
            {

                pnlsorucevaponaylama.Visible = true;
                lblcevap.Text = "Yanlış cevap verdiniz...";

            }
            baglanti.Close();
        }

        protected void btnsifredegistir_Click(object sender, EventArgs e)
        {
            
            
                if (txtyenisifre.Text == txtyenisifretekrar.Text)
                {
                    baglanti.Open();
                    komut = new SqlCommand("update Kullanicilar set Sifre='" + txtyenisifre.Text + "' where Kullaniciadi='" + txtkullaniciadi.Text + "'", baglanti);
                    komut.ExecuteNonQuery();


                    pnlsifredegistirbasarili.Visible = true;
                    pnlkullanicionaylama.Visible = false;
                    pnlsifredegistir.Visible = false;
                    lblsifredegistirbasarili.Text = "Şifre değiştirme işleminiz başarıyla sonuçlanmıştır...";
                }
                else
                {
                    pnlsifredegistir.Visible = true;
                    lblsifreeslestirme.Text = "Şifreler birbirleriyle uyuşmuyor...";
                }

                baglanti.Close();
            
            

        }
    }

}