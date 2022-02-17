using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class demostrativo_finaceiro_lista : System.Web.UI.Page
{
    db_rede_dorModel.db_rede_dorEntities cnDor = new db_rede_dorModel.db_rede_dorEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            var MaxDate = cnDor.TB_DEMOSTRATIVO_FINANCEIRO.Max(a => a.dtDemonstrativo).Value;
            var MinDate = cnDor.TB_DEMOSTRATIVO_FINANCEIRO.Min(a => a.dtDemonstrativo).Value;

            for (int i = MinDate.Year; i <= MaxDate.Year; i++)
            {
                drpAno.Items.Add(new ListItem() { Text = i.ToString(), Value = i.ToString() });
            }
        }
    }
}