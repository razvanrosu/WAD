<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>

    <%--<meta name="viewport" content="width=device-width, initial-scale=1">--%>

    <%--<title>eCommerce Product Detail</title>--%>
    <%--<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">--%>
    <%--<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">--%>

<%--</head>--%>

<%--<body>--%>

<div class="container">
    <div class="card">
        <div class="container-fliud">
            <div class="wrapper row">
                <div class="preview col-md-6">

                    <div class="preview-pic tab-content" id="imageRow">
                        <div class="tab-pane active" id="pic-1"><img class="img-responsive" src="${product.imagePath}" /></div>
                        <%--<div class="tab-pane" id="pic-2"><img src="http://placekitten.com/400/252" /></div>--%>
                        <%--<div class="tab-pane" id="pic-3"><img src="http://placekitten.com/400/252" /></div>--%>
                        <%--<div class="tab-pane" id="pic-4"><img src="http://placekitten.com/400/252" /></div>--%>
                        <%--<div class="tab-pane" id="pic-5"><img src="http://placekitten.com/400/252" /></div>--%>
                    </div>
                    <ul class="preview-thumbnail nav nav-tabs">
                        <%--<li class="active"><a data-target="#pic-1" data-toggle="tab"><img src="http://placekitten.com/200/126" /></a></li>--%>
                        <%--<li><a data-target="#pic-2" data-toggle="tab"><img src="http://placekitten.com/200/126" /></a></li>--%>
                        <%--<li><a data-target="#pic-3" data-toggle="tab"><img src="http://placekitten.com/200/126" /></a></li>--%>
                        <%--<li><a data-target="#pic-4" data-toggle="tab"><img src="http://placekitten.com/200/126" /></a></li>--%>
                        <%--<li><a data-target="#pic-5" data-toggle="tab"><img src="http://placekitten.com/200/126" /></a></li>--%>
                    </ul>

                </div>
                <div class="details col-md-6">
                    <div id = "row1">
                    <h3 class="product-title">${product.name}</h3>
                    <%--<div class="rating">--%>
                    <%--<div class="stars">--%>
                    <%--<span class="fa fa-star checked"></span>--%>
                    <%--<span class="fa fa-star checked"></span>--%>
                    <%--<span class="fa fa-star checked"></span>--%>
                    <%--<span class="fa fa-star"></span>--%>
                    <%--<span class="fa fa-star"></span>--%>
                    <%--</div>--%>
                    <%--<span class="review-no">41 reviews</span>--%>
                    <%--</div>--%>
                    <p class="product-description">${product.description}</p>
                    <h4 class="price">Price: <span>${product.price}</span></h4>
                    <%--<p class="vote"><strong>91%</strong> of buyers enjoyed this product! <strong>(87 votes)</strong></p>--%>
                    </div>
                    <div id = "row2" style="display: inline-flex;">
                        <div class="dropdown" style="padding-right: 10px">
                            <button class="btn btn-success dropdown-toggle btn-lg" type="button"
                                    data-toggle="dropdown">
                                Choose size <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" id="dropmenuSize">
                                <li><a href="#" id="id1">40</a></li>
                                <li><a href="#">41</a></li>
                                <li><a href="#">42</a></li>
                            </ul>
                        </div>
                        <div class="dropdown" style="padding-right: 10px">
                            <button class="btn btn-primary dropdown-toggle btn-lg" type="button"
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
                        <div>
                        <c:choose>
                            <c:when test="${product.available == true}">
                                <button class="btn btn-danger btn-lg addProductToCart"
                                        data-toggle="tooltip" value="${product.id}"
                                        data-placement="top" onclick="addToShoppingCart(${product.id})">Add</button>
                            </c:when>
                            <c:otherwise>
                                <button class="btn btn-danger btn-lg" disabled="disabled"
                                        data-toggle="tooltip" value="${product.id}" data-placement="top">
                                    Add</button>
                            </c:otherwise>
                        </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--</body>--%>
<%--</html>--%>
