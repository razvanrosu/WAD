<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="row">
	<div class="col-md-12">
			<table class="table table-bordered table-hover">
				<tbody>
				<c:if test="${empty products}">
				<tr style="text-align: center;">
					<td colspan="5">No products found</td>
				</tr>
				</c:if>
				<c:forEach var="product" items="${products}" varStatus="loop">
				<div class="col-sm-3 " id="${product.id}" style="padding: 20px">
					<div class="panel panel-primary" id="${product.id}">
						<div class="panel-heading" id="panel">${product.name}</div>
						<div class="panel-body">
							<img src=${product.imagePath } class="img-responsive center-block" width="100" height="100" alt="Image"></div>
						<%--<div class="panel-footer">${product.description}</div>--%>
						<div class="panel-footer"><i class="fa fa-money " style="font-size:24px"> ${product.price} Lei</i></div>
					</div>
					<div style="display: inline-flex">
						<div class="dropdown">
							<button class="btn btn-success dropdown-toggle" type="button"
									data-toggle="dropdown">
								Choose size <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" id="dropmenuSize">
								<li><a href="#" id="id1">40</a></li>
								<li><a href="#">41</a></li>
								<li><a href="#">42</a></li>
							</ul>
						</div>
						<div class="dropdown">
							<button class="btn btn-primary dropdown-toggle" type="button"
									data-toggle="dropdown" id = "selectQuantity${product.id}">Nr <span class="caret"></span>
							</button>

							<ul class = "dropdownQuantity dropdown-menu" id="Quantity">
								<li ><a href="#" class="quantityItem">1</a></li>
								<li ><a href="#" class="quantityItem">2</a></li>
								<li ><a href="#" class="quantityItem">3</a></li>
								<li ><a href="#" class="quantityItem">4</a></li>
								<li ><a href="#" class="quantityItem">5</a></li>
							</ul>
						</div>
					</div>

					<c:choose>
						<c:when test="${product.available == true}">
							<button class="btn btn-danger addProductToCart"
									data-toggle="tooltip" value="${product.id}"
									data-placement="top" onclick="addToShoppingCart(${product.id})">Add</button>
						</c:when>
						<c:otherwise>
							<button class="btn btn-danger" disabled="disabled"
									data-toggle="tooltip" value="${product.id}" data-placement="top">
								Add</button>
						</c:otherwise>
					</c:choose>
				</div>
		</c:forEach>
		</tbody>
		</table>
	</div>
</div>
<script>

    $("#cartPage").click(function () {
        window.location.href = "/viewCart";
    });

</script>