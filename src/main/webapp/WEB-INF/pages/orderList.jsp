<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">
	<div class="col-md-12">
		<div class="table-responsive">
			<table class="table table-bordered table-hover" style="cursor: pointer;">
				<thead>
					<tr>
						<th>Number</th>
						<th>Date</th>
						<th>Price</th>
						<th>Items Number</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty orders}">
						<tr style="text-align: center;">
							<td colspan="5">No orders found</td>
						</tr>
					</c:if>					
					<c:forEach var="order" items="${orders}" varStatus="loop">
						<tr value="${order.id}" style="text-align: center;">
							<td>${order.id}</td>
							<td>${order.placeDate}</td>
							<td>${order.price}</td>
							<td>${order.orderItems.size()}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>