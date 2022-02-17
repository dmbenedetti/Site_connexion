<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FormularioExport.aspx.cs" Inherits="admincms_newsletter" ViewStateMode="Disabled" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta content="application/vnd.ms-excel" />
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:Repeater ID="rptNewsLetter" runat="server" DataSourceID="ds_newsletter">
        <HeaderTemplate>
            <table cellpadding="0" cellspacing="0" border="1">
                <tr>
                
                    <td>Protocolo</td>
                    <td>Data Solicitação</td>
                    <td>Nome</td>
                    <td>Data Nascimento</td>
                    <td>Data Atendimento</td>
                    <td>Tipo Atentimento</td>
                    <td>Telefone Fixo</td>
                    <td>Telefone Celular</td>
                    <td>Observação</td>
                           
                                
                    
                    
               <!--  <td>Protocolo</td>
                    <td>Nome</td>
                    <td>Data Nascimento</td>
                    <td>Telefone Fixo</td>
                    <td>Telefone Celular</td>
                    <td>Data Atendimento</td>
                    <td>Tipo Atentimento</td>
                    <td>Data Solicitação</td>
                    <td>Observação</td>-->
                </tr>
        </HeaderTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <%# Eval("id_exames_imagem")%>
                </td>
                <td>
                    <%# Convert.ToDateTime(Eval("dt_solicitacao")).ToString("dd/MM/yyy HH:mm")%>
                </td>  
                <td>
                    <%# Eval("ds_nome")%>
                </td>
                <td>
                    <%# Eval("ds_data_nascimento")%>
                </td>
                <td>
                    <%# Convert.ToDateTime(Eval("dt_atendimento")).ToString("MM/yyyy")%>
                </td>
                 <td>
                    <%# Eval("ds_atendimento")%>
                </td>
                <td>
                    <%# Eval("ds_telefone_fixo")%>
                </td>
                <td>
                    <%# Eval("ds_telefone_celular")%>
                </td>     
               
                          
                <td>
                    <%# Eval("ds_observacao")%>
                </td> 
            </tr>
        </ItemTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="ds_newsletter" runat="server" ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>"
        SelectCommand="SELECT 0 id_conteudo, * FROM TB_FORMULARIO_EXAMES WHERE id_hospital = @idHosp AND (@dtStart IS NULL OR dt_solicitacao >= @dtStart) and (@dtEnd is null OR dt_solicitacao <= DATEADD(day, 1, @dtEnd))">
        <SelectParameters>
           <asp:SessionParameter Name="idHosp" SessionField="idHosp" Type="Int32" />
                <asp:QueryStringParameter QueryStringField="txtDataFim" Name="dtEnd" DbType="DateTime" ConvertEmptyStringToNull="true" />
                <asp:QueryStringParameter QueryStringField="txtDataInicio" Name="dtStart" DbType="DateTime" ConvertEmptyStringToNull="true" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
