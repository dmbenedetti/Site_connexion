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
using System.IO;

public partial class admin_galeria_excluir_foto : System.Web.UI.Page
{
    public string nome_pagina;
    public int id_prod_banco;

    public string carregadados(string id)
    {
        int id_pag = Convert.ToInt32(id);
        DataSet1TableAdapters.tb_galeriaTableAdapter delete_foto = new DataSet1TableAdapters.tb_galeriaTableAdapter();
        DataTable tb2 = delete_foto.Get_select_id(id_pag);


        if (tb2.Rows.Count > 0)
        {
            nome_pagina = (string)tb2.Rows[0]["nome_arquivo"];
            img.ImageUrl = "~/images/galeria/" + nome_pagina;
            //id_prod_banco = (int)tb2.Rows[0]["id_prod"];
        }



        return "ok";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        string id_pag = Request["id"];
        if (!Page.IsPostBack)
        {
            carregadados(id_pag);
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {

        string id_pag1 = Request["id"];
        int id_pag = Convert.ToInt32(id_pag1);
        string foto_caminho = img.ImageUrl;
        string nome_foto = "";
        int id_paginas = 0;

        DataSet1TableAdapters.tb_galeriaTableAdapter delete_foto = new DataSet1TableAdapters.tb_galeriaTableAdapter();
        DataTable tb2 = delete_foto.Get_select_id(id_pag);


        if (tb2.Rows.Count > 0)
        {
            nome_foto = (string)tb2.Rows[0]["nome_arquivo"];
            id_paginas = Convert.ToInt32(tb2.Rows[0]["id_pg"]);
        }
        FileInfo TheFile = new FileInfo(MapPath("../") + "/images/galeria/" + nome_foto);
        delete_foto.Delete_foto(id_pag);
        File.Delete(MapPath("../") + "/images/galeria/" + nome_foto);
        Response.Write(@"<script>alert('Foto Excluída com sucesso!');location.href='editar_galerias.aspx?id=" + Convert.ToString( id_paginas) + "';</script>");

    }
}
