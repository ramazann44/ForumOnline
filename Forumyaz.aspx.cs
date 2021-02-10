using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;
using System.ComponentModel;

namespace Forrumonline
{
    public partial class Forumyaz : System.Web.UI.Page
    {
        SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings[0].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {


            lbltarih.Visible = false;
            lblkullaniciadi.Visible = false;
            lblrol.Visible = false;

            object kullanici = Session["kullaniciadi"];
            object rol = Session["rol"];
            lblkullaniciadi.Text = kullanici.ToString();
            lblrol.Text = rol.ToString();


        }

        protected void btngeridon_Click(object sender, EventArgs e)
        {
            Response.Redirect("Forumlar.aspx");
        }

        protected void btntemizle_Click(object sender, EventArgs e)
        {
            Response.Redirect("Forumyaz.aspx");
        }

        protected void btnyayimla_Click(object sender, EventArgs e)
        {
            string kullaniciAdi = lblkullaniciadi.Text;
            string baslik = txtbaslik.Text;
            string icerik = txticerik.Text;
            string tarih = lbltarih.Text;

            if(txtbaslik.Text != "" && txticerik.Text != "")
            {
                lbltarih.Text = DateTime.Today.ToShortDateString() + " " + DateTime.Now.ToLongTimeString();

                cnn.Open();
                SqlCommand komut = new SqlCommand("Insert into Forumyazilari  (forumuacan, baslik, icerik, tarih) values (@forumuacan, @baslik, @icerik, '" + lbltarih.Text + "')", cnn);

                komut.Parameters.AddWithValue("@forumuacan", lblrol.Text + " " + lblkullaniciadi.Text);
                komut.Parameters.AddWithValue("@baslik", txtbaslik.Text);
                komut.Parameters.AddWithValue("@icerik", txticerik.Text);

                komut.ExecuteNonQuery();

                cnn.Close();
                lblyayimlasonuc.ForeColor = Color.Green;
                lblyayimlasonuc.Text = "Forumunuz başarıyla yayınlandı.";
            }
            else
            {
                lblyayimlasonuc.ForeColor = Color.Red;
                lblyayimlasonuc.Text = "Boşlukları doldurunuz...";
            }
        }
    }
}