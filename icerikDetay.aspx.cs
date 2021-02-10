using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Data.OleDb;

namespace Forrumonline
{
    public partial class icerikDetay : System.Web.UI.Page
    {
        SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings[0].ConnectionString);

        
        protected void Page_Load(object sender, EventArgs e)
        {

            if(Page.IsPostBack == false)
            {

                object kullanici = Session["kullaniciadi"];
                object rol = Session["rol"];
                lblkullanici.Visible = false;
                lbltarih.Visible = false;
                lblrol.Visible = false;
                pnlyorumyap.Visible = false;
                pnlyorumüyelikuyari.Visible = false;

                if (kullanici != null)
                {
                    lblkullanici.Text = rol.ToString() + " " + kullanici.ToString();
                    lblrol.Text = rol.ToString();

                    if (lblrol.Text == "Yönetici" || lblrol.Text == "Moderatör")
                    {
                        pnlherkesicinyorumlar.Visible = false;
                        pnlyöneticivemoderratorlericinyorumlar.Visible = true;
                        pnlyöneticivemoderatoryorumsilme.Visible = true;
                    }
                    else
                    {
                        pnlherkesicinyorumlar.Visible = true;
                        pnlyöneticivemoderratorlericinyorumlar.Visible = false;
                        pnlyöneticivemoderatoryorumsilme.Visible = false;
                    }

                    pnlyorumyap.Visible = true;
                    pnlyorumüyelikuyari.Visible = false;
                }
                else
                {
                    pnlyöneticivemoderratorlericinyorumlar.Visible = false;
                    pnlyöneticivemoderatoryorumsilme.Visible = false;
                    pnlyorumyap.Visible = false;
                    pnlyorumüyelikuyari.Visible = true;
                    lblyorumüyelikuyari.Text = "Üye Girişi Yapmadığınız İçin Yorum Yapamazsınız. Yorum Yapmak İçin Lütfen Giriş Yapınız...";
                }

                lblgelenid.Visible = false;

                lblgelenid.Text = Request.QueryString["id"];


                string sorgu = "Select * from Forumyazilari where id=@id";

                SqlCommand cmd = new SqlCommand(sorgu, cnn);
                cnn.Open();

                cmd.Parameters.AddWithValue("@id", lblgelenid.Text);

                SqlDataReader dr = cmd.ExecuteReader();

                listdetaylar.DataSource = dr;
                listdetaylar.DataBind();

                cnn.Close();


                YorumlariGetir();

                YöneticivemoderatorlericinYorumlariGetir();



                cnn.Open();
                SqlCommand okunmayiarttir = new SqlCommand("Update Forumyazilari set forumokunmasayisi=forumokunmasayisi+1 where id='" + lblgelenid.Text + "'", cnn);
                okunmayiarttir.ExecuteNonQuery();
                cnn.Close();
            }

            

        }

        protected void btnyorumupaylas_Click(object sender, EventArgs e)
        {

            string kullaniciAdi = lblkullanici.Text;
            string yorum = txtyorum.Text;
            string forumsahiplikid = lblgelenid.Text;

            if (txtyorum.Text != "")
            {

                lbltarih.Text = DateTime.Today.ToShortDateString() + " " + DateTime.Now.ToLongTimeString();

                cnn.Open();
                SqlCommand cmd = new SqlCommand("Insert into Forumyorumlari (forumsahiplikid, yorumyapankullanici, yorum, tarih) values (@forumsahiplikid, @yorumyapankullanici, @yorum, @tarih)", cnn);

                cmd.Parameters.AddWithValue("@forumsahiplikid", lblgelenid.Text);
                cmd.Parameters.AddWithValue("@yorumyapankullanici", lblkullanici.Text);
                cmd.Parameters.AddWithValue("@yorum", txtyorum.Text);
                cmd.Parameters.AddWithValue("@tarih", lbltarih.Text);

                cmd.ExecuteNonQuery();

                cnn.Close();

                Response.Redirect(Request.RawUrl);



            }
            else
            {
                lblyorumsonuc.Text = "Yorum kutucuğu doldurulmadan yorum yapılamaz...";
            }


        }

        private void YorumlariGetir()
        {
            

            string sorgu = "select * from Forumyorumlari where forumsahiplikid like '" + lblgelenid.Text + "' order by tarih desc ";

            SqlCommand cmd = new SqlCommand(sorgu, cnn);
            cnn.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            listherkesicinyorumlar.DataSource = dr;
            listherkesicinyorumlar.DataBind();

            cnn.Close();

        }

        private void YöneticivemoderatorlericinYorumlariGetir()
        {


            string sorgu = "select * from Forumyorumlari where forumsahiplikid like '" + lblgelenid.Text + "' order by tarih desc ";

            SqlCommand cmd = new SqlCommand(sorgu, cnn);
            cnn.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            listyöneticivemoderratorlericinyorumlar.DataSource = dr;
            listyöneticivemoderratorlericinyorumlar.DataBind();

            cnn.Close();

        }

        protected void btnyorumsil_Click(object sender, EventArgs e)
        {
            if (txtsilinecekyorumunidnumarasi.Text != "")
            {
                cnn.Open();
                SqlCommand komut = new SqlCommand("Delete From Forumyorumlari  where id='" + txtsilinecekyorumunidnumarasi.Text + "'", cnn);
                komut.ExecuteNonQuery();
                cnn.Close();
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                lblyorumsilmesonuc.Text = "Silinecek olan yorumun ID numarasını girmeden yorum silme işlemi yapamazsınız...";
            }
        }
    }
}