using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class formInscricao : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button11_Click(object sender, EventArgs e)
    {
        Response.Write(@"<script>parent.$.fn.colorbox.close();</script>");
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        string nome = txtNome.Text;
        string cpf = txtCPF.Text;
        string profissao = txtProfissao.Text;
        string telefone = txtTelefone.Text;
        string endereco = txtEndereco.Text;
        string complemento = txtComplemento.Text;
        string bairro = txtBairro.Text;
        string cep = txtCEP.Text;
        string cidade = txtCidade.Text;
        string estado = drpEstado.SelectedValue;
        string email = txtEmail.Text;
        //SERGINEI
        //simposioTableAdapters.tb_inscricaoTableAdapter inscricao = new simposioTableAdapters.tb_inscricaoTableAdapter();
        //DataTable tb_cpf = inscricao.Get_select_cpf(cpf);
        //if (tb_cpf.Rows.Count > 0)
        //{
        //    Response.Write(@"<script>alert('Uma inscrição já foi realizada com este cpf. \nPor Favor verifique o CPF digitado.')</script>");
        //}//fim do if
        //else { 
        //    try
        //    {
        //        //DateTime nasc = Convert.ToDateTime(txtDataNasc.Text);
        //        /* Convertendo a data*/
        //        /********************************************************/
        //        string data_temp = txtDataNasc.Text;
        //        string dia = data_temp.Remove(2);
        //        string mes = data_temp.Substring(3).Remove(2);
        //        string ano = data_temp.Substring(6);
        //        string data = ano + "/" + mes + "/" + dia;
        //        DateTime data_saida = Convert.ToDateTime(data);
        //        /********************************************************/

        //        int conheceu = Convert.ToInt32(drpConheceu.SelectedValue);
        //        inscricao.Insert_inscrito(conheceu, cpf, nome, data_saida, profissao, endereco, complemento, bairro, cidade, estado, cep, telefone, email, DateTime.Now);
        //        Response.Write(@"<script>alert('Cadastro efetuado com sucesso');parent.$.fn.colorbox.close();</script>");
        //    }
        //    catch(Exception ex) {
        //        Response.Write(@"<script>alert('Erro! Por favor revise os campos digitados ou tente mais tarde."+ex.Message+"')</script>");
        //    }
        //}//fim do else
    }
    protected void drpConheceu_PreRender(object sender, EventArgs e)
    {
        drpConheceu.Items.Insert(0, new ListItem("", "", true));
    }
    
}