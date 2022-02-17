using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class MasterPage : System.Web.UI.MasterPage
{
    public string imagem_destque = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            DataSet1TableAdapters.tb_paginasTableAdapter paginas = new DataSet1TableAdapters.tb_paginasTableAdapter();
            DataTable tb00 = paginas.Get_select_id(id);
            if (tb00.Rows.Count > 0)
            {
                string imagem = "";
                string link_imagem = "";
                int tipo = Convert.ToInt32(tb00.Rows[0]["tipo"]);
                int id_tipo = Convert.ToInt32(tb00.Rows[0]["id_tipo"]);



                int subpagina = Convert.ToInt32(tb00.Rows[0]["subpagina"]);
                int pagina_mae = Convert.ToInt32(tb00.Rows[0]["pagina_mae"]);

                if (subpagina == 1)
                {

                    DataTable tb01 = paginas.Get_select_id(pagina_mae);
                    imagem = (string)tb01.Rows[0]["imagem_destaque"];
                    link_imagem = (string)tb01.Rows[0]["link_imagem_destaque"];
                }//fim do if subpagian==1
                else
                {
                    imagem = (string)tb00.Rows[0]["imagem_destaque"];
                    link_imagem = (string)tb00.Rows[0]["link_imagem_destaque"];
                }
                if (id == 0 || id == null)
                {
                    imagem = "destaque_home.png";
                    link_imagem = "#";
                }



                imagem_destque = "<a href='" + link_imagem + "'><img src='images/destaque_home/" + imagem + "' width=1015 height=249 /></a>";

            }//fim if tb00
            else
            {
                string imagem = "";
                string link_imagem = "";
                imagem = "destaque_home.png";
                link_imagem = "#";




                imagem_destque = "<a href='" + link_imagem + "'><img src='images/destaque_home/" + imagem + "' width=1015 height=249 /></a>";

            }
        }//fim do if Page.IsPostBack
        else {
            string imagem = "";
            string link_imagem = "";
            imagem = "destaque_home.png";
            link_imagem = "#";




            imagem_destque = "<a href='" + link_imagem + "'><img src='images/destaque_home/" + imagem + "' width=1015 height=249 /></a>";
        }
    }
   
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string busca = TextBox1.Text;
        Response.Redirect("resultados.aspx?pesquisa=" + busca);
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        string busca = TextBox1.Text;
        Response.Redirect("resultados.aspx?pesquisa=" + busca);
    }
}
