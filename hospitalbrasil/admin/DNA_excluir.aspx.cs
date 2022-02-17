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

public partial class admin_portal_excluir_pagina : System.Web.UI.Page
{
    public string carregadados(string id)
    {
        int id_pag = Convert.ToInt32(id);
        DataSet1TableAdapters.tb_dnaTableAdapter delete_foto = new DataSet1TableAdapters.tb_dnaTableAdapter();
        DataTable tb2 = delete_foto.Get_select_id_dna(id_pag);
        string nome_pagina = "";

        if (tb2.Rows.Count > 0)
        {
            nome_pagina = (string)tb2.Rows[0]["titulo"] + " Edição: " + Convert.ToInt32( tb2.Rows[0]["edicao"]);
            img.ImageUrl = "~/images/dna/" + (string)tb2.Rows[0]["imagem"];
            //id_prod_banco = (int)tb2.Rows[0]["id_prod"];
        }



        return "ok";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        int id=Convert.ToInt32(Request.QueryString["id"]);
        if (!Page.IsPostBack) {
            
            DataSet1TableAdapters.tb_dnaTableAdapter select_pagina = new DataSet1TableAdapters.tb_dnaTableAdapter();
            DataTable tb01 = select_pagina.Get_select_id_dna(id);
            lbl_pagina.Text = (string)tb01.Rows[0]["titulo"] + " Edição: " + Convert.ToInt32(tb01.Rows[0]["edicao"]);
            img.ImageUrl = "~/images/dna/" + (string)tb01.Rows[0]["imagem"];
        }//fim do if Page.IsPotBack
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {

        string id_pag1 = Request["id"];
        int id_pag = Convert.ToInt32(id_pag1);
        string foto_caminho = img.ImageUrl;
        string nome_foto = "";
        string nome_arquivo = "";

        DataSet1TableAdapters.tb_dnaTableAdapter delete_foto = new DataSet1TableAdapters.tb_dnaTableAdapter();
        DataTable tb2 = delete_foto.Get_select_id_dna(id_pag);


        if (tb2.Rows.Count > 0)
        {
            nome_foto = (string)tb2.Rows[0]["imagem"];
            nome_arquivo = (string)tb2.Rows[0]["arquivo"];
        }
        FileInfo TheFile = new FileInfo(MapPath("../") + "/images/dna/" + nome_foto);
        delete_foto.Deletearquivo(id_pag);
        File.Delete(MapPath("../") + "/images/dna/" + nome_foto);
        File.Delete(MapPath("../") + "/images/dna/" + nome_arquivo);

        Response.Write(@"<script>alert('Edição Excluída com sucesso!');location.href='dna.aspx';</script>");
      
    }
}
