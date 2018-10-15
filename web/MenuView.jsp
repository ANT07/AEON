<%-- 
    Document   : ProviderView
    Created on : 01-24-2018, 05:07:38 PM
    Author     : anthony
--%>

<%@page import="aeon.modelo.dto.SubMenu"%>
<%@page import="aeon.modelo.servicios.ServiciosSubMenu"%>
<%@page import="aeon.modelo.servicios.ServiciosMenu"%>
<%@page import="aeon.modelo.dto.Menu"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">


        <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js" integrity="sha256-0YPKAwZP7Mp3ALMRVB2i8GXeEndvCq3eSl/WsAl1Ryk="crossorigin="anonymous"></script>

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

        <script src="${pageContext.request.contextPath}/Javascript/javascript.js"></script>
        <style>
            td{
                vertical-align: middle !important;
            }
        </style>
    </head>
    <body>

        <%
            ServiciosMenu serviciosMenu = new ServiciosMenu();
            List<Menu> menusTabla = serviciosMenu.ObtenerMenus();
            pageContext.setAttribute("menus",
                    menusTabla);


        %>

        <div class="row">
            <!-- Modal -->
            <div class="modal fade" id="myModalMenu" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Proveedores</h4>
                        </div>
                        <div class="modal-body">
                            <form action="menu.do" method="post" id="formMenu">
                                <input name="tipo" id="tipoMenu" value="guardar" type="hidden">
                                <input name="menuId" id="menuId" type="hidden" value="0">
                                <div class="form-group">
                                    <label>Nombre Menu: </label>
                                    <input name="nombreMenu" id="nombreMenu" type="text" class="form-control">
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary" form="formMenu" >Guardar</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="myModalSubmenu" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Proveedores</h4>
                        </div>
                        <div class="modal-body">
                            <form action="submenu.do" method="post" id="formSubmenu">
                                <input name="tipo" id="tipoSubmenu" value="guardar" type="hidden">
                                <input name="menuId" id="menuId" value="0" type="hidden">
                                <input name="SubMenuId" id="SubMenuId" value="0" type="hidden">
                                <input name="url" id="url" value="0" type="hidden">
                                <div class="form-group">
                                    <label>Nombre Sub-Menu: </label>
                                    <input name="nombreSumenu" id="nombreMenu" type="text" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Url: </label>
                                    <%@include file="WEB-INF/jspf/SelectPath.jspf" %>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary" form="formSubmenu" >Guardar</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-8 col-md-offset-2">
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary btn-sm btn-block" data-toggle="modal" data-target="#myModalMenu" onclick="resetForm('formMenu')">
                    <span class="glyphicon glyphicon-plus"></span> Nuevo Menu
                </button><br><br>
                <div>
                    <div  id="contenerdorMenus" class="  panel-group">
                        <c:forEach items="${menus}" var="menu" >
                            <c:set var = "menuId" scope = "request" value = "${menu.menuId}"/>
                            <div class="panel panel-default">

                                <div class="panel-heading">
                                    <div class="btn-group btn-group-sm">
                                        <button type="button" class="btn btn-success btn-sm " data-toggle="modal" data-target="#myModalMenu" onclick="abrirDialogoMenu('${menu.menuId}', '${menu.menuName}')"><span class="glyphicon glyphicon-pencil" ></span></button>
                                        <a href="${pageContext.request.contextPath}/menu.do?tipo=eliminar&menuId=${menu.menuId}" class="btn btn-danger btn-sm "><span class="glyphicon glyphicon-remove"></span></a>
                                    </div>
                                    <span style="font-weight: bold;">${menu.menuName}</span>
                                    <button type="button" class="btn btn-default btn-sm pull-right"  onclick="expandir('${menu.menuId}')"><span class="caret"></span></button>

                                </div>
                                <div class="panel-body" expandido="false" style="display: none;" id="${menu.menuId}">
                                    <div>
                                        <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModalSubmenu" onclick="resetForm('formSubmenu'), abrirDialogoGuardarSubMenu('${menu.menuId}')">
                                            <span class="glyphicon glyphicon-plus"></span> Nuevo SubMenu
                                        </button>
                                        <div>
                                            <h4>SubMenus</h4>
                                            <div class="well">
                                                <table class="table table-hover table-condensed">
                                                    <tbody>
                                                        <% 
                                                            int menuId = (int)request.getAttribute(
                                                                    "menuId");
                                                            ServiciosSubMenu serviciosSubMenu = new ServiciosSubMenu();
                                                            List<SubMenu> submenus = serviciosSubMenu.ObtenerSubMenusByMenu(menuId);
                                                            pageContext.setAttribute(
                                                                        "submenus",
                                                                        submenus);
                                                            
                                                            %>
                                                        <c:forEach items="${submenus}" var="submenu">
                                                            <tr>
                                                                <td>${submenu.submenuName}</td>
                                                                <td>${submenu.url}</td>
                                                                <td>
                                                                    <button type="button" class="btn btn-success btn-sm " data-toggle="modal" data-target="#myModalSubmenu" onclick="abrirDialogoSubMenu('${menu.menuId}', '${submenu.summenuId}', '${submenu.submenuName}', '${submenu.url}')"><span class="glyphicon glyphicon-pencil" ></span></button>
                                                                </td>
                                                                <td>                                            
                                                                    <a href="${pageContext.request.contextPath}/submenu.do?tipo=eliminar&submenuId=${submenu.summenuId}" class="btn btn-danger btn-sm "><span class="glyphicon glyphicon-remove"></span></a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<script>
    function resetForm(formId) {
        var formulario = document.getElementById(formId);
        formulario.reset();
    }

    function expandir(menuId) {
        var elemento = $("#" + menuId);
        var expandido = elemento.attr("expandido");
        var elementoExpandido = document.querySelector("div [expandido='true']");

        if (elementoExpandido != null) {
            $(elementoExpandido).slideUp();
            $(elementoExpandido).attr("expandido", "false")
        }

        if (expandido == "false") {
            elemento.slideDown();
            elemento.attr("expandido", "true");
        }
//        else {
//            elemento.slideUp();
//            elemento.attr("expandido","false") ;
//        }

    }

    function abrirDialogoMenu(menuId, menuName) {
        var tipo = document.querySelector("form#formMenu #tipoMenu");
        tipo.value = "editar";

        var menuIdHidden = document.querySelector("form#formMenu #menuId");
        var menuNameText = document.querySelector("form#formMenu #nombreMenu");

        menuIdHidden.value = menuId;
        menuNameText.value = menuName;
    }

    function abrirDialogoSubMenu(menuId, submenuId, submenuName, url) {
        var tipo = document.querySelector("form#formSubmenu #tipoSubmenu");
        tipo.value = "editar";

        var submenuIdHidden = document.querySelector("form#formSubmenu #SubMenuId");
        var submenuNameText = document.querySelector("form#formSubmenu #nombreMenu");
        var menuIdHidden = document.querySelector("form#formSubmenu #menuId");
        var urlSelect = document.querySelector("form#formSubmenu select#url");
        var urlHidden = document.querySelector("form#formSubmenu input[type='hidden']#url");


        submenuIdHidden.value = submenuId;
        submenuNameText.value = submenuName;
        menuIdHidden.value = menuId;
        urlHidden.value = url;
        urlSelect.value = url;
        urlSelect.disabled = true;
    }

    function abrirDialogoGuardarSubMenu(menuId) {
        var menuIdHidden = document.querySelector("form#formSubmenu #menuId");
        var urlSelect = document.querySelector("form#formSubmenu select#url");
        urlSelect.disabled = false;
        menuIdHidden.value = menuId;
    }

    function cambiarTipo(inputId) {
        var hiddenTipo = document.getElementById(inputId);
        hiddenTipo.value = "editar";
    }

    function cambioValorSelect(e) {
        var element = e.target;
        var urlHidden = document.querySelector("form#formSubmenu input[type='hidden']#url");
        urlHidden.value = element.value;
    }
</script>