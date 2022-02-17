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


            int id_hospital = Convert.ToInt32(Request.QueryString["id"]);
            if (id_hospital == -1)
            {
                int.TryParse(Session["idHosp"].ToString(), out id_hospital);
            }
            var hospital = cnDor.TB_HOSPITAL.Where(x => x.id_hospital == id_hospital).FirstOrDefault();
            if (hospital != null) {
                lbl_hospital.Text = hospital.nm_hospital;
                txt_nome.Text = hospital.nm_hospital;
                txt_descricao.Text = hospital.ds_hospital;
                txt_endereco.Text = hospital.ds_endereco_hospital;
                drp_Estado.SelectedValue = hospital.id_estado.ToString();
                txt_site.Text = hospital.ds_site_hospital;
                txt_telefone.Text = hospital.nr_telefone_hospital;

                var especialidades = (from esp in cnDor.TB_ESPECIALIDADE_HOSPITAL
                                          join es in cnDor.TB_EPSECIALIDADE on esp.id_especialidade equals es.id_especialidade
                                          where esp.id_hospital == id_hospital
                                          select new{es.nm_especialidade, es.id_especialidade}).ToList();
                if (especialidades.Count > 0) {
                    for (int i = 0; especialidades.Count > i; i++) {
                        for (int j = 0; chb_especialidades.Items.Count>j; j++)
                        {//percorre todos os itens
                            if (chb_especialidades.Items[j].Value.ToString() == especialidades[i].id_especialidade.ToString()) // se for igual, marca
                            {
                                chb_especialidades.Items[j].Selected = true;
                            }
                        }//fim do for
                    }//fim do for


                    var exame = (from ex in cnDor.TB_EXAME_HOSPITAL
                                          join exa in cnDor.TB_EXAME on ex.id_exame equals exa.id_exame
                                          where ex.id_hospital == id_hospital
                                          select new { exa.nm_exame, exa.id_exame }).ToList();
                    if (exame.Count > 0)
                    {
                        for (int i = 0; exame.Count > i; i++)
                        {
                            for (int j = 0; chb_exames.Items.Count > j; j++)
                            {//percorre todos os itens
                                if (chb_exames.Items[j].Value.ToString() == exame[i].id_exame.ToString()) // se for igual, marca
                                {
                                    chb_exames.Items[j].Selected = true;
                                }
                            }//fim do for
                        }//fim do for
                    }
                    var psocorro = (from psh in cnDor.TB_PRONTOSOCORRO_HOSPITAL
                                          join ps in cnDor.TB_PRONTOSOCORRO on psh.id_prontosocorro equals ps.id_prontosocorro
                                          where psh.id_hospital == id_hospital
                                          select new { ps.id_prontosocorro , ps.nm_prontosocorro}).ToList();
                    if (psocorro.Count > 0) {
                    for (int i = 0; psocorro.Count > i; i++) {
                        for (int j = 0; chb_ps.Items.Count>j; j++)
                        {//percorre todos os itens
                            if (chb_ps.Items[j].Value.ToString() == psocorro[i].id_prontosocorro.ToString()) // se for igual, marca
                            {
                                chb_ps.Items[j].Selected = true;
                            }
                        }//fim do for
                    }//fim do for
                    }


                }//fim do if especialidades.Count > 0

            }//fim do if hospital != null


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
    protected void btn_gravar_Click(object sender, EventArgs e)
    {
        int id_hospital = Convert.ToInt32(Request.QueryString["id"]);
        if (id_hospital == -1)
        {
            int.TryParse(Session["idHosp"].ToString(), out id_hospital);
        }


        var especiadidades = cnDor.TB_ESPECIALIDADE_HOSPITAL.Where(x => x.id_hospital == id_hospital).ToList();
            if (especiadidades.Count > 0)
            {
                for (int es = 0; especiadidades.Count > es; es++) {
                    int id_especialidade_hospital = Convert.ToInt32(especiadidades[es].id_especialidade_hospital);
                    var esp = cnDor.TB_ESPECIALIDADE_HOSPITAL.Where(x => x.id_especialidade_hospital == id_especialidade_hospital).FirstOrDefault();
                    cnDor.DeleteObject(esp);
                    cnDor.SaveChanges();
                }
                
            }
            for (int j = 0; chb_especialidades.Items.Count > j; j++)
            {//percorre todos os itens
                if (chb_especialidades.Items[j].Selected == true) // se for igual, marca
                {
                    int id_especialidade = Convert.ToInt32(chb_especialidades.Items[j].Value);
                    insere_especialidade(id_especialidade, id_hospital);
                }
            }//fim do for

            var exames = cnDor.TB_EXAME_HOSPITAL.Where(x => x.id_hospital == id_hospital).ToList();
            if (exames.Count > 0)
            {
                for (int ex = 0; exames.Count > ex; ex++)
                {
                    int id_exame_hospital = Convert.ToInt32(exames[ex].id_exame_hospital);
                    var exa = cnDor.TB_EXAME_HOSPITAL.Where(x => x.id_exame_hospital == id_exame_hospital).FirstOrDefault();
                    cnDor.DeleteObject(exa);
                    cnDor.SaveChanges();
                }
            }
            for (int j = 0; chb_exames.Items.Count > j; j++)
            {//percorre todos os itens
                if (chb_exames.Items[j].Selected == true) // se for igual, marca
                {
                    int id_exame = Convert.ToInt32(chb_exames.Items[j].Value);
                    insere_exame(id_exame, id_hospital);
                }
            }//fim do for

            var ps = cnDor.TB_PRONTOSOCORRO_HOSPITAL.Where(x => x.id_hospital == id_hospital).ToList();
            if (ps.Count > 0)
            {

                for (int psc = 0; ps.Count > psc; psc++)
                {
                    int id_prontosocorro_hospital = Convert.ToInt32(ps[psc].id_prontosocorro_hospital);
                    var psco = cnDor.TB_PRONTOSOCORRO_HOSPITAL.Where(x => x.id_prontosocorro_hospital == id_prontosocorro_hospital).FirstOrDefault();
                    cnDor.DeleteObject(psco);
                    cnDor.SaveChanges();
                }
            }
            for (int j = 0; chb_ps.Items.Count > j; j++)
            {//percorre todos os itens
                if (chb_ps.Items[j].Selected == true) // se for igual, marca
                {
                    int id_ps = Convert.ToInt32(chb_ps.Items[j].Value);
                    insere_PS(id_ps, id_hospital);
                }
            }//fim do for

        var hospital = cnDor.TB_HOSPITAL.Where(x => x.id_hospital == id_hospital).FirstOrDefault();
        if (hospital != null) {
            hospital.nm_hospital = txt_nome.Text;
            hospital.ds_hospital = txt_descricao.Text;
            hospital.ds_endereco_hospital = txt_endereco.Text;
            hospital.nr_telefone_hospital = txt_telefone.Text;
            hospital.id_estado = Convert.ToInt32(drp_Estado.SelectedValue);
            hospital.ds_site_hospital = txt_site.Text;
}//fim do if hospital != null
            try{
            cnDor.SaveChanges();
            
        
        ClientScript.RegisterStartupScript(this.GetType(), "sucesso", "alert('Hospital editado com sucesso!');location.href='hospitais.aspx';", true);
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "erro", "alert('Não foi possivel cadastrar. Erro:"+ex.Message+"')", true);
        }

    }
}