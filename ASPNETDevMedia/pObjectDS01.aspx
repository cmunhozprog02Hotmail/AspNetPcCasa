<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pObjectDS01.aspx.cs" Inherits="ASPNETDevMedia.pObjectDS01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
        
        <asp:Button runat="server" ID="btnSearch" Text="Pesquisar" OnClick="btnSearch_Click" />
        <asp:GridView ID="gvPessoa" runat="server" AutoGenerateColumns="False" 
            DataSourceID="ODS01" DataKeyNames="idPessoa" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="idPessoa" HeaderText="idPessoa" SortExpression="idPessoa" />
                <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
                <asp:BoundField DataField="telefone" HeaderText="telefone" SortExpression="telefone" />
                <asp:BoundField DataField="obs" HeaderText="Obs." SortExpression="obs" />
                <asp:CommandField ShowSelectButton="true" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" 
                           OnClientClick="return confirm('Deseja realmente EXCLUIR?');"  Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                Nenhum dado encontrado
            </EmptyDataTemplate>
        </asp:GridView>
        
    
        <asp:ObjectDataSource ID="ODS01" runat="server" TypeName="ASPNETDevMedia.SampleContext"
            SelectMethod="GetPessoas"
            DeleteMethod="DeletePessoa" 
            UpdateMethod="UpdatePessoa">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtSearch" PropertyName="Text" Name="search" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        
    
        <br />
        <br />
        
        <asp:ObjectDataSource ID="ODS02" runat="server" DataObjectTypeName="ASPNETDevMedia.Pessoa" 
            InsertMethod="AddPessoa" 
            SelectMethod="GetPessoa" 
            UpdateMethod="Update"
            TypeName="ASPNETDevMedia.SampleContext">
            <SelectParameters>
                <asp:ControlParameter ControlID="gvPessoa" PropertyName="SelectedValue" Name="idPessoa" />
            </SelectParameters>
        </asp:ObjectDataSource>
        
        <asp:FormView runat="server" ID="FVPessoa" DataSourceID="ODS02" DefaultMode="Insert"
             OnItemUpdated="FVPessoa_ItemUpdated" OnItemInserted="FVPessoa_ItemInserted">
            <EditItemTemplate>
                <asp:HiddenField runat="server" ID="hdIdPessoa" Value='<%# Bind("idPessoa") %>' />
                <br />
                nome:
                <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>' />
                <br />
                telefone:
                <asp:TextBox ID="telefoneTextBox" runat="server" Text='<%# Bind("telefone") %>' />
                <br />
                Obs.:
                <asp:TextBox ID="obsTextBox" runat="server" Text='<%# Bind("obs") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                
                nome:
                <asp:TextBox ID="nomeTextBox" runat="server" Text='<%# Bind("nome") %>' />
                <br />
                telefone:
                <asp:TextBox ID="telefoneTextBox" runat="server" Text='<%# Bind("telefone") %>' />
                <br />
                Obs.:
                <asp:TextBox ID="obsTextBox" runat="server" Text='<%# Bind("obs") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            

        </asp:FormView>
    
    </div>
    </form>
</body>
</html>
