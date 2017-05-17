<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<div class="row">
		<div class="col-xs-10 col-sm-6 col-md-6 col-lg-6 col-xs-offset-1 col-sm-offset-3 col-md-offset-3 col-lg-offset-3">
			<form action="<c:url value='/login.html'/>" method="POST">
				<div class="form-group">
					<label for="username">Email address</label>
					<input type="email" class="form-control" id="username" name="username" placeholder="Email address">
				</div>
				<div class="form-group">
					<label for="password">Password</label>
					<input type="password" class="form-control" id="password" name="password" placeholder="Password">
				</div>

				<input type='checkbox' name="remember-me-param"/> Remember Me <br/>

				<div class="form-group align-middle">
					<button type="submit" class="btn btn-default">Sign in</button>
					<button type="button" id="singup" class="btn btn-default">Sign up</button>
				</div>	
			</form>
		</div>
	</div>
	<div class="modal fade" tabindex="-1" role="dialog" id="signupDialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form method="POST" action="<c:url value='/users/save.html' />">
					<div class="modal-header">
						<button type="button" class="close closeModal" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title">New Account</h4>
					</div>
					<div class="modal-body">
						<div class="form-group" id="checkMessage">
							<label for="inputEmail">Email address</label>
							<input type="email" name="username" id="inputEmail" class="form-control" placeholder="Email address" required="true" autofocus="true">
						</div>
						<div class="form-group">
							<label for="inputEmail">Password</label>
							<input type="text" name="password" id="inputPassword" class="form-control" placeholder="Password" required="true">
						</div>
						<div class="form-group">
							<label for="inputEmail">First Name</label>
							<input type="text" name="firstName" id="inputEmail" class="form-control" placeholder="First name" required="true">
						</div>
						<div class="form-group">
							<label for="inputEmail">Last Name</label>
							<input type="text" name="lastName" id="inputEmail" class="form-control" placeholder="Last name" required="true">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default closeModal" data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
				</form>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
</div>
<script>
	$(function(){
		$('#singup').click(function(){
			$('#signupDialog').modal({'show': true});
			return false;
		});

		$('.closeModal').click(function(){
			$('#checkMessage').removeClass('has-error has-success');
		});

		$('#inputEmail').keyup(function() {
			var query = $(this).val();
			delay(function(){
				if (query != "") {
					$.ajax({
						method: 'GET',
						url: '<c:url value="users/checkUsername.do"/>',
						data: {
							username: query
						},
						success: function(response) {
							if(response) {
								$('#checkMessage').removeClass('has-success').addClass('has-error')
							} else {
								$('#checkMessage').removeClass('has-error').addClass('has-success')
							}
						}
					});
				}
			}, 1500);
		});
	});
</script>