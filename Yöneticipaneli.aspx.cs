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
    public partial class adminpaneli : System.Web.UI.Page
    {
        SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings[0].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

            lblrol.Visible = false;

            object rol = Session["rol"];
            lblrol.Text = rol.ToString();
            if (lblrol.Text == "Yönetici")
            {
                pnlmoderatorlericinuyeler.Visible = false;
                pnlyoneticilericinuyeler.Visible = true;
            }
            else if (lblrol.Text == "Moderatör")
            {
                pnlmoderatorlericinuyeler.Visible = true;
                pnlyoneticilericinuyeler.Visible = false;
            }
            else
            {
                pnlmoderatorlericinuyeler.Visible = false;
                pnlyoneticilericinuyeler.Visible = false;
            }
        }
    }
}