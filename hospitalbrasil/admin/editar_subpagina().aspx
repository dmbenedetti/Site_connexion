<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="editar_subpagina().aspx.cs" Inherits="admin_portal_editar_pagina" Title="Untitled Page" %>

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
        Editar Sub-Página</h2>
    <p>
        &nbsp;</p>
    <p>
    <br />
        <b>Título&nbsp; </b>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txt_titulo" ErrorMessage="Digite um titulo para página">*</asp:RequiredFieldValidator>
                                    </p>
<p>
    <asp:TextBox ID="txt_titulo" runat="server" CssClass="txt" Width="600px" 
        MaxLength="200"></asp:TextBox>
</p>
                                    <p>
                                        &nbsp;</p>
    <p>
        <b>Conteúdo</b></p>
    <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" Height="600px" 
        Width="600px" SkinPath="skins/silver/" BasePath="../fckeditor/">
    </FCKeditorV2:FCKeditor>
    <br />
    <p>Posição no menu:&nbsp;
        <asp:TextBox ID="txt_ordem" runat="server" CssClass="txt" 
            Width="50px" onkeypress="return txtBoxFormat(this, '9', event);"  
                onclick="this.value='';" MaxLength="3"></asp:TextBox>
    </p>
    <br />
    <br />
    <asp:ImageButton ID="ImageButton2" runat="server" 
        ImageUrl="~/admin/images/btn_gravar.jpg" onclick="ImageButton2_Click" />

<br />
<br />
<br />
<asp:ImageButton ID="ImageButton3" runat="server" 
    ImageUrl="~/admin/images/btn_voltar.jpg" onclick="ImageButton3_Click" />

</asp:Content>

