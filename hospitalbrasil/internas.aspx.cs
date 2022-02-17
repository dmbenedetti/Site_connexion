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
    public string sub_titulo;
    public string conteudo;
    public string link;
    public string link_ativo;
    public string size_fotos;
    public string caminho_fotos;

    public string carregafotos(string id)
    {
        int id_pag = Convert.ToInt32(id);

        DataSet1TableAdapters.tb_galeriaTableAdapter textos_select = new DataSet1TableAdapters.tb_galeriaTableAdapter();
        DataTable tb2 = textos_select.Get_select_id_pg(id_pag);
        size_fotos = Convert.ToString(tb2.Rows.Count);
        int contador = 0;
        int contador1 = 0;
        if (tb2.Rows.Count > 0)
        {
            while (contador < Convert.ToUInt32(size_fotos))
            {
                Int32 linha = Convert.ToInt32(contador);
                caminho_fotos = caminho_fotos + "'images/galeria/" + (string)tb2.Rows[linha]["nome_arquivo"] + "',";
                contador++;
            }//fim do while
        }//fim do if
        return "ok";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            int galeria = 0;
            DataSet1TableAdapters.tb_paginasTableAdapter paginas = new DataSet1TableAdapters.tb_paginasTableAdapter();
            DataTable tb00 = paginas.Get_select_id(id);
            if (tb00.Rows.Count > 0) {
                string titulo = (string)tb00.Rows[0]["titulo"];
                string conteudo = (string)tb00.Rows[0]["conteudo"];
                //galeria de fotos
                galeria = Convert.ToInt32(tb00.Rows[0]["galeria"]);
                if (galeria == 0)
                {
                    //ListView1.Visible = false;
                }
                else {
                    //ListView1.Visible = true;
                    carregafotos(id.ToString());
                }
                string imagem = "";
                string link_imagem = "";
                string url = (string)tb00.Rows[0]["url"];
                int tipo = Convert.ToInt32(tb00.Rows[0]["tipo"]);
                int id_tipo = Convert.ToInt32(tb00.Rows[0]["id_tipo"]);
                //se o tipo da página for igual a 1 a exibe o formulario
                if (tipo == 1) {
                    DataSet1TableAdapters.tb_formulariosTableAdapter formulario = new DataSet1TableAdapters.tb_formulariosTableAdapter();
                    DataTable tb01 = formulario.Get_select_id(id_tipo);
                    string pagina_redirect = (string)tb01.Rows[0]["pagina"] + "?id=" + id.ToString();
                    Response.Redirect(pagina_redirect);
                }
                else if (tipo == 2) {
                    Response.Redirect(url);
                }


                lbl_titulo.Text = titulo;
                Literal1.Text = conteudo;
            }//fim if tb00
        }//fim do if Page.IsPostBack
    }
}
