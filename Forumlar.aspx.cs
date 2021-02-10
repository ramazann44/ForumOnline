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
    public partial class Bloglar : System.Web.UI.Page
    {
        SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings[0].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            lblkullanici.Visible = false;
            lblrol.Visible = false;

            object kullanici = Session["kullaniciadi"];
            object rol = Session["rol"];

            if(kullanici != null)
            {
                lblkullanici.Text = kullanici.ToString();
                lblrol.Text = rol.ToString();

                if(lblrol.Text=="Yönetici" || lblrol.Text=="Moderatör")
                {
                    pnlyöneticivemoderatorforumsilme.Visible = true;
                    pnlyöneticivemoderatorforumlar.Visible = true;
                    forumbasliklari.Visible = false;
                }
                else
                {
                    pnlyöneticivemoderatorforumsilme.Visible = false;
                    pnlyöneticivemoderatorforumlar.Visible = false;
                    forumbasliklari.Visible = true;
                }
            }
            else
            {
                pnlyöneticivemoderatorforumsilme.Visible = false;
                pnlyöneticivemoderatorforumlar.Visible = false;
                forumbasliklari.Visible = true;
            }

            Okunmasayilarinisifiryap();

            Uyelericinforumlar();

            Yöneticivemoderatorlericinforumlar();

        }

        private void Okunmasayilarinisifiryap()
        {


            cnn.Open();
            SqlCommand okunmayisifiryap = new SqlCommand("Update Forumyazilari set forumokunmasayisi=0 where forumokunmasayisi is NULL", cnn);
            okunmayisifiryap.ExecuteNonQuery();
            cnn.Close();


        }

        private void Uyelericinforumlar()
        {
            string sorgu = "Select * from Forumyazilari order by tarih desc";

            SqlCommand cmd = new SqlCommand(sorgu, cnn);
            cnn.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            listüyeleringozundenforumlar.DataSource = dr;
            listüyeleringozundenforumlar.DataBind();

            cnn.Close();
        }

        private void Yöneticivemoderatorlericinforumlar()
        {
            string sorgu = "Select * from Forumyazilari order by tarih desc";

            SqlCommand cmd = new SqlCommand(sorgu, cnn);
            cnn.Open();

            SqlDataReader dr = cmd.ExecuteReader();

            listyöneticivemoderatorforumlar.DataSource = dr;
            listyöneticivemoderatorforumlar.DataBind();

            cnn.Close();
        }

        protected void btnforumsil_Click(object sender, EventArgs e)
        {
            if (txtsilinecekforumunidnumarasi.Text != "")
            {
                cnn.Open();
                SqlCommand komut = new SqlCommand("Delete From Forumyazilari  where id='" + txtsilinecekforumunidnumarasi.Text + "'", cnn);
                komut.ExecuteNonQuery();
                cnn.Close();
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                lblforumsilmesonuc.Text = "Silinecek olan forumun ID numarasını girmeden forum silme işlemi yapamazsınız...";
            }
        }

    }
}