<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">
	<div class="col-md-12">
		<form action="<c:url value='/users/updateAccount.do'/>" method="POST">
			<input type="hidden" name="id" value="${account.id}"/>
			<input type="hidden" name="userDetails.id" value="${account.userDetails.id}"/>
			<div class="form-group">
				<label for="inputEmail">Email address</label>
				<input type="text" name="username" class="form-control" placeholder="Email address" value="${account.username}" required="true">
			</div>
			<div class="form-group">
				<label for="firstName">First Name</label>
				<input type="text" name="userDetails.firstName" class="form-control" placeholder="First name" value="${account.userDetails.firstName}" required="true">
			</div>
			<div class="form-group">
				<label for="lastName">Last Name</label>
				<input type="text" name="userDetails.lastName" class="form-control" placeholder="Last name" value="${account.userDetails.lastName}" required="true">
			</div>
			<div class="form-group">
				<label for="password">Password</label>
				<input type="password" name="password" class="form-control"  value="${account.password}" required="true">
			</div>
			<div class="row">
				<div class='col-md-12 align-right padding-bottom'>
					<button type="submit" class="btn btn-default">Update Account</button>
				</div>
			</div>
		</form>
	</div>
</div>
<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
	<c:forEach var="address" items="${addresses}" varStatus="loop">
		<div class="panel panel-default">
	   		<div class="panel-heading">
	      		<h4 class="panel-title">
	       			<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse_${loop.index}">
	          			Address #${loop.index}
	        		</a>
	      		</h4>
	    	</div>
	    	<div id="collapse_${loop.index}" class="panel-collapse collapse ${loop.index == 0 ? 'in' : ''}">
	      		<div class="panel-body">
	      			<div class="row">
						<div class="col-md-12">
							<form class="addressForm" action="<c:url value='/users/updateAddress.do' />" method="POST">
								<input type="hidden" name="id" value="${address.id}"/>
								<div class="form-group">
									<label for="inputEmail">Street</label>
									<input type="text" name="street" class="form-control" placeholder="Street" value="${address.street}" required="true">
								</div>
								<div class="form-group">
									<label for="inputEmail">Number</label>
									<input type="text" name="number" class="form-control" placeholder="Street Number" value="${address.number}" required="true">
								</div>
								<div class="form-group">
									<label for="inputEmail">City</label>
									<input type="text" name="city" class="form-control" placeholder="City" value="${address.city}" required="true">
								</div>
								<div class="form-group">
									<label for="inputEmail">Country</label>
									<input type="text" name="country" class="form-control" placeholder="Country" value="${address.country}" required="true">
								</div>
								<div class="form-group">
									<label for="inputEmail">Zip code</label>
									<input type="text" name="zip" class="form-control" placeholder="Zip code" value="${address.zip}" required="true">
								</div>
								<div class="row">
									<div class="col-md-12 align-right ">
										<button type="button" class="update-address">Update Address</button>
										<button type="button" class="delete-address">Delete Address</button>
									</div>
								</div>
							</form>
						</div>
					</div>
	       		</div>
	    	</div>
	 	 </div>		
	</c:forEach>
	<div class="panel panel-default hidden">			
   		<div class="panel-heading">
      		<h4 class="panel-title">
       			<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse_">
          			Address #
        		</a>
      		</h4>
    	</div>
    	<div id="collapse_" class="panel-collapse collapse">
      		<div class="panel-body">
      			<div class="row">
					<div class="col-md-12">
						<form class="addressForm" action="<c:url value='/users/updateAddress.do' />" method="POST">
							<input type="hidden" name="id" value=""/>
							<div class="form-group">
								<label for="inputEmail">Street</label>
								<input type="text" name="street" class="form-control" placeholder="Street" value="">
							</div>
							<div class="form-group">
								<label for="inputEmail">Number</label>
								<input type="text" name="number" class="form-control" placeholder="Street Number" value="">
							</div>
							<div class="form-group">
								<label for="inputEmail">City</label>
								<input type="text" name="city" class="form-control" placeholder="City" value="">
							</div>
							<div class="form-group">
								<label for="inputEmail">Country</label>
								<input type="text" name="country" class="form-control" placeholder="Country" value="">
							</div>
							<div class="form-group">
								<label for="inputEmail">Zip code</label>
								<input type="text" name="zip" class="form-control" placeholder="Zip code" value="">
							</div>
							<div class="row">
								<div class="col-md-12 align-right">
									<button type="button" class="update-address">Update Address</button>
									<button type="button" class="delete-address">Delete Address</button>
								</div>
							</div>
						</form>
					</div>
				</div>
       		</div>
    	</div>
 	 </div>
</div>
<div class="row">
	<div class="col-md-12 align-right padding-bottom">
		<button type="button" class="btn btn-default add-address">Add new delivery address</button>
	</div>
</div>
<div class="modal fade" tabindex="-1" role="dialog" id="addressForm">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form id="newAddressForm" action="<c:url value='/users/saveAddress.do' />" method="POST">
				<div class="modal-header">
					<button type="button" class="close closeModal" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">New delivery address</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="inputEmail">Street</label>
						<input type="text" name="street" class="form-control" placeholder="Street" required="true" autofocus="true">								
					</div>
					<div class="form-group">
						<label for="inputEmail">Street number</label>
						<input type="text" name="number" class="form-control" placeholder="Street number" required="false">
					</div>
					<div class="form-group">
						<label for="inputEmail">City</label>
						<input type="text" name="city" class="form-control" placeholder="City" required="true">
					</div>
					<div class="form-group">
						<label for="inputEmail">Country</label>
						<input type="text" name="country" class="form-control" placeholder="Country" required="true">
					</div>
					<div class="form-group">
						<label for="inputEmail">Zip code</label>
						<input type="text" name="zip" class="form-control" placeholder="Zip code" required="true">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default closeModal" data-dismiss="modal">Close</button>
					<button id="saveAddress" type="button" class="btn btn-primary">Submit</button>
				</div>
			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

