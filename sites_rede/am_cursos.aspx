<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="am_cursos.aspx.cs" Inherits="campanhas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>

    

.botao2 
{
    background-color: #f1f1f1;
    color: #666;
    padding: 10px 15px 10px 15px;
    margin: 0 10px;
    font-size: 15px;
}

.botao2 a
{
    color: #a0a0a0;
}


</style>
<asp:Literal ID="ltlMetaTag" runat="server"></asp:Literal>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="container_interna">
<h2><asp:Literal ID="ltlTitulo" runat="server"></asp:Literal></h2>
<br /><br />
<div style="border-bottom:solid 1px #efefef; padding-bottom: 30px;" >
<asp:DropDownList runat="server" CssClass="selectDefault" ID="drpUnidade" DataSourceID="SqlDataSource1" DataTextField="nm_hospital" DataValueField="id_hospital">
    <asp:ListItem Text="Selecione uma Unidade" Value="0"></asp:ListItem>
</asp:DropDownList> - <asp:DropDownList runat="server"  CssClass="selectDefault" ID="drpEspecialidade" DataSourceID="SqlDataSource2" DataTextField="nm_especialidade" DataValueField="id_especialidade">
    <asp:ListItem Text="Selecione uma Especialidade" Value="0"></asp:ListItem>
</asp:DropDownList>
<asp:LinkButton ID="btnBuscar" runat="server" CssClass="btnDefault" Text="  Buscar  " 
        onclick="btnBuscar_Click"></asp:LinkButton>
</div>

<asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="ds_paginas">
            <EmptyDataTemplate>
                <span>Nenhum registro encontrado.</span>
            </EmptyDataTemplate>
            <ItemTemplate>
                <div style=" border-bottom:solid 1px #efefef; margin-bottom:20px; padding: 10px 0px 10px 0px;" class="campanhas_front">
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td>
                            <p><h3><strong><%# Eval("ds_curso")%></strong></h3></p>
                            <p style="padding: 0px 0px 10px 0px;">
                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("id")%>' />

                                <asp:ListView ID="ListView2" runat="server" DataKeyNames="nm_especialidade" DataSourceID="ds_especialidade">
                                    <ItemTemplate>
                                        <span class="span_esp"><%# Eval("nm_especialidade") %></span>
                                    </ItemTemplate>
                                </asp:ListView>
                            </p>
                        </td>
                        <td width="180" class="cursostd2" style="border-left: 1px solid #efefef; border-right: 1px solid #efefef; text-align:center;">
                            <%# Eval("nm_hospital") %>
                        </td>
                        <td width="200" class="cursostd3" style=" text-align:center;">
                            <div class='<%#((!Convert.IsDBNull(Eval("dt_inscricao"))) && System.DateTime.Now < Convert.ToDateTime(Eval("dt_inscricao")) ? "btnPrimario" : "botao2") %>'><asp:HyperLink ID="hpkInscricao" runat="server" Text='<%# ((!Convert.IsDBNull(Eval("dt_inscricao"))) && System.DateTime.Now < Convert.ToDateTime(Eval("dt_inscricao")) ? "Mais informações" : "<strong>Inscrições encerradas</strong>") %>' NavigateUrl='<%# "am_curso_detail.aspx?id=" + Eval("id").ToString() %>'></asp:HyperLink></span>
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
            
            
            SelectCommand="SELECT id, ds_Curso, dt_curso, dt_inscricao, b.nm_hospital FROM [TB_AREA_MEDICA_CURSO] a INNER JOIN [TB_HOSPITAL] b ON a.id_hospital = b.id_hospital INNER JOIN [TB_AREA_MEDICA_CURSO_HOSPITAL] c ON a.id = c.id_curso WHERE ((a.id_status = @id_status) AND (ISNULL(@Unidade,0) = 0 OR b.id_hospital = @Unidade) AND (ISNULL(@Especialidade,0) = 0 OR id IN (SELECT id_area_medica_curso FROM dbo.TB_AREA_MEDICA_CURSO_ESPECIALIDADE WHERE id_especialidade = @Especialidade)) AND c.id_hospital = @idHosp ) order by dt_curso desc, id desc">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
                <asp:ControlParameter ConvertEmptyStringToNull="true" DefaultValue="0" Name="Unidade" Type="Int32" ControlID="drpUnidade" PropertyName="SelectedValue" />
                <asp:ControlParameter ConvertEmptyStringToNull="true" DefaultValue="0" Name="Especialidade" Type="Int32" ControlID="drpEspecialidade" PropertyName="SelectedValue" />
                <asp:SessionParameter Name="idHosp" SessionField="idHosp" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
            
            
            SelectCommand="SELECT 0 id_hospital, '  Selecione uma Unidade' nm_hospital UNION SELECT id_hospital, nm_hospital FROM [TB_HOSPITAL] b WHERE ((id_status = @id_status)) order by nm_hospital">
            <SelectParameters>
                
                <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:db_rede_dorConnectionString %>" 
            
            
            SelectCommand="SELECT 0 id_especialidade, '  Selecione uma Especialidade' nm_especialidade UNION SELECT id_especialidade, nm_especialidade FROM [TB_EPSECIALIDADE] b WHERE ((id_status = @id_status)) order by nm_especialidade">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="id_status" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
</div>

</asp:Content>

