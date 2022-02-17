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

public partial class quem_somos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            
            DataSet1TableAdapters.tb_texto_dnaTableAdapter paginas = new DataSet1TableAdapters.tb_texto_dnaTableAdapter();
            DataTable tb00 = paginas.Get_select_texto();
            if (tb00.Rows.Count > 0) {
                string titulo = "Revista DNA";
                string conteudo = (string)tb00.Rows[0]["conteudo"];
                lbl_titulo.Text = titulo;
                Literal1.Text = conteudo;
            }//fim if tb00
        }//fim do if Page.IsPostBack
    }
}
