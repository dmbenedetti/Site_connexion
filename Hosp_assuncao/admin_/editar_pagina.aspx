<%@ Page Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="editar_pagina.aspx.cs" Inherits="admin_portal_editar_pagina" Title="Untitled Page" %>

<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            color: #666666;
        }
        .style2
        {
            color: #999999;
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
        Editar Páginas do Portal</h2>
    <p>
        &nbsp;</p>
                                    <p>
    <br />
                                    </p>
                                    <p>
                                        &nbsp;</p>
                                    <p>
                                        <b>Título&nbsp; </b>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txt_titulo" ErrorMessage="Digite um titulo para página">*</asp:RequiredFieldValidator>
                                    </p>
<p>
    <asp:TextBox ID="txt_titulo" runat="server" CssClass="txt" Width="600px" 
        MaxLength="200"></asp:TextBox>
</p>
    <p>
        Imagem Destaque:</p>
                                    <p>
                                        <asp:Image ID="Image1" runat="server" Height="126px" Width="500px" />
                                        <br />
                                        <span class="style2"><i>Tamanho da imagem: 985px de largura por 248px de altura</i><br /></span> 
                                        Mudar imagem:<br />
                                        <asp:FileUpload ID="FileUpload1" runat="server" Width="244px" CssClass="txt" />
                                </p>
                                <p>
                                        Link da imagem:</p>
                                <p>
    <asp:TextBox ID="txt_link_img" runat="server" CssClass="txt" Width="341px" 
        MaxLength="200"></asp:TextBox>
                                </p>
                                    <p>
                                        &nbsp;</p>
    <p>
        <b>Tipo de página:</b></p>
                                    <p>
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                                            Height="28px" onselectedindexchanged="RadioButtonList1_SelectedIndexChanged" 
                                            RepeatDirection="Horizontal" Width="428px">
                                            <asp:ListItem Value="0">Conteúdo</asp:ListItem>
                                            <asp:ListItem Value="1">Formulário</asp:ListItem>
                                            <asp:ListItem Value="2">Link externo</asp:ListItem>
                                            <asp:ListItem Value="3">Link interno</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </p>
<!-- Div url-->
<div id="url" <% =div_url %>>
<p>Digite a url:<br />
<asp:TextBox ID="txt_url" runat="server" CssClass="txt" Width="341px"></asp:TextBox>
<br />
</p>
</div>
<!-- fim Div url-->
                                    
<!-- Div formulario_pag-->
<div id="formulario_pag" <% =div_formulario %>>
    <p>
        <b>Escolha o formulário:</b>
    </p>
    <p>
        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="txt" 
        Height="20px" Width="300px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:db_hosp_assuncaoConnectionString %>" 
        SelectCommand="SELECT [id], [nome] FROM [tb_formularios] ORDER BY [nome], [id]">
        </asp:SqlDataSource>
    </p>
</div>
<!-- Fim Div formulario_pag-->
<p>&nbsp;</p>
<p>&nbsp;</p>
<!-- Div Conteudo_pag-->
<div id="conteudo_pag" <% =div_conteudo %>>
    <p><b>Conteúdo</b></p>
    <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" Height="600px" Width="600px" SkinPath="skins/silver/" BasePath="../fckeditor/"></FCKeditorV2:FCKeditor>
</div>
<!-- Div Conteudo_pag-->

    <br />
    <p>Posição no menu:&nbsp;
        <asp:TextBox ID="txt_ordem" runat="server" CssClass="txt" 
            Width="50px" onkeypress="return txtBoxFormat(this, '9', event);"  
                onclick="this.value='';" MaxLength="3"></asp:TextBox>
    </p>
    <p>&nbsp;</p>
    <p>Exibir no menu:
    </p>
    <p>
        <asp:RadioButtonList ID="RadioButtonList2" runat="server" Height="25px" 
            RepeatDirection="Horizontal" Width="150px">
            <asp:ListItem>sim</asp:ListItem>
            <asp:ListItem>não</asp:ListItem>
        </asp:RadioButtonList>
    </p>
<p>
        Ativar Galeria de fotos:</p>
<p>
        <asp:RadioButtonList ID="RadioButtonList3" runat="server" Height="24px" 
            RepeatDirection="Horizontal" Width="180px">
            <asp:ListItem Value="1">sim</asp:ListItem>
            <asp:ListItem Value="0" Selected="True">não</asp:ListItem>
        </asp:RadioButtonList>
    </p>
    <br />
    <br />
    <asp:ImageButton ID="ImageButton2" runat="server" 
        ImageUrl="~/admin/images/btn_gravar.jpg" onclick="ImageButton2_Click" />

</asp:Content>

