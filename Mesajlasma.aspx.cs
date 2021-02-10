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
    public partial class Mesajlasma : System.Web.UI.Page
    {
        SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings[0].ConnectionString);
        SqlConnection kullanicisorgulama = new SqlConnection(ConfigurationManager.ConnectionStrings[0].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            lbltarih.Visible = false;
            lblgönderen.Visible = false;
            lblrol.Visible = false;


            object kullanici = Session["kullaniciadi"];
            object rol = Session["rol"];
            lblrol.Text = rol.ToString();
            lblgönderen.Text = kullanici.ToString();

            if (lblrol.Text == "Yönetici" || lblrol.Text == "Moderatör")
            {
                pnlyöneticiolmayanlaricinbilgiler.Visible = false;
            }
            else
            {
                pnlyöneticiolmayanlaricinbilgiler.Visible = true;
            }

            MesajlariGörüntüle();

            AdminleriGörüntüle();

        }

        protected void btngönder_Click(object sender, EventArgs e)
        {
            if (txtalici.Text != "" && txtmesaj.Text != "")
            {

                lbltarih.Text = DateTime.Today.ToShortDateString() + " " + DateTime.Now.ToLongTimeString();

                string sorgu = "Select * from Kullanicilar where KullaniciAdi=@kullaniciadi";
                SqlCommand cmd = new SqlCommand(sorgu, kullanicisorgulama);
                cmd.Parameters.AddWithValue("@kullaniciadi", txtalici.Text);

                kullanicisorgulama.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {

                    cnn.Open();

                    SqlCommand kaydet = new SqlCommand("Insert into mesajlasma (Kimden, Kime, Mesaj, Tarih) values (@Kimden, @Kime, @Mesaj, '" + lbltarih.Text + "')", cnn);

                    kaydet.Parameters.AddWithValue("@Kimden", lblrol.Text + " " + lblgönderen.Text);
                    kaydet.Parameters.AddWithValue("@Kime", txtalici.Text);
                    kaydet.Parameters.AddWithValue("@Mesaj", txtmesaj.Text);

                    kaydet.ExecuteNonQuery();
                    cnn.Close();
                    Response.Redirect(Request.RawUrl);
                    kullanicisorgulama.Close();
                }
                
                else
                {
                    lblmesajgöndermesonuc.Text = "Girdiğiniz kullanıcı adı bulunamamaktadır...";
                }

                kullanicisorgulama.Close();

            }
            else
            {
                lblmesajgöndermesonuc.Text = "Boş kutucukları doldurunuz...";
            }

        }


        private void MesajlariGörüntüle()
        {
            string sorgu = "select * from mesajlasma where Kime=@Kime order by Tarih desc ";

            SqlCommand cmd = new SqlCommand(sorgu, cnn);

            cmd.Parameters.AddWithValue("@Kime", lblgönderen.Text);

            cnn.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            listgelenmesajlar.DataSource = dr;
            listgelenmesajlar.DataBind();

            cnn.Close();
        }

        private void AdminleriGörüntüle()
        {
            string sorgu = "select * from Kullanicilar where Rol like '%Yönetici%' or Rol like '%Moderatör%' order by KullaniciAdi";

            SqlCommand cmd = new SqlCommand(sorgu, cnn);
            cnn.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            listadminler.DataSource = dr;
            listadminler.DataBind();

            cnn.Close();

        }

        protected void btngelenmesajlarisil_Click(object sender, EventArgs e)
        {
            cnn.Open();
            SqlCommand komut = new SqlCommand("Delete From mesajlasma  where Kime=@Kime", cnn);
            komut.Parameters.AddWithValue("@Kime", lblgönderen.Text);
            komut.ExecuteNonQuery();
            cnn.Close();
            Response.Redirect(Request.RawUrl);
        }
    }
}