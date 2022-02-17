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
public partial class admin_Fotobb_texto : System.Web.UI.Page
{
    //função que exclui a foto pelo id e pelo nome dos arquivos
    //Criado por: Diego Sousa
    //Data Criação:13/06/2011
    public string apagar_arquivo_registro(int id, string foto1, string foto2){
        DataSet1TableAdapters.tb_fotosbbTableAdapter foto = new DataSet1TableAdapters.tb_fotosbbTableAdapter();
        if (foto2 == "" || foto2 == null)
        {
            FileInfo TheFile = new FileInfo(MapPath("../") + "/fotosbb/" + foto1);
            File.Delete(MapPath("../") + "/fotosbb/" + foto1);
        }//fim do if
        else
        {
            FileInfo TheFile = new FileInfo(MapPath("../") + "/fotosbb/" + foto1);
            FileInfo TheFile2 = new FileInfo(MapPath("../") + "/fotosbb/" + foto2);
            File.Delete(MapPath("../") + "/fotosbb/" + foto1);
            File.Delete(MapPath("../") + "/fotosbb/" + foto2);
        }//fim do else
        foto.Delete_fotobb(id);
        return "ok";
    }

    //Função que verifica as fotos que passaram 30 dias da data de saída
    //Criado por: Diego Sousa
    //Data Criação:13/06/2011
    public string apagar_fotos_antigas()
    {
        DataSet1TableAdapters.tb_fotosbbTableAdapter fotos = new DataSet1TableAdapters.tb_fotosbbTableAdapter();
        DataTable tb_apagar = fotos.Get_select_all();
        if (tb_apagar.Rows.Count > 0) {
            int qtde_linhas = tb_apagar.Rows.Count;
            DateTime data_hoje = DateTime.Now.Date;
            //Response.Write("data_hj -" + data_hoje.ToString("dd/MM/yyyy") + "<br />");
            for (int i = 0; i < qtde_linhas; i++) {
                DateTime data_saida = Convert.ToDateTime(tb_apagar.Rows[i]["data_saida"]);
                data_saida = data_saida.AddDays(30);
                int id_foto = Convert.ToInt32(tb_apagar.Rows[i]["id"]);
                string foto1 = (string)tb_apagar.Rows[i]["foto1"] ;
                string foto2 = (string)tb_apagar.Rows[i]["foto2"];
                if (data_hoje > data_saida)
                {
                    //chama a função que apaga o registro do banco e exclui os arquivos da pasta.
                    apagar_arquivo_registro(id_foto, foto1, foto2);

                }//fim do if
            }//fim do for
        }//fim do if
        return "apagado";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            //função que verifica e exclui as fotos que ultrapassaram 30 dias do prazo de expiração
            apagar_fotos_antigas();

            DataSet1TableAdapters.tb_fotosbbTableAdapter fotos = new DataSet1TableAdapters.tb_fotosbbTableAdapter();
            DataTable tb00 = fotos.Get_select_orderby_desc();
            GridView1.DataSource = tb00;
            GridView1.DataBind();
            GridView1.Visible = true;
        }//fim do if page.ispostback
    }

    protected void GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        DataSet1TableAdapters.tb_fotosbbTableAdapter fotos = new DataSet1TableAdapters.tb_fotosbbTableAdapter();
        DataTable tb00 = fotos.Get_select_orderby_desc();
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataSource = tb00;
            GridView1.DataBind();
            GridView1.Visible = true;
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Fotobb_fotos_inserir.aspx");
    }

}
