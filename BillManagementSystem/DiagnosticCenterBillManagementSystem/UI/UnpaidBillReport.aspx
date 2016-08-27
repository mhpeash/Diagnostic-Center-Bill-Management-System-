<%@ Page Title="Unpaid Bill Report" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UnpaidBillReport.aspx.cs" Inherits="DiagnosticCenterBillManagementSystem.UI.UnpaidBillReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <fieldset>
        <table class="ui-accordion">
            <tr>
                <td style="width: 140px"></td>
                <td style="width: 74px">
                    <asp:Label ID="Label1" runat="server" Text="From Date "></asp:Label>
                </td>
                <td style="width: 197px">
                    <asp:TextBox ID="fromDateTextBox" CssClass="form-control" runat="server" Width="194px"></asp:TextBox>
                </td>
                <td style="width: 53px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         
            <asp:Label ID="Label3" runat="server" Text="to"></asp:Label>

                </td>
                <td>
                    <asp:TextBox ID="toDateTextBox" CssClass="form-control" runat="server" Width="192px"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr>
                <td style="width: 159px"></td>
                <td style="width: 74px"></td>
                <td style="width: 197px"></td>
                <td style="width: 53px">
                    <br />
                    <asp:Button ID="showButton" CssClass="btn btn-default" runat="server" Text="Show" OnClick="showButton_Click" Height="40px" Width="85px" />
                </td>
                <td></td>
            </tr>
            <tr>
                <td style="width: 159px"></td>
                <td style="width: 74px"></td>
                <td style="width: 197px">
                    <asp:Label ID="messageLabel" runat="server"></asp:Label>
                </td>
                <td style="width: 53px">

                    <br />
                    <%--<asp:Label ID="messageLabel" runat="server" Text=""></asp:Label>--%>
                </td>
                <td></td>
            </tr>
        </table>
        
                
        <br />


        <asp:GridView ID="showUnpaidBillGridView" CssClass="grid" runat="server" HorizontalAlign="Center" Width="508px" AutoGenerateColumns="False" OnRowDataBound="showUnpaidBillGridView_RowDataBound" ShowFooter="True" CellPadding="4"
            EmptyDataText="No data available." ForeColor="#333333" GridLines="None">



            <AlternatingRowStyle BackColor="White" />



            <Columns>

                <asp:TemplateField HeaderText="SL" ItemStyle-Width="6%">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# ((GridViewRow)Container).RowIndex + 1%>'></asp:Label>
                    </ItemTemplate>

<ItemStyle Width="6%"></ItemStyle>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Bill No">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("BillNo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Contact No">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("MobileNo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Patient Name" ItemStyle-CssClass="text-align-left">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("PatientName") %>'></asp:Label>
                    </ItemTemplate>

<ItemStyle CssClass="text-align-left"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Bill Amount">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("TotalAmount") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>



            </Columns>

            <EditRowStyle BackColor="#7C6F57" />

            <EmptyDataRowStyle HorizontalAlign="Center" />

            <FooterStyle HorizontalAlign="Center" BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
            <HeaderStyle HorizontalAlign="Center" BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle HorizontalAlign="Center" BackColor="#666666" ForeColor="White" />
            <RowStyle HorizontalAlign="Center" BackColor="#E3EAEB" />

            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />

        </asp:GridView>

        <br />
        <br />


        <table class="ui-accordion">
            <tr>
                <td style="width: 418px">&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;<asp:Button ID="pdfButton" CssClass="btn btn-default" runat="server" Text="PDF" Height="40px" OnClick="pdfButton_Click" Width="85px" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        


        <script src="../Scripts/jquery.validate.js"></script>
        <script src="../Scripts/jquery-ui-1.11.4.js"></script>

        <script>
            $(function () {

                $("[id*=fromDateTextBox]").datepicker({
                    defaultDate: "-1w",
                    changeMonth: true,
                    changeYear: true,
                    numberOfMonths: 1,
                    onClose: function (selectedDate) {
                        $("[id*=toDateTextBox]").datepicker("option", "minDate", selectedDate);
                    }


                });

                $("[id*=toDateTextBox]").datepicker({
                    //defaultDate: "+1w",
                    changeMonth: true,
                    changeYear: true,
                    numberOfMonths: 1,
                    setDate: new Date(),
                    onClose: function (selectedDate) {
                        $("[id*=fromDateTextBox]").datepicker("option", "maxDate", selectedDate);
                    }
                });



                $("[id*=showButton]").click(function() {

                    var startDate = $("[id*=fromDateTextBox]").val();
                    var endDate = $("[id*=toDateTextBox]").val();

                    var currentDate = moment().format("MM/DD/YYYY");

                    if (startDate === "") {
                        alert("Select Date!");
                        return false;
                    }

                    if (endDate === "") {
                        alert("Select Date!");
                        return false;
                    }

                    if (startDate > currentDate) {
                        alert("Search Date Cannot Go Beyond Current Date!");
                        return false;
                    }

                    if (endDate > currentDate) {
                        alert("Search Date Cannot Go Beyond Current Date!");
                        return false;
                    }
                    
                });


            });


        </script>


    </fieldset>
</asp:Content>
