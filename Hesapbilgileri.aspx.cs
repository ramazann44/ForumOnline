using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Forrumonline
{
    public partial class Hesapbilgileri : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            object ad = Session["ad"];
            object soyad = Session["soyad"];
            object kullanici = Session["kullaniciadi"];
            object sifre = Session["sifre"];
            object email = Session["email"];
            object rol = Session["rol"];
            object hatirlatmasoru = Session["hatirlatmasoru"];
            object hatirlatmacevap = Session["hatirlatmacevap"];
            if (ad != null && soyad != null && kullanici != null && sifre != null && email != null && hatirlatmacevap != null)
            {

                pnlhesapkullanici.Visible = true;
                pnlhesap2.Visible = false;
                lblhesapad.Text = ad.ToString();
                lblhesapsoyad.Text = soyad.ToString();
                lblhesapkullaniciadi.Text = kullanici.ToString();
                lblhesapemail.Text = email.ToString();
                lblrol.Text = rol.ToString();
                lblhatirlatmasoru.Text = hatirlatmasoru.ToString();
            }
            else
            {
                pnlhesapkullanici.Visible = false;
                pnlhesap2.Visible = true;
                lblhesapilkbilgi.Text = "Kaydınızı ilk yaptığınızda hesap bilgileriniz gözükmeyecektir. Hesap bilgilerinizi görmek için lütfen hesabınızdan çıkış yapıp tekrar giriniz...";
            }

        }


    }
}