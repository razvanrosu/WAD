<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">
	<div class="col-md-12">
		<div class="table-responsive">
			<table id="products-table" class="table table-bordered table-hover" style="cursor: pointer;">
				<thead>
					<tr>
						<th>Name</th>
						<th>Description</th>
						<th>Price</th>
						<th>Available</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty products}">
						<tr style="text-align: center;">
							<td colspan="5">No products found</td>
						</tr>
					</c:if>					
					<c:forEach var="product" items="${products}" varStatus="loop">
						<tr value="${product.id}" style="text-align: center;">
							<td>${product.name}</td>
							<td>${product.description}</td>										
							<td>${product.price}</td>
							<td>${product.available}</td>
							<td>
								<c:choose>
									<c:when test="${product.available == true}">
										<button class="btn btn-danger disable-product"
												data-toggle="tooltip" 
												value="${product.id}" 
												data-placement="top">
											Disable
										</button>
									</c:when>
									<c:otherwise>
										<button class="btn btn-danger disable-product"
												disabled="disabled" 
												data-toggle="tooltip" 
												value="${user.id}" 
												data-placement="top">
											Enable
										</button>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12 align-right padding-bottom">
		<button type="button" class="btn btn-default add-product">Add new product</button>
	</div>
</div>
<div class="modal fade" tabindex="-1" role="dialog" id="productForm">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form id="newProductForm" action="<c:url value='/saveProduct.do' />" method="POST">
				<div class="modal-header">
					<button type="button" class="close closeModal" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">New product</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="inputEmail">Name</label>
						<input type="text" name="name" class="form-control" placeholder="Name" required="true" autofocus="true">								
					</div>
					<div class="form-group">
						<label for="inputEmail">Description</label>
						<input type="text" name="description" class="form-control" placeholder="Description" required="false">
					</div>
					<div class="form-group">
						<label for="inputEmail">Price</label>
						<input type="text" name="price" class="form-control" placeholder="Price" required="true">
					</div>
					<div class="form-group">
						<label for="imagePath">Image Path</label>
						<input type="text" name="imagePath" class="form-control" placeholder="imagePath" required="true">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default closeModal" data-dismiss="modal">Cancel</button>
					<button id="saveProduct" type="button" class="btn btn-primary">Save</button>
				</div>
			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script>
	$(function(){
		$('.add-product').click(function(){
			$('#productForm').find('input').val('');
			$('#productForm').modal({'show': true});
			return false;
		});
		$('#saveProduct').click(function(){
			var form = $('#newProductForm');
			var data = form.serialize();
			var url = form.attr('action');
			var method = form.attr('method');
			$.ajax({
				type: method,
				url: url,
				data: data,
				success: function(product) {
					$('#productForm').modal('hide');
					$('#productForm').find('input').val('');
					if (product.id != null) {
						var row = $('<tr value="'+product.id+'" style="text-align: center;" ></tr>');
						row.append('<td>'+product.name+'</td>');
						row.append('<td>'+product.description+'</td>');
						row.append('<td>'+product.price+'</td>');
						row.append('<td>'+product.available+'</td>');
						row.append('<td><button class="btn btn-danger disable-product" data-toggle="tooltip" value="'+product.id+'" data-placement="top">Disable</button></td>');
						$('#products-table').append(row);
					}
				}
			});
			return false;
		});
	});
</script>