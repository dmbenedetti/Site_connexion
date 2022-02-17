<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="resultadoexames.aspx.cs" Inherits="resultadoexames" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
.list_revista
{
    width:100px;
    height:230px;
    text-align:center;
    padding:6px 25px;
    
    }
    .list_revista img
    {
        border: solid 2px #999;
        }
    .list_revista a
    {
        font:Tahoma, Arial, Helvetica, sans-serif;
        color:#999999;
        text-decoration:none;
        
        }
        .list_revista a:hover
        {
            text-decoration:underline;
         }
#ctl00_ContentPlaceHolder1_DataPager1 input
{
    font: bold 12px Tahoma, Arial, Helvetica, sans-serif;
    color:#fff;
    background: #57abcd;
    padding:6px 10px;
    }
    #ctl00_ContentPlaceHolder1_DataPager1 span
    {
        width:15px;
        padding:6px 5px;
        color:#57abcd;
        font: bold 12px Tahoma, Arial, Helvetica, sans-serif;
        margin:0 3px;
        }
        #ctl00_ContentPlaceHolder1_DataPager1 a
        {
        width:15px;
        padding:5px 5px;
        color:#fff;
        text-decoration:none;
        background:#57abcd;
        margin:0 3px;
        font: bold 12px Tahoma, Arial, Helvetica, sans-serif;
        border:solid 1px #57abcd;
        }
        #ctl00_ContentPlaceHolder1_DataPager1 a:hover
        {
        
        color:#57abcd;
        background:#fff;
        border:solid 1px #57abcd;
        
        }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="titulo_pag">
            	<h2><asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label></h2>
            </div>
    
<p>&nbsp;</p>
<div style="width:300px; margin:10px auto;">
<p>Digite o seu Id e senha para acessar o sistema </p>
              <table width="86%" height="96" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="28%"><span class="green">ID Paciente:</span></td>
                  <td width="72%"><span class="green">
                   <asp:TextBox ID="txtNic" CssClass="campo" runat="server" style="border: solid 1px #CCC; width:100px; margin-right:26px;"></asp:TextBox>
                  </span></td>
                </tr>
                <tr>
                  <td><span class="green">Senha:</span></td>
                  <td><asp:TextBox id="txtSenha" CssClass="campo" runat="server" style="border: solid 1px #CCC; width: 100px;" TextMode="Password"></asp:TextBox></td>
                </tr>
                <tr>
                  <td colspan="2"><asp:ImageButton ID="btnOk" runat="server" 
                          ImageUrl="images/btn_ok.jpg" onclick="btnOk_Click" /></td>
                </tr>
                <tr>
                  <td colspan="2"><asp:Literal ID="ltlMsg" runat="server"></asp:Literal></td>
                </tr>
              </table>
              <p><span class="green"><input type="hidden" name="ip_origem" id="ip_origem" value="189.91.33.79">
              <input type="hidden" name="empresa" id="empresa" value="labs_hmb"> 
              <input type=hidden SIZE='20' NAME='pagina_retorno' value='hospitalbrasil.saoluiz.com.br/recebe_exames.aspx'>  
              </span><br>
              </p>
</div>
    <br />
                    <br />
                    <br />
                    </asp:Content>

