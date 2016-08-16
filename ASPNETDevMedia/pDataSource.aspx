<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pDataSource.aspx.cs" Inherits="ASPNETDevMedia.pDataSource" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="DSCidades" runat="server" ConnectionString="<%$ ConnectionStrings:sistemadbConnectionString %>" 
            SelectCommand="SELECT * FROM [Cidades]"
            DeleteCommand="DELETE FROM Cidades WHERE (idCidade = @idCidade)"
            UpdateCommand="UPDATE Cidades SET descricao = @descricao, sigla = @sigla WHERE (idCidade = @idCidade)"
            InsertCommand="INSERT INTO Cidades(descricao, sigla) VALUES (@descricao, @sigla)">
            <DeleteParameters>
                <asp:ControlParameter ControlID="GVCidades" Name="idCidade" PropertyName="SelectedValue" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Type="String"  Name="descricao"/>
                <asp:Parameter Type="String" Name="sigla" />
                <asp:ControlParameter ControlID="GVCidades" Name="newparameter" PropertyName="SelectedValue" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Type="String" Name="descricao" />
                <asp:Parameter Type="String" Name="sigla" />
            </InsertParameters>
        </asp:SqlDataSource>
        <br />
        <asp:GridView ID="GVCidades" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="idCidade" DataSourceID="DSCidades" PageSize="5">
            <Columns>
                <asp:BoundField DataField="idCidade" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="idCidade" />
                <asp:TemplateField HeaderText="Cidade" SortExpression="descricao">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("descricao") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# DoUpper(Eval("descricao")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sigla" SortExpression="sigla">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("sigla") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# DoUpper(Eval("sigla")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField HeaderText="Excluir">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" 
                            OnClientClick="return confirm('Deseja realmente EXCLUIR?');" />
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:CommandField ShowEditButton="True" />
                
            </Columns>
        </asp:GridView>
    
        <br />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="idCidade" DataSourceID="DSCidades" DefaultMode="Insert">
            <EditItemTemplate>
                idCidade:
                <asp:Label ID="idCidadeLabel1" runat="server" Text='<%# Eval("idCidade") %>' />
                <br />
                descricao:
                <asp:TextBox ID="descricaoTextBox" runat="server" Text='<%# Bind("descricao") %>' />
                <br />
                sigla:
                <asp:TextBox ID="siglaTextBox" runat="server" Text='<%# Bind("sigla") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                descricao:
                <asp:TextBox ID="descricaoTextBox" runat="server" Text='<%# Bind("descricao") %>' />
                <br />
                sigla:
                <asp:TextBox ID="siglaTextBox" runat="server" Text='<%# Bind("sigla") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            
            <ItemTemplate>
                idCidade:
                <asp:Label ID="idCidadeLabel" runat="server" Text='<%# Eval("idCidade") %>' />
                <br />
                descricao:
                <asp:Label ID="descricaoLabel" runat="server" Text='<%# Bind("descricao") %>' />
                <br />
                sigla:
                <asp:Label ID="siglaLabel" runat="server" Text='<%# Bind("sigla") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
            
        </asp:FormView>
        <br />
        <asp:Repeater runat="server" DataSourceID="DSCidades">
            <HeaderTemplate>
                <table>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Eval("idCidade") %></td>
                    <td><%# DoUpper(Eval("descricao")) %></td>
                    <td><%# DoUpper(Eval("sigla")) %></td>

                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
    
        <br />
        <br />
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="idCidade" DataSourceID="DSCidades" GroupItemCount="3" InsertItemPosition="LastItem">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color:#FFF8DC;">idCidade:
                    <asp:Label ID="idCidadeLabel" runat="server" Text='<%# Eval("idCidade") %>' />
                    <br />descricao:
                    <asp:Label ID="descricaoLabel" runat="server" Text='<%# Eval("descricao") %>' />
                    <br />sigla:
                    <asp:Label ID="siglaLabel" runat="server" Text='<%# Eval("sigla") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <br />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    <br /></td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">idCidade:
                    <asp:Label ID="idCidadeLabel1" runat="server" Text='<%# Eval("idCidade") %>' />
                    <br />descricao:
                    <asp:TextBox ID="descricaoTextBox" runat="server" Text='<%# Bind("descricao") %>' />
                    <br />sigla:
                    <asp:TextBox ID="siglaTextBox" runat="server" Text='<%# Bind("sigla") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br /></td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
<td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">descricao:
                    <asp:TextBox ID="descricaoTextBox" runat="server" Text='<%# Bind("descricao") %>' />
                    <br />sigla:
                    <asp:TextBox ID="siglaTextBox" runat="server" Text='<%# Bind("sigla") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br /></td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color:#DCDCDC;color: #000000;">idCidade:
                    <asp:Label ID="idCidadeLabel" runat="server" Text='<%# Eval("idCidade") %>' />
                    <br />descricao:
                    <asp:Label ID="descricaoLabel" runat="server" Text='<%# Eval("descricao") %>' />
                    <br />sigla:
                    <asp:Label ID="siglaLabel" runat="server" Text='<%# Eval("sigla") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <br />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    <br /></td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">idCidade:
                    <asp:Label ID="idCidadeLabel" runat="server" Text='<%# Eval("idCidade") %>' />
                    <br />descricao:
                    <asp:Label ID="descricaoLabel" runat="server" Text='<%# Eval("descricao") %>' />
                    <br />sigla:
                    <asp:Label ID="siglaLabel" runat="server" Text='<%# Eval("sigla") %>' />
                    <br />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <br />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    <br /></td>
            </SelectedItemTemplate>
        </asp:ListView>
    
    </div>
    </form>
</body>
</html>
