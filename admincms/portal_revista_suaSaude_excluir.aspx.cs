using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class admincms_ogrupo : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int id_edicao = Convert.ToInt32(Request.QueryString["id"]);
            var edicao = cnDor.TB_PORTAL_EDICAO_REVISTA.Where(x => x.id_edicao == id_edicao).FirstOrDefault();
            if (edicao != null)
            {
                Label1.Text = edicao.nr_edicao.ToString();
                lbl_nr.Text = edicao.nr_edicao.ToString();
                Image1.ImageUrl = "../Revista_SuaSaude/" + edicao.ds_imagem;
            }//fim do if edicao!=null
        }//fim do if postback

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int id_edicao = Convert.ToInt32(Request.QueryString["id"]);
        var edicao = cnDor.TB_PORTAL_EDICAO_REVISTA.Where(x => x.id_edicao == id_edicao).FirstOrDefault();
        try
        {
            //cria uma lista com as materias relacionadas a edição da revista.
            var materias = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_tipo == 9 && x.id_sessao == 3 && x.nr_edicaorevista == id_edicao).ToList();
            //percorre as matérias da edição e exclui uma a uma.
            for (int i = 0; materias.Count > i; i++)
            {
                int id_cont = materias[i].id_conteudo;
                var mat = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_conteudo == id_cont).FirstOrDefault();
                //mat.id_status = 2;
                cnDor.DeleteObject(mat);
                cnDor.SaveChanges();
                Response.Write(@"<script>alert('" + id_cont.ToString()+ "')</script>");
            }//fim do For
            //exclui o arquivo pdf da edição.
            string arquivo_old = edicao.ds_arquivo;
            FileInfo TheFile = new FileInfo(MapPath("../") + "/Revista_SuaSaude/" + arquivo_old);
            File.Delete(MapPath("../") + "/Revista_SuaSaude/" + arquivo_old);
            //exclui a imagemd a capa da edição.
            string imagem_old = edicao.ds_imagem;
            TheFile = new FileInfo(MapPath("../") + "/Revista_SuaSaude/" + imagem_old);
            File.Delete(MapPath("../") + "/Revista_SuaSaude/" + imagem_old);
            //edicao.id_status = 2;
            cnDor.DeleteObject(edicao);
            cnDor.SaveChanges();
            Response.Write(@"<script>alert('Edição alterada com sucesso!');location.href='portal_revista_suaSaude.aspx'</script>");
        }
        catch (Exception ex)
        {
            Response.Write(@"<script>alert('Não foi possivel Excluir a Edição.\n Erro:" + ex.Message + "')</script>");
        }
    }
}