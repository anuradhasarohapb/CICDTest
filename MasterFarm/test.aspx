<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="MasterFarm.test" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div style="margin:40px 0;"></div>
    <div class="easyui-layout" style="width:95%;height:80%;">
        <div id="p" data-options="region:'west'" title="West" style="width:10%;padding:10px">
            <p>width: 80%</p>
        </div>
    <div data-options="region:'east',split:true,hideCollapsedContent:false" title="East" style="width:10%;"></div>
        <div data-options="region:'center'" title="Center">
                <h2>Ajax Form Demo</h2>
   
        <form id="ff" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>Name:</td>
                    <td><input name="name" class="f1 easyui-textbox"></input></td>
                       <td>Name:</td>
                    <td><input name="name" class="f1 easyui-textbox"></input></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input name="email" class="f1 easyui-textbox"></input></td>
                </tr>
                <tr>
                    <td>Phone:</td>
                    <td><input name="phone" class="f1 easyui-textbox"></input></td>
                </tr>
                <tr>
                    <td>File:</td>
                    <td><input name="file" class="f1 easyui-filebox"></input></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Submit"></input></td>
                </tr>
            </table>
        </form>
    </div>
    <style scoped>
        .f1{
            width:200px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $('#ff').form({
                success: function (data) {
                    $.messager.alert('Info', data, 'info');
                }
            });
        });
    </script>
        </div>

</asp:Content>