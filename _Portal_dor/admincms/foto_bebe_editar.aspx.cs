using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class admincms_ogrupo_criar : System.Web.UI.Page
{

    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int id_conteudo = Convert.ToInt32(Request.QueryString["id"]);
            var foto_bebe = (from f in cnDor.TB_FOTO_BEBE where f.id_foto == id_conteudo select f).FirstOrDefault();

            if (foto_bebe == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Erro", "alert('foto não encontrada);location.href='foto_bebe.aspx'", true);
                return;
            }

            txt_data.Text = foto_bebe.dt_nascimento.ToString("dd/MM/yyyy");
            txt_horanasciemnto.Text = foto_bebe.dt_nascimento.ToString("HH:mm");
            txt_NomeBebe.Text = foto_bebe.ds_nome_bebe;
            txtAltura.Text = foto_bebe.nu_estatura.ToString("0.00").Replace(".", ",");
            txtNomeMae.Text = foto_bebe.ds_nome_mae;
            txtNomePai.Text = foto_bebe.ds_nome_pai;
            txtObstreta.Text = foto_bebe.ds_obstreta;
            txtPediatra.Text = foto_bebe.ds_pediatra;
            txtPeso.Text = foto_bebe.nu_peso.ToString("0.00").Replace(".", ",");
            Image1.ImageUrl = "../images/foto_bebe/thumb/" + foto_bebe.ds_foto_thumb;
            Image2.ImageUrl = "../images/foto_bebe/" + foto_bebe.ds_foto_bebe;
 
            drpHospital.DataSource = (from p in cnDor.TB_HOSPTIAL_FOTO_BEBE
                                      join h in cnDor.TB_HOSPITAL on p.id_hospital equals h.id_hospital
                                      where h.id_status == 1
                                      select new { h.nm_hospital, h.id_hospital }).ToList();
            drpHospital.DataTextField = "nm_hospital";
            drpHospital.DataValueField = "id_hospital";
            drpHospital.SelectedValue = foto_bebe.id_hospital.ToString();
            drpHospital.DataBind();

        }//fim do if !Page.IsPostBack
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
    protected string uploadimagem(){
            //se selecionou uma outra imagem;
            string imagem; 
            string erro_foto = "";
            string nomeArq = DateTime.Now.Ticks.ToString();
            nomeArq = GetStringNoAccents(nomeArq).Replace(" ", "_");
            nomeArq = nomeArq + System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
            string autorizado1 = "";
            string caminho = Server.MapPath("~/images/foto_bebe/thumb/");
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
                erro_foto = "Não foi possivel gravar este conteúdo:<br />"+erro_foto + autorizado1;
                return "erro";
            }//fim do else
    }

    protected string uploadimagem2()
    {
        //se selecionou uma outra imagem;
        string imagem;
        string erro_foto = "";
        string nomeArq = DateTime.Now.Ticks.ToString();
        nomeArq = GetStringNoAccents(nomeArq).Replace(" ", "_");
        nomeArq = nomeArq + System.IO.Path.GetExtension(FileUpload2.FileName).ToLower();
        string autorizado1 = "";
        string caminho = Server.MapPath("~/images/foto_bebe/");
        string extensao = System.IO.Path.GetExtension(FileUpload2.FileName).ToLower();
        int tamanho_kb = FileUpload2.PostedFile.ContentLength;
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
                FileUpload2.SaveAs(caminho + nomeArq);
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

    //protected string uploadimagem3()
    //{
    //    //se selecionou uma outra imagem;
    //    string imagem;
    //    string erro_foto = "";
    //    string nomeArq = DateTime.Now.Ticks.ToString();
    //    nomeArq = GetStringNoAccents(nomeArq).Replace(" ", "_");
    //    nomeArq = nomeArq + System.IO.Path.GetExtension(FileUpload3.FileName).ToLower();
    //    string autorizado1 = "";
    //    string caminho = Server.MapPath("~/images/foto_bebe/retrato/");
    //    string extensao = System.IO.Path.GetExtension(FileUpload3.FileName).ToLower();
    //    int tamanho_kb = FileUpload3.PostedFile.ContentLength;
    //    //verifica a extensão do arquivo.
    //    if (extensao == ".jpg" || extensao == ".jpeg" || extensao == ".gif" || extensao == ".png")
    //    {
    //        //verifica o tamanho em kb
    //        if (tamanho_kb > 6553600) { autorizado1 = autorizado1 + "Imagem: Não São permitidos arquivos maiores que 800 KB.<br />"; }//fim do if
    //    }//fim do if
    //    //se a extensão não for permitida grava o erro na string.
    //    else { autorizado1 = autorizado1 + "Imagem: Extensão não permitida.<br />"; }//fim do else
    //    //verifica se há algum erro.
    //    if (autorizado1 == "")
    //    {
    //        //salva o arquivo e exibe mensagem de sucesso.
    //        try
    //        {
    //            //FileInfo TheFile = new FileInfo(MapPath("../") + "/images/" + imagem);
    //            //File.Delete(MapPath("../") + "/images/" + imagem);
    //            FileUpload3.SaveAs(caminho + nomeArq);
    //            imagem = nomeArq;
    //            return imagem;
    //        }//fim do try
    //        //se houver algum erro na hora de salvar o arquivo grava na srting erro.
    //        catch (Exception ex)
    //        {
    //            autorizado1 = autorizado1 + "Imagem: " + ex.Message + "<br />";
    //            erro_foto = erro_foto + autorizado1;
    //            lbl_erro.Text = erro_foto;
    //            return "erro";
    //        }//fim do catch
    //    }//fim do if
    //    //exibe na tela se houver algum erro gravado na string erro.
    //    else
    //    {
    //        //Response.Write(@"<script>alert('Autorizado foto1: " + autorizado1 + "');</script>");
    //        erro_foto = "Não foi possivel gravar este conteúdo:<br />" + erro_foto + autorizado1;
    //        return "erro";
    //    }//fim do else
    //}


    
    protected void Button1_Click(object sender, EventArgs e)
    { 
        int usuario = Convert.ToInt32(Session.Contents["iduser"]);
        int id_idioma = Convert.ToInt32(Session.Contents["idioma"]);
        DateTime data = Convert.ToDateTime(txt_data.Text);
        string conteudo = "";
        string imagem = "", imagem2 = "", imagem3 = "";
        string sfile = null;
        bool erro = false;
        if(FileUpload1.HasFile){
            string upload = uploadimagem();
            if (upload != "erro")
            {
                imagem = upload;
            }//fim do if upload!="erro"
            else {
                erro = true;
            }
        }//fim do if FileUpload1.HasFile
        if (FileUpload2.HasFile)
        {
            string upload = uploadimagem2();
            if (upload != "erro")
            {
                imagem2 = upload;
            }//fim do if upload!="erro"
            else
            {
                erro = true;
            }
        }//fim do if FileUpload1.HasFile
        //if (FileUpload3.HasFile)
        //{
        //    string upload = uploadimagem3();
        //    if (upload != "erro")
        //    {
        //        imagem3 = upload;
        //    }//fim do if upload!="erro"
        //    else
        //    {
        //        erro = true;
        //    }
        //}//fim do if FileUpload1.HasFile
        if (erro == false)
        {
            try
            {
                DateTime datanascimento;
                try
                {
                    datanascimento = Convert.ToDateTime(txt_data.Text + " " + txt_horanasciemnto.Text);
                }
                catch
                {
                    throw new Exception("Data ou Hora de Nascimento Inválida");
                }
                int id_conteudo = Convert.ToInt32(Request.QueryString["id"]);
                var foto_bebe = (from f in cnDor.TB_FOTO_BEBE where f.id_foto == id_conteudo select f).FirstOrDefault();
                if (imagem2 != "")
                {
                    excluir_imagem("images/foto_bebe/" + foto_bebe.ds_foto_bebe);
                    foto_bebe.ds_foto_bebe = imagem2;
                }
                if (imagem3 != "")
                {
                    excluir_imagem("images/foto_bebe/retrato/" + foto_bebe.ds_foto_retrato);
                    foto_bebe.ds_foto_retrato = imagem3;
                }
                if (imagem != "")
                {
                    excluir_imagem("images/foto_bebe/thumb/" + foto_bebe.ds_foto_thumb);
                    foto_bebe.ds_foto_thumb = imagem;
                }
                foto_bebe.ds_nome_bebe = txt_NomeBebe.Text; ;
                foto_bebe.ds_nome_mae = txtNomeMae.Text;
                foto_bebe.ds_nome_pai = txtNomePai.Text;
                foto_bebe.ds_obstreta = txtObstreta.Text;
                foto_bebe.ds_pediatra = txtPediatra.Text;
                foto_bebe.dt_cadastro = System.DateTime.Now;
                foto_bebe.dt_nascimento = datanascimento;
                foto_bebe.fg_status = 1;
                try
                {
                    foto_bebe.nu_estatura = Convert.ToDouble(txtAltura.Text);
                }
                catch
                {
                    throw new Exception("Estatura Inválida");
                }
                try
                {
                    foto_bebe.nu_peso = Convert.ToDouble(txtPeso.Text);
                }
                catch
                {
                    throw new Exception("Peso Inválida");
                }
                foto_bebe.id_hospital = Convert.ToInt32(drpHospital.SelectedValue);


                cnDor.SaveChanges();
                //ClientScript.RegisterStartupScript(this.GetType(), "Sucesso", "alert('Notícia Gravada com sucesso!');location.href='portal_noticias.aspx'", true);
                Response.Write(@"<script>alert('Foto Gravada com sucesso!');location.href='foto_bebe.aspx'</script>");
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Erro", "alert('Não foi possivel gravar esta foto \nErro: " + ex.Message + "');", true);
            }
        }//fim do if
        else {
            lbl_erro.Text = "Algum erro";
        }
    }

    protected void excluir_imagem(string file)
    {
        if (!String.IsNullOrEmpty(file))
        {
            try
            {
                FileInfo TheFile = new FileInfo(MapPath("../") + file);
                File.Delete(MapPath("../") + file);
            }
            catch { }
        }

    }

}