<%@ Page Title="Test Setup" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TestSetupUI.aspx.cs" Inherits="DiagnosticCenterBillManagementSystem.UI.TestSetupUI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />

    <fieldset>

        <table style="width: 100%">
            <tr>
                <td style="height: 52px; width: 146px">&nbsp;</td>
                <td style="height: 52px; width: 108px">
                    <asp:Label ID="Label1" runat="server" Text="Test Name"></asp:Label>
                </td>
                <td style="height: 52px">
                    <asp:TextBox ID="testNameTextBox" CssClass="form-control" runat="server" Width="180px"></asp:TextBox>
                </td>
                <td style="height: 52px"></td>
            </tr>
            <tr>
                <td style="height: 52px; width: 146px">&nbsp;</td>
                <td style="height: 52px; width: 108px">
                    <asp:Label ID="Label2" runat="server" Text="Fee"></asp:Label>
                </td>
                <td style="height: 52px">
                    <asp:TextBox ID="feeTextBox" CssClass="form-control" runat="server" Width="180px" Wrap="False"></asp:TextBox>
                </td>
                <td style="height: 52px"></td>
            </tr>
            <tr>
                <td style="height: 43px; width: 146px">&nbsp;</td>
                <td style="height: 43px; width: 108px">
                    <asp:Label ID="Label3" runat="server" Text="Test Type"></asp:Label>
                </td>
                <td style="height: 43px">
                    <asp:DropDownList ID="testTypeDropDownList" CssClass="form-control" runat="server" Width="180px">
                    </asp:DropDownList>
                </td>
                <td style="height: 43px"></td>
            </tr>
            <tr>
                <td style="height: 49px; width: 146px">&nbsp;</td>
                <td style="height: 49px; width: 108px"></td>
                <td style="height: 49px">
                    <asp:Button ID="saveButton" CssClass="btn btn-default" runat="server" Text="Save" OnClick="saveButton_Click" />
                </td>
                <td style="height: 49px"></td>
            </tr>
            <tr>
                <td style="width: 146px">&nbsp;</td>
                <td style="width: 108px">&nbsp;</td>
                <td>
                    <br />
                    <asp:Label ID="messageLabel" runat="server" Text=""></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />

        <asp:GridView ID="showAllTestsGridView" CssClass="grid" HorizontalAlign="Center" runat="server" AutoGenerateColumns="False" Width="565px" CellPadding="4" ForeColor="#333333" GridLines="None">

            <AlternatingRowStyle BackColor="White" />

            <Columns>

                <asp:TemplateField HeaderText="SL" ItemStyle-Width="5%">
                    <ItemTemplate>
                        <%# ((GridViewRow)Container).RowIndex + 1%>
                    </ItemTemplate>

                    <ItemStyle Width="20%"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Test Name" ItemStyle-CssClass="text-align-left">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("TestName") %>'></asp:Label>
                    </ItemTemplate>

                    <ItemStyle CssClass="text-align-left"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Fee">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("TestFee") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Type">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("TestTypeName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>

            <EditRowStyle BackColor="#2461BF" />

            <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />

        </asp:GridView>


    </fieldset>

    <br />
    <br />
    <script src="../Scripts/jquery-2.2.3.js"></script>
    <script src="../Scripts/jquery.validate.js"></script>


    <script>
        $(document).ready(function () {

            jQuery.validator.addMethod(
           "content",
           function(value, element) {
               var isValid = /^[A-Za-z][a-zA-Z0-9- .]+$/.test(value);
               return this.optional(element) || isValid;
           },
           "Insert "
           );
            
            

             jQuery.validator.addMethod(
        "money",
            function(value, element) {
            var isValidMoney = /^\s*(?=.*[1-9])\d*(?:\.\d{1,2})?\s*$/.test(value);
            return this.optional(element) || isValidMoney;
            },
            "Insert "
            );

            jQuery.validator.addMethod(
          "selected",
          function(value, element) {
              if ($("select option:selected").index() > 0)
                  return true;

          },
          "Insert "
       );


            $("#mainForm").validate({
                rules: {
                    <%= testNameTextBox.UniqueID %>: {
                        required:true,
                        content:true,
                        minlength:3
                    },
                    <%= feeTextBox.UniqueID %>: {
                        required: true,
                        money:true
                    },
                    <%= testTypeDropDownList.UniqueID %>: {
                        required: true,
                        selected: true
                    }
                    
                    
                },
                messages: {
                    <%= testNameTextBox.UniqueID %>: {
                        required:"Please provide Test Name",
                        content: "Test Type Name Can Have Alphabets Digits Space & - Only!",
                        minlength: "Test Type Name Must be At Least 3 Characters long!"
                    },
                    <%= feeTextBox.UniqueID %>: {
                        required:"Please provide Fee",
                        money: "Fee must be positive and numeric value"
                    },
                    <%= testTypeDropDownList.UniqueID %>: {
                        required: "Please select Test Type",
                        selected:  "Please select Test Type"
                    }
                }
            });  
            
        });
    
    </script>





</asp:Content>
