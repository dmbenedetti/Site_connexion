<%@ Page Language="C#" AutoEventWireup="true" CodeFile="formInscricao.aspx.cs" Inherits="formInscricao" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="styles/modal.css" rel="stylesheet" media="screen" />
    <meta http-equiv="X-UA-Compatible" content="IE=8" />
    <style type="text/css">
        .style1
        {
            width: 745px;
        }
        .div {
border-left: 1px solid #666;
border-right: 1px solid #666;
border-top: 1px solid #666;
border-bottom: 1px solid #666;
-moz-border-radius:10px;
/* Firefox, etc */
-khtml-border-radius:10px;
/* Konqueror, etc */
-webkit-border-radius:10px;
/* Safari, Google Chrome, etc */
-opera-border-radius:10px;
/* Opera */
padding:5px;

}
        .style2
        {
            height: 18px;
        }
        </style>
        <script type="text/javascript" language="javascript">
            //MÁSCARA DE VALORES

            function txtBoxFormat(objeto, sMask, evtKeyPress) {
                var i, nCount, sValue, fldLen, mskLen, bolMask, sCod, nTecla;


                if (document.all) { // Internet Explorer
                    nTecla = evtKeyPress.keyCode;
                } else if (document.layers) { // Nestcape
                    nTecla = evtKeyPress.which;
                } else {
                    nTecla = evtKeyPress.which;
                    if (nTecla == 8) {
                        return true;
                    }
                }

                sValue = objeto.value;

                // Limpa todos os caracteres de formatação que
                // já estiverem no campo.
                sValue = sValue.toString().replace("-", "");
                sValue = sValue.toString().replace("-", "");
                sValue = sValue.toString().replace(".", "");
                sValue = sValue.toString().replace(".", "");
                sValue = sValue.toString().replace("/", "");
                sValue = sValue.toString().replace("/", "");
                sValue = sValue.toString().replace(":", "");
                sValue = sValue.toString().replace(":", "");
                sValue = sValue.toString().replace("(", "");
                sValue = sValue.toString().replace("(", "");
                sValue = sValue.toString().replace(")", "");
                sValue = sValue.toString().replace(")", "");
                sValue = sValue.toString().replace(" ", "");
                sValue = sValue.toString().replace(" ", "");
                fldLen = sValue.length;
                mskLen = sMask.length;

                i = 0;
                nCount = 0;
                sCod = "";
                mskLen = fldLen;

                while (i <= mskLen) {
                    bolMask = ((sMask.charAt(i) == "-") || (sMask.charAt(i) == ".") || (sMask.charAt(i) == "/") || (sMask.charAt(i) == ":"))
                    bolMask = bolMask || ((sMask.charAt(i) == "(") || (sMask.charAt(i) == ")") || (sMask.charAt(i) == " "))

                    if (bolMask) {
                        sCod += sMask.charAt(i);
                        mskLen++;
                    }
                    else {
                        sCod += sValue.charAt(nCount);
                        nCount++;
                    }

                    i++;
                }

                objeto.value = sCod;

                if (nTecla != 8) { // backspace
                    if (sMask.charAt(i - 1) == "9") { // apenas números...
                        return ((nTecla > 47) && (nTecla < 58));
                    }
                    else { // qualquer caracter...
                        return true;
                    }
                }
                else {
                    return true;
                }
            }
            // onkeypress="return txtBoxFormat(this, '999.999.999/9999-99', event);"  onclick="this.value='';" MaxLength="19"
    </script>
</head>
<body>
<div style="width:750px; border:solid 1px #fff; overflow:auto; display:block;">
    <form id="form1" runat="server">
    
    
    <h2>Formulário de Inscrição</h2>
    <table cellpadding="5" cellspacing="0" class="style1">
        <tr>
            <td height="18">
                Nome Completo:
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtNome" ErrorMessage="Campo Obrigatório" 
                    ForeColor="Red" ValidationGroup="formInscricao"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td height="18">
                <asp:TextBox ID="txtNome" runat="server" Width="575px" CssClass="div"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td height="18">
            <div style="width:430px; float:left">
                CPF:
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtCPF" ErrorMessage="Campo Obrigatório" 
                    ForeColor="Red" ValidationGroup="formInscricao"></asp:RequiredFieldValidator>
                </div>Data de Nascimento:<asp:RequiredFieldValidator 
                    ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtDataNasc" 
                    ErrorMessage="Campo Obrigatório" ForeColor="Red" 
                    ValidationGroup="formInscricao" Display="Dynamic"></asp:RequiredFieldValidator>

                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" 
                    ForeColor="Red" runat="server" 
                    ControlToValidate="txtDataNasc" Display="Dynamic" ErrorMessage="Data Inválida" 
                    ValidationExpression="^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/[12][0-9]{3}$" 
                    ValidationGroup="formInscricao"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td height="18">
            <div style="width:430px; float:left">
                <asp:TextBox ID="txtCPF" runat="server" CssClass="div" Width="200px"
                onkeypress="return txtBoxFormat(this, '999.999.999-99', event);"  onclick="this.value='';" MaxLength="14"
                ></asp:TextBox>
                (xxx.xxx.xxx<span style="font-family:Arial">-</span>xx)</div>
                <asp:TextBox ID="txtDataNasc" runat="server" CssClass="div"
                onkeypress="return txtBoxFormat(this, '99/99/9999', event);"  
                    onclick="this.value='';" MaxLength="10" Width="150px"
                ></asp:TextBox>
                (dd/mm/aaaa)
            </td>
        </tr>
        <tr>
            <td class="style2">
            <div style="width:430px; float:left">
                Profissão:
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtProfissao" ErrorMessage="Campo Obrigatório" 
                    ForeColor="Red" ValidationGroup="formInscricao"></asp:RequiredFieldValidator>
                </div>
                Telefone:
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="txtTelefone" ErrorMessage="Campo Obrigatório" 
                    ForeColor="Red" ValidationGroup="formInscricao"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td height="18">
            <div style="width:430px; float:left">
                <asp:TextBox ID="txtProfissao" runat="server" Width="400px" CssClass="div"></asp:TextBox>
                </div>
                <asp:TextBox ID="txtTelefone" runat="server" CssClass="div" Width="150px"
                onkeypress="return txtBoxFormat(this, '(99)9999-99999', event);"  
                    onclick="this.value='';" MaxLength="14"
                ></asp:TextBox>
                (xx)xxxx<span style="font-family:Arial">-</span>xxxx</td>
        </tr>
        <tr>
            <td height="18">
            <div style="width:430px; float:left">
                Endereço: 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtEndereco" ErrorMessage="Campo Obrigatório" 
                    ForeColor="Red" ValidationGroup="formInscricao"></asp:RequiredFieldValidator>
                </div>Complemento:</td>
        </tr>
        <tr>
            <td height="18">
            <div style="width:430px; float:left">
                <asp:TextBox ID="txtEndereco" runat="server" Width="400px" CssClass="div"></asp:TextBox>
                </div>
                <asp:TextBox ID="txtComplemento" runat="server" Width="150px" CssClass="div"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td height="18">
            <div style="width:430px; float:left">
                Bairro:
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtBairro" ErrorMessage="Campo Obrigatório" 
                    ForeColor="Red" ValidationGroup="formInscricao"></asp:RequiredFieldValidator>
                </div>
                CEP:<asp:RequiredFieldValidator ID="RequiredFieldValidator11" 
                    runat="server" ControlToValidate="txtCEP" ErrorMessage="Campo Obrigatório" 
                    ForeColor="Red" Display="Dynamic" ValidationGroup="formInscricao"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtCEP" ErrorMessage="Digite um CEP Valido" ForeColor="Red" 
                    ValidationExpression="^\d{5}-\d{3}$" Display="Dynamic" 
                    ValidationGroup="formInscricao"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td height="18">
            <div style="width:430px; float:left">
                <asp:TextBox ID="txtBairro" runat="server" Width="400px" CssClass="div"></asp:TextBox>
            </div>
                <asp:TextBox ID="txtCEP" runat="server" Width="150px" CssClass="div"
                onkeypress="return txtBoxFormat(this, '99999-999', event);"  
                    onclick="this.value='';" MaxLength="9"
                ></asp:TextBox>
                &nbsp;(xxxxx<span style="font-family:Arial">-</span>xxx)</td>
        </tr>
        <tr>
            <td height="18">
<div style="width:430px; float:left">Cidade: 
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
        ControlToValidate="txtCidade" ErrorMessage="Campo Obrigatório" 
        ForeColor="Red" ValidationGroup="formInscricao"></asp:RequiredFieldValidator>
                </div>
Estado:<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                    ControlToValidate="drpEstado" ErrorMessage="Campo Obrigatório" 
                    ForeColor="Red" ValidationGroup="formInscricao"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td height="18">
                <div style="width:430px; float:left">
                <asp:TextBox ID="txtCidade" runat="server" Width="400px" CssClass="div"></asp:TextBox>
                </div>
                
                <asp:DropDownList ID="drpEstado" runat="server" CssClass="div" 
                    Width="150px">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>AC</asp:ListItem>
                    <asp:ListItem>AL</asp:ListItem>
                    <asp:ListItem>AP</asp:ListItem>
                    <asp:ListItem>AM</asp:ListItem>
                    <asp:ListItem>BA</asp:ListItem>
                    <asp:ListItem>CE</asp:ListItem>
                    <asp:ListItem>DF</asp:ListItem>
                    <asp:ListItem>ES</asp:ListItem>
                    <asp:ListItem>GO</asp:ListItem>
                    <asp:ListItem>MA</asp:ListItem>
                    <asp:ListItem>MT</asp:ListItem>
                    <asp:ListItem>MS</asp:ListItem>
                    <asp:ListItem>MG</asp:ListItem>
                    <asp:ListItem>PA</asp:ListItem>
                    <asp:ListItem>PB</asp:ListItem>
                    <asp:ListItem>PR</asp:ListItem>
                    <asp:ListItem>PE</asp:ListItem>
                    <asp:ListItem>PI</asp:ListItem>
                    <asp:ListItem>RJ</asp:ListItem>
                    <asp:ListItem>RN</asp:ListItem>
                    <asp:ListItem>RS</asp:ListItem>
                    <asp:ListItem>RO</asp:ListItem>
                    <asp:ListItem>RR</asp:ListItem>
                    <asp:ListItem>SC</asp:ListItem>
                    <asp:ListItem>SP</asp:ListItem>
                    <asp:ListItem>SE</asp:ListItem>
                    <asp:ListItem>TO</asp:ListItem>
                </asp:DropDownList>
                </td>
        </tr>
        <tr>
            <td height="18">
            <div style="width:430px; float:left">
                
                E-mail:
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Campo Obrigatório" 
                    ForeColor="Red" Display="Dynamic" ValidationGroup="formInscricao"></asp:RequiredFieldValidator>
                
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Digite um email Valido" 
                    ForeColor="Red" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    Display="Dynamic" ValidationGroup="formInscricao"></asp:RegularExpressionValidator>
                
                </div>
                Como ficou sabendo do evento:
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                    ControlToValidate="drpConheceu" ErrorMessage="Obrigatório" ForeColor="Red" 
                    ValidationGroup="formInscricao" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td class="style2">
            <div style="width:430px; float:left">
                
                <asp:TextBox ID="txtEmail" runat="server" Width="400px" CssClass="div"></asp:TextBox>
                
                </div>
                <asp:DropDownList ID="drpConheceu" runat="server" DataSourceID="ds_conheceu" 
                    DataTextField="ds_conheceu" DataValueField="id_conheceu" CssClass="div" 
                    Width="150px" onprerender="drpConheceu_PreRender">
                </asp:DropDownList>
                <asp:SqlDataSource ID="ds_conheceu" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dbSimposioConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:dbSimposioConnectionString.ProviderName %>" 
                    SelectCommand="SELECT [id_conheceu], [ds_conheceu] FROM [tb_conheceu]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/images/btn_enviar.png" onclick="ImageButton1_Click" 
                    ValidationGroup="formInscricao" />
            </td>
        </tr>
        </table>
    
    
    
    </form>
    </div>
</body>
</html>
