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
    public partial class Girisyap : System.Web.UI.Page
    {
        SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings[0].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {


            


        }

        protected void btngeridön_Click(object sender, EventArgs e)
        {
            Response.Redirect("Forumlar.aspx");
        }

        protected void btngirisyap_Click(object sender, EventArgs e)
        {
            string sorgu = "Select * from Kullanicilar where KullaniciAdi=@kullaniciadi and Sifre=@sifre";
            SqlCommand cmd = new SqlCommand(sorgu, cnn);
            cmd.Parameters.AddWithValue("@kullaniciadi", txtkullaniciadi.Text);
            cmd.Parameters.AddWithValue("@sifre", txtsifre.Text);



            cnn.Open();

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Session.Add("ad", dr["Ad"].ToString());
                Session.Add("soyad", dr["Soyad"].ToString());
                Session.Add("kullaniciadi", dr["Kullaniciadi"].ToString());
                Session.Add("sifre", dr["Sifre"].ToString());
                Session.Add("email", dr["Email"].ToString());
                Session.Add("rol", dr["Rol"].ToString());
                Session.Add("hatirlatmasoru", dr["Hatirlatmasoru"].ToString());
                Session.Add("hatirlatmacevap", dr["Hatirlatmacevap"].ToString());

                Response.Redirect("Forumlar.aspx");

            }
            else
            {
                lblsonuc.Text = "Kullanıcı girişi sağlanamadı.";
            }

            cnn.Close();
        }

        
    }
}