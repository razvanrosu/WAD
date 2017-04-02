<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">
	<div class="col-md-12">
		<div class="table-responsive">
			<table class="table table-bordered table-hover" style="cursor: pointer;">
				<thead>
					<tr>
						<th>Id</th>
						<th>Username</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Active</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty userAccounts}">
						<tr style="text-align: center;">
							<td colspan="5">No users found</td>
						</tr>
					</c:if>					
					<c:forEach var="userAccount" items="${userAccounts}" varStatus="loop">						
						<tr id="#00000_${userAccount.id}" style="text-align: center;" class="userDetails">
							<c:if test="${userAccount.id != currentUser.id }">
								<td>${loop.index}</td>
								<td>${userAccount.username}</td>
								<td>${userAccount.userDetails.firstName}</td>
								<td>${userAccount.userDetails.lastName}</td>										
								<td class="active-flag">${userAccount.active}</td>
								<td>
									<c:choose>
										<c:when test="${userAccount.active}">
											<button class="btn btn-default disable-user" data-id="${userAccount.id}" data-active="${userAccount.active}">Disable user</button>
										</c:when>
										<c:otherwise>
											<button class="btn btn-default disable-user" data-id="${userAccount.id}" data-active="${userAccount.active}">Enable user</button>
										</c:otherwise>
									</c:choose>
								</td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
	$(function(){
		$('.disable-user').click(function(){
			var row = $(this).closest('tr');
			var id = $(this).data('id');
			var active = $(this).data('active');
			$.ajax({
				type: "GET",
				url: '<c:url value="/users/admin/disableUser.do"/>',
				data: {
					id: id,
					active: !active
				},
				success: function(response) {
					if (active) {
						row.find('.active-flag').html('false');
						row.find('.disable-user').data('active', false).html('Enable user');
					} else {
						row.find('.active-flag').html('true');
						row.find('.disable-user').data('active', true).html('Disable user');
					}
				}
			});
		});
	});
</script>