<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="am_curso_detail.aspx.cs" Inherits="campanhas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<link href="styles_ogrupo.css" rel="stylesheet" media="screen" />
<asp:Literal ID="ltlMetaTag" runat="server"></asp:Literal>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div id="container_interna">
<h2><asp:Literal ID="ltlTitulo" runat="server"></asp:Literal></h2>
<div id="contentContainer">
    <h3><asp:Label ID="lbl_titulo" runat="server" Text=""></asp:Label></h3>
    <div>
        <asp:ListView ID="ListView2" runat="server" DataKeyNames="nm_especialidade" DataSourceID="ds_especialidade">
            <ItemTemplate>
                <span class="span_esp"><%# Eval("nm_especialidade") %></span>
            </ItemTemplate>
        </asp:ListView>
    </div>
    <div id="dataCurso">
        Data:<asp:Literal ID="ltlData" runat="server"></asp:Literal><br />
        Horário: <asp:Literal ID="ltlHorario" runat="server"></asp:Literal>
    </div>
    <div id="localCurso">
        <asp:Literal ID="ltlLocal" runat="server"></asp:Literal>
    </div>
    <div id="descricaoCurso">
        <asp:Literal ID="ltr_conteudo" runat="server"></asp:Literal>
    </div>
</div>

<div id="rightContainer">
    <div id="boxIncreva">
        <asp:Literal ID="ltlInfo" runat="server"></asp:Literal><br /><br />
        Inscrição até:
        <asp:Literal ID="ltlDataInscri" runat="server"></asp:Literal>
        
        
        <br />
        <asp:Literal ID="ltlPreco" runat="server"></asp:Literal><br />
        <asp:Literal ID="ltlUnidade" runat="server"></asp:Literal>

        <div class="btnPrimario" style="text-align:center; margin-top: 15px;"><asp:HyperLink ID="hpkInscricao" runat="server"></asp:HyperLink></div>
        <br />
    </div>
    <div id="boxAtendimento">
        <p style="font-size: 20px; font-weight: bold;">
            <asp:Literal ID="ltlTituloBox2" runat="server"></asp:Literal>
        </p>
        <br />
        <p>
            <asp:Literal ID="ltlDescBox2" runat="server"></asp:Literal></p>
        <br />
        <div style="font-size: 15px; font-weight: bold; text-align:center;">
            <asp:Literal ID="ltlTelefone" runat="server"></asp:Literal>
        </div>
        <br />
        <div class="botao" style="text-align:center;">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="" Visible="false" Text="Fale Conosco"></asp:HyperLink></div>
        <br />
    </div>
</div>


<!--div class="botao" style="width: 80px; margin-left: 94px; text-align: center; cursor: pointer;" onclick="history.go(-1);">< Voltar</div-->


<asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="ds_paginas">
<EmptyDataTemplate>
    <span></span>
</EmptyDataTemplate>
<ItemTemplate>
    <div style=" border-bottom:solid 1px #efefef; margin-bottom:20px; padding: 10px 0px 10px 0px;" class="campanhas_front">
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td>
                <p><h3 style="margin:5px 0;"><strong><%# Eval("ds_curso")%></strong></h3></p>
                <p style="padding: 0px 0px 10px 0px;">
                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("id")%>' />

                    <asp:ListView ID="ListView2" runat="server" DataKeyNames="nm_especialidade" DataSourceID="ds_especialidade">
                        <ItemTemplate>
                            <span class="span_esp"><%# Eval("nm_especialidade") %></span>
                        </ItemTemplate>
                    </asp:ListView>
                </p>
            </td>
            <td width="180" style="border-left: 1px solid #CCC; border-right: 1px solid #CCC; text-align:center;">
                <%# Eval("nm_hospital") %>
            </td>
            <td width="200" style=" text-align:center;">
                <div class='<%#((!Convert.IsDBNull(Eval("dt_inscricao"))) && System.DateTime.Now < Convert.ToDateTime(Eval("dt_inscricao")) ? "botao" : "botao2") %>'><asp:HyperLink ID="hpkInscricao" runat="server" Text='<%# ((!Convert.IsDBNull(Eval("dt_inscricao"))) && System.DateTime.Now < Convert.ToDateTime(Eval("dt_inscricao")) ? "Mais informações" : "<strong>Inscrições encerradas</strong><br><span style=\"color: black;\">Avise-me quando estiver disponível</span>") %>' NavigateUrl='<%# "am_curso_detail.aspx?id=" + Eval("id").ToString() %>'></asp:HyperLink></span>
            </td>
        </tr>
    </table>
 </div>
             
                <asp:SqlDataSource ID="ds_especialidade" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
            
            
                    SelectCommand="SELECT * FROM dbo.TB_AREA_MEDICA_CURSO_ESPECIALIDADE a INNER JOIN TB_EPSECIALIDADE b ON a.id_especialidade = b.id_especialidade WHERE id_area_medica_curso = @idCurso order by b.nm_especialidade">
                    <SelectParameters>
                        <asp:ControlParameter ControlId="HiddenField1" DefaultValue="0" Type="Int32" PropertyName="Value" Name="idCurso" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
                <asp:DataPager ID="ItemDataPager" runat="server" PageSize="15">
        <Fields>
             <asp:NumericPagerField ButtonCount="3" />
        </Fields>
    </asp:DataPager> 
            </LayoutTemplate>
        </asp:ListView>

        <asp:SqlDataSource ID="ds_paginas" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
            
            
            SelectCommand="SELECT id, ds_Curso, dt_curso, dt_inscricao, b.nm_hospital FROM 	[TB_AREA_MEDICA_CURSO] a INNER JOIN [TB_HOSPITAL] b ON a.id_hospital = b.id_hospital INNER JOIN [TB_AREA_MEDICA_CURSO_HOSPITAL] c ON a.id = c.id_curso WHERE ((a.id_status = @id_status) AND id IN (SELECT id_area_medica_curso FROM dbo.TB_AREA_MEDICA_CURSO_ESPECIALIDADE WHERE id_especialidade in (SELECT id_especialidade FROM TB_AREA_MEDICA_CURSO_ESPECIALIDADE j WHERE j.id_area_medica_curso = @idCurso ) and id_area_medica_curso <> @idCurso AND c.id_hospital = @idHosp)) order by dt_curso desc, id desc">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
                <asp:QueryStringParameter QueryStringField="id" Name="idCurso" Type="Int32" />
                <asp:SessionParameter Name="idHosp" SessionField="idHosp" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

    <asp:SqlDataSource ID="ds_especialidade" runat="server" ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>"
        SelectCommand="SELECT * FROM dbo.TB_AREA_MEDICA_CURSO_ESPECIALIDADE a INNER JOIN TB_EPSECIALIDADE b ON a.id_especialidade = b.id_especialidade WHERE id_area_medica_curso = @idCurso order by b.nm_especialidade">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="id" DefaultValue="0" Type="Int32" Name="idCurso" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="ds_campanhas_last_four" runat="server" ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>"
        SelectCommand="SELECT top 4 [id_conteudo], [nm_titulo], [dt_conteudo], (CASE WHEN [ds_imgDestaque] is null THEN 'destaque_default.jpg' ELSE [ds_imgDestaque] END)as imagem , [ds_resumo] FROM [TB_PORTAL_CONTEUDO] WHERE (([id_sessao] = @id_sessao) AND ([id_tipo] = @id_tipo) AND ([id_status] = @id_status) AND ([id_idioma] = @id_idioma) AND id_conteudo <> @idConteudo) order by dt_conteudo desc,id_conteudo desc ">
        <SelectParameters>
            <asp:Parameter DefaultValue="3" Name="id_sessao" Type="Int32" />
            <asp:Parameter DefaultValue="4" Name="id_tipo" Type="Int32" />
            <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
            <asp:QueryStringParameter QueryStringField="id" Name="idConteudo" Type="Int32" />
            <asp:SessionParameter Name="id_idioma" SessionField="idioma" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>
</asp:Content>
