using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class saude_com_hospitais_rede_dor_sao_Luiz : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {

            var audios = cnDor.TB_PORTAL_SAUDE_HSL_DOR.Where(x => x.id_status == 1).Select(x => new { 
                x.id_saude,
                x.nm_titulo,
                x.ds_audio,
                x.TB_PORTAL_ESPECIALISTA.nm_especialista,
                x.TB_PORTAL_TEMA.nm_tema
            }).OrderByDescending(x=>x.id_saude).ToList();
            ListView1.DataSource = audios;
            ListView1.DataBind();

            DropDownList1.DataSource = cnDor.TB_PORTAL_TEMA.Where(x => x.id_status == 1).OrderBy(x=>x.nm_tema).ToList();
            DropDownList1.DataTextField = "nm_tema";
            DropDownList1.DataValueField = "id_tema";
            DropDownList1.DataBind();

            DropDownList2.DataSource = cnDor.TB_PORTAL_ESPECIALISTA.Where(x => x.id_status == 1).OrderBy(x => x.nm_especialista).ToList();
            DropDownList2.DataTextField = "nm_especialista";
            DropDownList2.DataValueField = "id_especialista";
            DropDownList2.DataBind();
        }//fim do if postback
    }
    protected void DropDownList1_PreRender(object sender, EventArgs e)
    {
        DropDownList1.Items.Remove("Selecione");
        DropDownList1.Items.Insert(0, "Selecione");
    }
    protected void DropDownList2_PreRender(object sender, EventArgs e)
    {
        DropDownList2.Items.Remove("Selecione");
        DropDownList2.Items.Insert(0, "Selecione");
    }
    protected void ListView1_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        this.DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
    }
    protected void DataPager1_PreRender(object sender, EventArgs e)
    {
        int id_tema = 0;
        int id_especialista = 0;
        if (DropDownList1.SelectedValue != "Selecione")
        {
            id_tema = Convert.ToInt32(DropDownList1.SelectedValue);
        }
        if (DropDownList2.SelectedValue != "Selecione")
        {
            id_especialista = Convert.ToInt32(DropDownList2.SelectedValue);
        }
        carrega_lista(id_tema, id_especialista);
    }
    protected void carrega_lista(int id_tema, int id_especialista) {
        if (id_tema != 0 && id_especialista != 0)
        {
            var audios = cnDor.TB_PORTAL_SAUDE_HSL_DOR.Where(x => x.id_status == 1 && x.id_tema==id_tema && x.id_espedcialista==id_especialista).Select(x => new
            {
                x.id_saude,
                x.nm_titulo,
                x.ds_audio,
                x.TB_PORTAL_ESPECIALISTA.nm_especialista,
                x.TB_PORTAL_TEMA.nm_tema
            }).OrderByDescending(x => x.id_saude).ToList();
            ListView1.DataSource = audios;
            ListView1.DataBind();
        }
        else if(id_tema==0 && id_especialista!=0){
            var audios = cnDor.TB_PORTAL_SAUDE_HSL_DOR.Where(x => x.id_status == 1 && x.id_espedcialista==id_especialista).Select(x => new
            {
                x.id_saude,
                x.nm_titulo,
                x.ds_audio,
                x.TB_PORTAL_ESPECIALISTA.nm_especialista,
                x.TB_PORTAL_TEMA.nm_tema
            }).OrderByDescending(x => x.id_saude).ToList();
            ListView1.DataSource = audios;
            ListView1.DataBind();
        
        }
        else if (id_tema != 0 && id_especialista == 0)
        {
            var audios = cnDor.TB_PORTAL_SAUDE_HSL_DOR.Where(x => x.id_status == 1 && x.id_tema==id_tema).Select(x => new
            {
                x.id_saude,
                x.nm_titulo,
                x.ds_audio,
                x.TB_PORTAL_ESPECIALISTA.nm_especialista,
                x.TB_PORTAL_TEMA.nm_tema
            }).OrderByDescending(x => x.id_saude).ToList();
            ListView1.DataSource = audios;
            ListView1.DataBind();

        }
        else {
            var audios = cnDor.TB_PORTAL_SAUDE_HSL_DOR.Where(x => x.id_status == 1).Select(x => new
            {
                x.id_saude,
                x.nm_titulo,
                x.ds_audio,
                x.TB_PORTAL_ESPECIALISTA.nm_especialista,
                x.TB_PORTAL_TEMA.nm_tema
            }).OrderByDescending(x => x.id_saude).ToList();
            ListView1.DataSource = audios;
            ListView1.DataBind();
        }

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int id_tema = 0;
        int id_especialista = 0;
        if (DropDownList1.SelectedValue != "Selecione")
        {
            //pega o id do tema
            id_tema = Convert.ToInt32(DropDownList1.SelectedValue);
            //faz uma busca dos especialistas deste tema
            var especialista = (from especialis in cnDor.TB_PORTAL_ESPECIALISTA
                                join id_espec in cnDor.TB_PORTAL_SAUDE_HSL_DOR on especialis.id_especialista equals id_espec.id_espedcialista
                                where id_espec.id_tema == id_tema && id_espec.id_status == 1
                                select new { especialis.id_especialista, especialis.nm_especialista }).Distinct().ToList();
            //carrega o dropdown de especialistas
            DropDownList2.DataSource = especialista;
            DropDownList2.DataTextField = "nm_especialista";
            DropDownList2.DataValueField = "id_especialista";
            //DropDownList2.Text = "Selecione";
            DropDownList2.DataBind();
            
        }
        else {
            //se escolher a opção selecione carrega todos os especialistas
            DropDownList2.DataSource = cnDor.TB_PORTAL_ESPECIALISTA.Where(x => x.id_status == 1).ToList();
            DropDownList2.DataTextField = "nm_especialista";
            DropDownList2.DataValueField = "id_especialista";
            DropDownList2.DataBind();
            DropDownList2.SelectedValue = "Selecione";
        }
        if (DropDownList2.SelectedValue != "Selecione" && !String.IsNullOrEmpty(DropDownList2.SelectedValue))
        {
            id_especialista = Convert.ToInt32(DropDownList2.SelectedValue);
        }
        carrega_lista(id_tema,id_especialista);
        

        
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
}