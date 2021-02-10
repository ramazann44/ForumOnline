using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Forrumonline
{
    public partial class main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            pnlyönetici.Visible = false;

            object rol = Session["rol"];
            object kullanici = Session["kullaniciadi"];
            if (kullanici != null)
            {
                lblrol.Visible = false;
                lblrol.Text = rol.ToString();
                if (lblrol.Text == "Yönetici" || lblrol.Text=="Moderatör")
                {
                    pnlyönetici.Visible = true;
                }
                else
                {
                    pnlyönetici.Visible = false;
                }
                pnlgirisyap.Visible = false;
                pnlforumyaz.Visible = true;
                pnlkaydol.Visible = false;
                pnlhesapbilgileri.Visible = true;
                pnlmesajlas.Visible = true;
                pnlcikisyap.Visible = true;
            }
            else
            {
                pnlkaydol.Visible = true;
                pnlforumyaz.Visible = false;
                lblrol.Visible = false;
                pnlhesapbilgileri.Visible = false;
                pnlmesajlas.Visible = false;
                pnlcikisyap.Visible = false;
            }


        }

        protected void btncikis_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Forumlar.aspx");
        }
    }
}