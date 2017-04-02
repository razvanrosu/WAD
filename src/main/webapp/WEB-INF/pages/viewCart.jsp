<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: razvan
  Date: 4/2/2017
  Time: 3:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart</title>
</head>
<body>


<h2>Cart (<span id="cartSize">${cartItems.size()}</span>)</h2>

<c:forEach var="cartItem" items="${cartItems}" varStatus="loop">

    <div class="row display-table" id="row-${cartItem.id}" style="padding-top: 20px;">
            <%--<div class="col-md-12">--%>
        <div class="col-md-3 display-cell">
            <img src=${cartItem.product.imagePath } class="img-responsive center-block" width="100" height="100" alt="Image">
        </div>

        <div class="col-md-3 display-cell">

            <h4>${cartItem.product.name}</h4>

        </div>
        <div class="col-md-3 display-cell">
            <h4>${cartItem.quantity}</h4>
        </div>

        <div class="col-md-3 display-cell">
            <i class="fa fa-money " style="font-size:24px;height:50%"> ${cartItem.product.price} Lei</i>
        </div>

        <div class="col-md-3 display-cell">
            <a href="#" class="glyphicon glyphicon-remove btn-lg" onclick="deleteItemFromCartPage(${cartItem.id}, ${cartItem.product.price}, ${cartItem.quantity})"></a>
        </div>

            <%--</div>--%>
    </div>

</c:forEach>

<div class="col-md-3 col-md-offset-10" style="display: block">
    <h2 style="padding-bottom: 20px">Total : <span id="total">${total}</span> Lei</h2>
    <c:choose>
        <c:when test="${cartItems.size() > 0}">
            <button class="btn btn-lg btn-success">
                Haide sa platesti !
            </button>
        </c:when>
        <c:otherwise>

        </c:otherwise>
    </c:choose>
</div>

</body>
</html>
