using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class fotosbb : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int id_bb = Convert.ToInt32(Request.QueryString["id_bb"]);
            DataSet1TableAdapters.tb_fotosbbTableAdapter fotos = new DataSet1TableAdapters.tb_fotosbbTableAdapter();
            DataTable tb00 = fotos.Get_select_id(id_bb);
            if (tb00.Rows.Count > 0)
            {
                string nomebb = (string)tb00.Rows[0]["nome_bb"];
                string mae =  (string)tb00.Rows[0]["nome_mae"];
                string pai = (string)tb00.Rows[0]["nome_pai"];
                string foto1 = (string)tb00.Rows[0]["foto1"];
                string foto2 = (string)tb00.Rows[0]["foto2"];
                string peso = (string)tb00.Rows[0]["peso"];
                string altura = (string)tb00.Rows[0]["altura"];
                if (nomebb == "" || nomebb == null)
                {
                    lbl_nomebb.Text = "";
                }
                else
                {
                    lbl_nomebb.Text =  nomebb;
                }
                if (mae == "" || mae == null)
                {
                    lbl_nomemae.Text = "";
                }
                else
                {
                    lbl_nomemae.Text = mae;
                }
                if (pai == "" || pai == null)
                {
                    lbl_nome_pai.Text = "";
                }
                else
                {
                    lbl_nome_pai.Text = pai;
                }
                if (peso == "" || peso == null)
                {
                    lbl_peso.Text = "";
                }
                else
                {
                    lbl_peso.Text =  peso;
                }
                if (altura == "" || altura == null)
                {
                    lbl_altura.Text = "";
                }
                else
                {
                    lbl_altura.Text =  altura;
                }


                if (foto1 == "" || foto1 == null)
                {
                    lbl_fotos.Text = "";
                }
                else
                {
                    lbl_fotos.Text = "<a href=\"fotosbb/" + foto1 + "\" target=\"_blank\"><img src=\"fotosbb/" + foto1 + "\"></a>";
                }
                if (foto2 == "" || foto2 == null)
                {
                    lbl_fotos0.Text = "";
                }
                else {
                    lbl_fotos0.Text = "<a href=\"fotosbb/" + foto2 + "\" target=\"_blank\"><img src=\"fotosbb/" + foto2 + "\"></a>";
                }
            }
        }//fim do if page.ispostback
    }
    
}
