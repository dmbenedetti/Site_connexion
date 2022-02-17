<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="dna_texto.aspx.cs" Inherits="admin_portal_editar_pagina" Title="Untitled Page" %>

<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

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
        Editar Texto Pagina Revista DNA</h2>
    <p>
        &nbsp;</p>
                                    <p>
    <br />
                                    </p>
                                    <p>
                                        &nbsp;</p>
<!-- Div Conteudo_pag-->
<div id="conteudo_pag">
    <p><b>Conteúdo</b></p>
    <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" Height="600px" Width="600px" SkinPath="skins/silver/" BasePath="../fckeditor/"></FCKeditorV2:FCKeditor>
</div>
<!-- Div Conteudo_pag-->

    <br />
    <br />
    <br />
    <asp:ImageButton ID="ImageButton2" runat="server" 
        ImageUrl="~/admin/images/btn_gravar.jpg" onclick="ImageButton2_Click" />

</asp:Content>

