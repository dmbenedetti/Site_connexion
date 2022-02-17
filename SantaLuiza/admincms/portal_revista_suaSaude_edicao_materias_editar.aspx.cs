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
                txt_titulo.Text = materia.nm_titulo;
                txt_resumo.Text = materia.ds_resumo;
                txt_sessao.Text = materia.ds_sessao_revista;
                FCKeditor1.Value = materia.ds_conteudo;
                Boolean destaque =Convert.ToBoolean(materia.ds_materiaDestaque);
               
                if (materia.ds_imgDestaque == "" || materia.ds_imgDestaque == null)
                {
                    Image1.ImageUrl = "../Revista_SuaSaude/materias/destaque_default.jpg";
                    LinkButton1.Visible = false;
                }
                else
                {
                    Image1.ImageUrl = "../Revista_SuaSaude/materias/" + materia.ds_imgDestaque;
                    LinkButton1.Visible = true;
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
    protected string uploadimagem()
    {
        //se selecionou uma outra imagem;
        string imagem;
        string erro_foto = "";
        string nomeArq = DateTime.Now.Ticks.ToString();
        nomeArq = GetStringNoAccents(nomeArq).Replace(" ", "_");
        nomeArq = nomeArq + System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
        string autorizado1 = "";
        string caminho = Server.MapPath("~/Revista_SuaSaude/materias/");
        string extensao = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
        int tamanho_kb = FileUpload1.PostedFile.ContentLength;
        //verifica a extensão do arquivo.
        if (extensao == ".jpg" || extensao == ".jpeg" || extensao == ".gif" || extensao == ".png")
        {
            //verifica o tamanho em kb
            if (tamanho_kb > 6553600) { autorizado1 = autorizado1 + "Imagem: Não São permitidos arquivos maiores que 800 KB.<br />"; }//fim do if
        }//fim do if
        //se a extensão não for permitida grava o erro na string.
        else { autorizado1 = autorizado1 + "Imagem: Extensão não permitida.<br />"; }//fim do else
        //verifica se há algum erro.
        if (autorizado1 == "")
        {
            //salva o arquivo e exibe mensagem de sucesso.
            try
            {
                //FileInfo TheFile = new FileInfo(MapPath("../") + "/images/" + imagem);
                //File.Delete(MapPath("../") + "/images/" + imagem);
                FileUpload1.SaveAs(caminho + nomeArq);
                imagem = nomeArq;
                return imagem;
            }//fim do try
            //se houver algum erro na hora de salvar o arquivo grava na srting erro.
            catch (Exception ex)
            {
                autorizado1 = autorizado1 + "Imagem: " + ex.Message + "<br />";
                erro_foto = erro_foto + autorizado1;
                lbl_erro.Text = erro_foto;
                return "erro";
            }//fim do catch
        }//fim do if
        //exibe na tela se houver algum erro gravado na string erro.
        else
        {
            //Response.Write(@"<script>alert('Autorizado foto1: " + autorizado1 + "');</script>");
            erro_foto = "Não foi possivel gravar este conteúdo:<br />" + erro_foto + autorizado1;
            return "erro";
        }//fim do else
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
        string titulo = txt_titulo.Text;
        string resumo = txt_resumo.Text;
        string conteudo = FCKeditor1.Value;
        string imagem = "";
        
        bool erro = false;
        /**/
        if (FileUpload1.HasFile)
        {
            string upload = uploadimagem();
            if (upload != "erro")
            {
                imagem = upload;
            }//fim do if upload!="erro"
            else
            {
                erro = true;
            }
        }//fim do if FileUpload1.HasFile
        if (erro == false)
        {
            try
            {
                var materia = (from n in cnDor.TB_PORTAL_CONTEUDO where n.id_conteudo == id_conteudo select n).FirstOrDefault();
                materia.nm_titulo = txt_titulo.Text;
                materia.ds_resumo = txt_resumo.Text;
                materia.ds_conteudo = FCKeditor1.Value;
                string imagem_old = materia.ds_imgDestaque;//pega o nome da imagem antiga pra remover da pasta 
                if (FileUpload1.HasFile)
                {
                    if (imagem_old == null || imagem_old == "")
                    {
                        
                    }
                    else {
                        excluir_imagem();
                    }
                    //define a nova imagem
                    materia.ds_imgDestaque = imagem;
                }//fim do if FileUpload1.HasFile
                materia.nm_titulo_fonetico = iFonetizar.Fonetizar(materia.nm_titulo, false);
                materia.ds_resumo_fonetico = iFonetizar.Fonetizar(materia.ds_resumo, false);
                materia.ds_conteudo_fonetico = iFonetizar.Fonetizar(materia.ds_conteudo, false);
                cnDor.SaveChanges();
                Response.Write(@"<script>alert('Matéria Alterada com sucesso.');location.href='portal_revista_suaSaude_edicao_materias.aspx?id=" + materia.nr_edicaorevista.ToString() + "'</script>");
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Erro", "alert('Não foi possivel gravar este conteúdo \nErro: " + ex.Message + "');", true);
            }
        }//fim do if
        else
        {
            lbl_erro.Text = "Algum erro";
        }




    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        int id_conteudo = Convert.ToInt32(Request.QueryString["id"]);

        var materia = (from n in cnDor.TB_PORTAL_CONTEUDO
                       where n.id_conteudo == id_conteudo 
                       select n).FirstOrDefault();
        string imagem = materia.ds_imgDestaque;
        if (imagem != "" || imagem != null)
        {
            FileInfo TheFile = new FileInfo(MapPath("../") + "/Revista_SuaSaude/materias/" + imagem);
            File.Delete(MapPath("../") + "/Revista_SuaSaude/materias/" + imagem);
        }
        LinkButton1.Visible = false;
        Image1.ImageUrl = "../Revista_SuaSaude/materias/destaque_default.jpg";
        materia.ds_imgDestaque = null;
        cnDor.SaveChanges();
    }
}