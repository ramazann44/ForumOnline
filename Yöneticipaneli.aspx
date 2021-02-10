<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="Yöneticipaneli.aspx.cs" Inherits="Forrumonline.adminpaneli" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <asp:Label ID="lblrol" runat="server" Text=""></asp:Label>

    <asp:Panel ID="pnlyoneticilericinuyeler" runat="server" ForeColor="Black" Width="98%">

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" ForeColor="#333333" Width="75%" CellPadding="4" GridLines="None" Height="122px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Ad" HeaderText="Ad" SortExpression="Ad" />
                <asp:BoundField DataField="Soyad" HeaderText="Soyad" SortExpression="Soyad" />
                <asp:BoundField DataField="Kullaniciadi" HeaderText="Kullaniciadi" SortExpression="Kullaniciadi" />
                <asp:BoundField DataField="Rol" HeaderText="Rol" SortExpression="Rol" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:forumonlineConnectionString %>" DeleteCommand="DELETE FROM [Kullanicilar] WHERE [ID] = @original_ID AND (([Ad] = @original_Ad) OR ([Ad] IS NULL AND @original_Ad IS NULL)) AND (([Soyad] = @original_Soyad) OR ([Soyad] IS NULL AND @original_Soyad IS NULL)) AND (([Kullaniciadi] = @original_Kullaniciadi) OR ([Kullaniciadi] IS NULL AND @original_Kullaniciadi IS NULL)) AND (([Rol] = @original_Rol) OR ([Rol] IS NULL AND @original_Rol IS NULL))" InsertCommand="INSERT INTO [Kullanicilar] ([Ad], [Soyad], [Kullaniciadi], [Rol]) VALUES (@Ad, @Soyad, @Kullaniciadi, @Rol)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [ID], [Ad], [Soyad], [Kullaniciadi], [Rol] FROM [Kullanicilar] ORDER BY [ID]" UpdateCommand="UPDATE [Kullanicilar] SET [Ad] = @Ad, [Soyad] = @Soyad, [Kullaniciadi] = @Kullaniciadi, [Rol] = @Rol WHERE [ID] = @original_ID AND (([Ad] = @original_Ad) OR ([Ad] IS NULL AND @original_Ad IS NULL)) AND (([Soyad] = @original_Soyad) OR ([Soyad] IS NULL AND @original_Soyad IS NULL)) AND (([Kullaniciadi] = @original_Kullaniciadi) OR ([Kullaniciadi] IS NULL AND @original_Kullaniciadi IS NULL)) AND (([Rol] = @original_Rol) OR ([Rol] IS NULL AND @original_Rol IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_Ad" Type="String" />
                <asp:Parameter Name="original_Soyad" Type="String" />
                <asp:Parameter Name="original_Kullaniciadi" Type="String" />
                <asp:Parameter Name="original_Rol" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Ad" Type="String" />
                <asp:Parameter Name="Soyad" Type="String" />
                <asp:Parameter Name="Kullaniciadi" Type="String" />
                <asp:Parameter Name="Rol" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Ad" Type="String" />
                <asp:Parameter Name="Soyad" Type="String" />
                <asp:Parameter Name="Kullaniciadi" Type="String" />
                <asp:Parameter Name="Rol" Type="String" />
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_Ad" Type="String" />
                <asp:Parameter Name="original_Soyad" Type="String" />
                <asp:Parameter Name="original_Kullaniciadi" Type="String" />
                <asp:Parameter Name="original_Rol" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </asp:Panel>

    <asp:Panel ID="pnlmoderatorlericinuyeler" runat="server">

        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Width="75%">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Ad" HeaderText="Ad" SortExpression="Ad" />
                <asp:BoundField DataField="Soyad" HeaderText="Soyad" SortExpression="Soyad" />
                <asp:BoundField DataField="Kullaniciadi" HeaderText="Kullaniciadi" SortExpression="Kullaniciadi" />
                <asp:BoundField DataField="Rol" HeaderText="Rol" SortExpression="Rol" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:forumonlineConnectionString %>" DeleteCommand="DELETE FROM [Kullanicilar] WHERE [ID] = @original_ID AND (([Ad] = @original_Ad) OR ([Ad] IS NULL AND @original_Ad IS NULL)) AND (([Soyad] = @original_Soyad) OR ([Soyad] IS NULL AND @original_Soyad IS NULL)) AND (([Kullaniciadi] = @original_Kullaniciadi) OR ([Kullaniciadi] IS NULL AND @original_Kullaniciadi IS NULL)) AND (([Rol] = @original_Rol) OR ([Rol] IS NULL AND @original_Rol IS NULL))" InsertCommand="INSERT INTO [Kullanicilar] ([Ad], [Soyad], [Kullaniciadi], [Rol]) VALUES (@Ad, @Soyad, @Kullaniciadi, @Rol)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [ID], [Ad], [Soyad], [Kullaniciadi], [Rol] FROM [Kullanicilar] WHERE [Rol]='Üye' ORDER BY [ID]" UpdateCommand="UPDATE [Kullanicilar] SET [Ad] = @Ad, [Soyad] = @Soyad, [Kullaniciadi] = @Kullaniciadi, [Rol] = @Rol WHERE [ID] = @original_ID AND (([Ad] = @original_Ad) OR ([Ad] IS NULL AND @original_Ad IS NULL)) AND (([Soyad] = @original_Soyad) OR ([Soyad] IS NULL AND @original_Soyad IS NULL)) AND (([Kullaniciadi] = @original_Kullaniciadi) OR ([Kullaniciadi] IS NULL AND @original_Kullaniciadi IS NULL)) AND (([Rol] = @original_Rol) OR ([Rol] IS NULL AND @original_Rol IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_Ad" Type="String" />
                <asp:Parameter Name="original_Soyad" Type="String" />
                <asp:Parameter Name="original_Kullaniciadi" Type="String" />
                <asp:Parameter Name="original_Rol" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Ad" Type="String" />
                <asp:Parameter Name="Soyad" Type="String" />
                <asp:Parameter Name="Kullaniciadi" Type="String" />
                <asp:Parameter Name="Rol" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Ad" Type="String" />
                <asp:Parameter Name="Soyad" Type="String" />
                <asp:Parameter Name="Kullaniciadi" Type="String" />
                <asp:Parameter Name="Rol" Type="String" />
                <asp:Parameter Name="original_ID" Type="Int32" />
                <asp:Parameter Name="original_Ad" Type="String" />
                <asp:Parameter Name="original_Soyad" Type="String" />
                <asp:Parameter Name="original_Kullaniciadi" Type="String" />
                <asp:Parameter Name="original_Rol" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </asp:Panel>

</asp:Content>
