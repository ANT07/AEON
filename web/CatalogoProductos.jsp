<%-- 
    Document   : CatalogoProductos
    Created on : 10-15-2018, 01:40:26 PM
    Author     : anthony
--%>

<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="aeon.modelo.dto.Producto"%>
<%@page import="aeon.modelo.servicios.ServiciosProducto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">


        <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js" integrity="sha256-0YPKAwZP7Mp3ALMRVB2i8GXeEndvCq3eSl/WsAl1Ryk="crossorigin="anonymous"></script>

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

        <script src="${pageContext.request.contextPath}/Javascript/javascript.js"></script>
    </head>
    <body>

        <%
            ServiciosProducto serviciosProductos = new ServiciosProducto();
            List<Producto> productos = serviciosProductos.ObtenerProductos();
            pageContext.setAttribute("productos",
                    productos);
        %>
        <div class="container">
            <div class="row">
                <c:forEach var="producto" items="${productos}">
                    <%@include file="WEB-INF/jspf/UnidadProducto.jspf" %>
                </c:forEach>
            </div>
        </div>

    </body>
    <script>
        function cambiarContenido(element) {
            var parent = element.parentNode;
            var contenido = "<input type='text' form='añadirCarrito' name='cantidadProducto' class='form-control input-sm' ><br>";
            contenido += '<div class="btn-group">';
            contenido += '<button  form=añadirCarrito" class="btn btn-sm btn-success" type="submit" ><span class="glyphicon glyphicon-shopping-cart"></span></button>';
            contenido += '<button   class="btn btn-sm btn-danger" type="button" ><span class="">x</span></button>';
            contenido += '</div>';
            parent.innerHTML = contenido;
        }
    </script>

</html>
