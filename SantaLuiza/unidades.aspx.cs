using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class unidades : System.Web.UI.Page
{ 
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected string carrega_hospitais(int id_hosp) {
        string especialidades_hosp = "";
        var hospital = cnDor.TB_HOSPITAL.Where(x => x.id_hospital == id_hosp).Select(x => new
        {
            x.id_hospital,
            x.nm_hospital,
            x.ds_hospital,
            x.ds_site_hospital
        }
        ).FirstOrDefault();
        var especialidades = (from espec in cnDor.TB_ESPECIALIDADE_HOSPITAL
                                  join nm_epsec in cnDor.TB_EPSECIALIDADE on espec.id_especialidade equals nm_epsec.id_especialidade
                                  where espec.id_hospital == id_hosp
                                  orderby nm_epsec.nm_especialidade
                                  select nm_epsec.nm_especialidade
                                  ).ToList();
        //var especialidades1 = cnDor.TB_ESPECIALIDADE_HOSPITAL.Where(x => x.id_hospital == id_hosp).Select(x => new{ x.TB_EPSECIALIDADE.nm_especialidade}).ToList();
        string esp = "";
        for (int i = 0; especialidades.Count > i;i++ ) {
            esp += "<span class='span_esp'>"+especialidades[i]+"</span>";
        }//fim do for

        especialidades_hosp = "<div class='unidades_hosp'><h4>" + hospital.nm_hospital + "</h4><p>" + hospital.ds_hospital + "</p><br /><strong>Especialidades:</strong><br /><div style='margin:10px 0;'>" + esp + "</div><p><a href='" + hospital.ds_site_hospital + "' target=_blank>" + hospital.ds_site_hospital + "</a></p></div><!-- Fim da div unidades_hosp-->";
        return especialidades_hosp;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            //var unidades = cnDor.TB_HOSPITAL.Where(x => x.id_status == 1).ToList();
            var unidades = (from u in cnDor.TB_HOSPITAL
                            join estado in cnDor.uf on u.id_estado equals estado.cd_uf into estado1
                            where u.id_status == 1 && u.id_hospital!=1
                            from estado in estado1.DefaultIfEmpty()
                            orderby u.nm_hospital ascending
                            select new { 
                                u.id_hospital,
                                u.nm_hospital,
                                u.ds_hospital,
                                u.ds_site_hospital,
                                u.ds_endereco_hospital,
                                u.nr_telefone_hospital,
                                estado.ds_uf_nome
                            }
                               ).ToList();

            string hospitais_lista = "";
            if(unidades.Count>0){
                for (int i = 0; unidades.Count > i; i++) {
                    hospitais_lista += carrega_hospitais(unidades[i].id_hospital);
                }//fim do for
            }//fim do if
            ltr_hosp.Text = hospitais_lista;
            img_map.ImageUrl = "~/images/unidades/maps/default.png";
            

            var estado_1 = (from uf in cnDor.uf
                              join hosp in cnDor.TB_HOSPITAL on uf.cd_uf equals hosp.id_estado
                              select new {
                                  uf.cd_uf,
                                  uf.ds_uf_nome
                              }
                            ).Distinct().ToList();
            drp_estado.DataSource = estado_1;
            drp_estado.DataValueField = "cd_uf";
            drp_estado.DataTextField = "ds_uf_nome";
            drp_estado.DataBind();

            BindEspecialidade();

        }//fim do if postback
    }
    private void BindEspecialidade()
    {
        string values = drp_especialidade.SelectedValue;
        int idHospital = 0;
        int.TryParse(drp_estado.SelectedValue, out idHospital);
        DataTable oTable = new DataTable();
        oTable.Columns.Add("id_especialidade");
        oTable.Columns.Add("nm_especialidade");
        DataRow oRow;
        oRow = oTable.NewRow();
        oRow["id_especialidade"] = "--Especialidades e Serviços--";
        oRow["nm_especialidade"] = "--Especialidades e Serviços--";
        oTable.Rows.Add(oRow);
        if (idHospital > 0)
        {
            var especialidades1 = (from es in cnDor.TB_EPSECIALIDADE
                                   join eh in cnDor.TB_ESPECIALIDADE_HOSPITAL on es.id_especialidade equals eh.id_especialidade
                                   join hosp in cnDor.TB_HOSPITAL on eh.id_hospital equals hosp.id_hospital
                                   where hosp.id_estado == idHospital
                                   group es by new { id_especialidade = es.id_especialidade, nm_especialidade = es.nm_especialidade } into g
                                   select g).ToList();
            foreach (var a in especialidades1)
            {
                oRow = oTable.NewRow();
                oRow["id_especialidade"] = a.Key.id_especialidade;
                oRow["nm_especialidade"] = a.Key.nm_especialidade;
                oTable.Rows.Add(oRow);
            }

        }
        else
        {
            var especialidades2 = (from es in cnDor.TB_EPSECIALIDADE
                                   join eh in cnDor.TB_ESPECIALIDADE_HOSPITAL on es.id_especialidade equals eh.id_especialidade
                                   join hosp in cnDor.TB_HOSPITAL on eh.id_hospital equals hosp.id_hospital
                                   group es by new { id_especialidade = es.id_especialidade, nm_especialidade = es.nm_especialidade } into g
                                   select g).ToList();
            foreach (var a in especialidades2)
            {
                oRow = oTable.NewRow();
                oRow["id_especialidade"] = a.Key.id_especialidade;
                oRow["nm_especialidade"] = a.Key.nm_especialidade;
                oTable.Rows.Add(oRow);
            }

        }
        if (drp_especialidade.Items.FindByValue(values) != null)
            drp_especialidade.SelectedValue = values;
        drp_especialidade.DataSource = oTable;
        drp_especialidade.DataTextField = "nm_especialidade";
        drp_especialidade.DataValueField = "id_especialidade";
        drp_especialidade.DataBind();
        oTable.Dispose();
        oTable = null;
    }


    protected void DropDownList1_PreRender(object sender, EventArgs e)
    {
        drp_estado.Items.Remove("--Escolha o estado--");
        drp_estado.Items.Insert(0, new ListItem("--Escolha o estado--", "--Escolha o estado--"));
        if (!Page.IsPostBack)
            drp_estado.SelectedValue = "--Escolha o estado--";
        BindEspecialidade();
    }
    protected void drp_especialidade_PreRender(object sender, EventArgs e)
    {
        drp_especialidade.Items.Remove("--Especialidades e Serviços--");
        drp_especialidade.Items.Insert(0, "--Especialidades e Serviços--");
    }
    protected void carrega() {
        int id_estado = 0;
        if (drp_estado.SelectedValue != "--Escolha o estado--")
        {
            id_estado = Convert.ToInt32(drp_estado.SelectedValue);
            var estado = cnDor.uf.Where(x => x.cd_uf == id_estado).FirstOrDefault();
            string sigla = estado.ds_uf_sigla;
            img_map.ImageUrl = "~/images/unidades/maps/" + sigla + ".png";
        }//fim do if
        int especialidade = 0;
        if (drp_especialidade.SelectedValue != "--Especialidades e Serviços--")
        {
            especialidade = Convert.ToInt32(drp_especialidade.SelectedValue);
        }//fim do if


        if (id_estado != 0 && especialidade != 0)
        {
            var hospitais = (from hosp in cnDor.TB_HOSPITAL
                             join esp in cnDor.TB_ESPECIALIDADE_HOSPITAL on hosp.id_hospital equals esp.id_hospital
                             where (esp.id_especialidade == especialidade && hosp.id_status == 1 && hosp.id_estado == id_estado && hosp.id_hospital != 1)
                             select new
                             {
                                 hosp.id_hospital,
                                 hosp.nm_hospital,
                                 hosp.ds_hospital,
                                 hosp.ds_site_hospital,
                                 hosp.uf.ds_uf_nome,
                                 hosp.ds_endereco_hospital,
                                 hosp.nr_telefone_hospital
                             }
                           ).ToList();
            string hospitais_lista = "";
            if (hospitais.Count > 0)
            {
                for (int i = 0; hospitais.Count > i; i++)
                {
                    hospitais_lista += carrega_hospitais(hospitais[i].id_hospital);
                }//fim do for
            }//fim do if
            ltr_hosp.Text = hospitais_lista;

        }//fim do if id_estado != 0 && especialidade != 0
        else if (id_estado == 0 && especialidade != 0)
        {

            var hospitais = (from hosp in cnDor.TB_HOSPITAL
                             join esp in cnDor.TB_ESPECIALIDADE_HOSPITAL on hosp.id_hospital equals esp.id_hospital
                             where (esp.id_especialidade == especialidade && hosp.id_status == 1 && hosp.id_hospital != 1)
                             select new
                             {
                                 hosp.id_hospital,
                                 hosp.nm_hospital,
                                 hosp.ds_hospital,
                                 hosp.ds_site_hospital,
                                 hosp.uf.ds_uf_nome,
                                 hosp.ds_endereco_hospital,
                                 hosp.nr_telefone_hospital
                             }
                           ).ToList();
            string hospitais_lista = "";
            if (hospitais.Count > 0)
            {
                for (int i = 0; hospitais.Count > i; i++)
                {
                    hospitais_lista += carrega_hospitais(hospitais[i].id_hospital);
                }//fim do for
            }//fim do if
            ltr_hosp.Text = hospitais_lista;
        }//fim do eslse if id_estado==0 && especialidade !=0
        else if (id_estado == 0 && especialidade == 0)
        {
            var hospitais = cnDor.TB_HOSPITAL.Where(x => x.id_status == 1 && x.id_hospital != 1).ToList();
            string hospitais_lista = "";
            if (hospitais.Count > 0)
            {
                for (int i = 0; hospitais.Count > i; i++)
                {
                    hospitais_lista += carrega_hospitais(hospitais[i].id_hospital);
                }//fim do for
            }//fim do if
            ltr_hosp.Text = hospitais_lista;
        }//fim do eslse if id_estado==0 && especialidade ==0
        else if (id_estado != 0 && especialidade == 0)
        {
            var hospitais = cnDor.TB_HOSPITAL.Where(x => x.id_status == 1 && x.id_estado == id_estado && x.id_hospital != 1).ToList();
            string hospitais_lista = "";
            if (hospitais.Count > 0)
            {
                for (int i = 0; hospitais.Count > i; i++)
                {
                    hospitais_lista += carrega_hospitais(hospitais[i].id_hospital);
                }//fim do for
            }//fim do if
            ltr_hosp.Text = hospitais_lista;
        }//fim do eslse if id_estado!=0 && especialidade ==0
        else
        {
            var hospitais = cnDor.TB_HOSPITAL.Where(x => x.id_status == 1 && x.id_hospital != 1).ToList();
            string hospitais_lista = "";
            if (hospitais.Count > 0)
            {
                for (int i = 0; hospitais.Count > i; i++)
                {
                    hospitais_lista += carrega_hospitais(hospitais[i].id_hospital);
                }//fim do for
            }//fim do if
            ltr_hosp.Text = hospitais_lista;
        }//fim do else id_estado != 0
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        carrega();

    }
    protected void drp_estado_SelectedIndexChanged(object sender, EventArgs e)
    {
        carrega();
    }
    protected void drp_especialidade_SelectedIndexChanged(object sender, EventArgs e)
    {
        carrega();
    }
}