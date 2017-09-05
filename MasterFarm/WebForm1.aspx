<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="WebForm1.aspx.cs" Inherits="MasterFarm.WebForm1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <form id="frmAccMaster" runat="server">
        <div id="MainDiv">
            <table id="tAccMaster" border="0" cellpadding="0" cellspacing="0" style="width: 100%;
                height: 100%; vertical-align: top;" align="left">
                <tr>
                    <td width="85%" height="95%" valign="top" align="left">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%" style="padding-left: 10px;
                            padding-right: 10px;">
                            <tr>
                                <td style="height: 2px">
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 12%; width: 100%" valign="top" align="left">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
                                        <tr>
                                            <td style="width: 17%; height: 1%">
                                            </td>
                                            <td style="width: 21%">
                                            </td>
                                            <td style="width: 30%">
                                            </td>
                                            <td style="width: 28%">
                                            </td>
                                            <td style="width: 5%">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="22%" class="tdAlign">
                                                <asp:Label ID="lblOurBranchID" runat="Server" Text="<%$ Resources:BRLabel, lblBranchID%>"
                                                    CssClass="Mandatory"  EnableViewState="False"></asp:Label></td>
                                            <td colspan="4">
                                                <asp:textbox TabIndex="1" Width="100%" ID="txtBranch" runat="server"
                                                    ControlType="BranchID" MaxLength="6" validationType="Default">
                                                </asp:textbox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="22%" class="tdAlign">
                                                <asp:Label ID="lblClientID" runat="Server" Text="<%$ Resources:BRLabel, lblClientID%>"
                                                    CssClass="Mandatory"  EnableViewState="False"></asp:Label></td>
                                            <td colspan="4">
                                                <asp:textbox TabIndex="2" Width="100%" ID="txtClient" runat="server"
                                                    validationType="AlphaNumeric" ControlType="clientid" MaxLength="20">
                                                </asp:textbox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 22%" class="tdAlign">
                                                <asp:Label ID="lblProductID" runat="server" CssClass="Mandatory" Text="<%$ Resources:BRLabel, lblProductID%>"
                                                     EnableViewState="False"></asp:Label></td>
                                            <td colspan="4">
                                                <asp:textbox TabIndex="3" ID="txtProduct" runat="server" Width="100%"
                                                    MaxLength="6" validationType="AlphaNumeric" ControlType="ProductBranchID">
                                                </asp:textbox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 22%" class="tdAlign">
                                                <asp:Label ID="lblAccountID" runat="Server" Text="<%$ Resources:BRLabel, lblAccountID%>"
                                                    CssClass="Mandatory"  EnableViewState="False"></asp:Label></td>
                                            <td colspan="4">
                                                <table id="tblGrp" cellpadding="0" cellspacing="0" width="100%" height="100%">
                                                    <tr>
                                                        <td style="width: 22.5%">
                                                          <%--<asp:TextBox ID="txtAccount" runat="server" CssClass="TextBox" TabIndex="4" onkeydown="fnGetAccounts" ></asp:TextBox>--%>
                                                            <asp:textbox Width="100%" ID="txtAccount" runat="server" CssClass="TextBox"
                                                                TabIndex="4">
                                                                <ClientSideEvents KeyDown="fnGetAccounts" Initialize="txtAccount_init" Blur="fnGetAccountDescription"
                                                                    KeyPress="fnAccountKeypress" />
                                                            </asp:textbox>
                                                        </td>
                                                        <td style="width: 67%;">
                                                            <asp:textbox ID="txtAccountDesc" runat="server" CssClass="TextBox" TabIndex="5"
                                                                MaxLength="100">
                                                                <ClientSideEvents Initialize="txtAccountDesc_init" />
                                                            </asp:textbox>
                                                        </td>
                                                        <td style="width: 2.5%;">
                                                        </td>
                                                        <td style="width: 2.5%; text-align: left;">
                                                            <img alt="" src="../Images/CS_Find.gif" onclick="f2Search(event)" style="cursor:hand;cursor:pointer"
                                                                    align="left" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 0.3%">
                                </td>
                            </tr>
                            <tr>
                                <td width="100%" height="38%" valign="top">
                                    <table border="0" width="100%" cellpadding="0" height="99%" cellspacing="0" class="DataTable">
                                        <tr>
                                            <td class="DataTableTitle" colspan="4" height="7.5%">
                                                <asp:Label ID="lblAccount" runat="server" Text="<%$ Resources:BRLabel, lblAccount%>"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="25%; height:1%">
                                            </td>
                                            <td width="25%">
                                            </td>
                                            <td width="25%">
                                            </td>
                                            <td width="25%">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdAlign">
                                                <asp:Label ID="lblShortName" runat="Server" Text="<%$ Resources:BRLabel, lblShortName%>"
                                                    CssClass="Label"  EnableViewState="False"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:textbox ID="txtShortName" MaxLength="20" runat="server" Width="90%" CssClass="TextBox"
                                                    EnableViewState="False" TabIndex="6">
                                                    <ClientSideEvents KeyDown="fnAlphaNumKeyPress" />
                                                </asp:textbox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdAlign">
                                                <asp:Label ID="lblAddress1" runat="Server" Text="<%$ Resources:BRLabel, lblAddress1%>"
                                                    CssClass="Mandatory"  EnableViewState="False"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:textbox ID="txtAddress1" runat="server" Width="90%" CssClass="TextBox"
                                                    MaxLength="255" EnableViewState="False" TabIndex="7">
                                                </asp:textbox>
                                            </td>
                                            <td class="tdAlign">
                                                <asp:Label ID="lblAddress2" runat="Server" Text="<%$ Resources:BRLabel, lblAddress2%>"
                                                    CssClass="Label"  EnableViewState="False"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:textbox ID="txtAddress2" runat="server" Width="90%" CssClass="TextBox"
                                                    MaxLength="255" EnableViewState="False" TabIndex="8">
                                                </asp:textbox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdAlign">
                                                <asp:Label ID="lblCityID" runat="Server" Text="<%$ Resources:BRLabel, lblCity%>"
                                                    CssClass="Label" EnableViewState="False"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="cboUserCityID" CssClass="ComboBox" runat="server" Width="91%"
                                                     EnableViewState="False" TabIndex="9">
                                                </asp:DropDownList>
                                            </td>
                                            <td class="tdAlign">
                                                <asp:Label ID="lblCountryID" runat="Server" Text="<%$ Resources:BRLabel, lblCountry%>"
                                                    CssClass="Label" EnableViewState="False"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="cboUserCountryID" CssClass="ComboBox" runat="server" Width="91%"
                                                     EnableViewState="False" TabIndex="10">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdAlign">
                                                <asp:Label ID="lblPhone1" runat="Server" Text="<%$ Resources:BRLabel, lblPhone1%>"
                                                    CssClass="Label"  EnableViewState="False"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtPhone1" runat="server" EnableViewState="False" Visible="true" MaxLength="30" Width="90%" CssClass="TextBox"
                                                    TabIndex="11"></asp:TextBox>
                                                <%--<asp:textbox ID="txtPhone1" runat="server" Width="90%" CssClass="TextBox" MaxLength="30"  EnableViewState="False"  TabIndex=11>
                                        <ClientSideEvents KeyDown="fnPhoneValidFF(event)"/>
                                        </asp:textbox>--%>
                                            </td>
                                            <td class="tdAlign">
                                                <asp:Label ID="lblPhone2" runat="Server" Text="<%$ Resources:BRLabel, lblPhone2%>"
                                                    CssClass="Label"  EnableViewState="False"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtPhone2" runat="server" EnableViewState="False" Visible="true" MaxLength="30" Width="90%" CssClass="TextBox"
                                                    TabIndex="12"></asp:TextBox>
                                                <%--<asp:textbox ID="txtPhone2" runat="server" Width="90%" CssClass="TextBox" MaxLength="30" EnableViewState="False"  TabIndex=12>
                                        <ClientSideEvents KeyDown="fnPhoneValidFF(event)" />
                                        </asp:textbox>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdAlign">
                                                <asp:Label ID="lblFax" runat="Server" Text="<%$ Resources:BRLabel, lblFax%>" CssClass="Label"
                                                    EnableViewState="False"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtFax" runat="server" EnableViewState="False" Visible="true" MaxLength="30" Width="90%" CssClass="TextBox"
                                                    TabIndex="13"></asp:TextBox>
                                                <%-- <asp:textbox ID="txtFax" runat="server" Width="90%" CssClass="TextBox" MaxLength="30"  EnableViewState="False" TabIndex=13>
                                        <ClientSideEvents KeyDown="fnPhoneValid" />
                                        </asp:textbox>--%>
                                            </td>
                                            <td class="tdAlign">
                                                <asp:Label ID="lblMobile" runat="Server" Text="<%$ Resources:BRLabel, lblMobile%>"
                                                    CssClass="Label" EnableViewState="False"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtMobile" runat="server" EnableViewState="False" Visible="true" MaxLength="30" Width="90%" CssClass="TextBox"
                                                    TabIndex="14"></asp:TextBox>
                                                <%--<asp:textbox ID="txtMobile" runat="server"  Width="90%" CssClass="TextBox" MaxLength="30" EnableViewState="False"  TabIndex=14>
                                        <ClientSideEvents KeyDown="fnPhoneValidFF(event)"  />
                                        </asp:textbox>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdAlign">
                                                <asp:Label ID="lblEmailID" runat="Server" Text="<%$ Resources:BRLabel, lblEmailID%>"
                                                    CssClass="Label"  EnableViewState="False"></asp:Label></td>
                                            <td>
                                                <asp:textbox ID="txtEmailID" runat="server" Width="90%" CssClass="TextBox"
                                                    MaxLength="100" EnableViewState="False" TabIndex="15">
                                                </asp:textbox>
                                            </td>
                                            <td class="tdAlign">
                                                <asp:Label ID="lblContactPerson" runat="Server" Text="<%$ Resources:BRLabel, lblContactPerson%>"
                                                    CssClass="Label"  EnableViewState="False"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:textbox ID="txtContactPerson" runat="server" Width="90%" CssClass="TextBox"
                                                    EnableViewState="False" TabIndex="16" MaxLength="100">
                                                    <ClientSideEvents KeyDown="fnAlphaNumKeyPress" />
                                                </asp:textbox>
                                            </td>
                                        </tr>
                                        <%--<tr>
                                    <td class="tdAlign">
					                    <asp:Label ID="lblComment" runat="Server" Text ="Comments" CssClass="Label" EnableViewState="False" ></asp:Label>
				                    </td>
                                    <td colspan=3>
                                        <asp:textbox ID="txtComment" runat="server" Width="96.8%" CssClass="TextBox" ToolTip="Please Enter Your Comments" TabIndex="23" MaxLength="255">
                                        </asp:textbox>
                                    </td>
                                </tr> --%>
                                        <tr>
                                            <td height="0.5%">
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="0.5%">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100%; height: 44%">
                                    <table border="0" width="100%" height="100%" class="DataTable" id="tblBehindScene"
                                        cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="DataTableTitle" colspan="5">
                                                <asp:Label ID="lblBHS" runat="server" Text="<%$ Resources:BRLabel, lblBHS%>"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="width: 25%; height: 1%">
                                            </td>
                                            <td style="width: 23%">
                                            </td>
                                            <td style="width: 3%">
                                            </td>
                                            <td style="width: 24%">
                                            </td>
                                            <td style="width: 25%">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 0.5%">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 0.5%">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 1px" colspan="5" bgcolor="Gray">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 0.5%">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100%; height: 21%;" align="left" valign="top" colspan="5">
                                                <table id="Table1" style="width: 100%; height: 100%; text-align: left;" border="0"
                                                    cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td style="width: 22%;">
                                                        </td>
                                                        <td style="width: 14%;">
                                                        </td>
                                                        <td style="width: 17%;">
                                                        </td>
                                                        <td style="width: 14%;">
                                                        </td>
                                                        <td style="width: 18%;">
                                                        </td>
                                                        <td style="width: 14%;">
                                                        </td>
                                                        <td style="width: 1%;">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tdAlign">
                                                            <asp:Label ID="lblCreatedBy" runat="server" Text="<%$ Resources:BRLabel, lblCreatedBy%>"
                                                                CssClass="Label"></asp:Label></td>
                                                        <td>
                                                            <asp:TextBox ID="txtCreatedBy" runat="server" CssClass="TextBox" Width="95%" Enabled="false"></asp:TextBox></td>
                                                        <td class="tdAlign">
                                                            <asp:Label ID="lblModifiedBy" runat="server" Text="<%$ Resources:BRLabel, lblModifiedBy%>"
                                                                CssClass="Label"></asp:Label></td>
                                                        <td>
                                                            <asp:TextBox ID="txtModifiedBy" runat="server" CssClass="TextBox" Width="95%" Enabled="false"></asp:TextBox></td>
                                                        <td class="tdAlign">
                                                            <asp:Label ID="lblSupervisedBy" runat="server" Text="<%$ Resources:BRLabel, lblSupervisedBy%>"
                                                                CssClass="Label"></asp:Label></td>
                                                        <td>
                                                            <asp:TextBox ID="txtSupervisedBy" runat="server" CssClass="TextBox" Width="95%" Enabled="false"></asp:TextBox></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 0.4%">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="tdAlign">
                                                            <asp:Label ID="lblCreatedOn" runat="server" Text="<%$ Resources:BRLabel, lblCreatedOn%>"
                                                                CssClass="Label"></asp:Label></td>
                                                        <td>
                                                            <input id="txtCreatedOn" runat="server" class="TextBox" style="width: 95%;"  /></td>
                                                        <td class="tdAlign">
                                                            <asp:Label ID="lblModifiedOn" runat="server" Text="<%$ Resources:BRLabel, lblModifiedOn%>"
                                                                CssClass="Label"></asp:Label></td>
                                                        <td>
                                                            <input id="txtModifiedOn" runat="server" class="TextBox" style="width: 95%;" /></td>
                                                        <td class="tdAlign">
                                                            <asp:Label ID="lblSupervisedOn" runat="server" Text="<%$ Resources:BRLabel, lblSupervisedOn%>"
                                                                CssClass="Label"></asp:Label></td>
                                                        <td>
                                                            <input id="txtSupervisedOn" runat="server" class="TextBox" style="width: 95%;"  /></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 0.5%">
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="0.5%">
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="15%" height="100%" rowspan="2" align="center" class="RgtSideTable" valign="top">
                        <table border="0" cellpadding="3px" cellspacing="0" width="100%" height="100%">
                            <tr>
                                <td height="3%">
                                </td>
                            </tr>
                            <tr>
                                <td height="20%">
                                </td>
                            </tr>
                            <tr>
                                <td height="7%" width="100%" align="center">
                                    <img id="imgClosed" style="visibility: hidden;" />
                                </td>
                            </tr>
                            <tr>
                                <td height="7%" width="100%" align="center">
                                    <img id="imgBlocked" style="visibility: hidden;" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="BottomDisplayMsg" id="divErrorMessage" height="5%" valign="Middle" style="width: 85%;">
                        <table border="0" width="100%" cellspacing="0" cellpadding="0">
                            <tr>
                                <td style="width: 4%" align="center">
                                    <img id="Prev" src="../Images/ButtonIcons/CS-Previous.gif" onclick="fnErrorNavi(-1)"
                                        align="left" style="cursor: hand; cursor: pointer; visibility: hidden;" />
                                </td>
                                <td style="width: 92%" align="left">
                                    <asp:Label ID="lblMessage" runat="server" EnableViewState="False" ForeColor="Red"
                                        CssClass="ErrMessage"></asp:Label>
                                </td>
                                <td style="width: 4%" align="center">
                                    <img id="Next" src="../Images/ButtonIcons/CS-Next.gif" onclick="fnErrorNavi(1)" align="left"
                                        style="cursor: hand; cursor: pointer; visibility: hidden;" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>

    
    
    
    </asp:Content>
