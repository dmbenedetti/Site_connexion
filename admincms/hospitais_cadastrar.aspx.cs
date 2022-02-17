using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincms_hospitais_editar : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {

            chb_especialidades.DataSource = cnDor.TB_EPSECIALIDADE.Where(x => x.id_status == 1).ToList();
            chb_especialidades.DataTextField = "nm_especialidade";
            chb_especialidades.DataValueField = "id_especialidade";
            chb_especialidades.DataBind();

            chb_exames.DataSource = cnDor.TB_EXAME.Where(x => x.id_status == 1).ToList();
            chb_exames.DataTextField = "nm_exame";
            chb_exames.DataValueField = "id_exame";
            chb_exames.DataBind();

            chb_ps.DataSource = cnDor.TB_PRONTOSOCORRO.Where(x => x.id_status == 1).ToList();
            chb_ps.DataTextField = "nm_prontosocorro";
            chb_ps.DataValueField = "id_prontosocorro";
            chb_ps.DataBind();

        }//fim do if !Page.IsPostBack)
    }

    protected void drp_Estado_PreRender(object sender, EventArgs e)
    {
        drp_Estado.Items.Remove("");
        drp_Estado.Items.Insert(0, "");
    }
    protected void insere_especialidade(int id_especialidade, int id_hospital) {
        db_rede_dorModel.TB_ESPECIALIDADE_HOSPITAL novaEspecialidade = new db_rede_dorModel.TB_ESPECIALIDADE_HOSPITAL();
        novaEspecialidade.id_hospital = id_hospital;
        novaEspecialidade.id_especialidade = id_especialidade;
        cnDor.AddToTB_ESPECIALIDADE_HOSPITAL(novaEspecialidade);
        cnDor.SaveChanges();
    }
    protected void insere_exame(int id_exame, int id_hospital)
    {
        db_rede_dorModel.TB_EXAME_HOSPITAL novoExame = new db_rede_dorModel.TB_EXAME_HOSPITAL();
        novoExame.id_hospital = id_hospital;
        novoExame.id_exame = id_exame;
        cnDor.AddToTB_EXAME_HOSPITAL(novoExame);
        cnDor.SaveChanges();
    }
    protected void insere_PS(int id_ps, int id_hospital)
    {
        db_rede_dorModel.TB_PRONTOSOCORRO_HOSPITAL novoPS = new db_rede_dorModel.TB_PRONTOSOCORRO_HOSPITAL();
        novoPS.id_hospital = id_hospital;
        novoPS.id_prontosocorro = id_ps;
        cnDor.AddToTB_PRONTOSOCORRO_HOSPITAL(novoPS);
        cnDor.SaveChanges();
    }
    
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        db_rede_dorModel.TB_HOSPITAL novoHospital = new db_rede_dorModel.TB_HOSPITAL();
        novoHospital.nm_hospital = txt_nome.Text;
        novoHospital.ds_hospital = txt_descricao.Text;
        novoHospital.ds_site_hospital = txt_site.Text;
        novoHospital.id_estado = Convert.ToInt32(drp_Estado.SelectedValue);
        novoHospital.ds_endereco_hospital = txt_endereco.Text;
        novoHospital.nr_telefone_hospital = txt_telefone.Text;
        novoHospital.id_status = 1;
        
        try
        {
            cnDor.AddToTB_HOSPITAL(novoHospital);
            cnDor.SaveChanges();
        }catch(Exception ex) {
            ClientScript.RegisterStartupScript(this.GetType(), "Erro", "alert('Não foi possivel gravar a monitoria. Por favor tente novamente mais tarde. Se ocorrer novamente informe o Desenvolvedor')", true);
        }
        var hospital = cnDor.TB_HOSPITAL.OrderByDescending(x=>x.id_hospital).FirstOrDefault();
        try{
        if (hospital != null)
        {
            int id_hospital = hospital.id_hospital;
            //percorre o checkboxlist de especialidades e insere na tabela especialidade_hospital os itens selecionados
            for (int j = 0; chb_especialidades.Items.Count > j; j++)
            {//percorre todos os itens
                if (chb_especialidades.Items[j].Selected == true) //se estiver selecionado insere na tabela
                {
                    int id_especialidade = Convert.ToInt32(chb_especialidades.Items[j].Value);
                    insere_especialidade(id_especialidade, id_hospital);
                }
            }//fim do for

            //percorre o checkboxlist de exames e insere na tabela exames_hospital os itens selecionados
            for (int j = 0; chb_exames.Items.Count > j; j++)
            {//percorre todos os itens
                if (chb_exames.Items[j].Selected == true) //se estiver selecionado insere na tabela
                {
                    int id_exame = Convert.ToInt32(chb_exames.Items[j].Value);
                    insere_exame(id_exame, id_hospital);
                }
            }//fim do for

            //percorre o checkboxlist de prontosocorro e insere na tabela prontosocorro_hospital os itens selecionados
            for (int j = 0; chb_ps.Items.Count > j; j++)
            {//percorre todos os itens
                if (chb_ps.Items[j].Selected == true) //se estiver selecionado insere na tabela
                {
                    int id_ps = Convert.ToInt32(chb_ps.Items[j].Value);
                    insere_PS(id_ps, id_hospital);
                }
            }//fim do for

        }//fim do if hospital != null
        ClientScript.RegisterStartupScript(this.GetType(), "sucesso", "alert('Hospital cadastrado com sucesso!');location.href='hospitais.aspx';", true);
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "erro", "alert('Não foi possivel cadastrar. Erro:"+ex.Message+"')", true);
        }
        
    }
}