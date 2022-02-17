<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="editar_noticia.aspx.cs" Inherits="admin_portal_editar_pagina" Title="Untitled Page" %>

<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            color: #666666;
        }
    </style>
    <script type="text/javascript" language="javascript">
//MÁSCARA DE VALORES

function txtBoxFormat(objeto, sMask, evtKeyPress) {
    var i, nCount, sValue, fldLen, mskLen,bolMask, sCod, nTecla;


if(document.all) { // Internet Explorer
    nTecla = evtKeyPress.keyCode;
} else if(document.layers) { // Nestcape
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
    sValue = sValue.toString().replace( "-", "" );
    sValue = sValue.toString().replace( "-", "" );
    sValue = sValue.toString().replace( ".", "" );
    sValue = sValue.toString().replace( ".", "" );
    sValue = sValue.toString().replace( "/", "" );
    sValue = sValue.toString().replace( "/", "" );
    sValue = sValue.toString().replace( ":", "" );
    sValue = sValue.toString().replace( ":", "" );
    sValue = sValue.toString().replace( "(", "" );
    sValue = sValue.toString().replace( "(", "" );
    sValue = sValue.toString().replace( ")", "" );
    sValue = sValue.toString().replace( ")", "" );
    sValue = sValue.toString().replace( " ", "" );
    sValue = sValue.toString().replace( " ", "" );
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
        mskLen++; }
      else {
        sCod += sValue.charAt(nCount);
        nCount++;
      }

      i++;
    }

    objeto.value = sCod;

    if (nTecla != 8) { // backspace
      if (sMask.charAt(i-1) == "9") { // apenas números...
        return ((nTecla > 47) && (nTecla < 58)); }
      else { // qualquer caracter...
        return true;
      }
    }
    else {
      return true;
    }
  }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <p>
        &nbsp;</p>
    <h2 class="style1">
        Editar Notícia</h2>
    <p>
        &nbsp;</p>
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                                    <p>
    <br />
        <b>Título&nbsp; </b>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txt_titulo" ErrorMessage="Digite um titulo para notícia">*</asp:RequiredFieldValidator>
                                    </p>
<p>
    <asp:TextBox ID="txt_titulo" runat="server" CssClass="txt" Width="600px" 
        MaxLength="200"></asp:TextBox>
</p>
    
                                    <p>
                                        &nbsp;</p>
<!-- Div formulario_pag-->
<!-- Fim Div formulario_pag-->
<p><b>Resumo<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="txt_resumo" 
        ErrorMessage="Digite um resumo para notícia">*</asp:RequiredFieldValidator>
                                    </b><br />
    <asp:TextBox ID="txt_resumo" runat="server" CssClass="txt" Width="600px" 
        MaxLength="200" Height="70px" TextMode="MultiLine"></asp:TextBox>
    </p>
    <br />
    <div id="conteudo_pag" <% =div_conteudo %>>
        <p><b>Conteúdo</b></p>
    <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" Height="600px" Width="600px" SkinPath="skins/silver/" BasePath="../fckeditor/"></FCKeditorV2:FCKeditor>
</div>
<!-- Div Conteudo_pag-->
    <br />
    <p>Data:<b><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="txt_data" 
        ErrorMessage="Escolha uma data para notícia">*</asp:RequiredFieldValidator>
                                    </b>
    </p>
       <asp:TextBox ID="txt_data" runat="server" Width="201px" CssClass="txt"></asp:TextBox>
            
            <asp:CalendarExtender   ID="CalendarExtender1"   TargetControlID="txt_data" 
                        runat="server" TodaysDateFormat="dd/MM/yyyy" Format="dd/MM/yyyy" />
    <br />
    <br />
    <asp:ImageButton ID="ImageButton2" runat="server" 
        ImageUrl="~/admin/images/btn_gravar.jpg" onclick="ImageButton2_Click" />

</asp:Content>

