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
        if (!Page.IsPostBack) {
            int id_matéria = Convert.ToInt32(Request.QueryString["id"]);
            var materia = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_conteudo == id_matéria).FirstOrDefault();
            if (materia != null) {
                lbl_nr_edicao.Text =materia.TB_PORTAL_EDICAO_REVISTA.nr_edicao.ToString();
                lbl_titulo.Text = materia.nm_titulo;
                if (materia.ds_imgDestaque == "" || materia.ds_imgDestaque == null)
                {
                    Image1.ImageUrl = "../Revista_SuaSaude/materias/destaque_default.jpg";
                }
                else
                {
                    Image1.ImageUrl = "../Revista_SuaSaude/materias/" + materia.ds_imgDestaque;
                }

            }//fim do if edicao != null
        }//fim do if postback
    }
    public static string GetStringNoAccents(string str)
    {

        /** Troca os caracteres acentuados por não acentuados **/
        string[] acentos = new string[] { "ç", "Ç", "á", "é", "í", "ó", "ú", "ý", "Á", "É", "Í", "Ó", "Ú", "Ý", "à", "è", "ì", "ò", "ù", "À", "È", "Ì", "Ò", "Ù", "ã", "õ", "ñ", "ä", "ë", "ï", "ö", "ü", "ÿ", "Ä", "Ë", "Ï", "Ö", "Ü", "Ã", "Õ", "Ñ", "â", "ê", "î", "ô", "û", "Â", "Ê", "Î", "Ô", "Û" };
        string[] semAcento = new string[] { "c", "C", "a", "e", "i", "o", "u", "y", "A", "E", "I", "O", "U", "Y", "a", "e", "i", "o", "u", "A", "E", "I", "O", "U", "a", "o", "n", "a", "e", "i", "o", "u", "y", "A", "E", "I", "O", "U", "A", "O", "N", "a", "e", "i", "o", "u", "A", "E", "I", "O", "U" };

        for (int i = 0; i < acentos.Length; i++)
        {
            str = str.Replace(acentos[i], semAcento[i]);
        }

        /** Troca os caracteres especiais da string por "" **/
        string[] caracteresEspeciais = { "\\.", ",", "-", ":", "\\(", "\\)", "ª", "\\|", "\\\\", "°" };

        for (int i = 0; i < caracteresEspeciais.Length; i++)
        {
            str = str.Replace(caracteresEspeciais[i], "");
        }

        /** Troca os espaços no início por "" **/
        str = str.Replace("^\\s+", "");
        /** Troca os espaços no início por "" **/
        str = str.Replace("\\s+$", "");
        /** Troca os espaços duplicados, tabulações e etc por  " " **/
        str = str.Replace("\\s+", " ");
        return str;

    }
   
    protected void excluir_imagem()
    {
        int id_matéria = Convert.ToInt32(Request.QueryString["id"]);
        var materia = cnDor.TB_PORTAL_CONTEUDO.Where(x => x.id_conteudo == id_matéria).FirstOrDefault();
        if (materia != null)
        {
            var imagem = materia.ds_imgDestaque;
            if (imagem != "" || imagem != null)
            {
                FileInfo TheFile = new FileInfo(MapPath("../") + "/Revista_SuaSaude/materias/" + imagem);
                File.Delete(MapPath("../") + "/Revista_SuaSaude/materias/" + imagem);
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int id_conteudo = Convert.ToInt32(Request.QueryString["id"]);
        string imagem = "";
        try{

                var materia = (from n in cnDor.TB_PORTAL_CONTEUDO where n.id_conteudo == id_conteudo select n).FirstOrDefault();
                string imagem_old = materia.ds_imgDestaque;//pega o nome da imagem antiga pra remover da pasta 
                
                    if (imagem_old == null || imagem_old == "")
                    {
                        
                    }
                    else {
                        excluir_imagem();
                    }
                    string nr_edicao = materia.nr_edicaorevista.ToString();
                cnDor.DeleteObject(materia);
                cnDor.SaveChanges();
                Response.Write(@"<script>alert('Matéria Excluída com sucesso.');location.href='portal_revista_suaSaude_edicao_materias.aspx?id=" + nr_edicao + "'</script>");
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Erro", "alert('Não foi possivel excluir este conteúdo \nErro: " + ex.Message + "');", true);
            }
    }
    
}