<%--<nav class="navbar navbar-default navbar-fixed-top">--%>
<%--<div class="container">--%>
<%--<div class="navbar-header">--%>
<%--<button type="button" class="navbar-toggle collapsed"--%>
<%--data-toggle="collapse" data-target="#navbar" aria-expanded="false"--%>
<%--aria-controls="navbar">--%>
<%--<span class="sr-only">Toggle navigation</span> <span--%>
<%--class="icon-bar"></span> <span class="icon-bar"></span> <span--%>
<%--class="icon-bar"></span>--%>
<%--</button>--%>
<%--</div>--%>
<%--<div id="navbar" class="collapse navbar-collapse">--%>
<%--<ul class="nav navbar-nav">--%>
<%--<li ${urlSegment == 'home.html' ? 'class="active"' : ''}><a--%>
<%--href="<c:url value="/home.html"/>" class="glyphicon glyphicon-home bt-lg"></a></li>--%>
<%--<li ${urlSegment == 'products.html' ? 'class="active"' : ''}><a--%>
<%--href="<c:url value="/products.html"/>">Products</a></li>--%>
<%--<c:if test="${isLoggedIn == false}">--%>
<%--<li ${urlSegment == 'login.html' ? 'class="active"' : ''}><a--%>
<%--href="<c:url value="/login.html"/>">Login</a></li>--%>
<%--</c:if>--%>
<%--<sec:authorize access="hasAnyRole('USER')">--%>
<%--<li class="dropdown"><a href="#" class="dropdown-toggle"--%>
<%--data-toggle="dropdown" role="button" aria-haspopup="true"--%>
<%--aria-expanded="false"> Account Management <span class="caret"></span>--%>
<%--</a>--%>
<%--<ul class="dropdown-menu">--%>
<%--<li ${urlSegment == 'account.html' ? 'class="active"' : ''}>--%>
<%--<a href="<c:url value="/users/account.html"/>">Account--%>
<%--Details</a>--%>
<%--</li>--%>
<%--<li ${urlSegment == 'orders.html' ? 'class="active"' : ''}>--%>
<%--<a href="<c:url value="/users/orders.html"/>">Orders--%>
<%--Management</a>--%>
<%--</li>--%>
<%--</ul></li>--%>
<%--</sec:authorize>--%>
<%--<sec:authorize access="hasAnyRole('ADMIN')">--%>
<%--<li class="dropdown"><a href="#" class="dropdown-toggle"--%>
<%--data-toggle="dropdown" role="button" aria-haspopup="true"--%>
<%--aria-expanded="false"> Shop Management <span class="caret"></span>--%>
<%--</a>--%>
<%--<ul class="dropdown-menu">--%>
<%--<li--%>
<%--${urlSegment == 'products-management.html' ? 'class="active"' : ''}>--%>
<%--<a href="<c:url value="/admin/products-management.html"/>">Products--%>
<%--Management</a>--%>
<%--</li>--%>
<%--<li--%>
<%--${urlSegment == 'orders-management.html' ? 'class="active"' : ''}>--%>
<%--<a href="<c:url value="/admin/orders-management.html"/>">Orders--%>
<%--Management</a>--%>
<%--</li>--%>
<%--<li--%>
<%--${urlSegment == 'users-management.html' ? 'class="active"' : ''}>--%>
<%--<a href="<c:url value="/users/admin/users-management.html"/>">Users--%>
<%--Management</a>--%>
<%--</li>--%>
<%--</ul></li>--%>
<%--</sec:authorize>--%>
<%--<sec:authorize access="hasAnyRole('USER', 'ADMIN')">--%>
<%--<li><a href="#" id="logout">Logout</a>--%>
<%--<form style="display: none;"--%>
<%--action="<c:url value="/logout.html" />" id="logoutAction"--%>
<%--method="post"></form> <script>--%>
<%--$(function(){--%>
<%--$('#logout').click(function(){--%>
<%--$('#logoutAction').submit();--%>
<%--});--%>
<%--});--%>
<%--</script></li>--%>
<%--</sec:authorize>--%>
<%--</ul>--%>
<%--<div class="pull-right">--%>
<%--&lt;%&ndash;<sec:authorize access="hasAnyRole('USER')">&ndash;%&gt;--%>
<%--<div class="dropdown " id="cartButton">--%>
<%--<button type="button"--%>
<%--class="dropdown-toggle basket"--%>
<%--data-toggle="dropdown" role="button" aria-haspopup="true"--%>
<%--aria-expanded="false"><span class=""--%>
<%--aria-hidden="true"></span>--%>
<%--</button>--%>
<%--<ul class="dropdown-menu" id="cart"></ul>--%>
<%--</div>--%>
<%--&lt;%&ndash;</sec:authorize>&ndash;%&gt;--%>
<%--</div>--%>
<%--</div>--%>

<%--<!--/.nav-collapse -->--%>
<%--</div>--%>
<%--&lt;%&ndash;<script src='<c:url value="/resources/js/ProductAdd.js"/>'></script>&ndash;%&gt;--%>

<%--</nav>--%>

<%--<style>--%>

<%--li.cartItem{--%>
<%--display: inline-flex;--%>
<%--}--%>

<%--</style>--%>


<div id="wrapper">
	<div class="overlay"></div>
	<!-- Sidebar -->
	<nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
		<ul class="nav sidebar-nav">
			<li class="sidebar-brand" ${urlSegment == 'home.html' ? 'class="active"' : ''}><a
					href="<c:url value="/home.html"/>" ><span class="glyphicon glyphicon-home bt-lg"> Home</span></a></li>
			<li ${urlSegment == 'products.html' ? 'class="active"' : ''}><a
					href="<c:url value="/products.html"/>">Products</a></li>
			<c:if test="${isLoggedIn == false}">
				<li ${urlSegment == 'login.html' ? 'class="active"' : ''}><a
						href="<c:url value="/login.html"/>">Login</a></li>
			</c:if>
			<sec:authorize access="hasAnyRole('USER')">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					   data-toggle="dropdown"> Account Management <span class="caret"></span>
					</a>
					<ul class="dropdown-menu" role="menu">
						<li ${urlSegment == 'account.html' ? 'class="active"' : ''}>
							<a href="<c:url value="/users/account.html"/>">Account
								Details</a>
						</li>
						<li ${urlSegment == 'orders.html' ? 'class="active"' : ''}>
							<a href="<c:url value="/users/orders.html"/>">Orders
								Management</a>
						</li>
					</ul></li>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('ADMIN')">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					   data-toggle="dropdown" role="button" aria-haspopup="true"
					   aria-expanded="false"> Shop Management <span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li
							${urlSegment == 'products-management.html' ? 'class="active"' : ''}>
							<a href="<c:url value="/admin/products-management.html"/>">Products
								Management</a>
						</li>
						<li
							${urlSegment == 'orders-management.html' ? 'class="active"' : ''}>
							<a href="<c:url value="/admin/orders-management.html"/>">Orders
								Management</a>
						</li>
						<li
							${urlSegment == 'users-management.html' ? 'class="active"' : ''}>
							<a href="<c:url value="/users/admin/users-management.html"/>">Users
								Management</a>
						</li>
					</ul></li>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('USER', 'ADMIN')">
				<li><a href="#" id="logout">Logout</a>
					<form style="display: none;"
						  action="<c:url value="/logout.html" />" id="logoutAction"
						  method="post"></form> <script>
                        $(function(){
                            $('#logout').click(function(){
                                $('#logoutAction').submit();
                            });
                        });
					</script></li>
			</sec:authorize>
		</ul>
	</nav>
	<div class="col-md-2 col-md-offset-10">
		<div class="pull-right">
			<%--<sec:authorize access="hasAnyRole('USER')">--%>
			<div class="dropdown " id="cartButton">
				<button type="button"
						class="dropdown-toggle basket"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false"><span class=""
													aria-hidden="true"></span>
				</button>
				<ul class="dropdown-menu cart" id="cart"></ul>
			</div>
		</div>
	</div>

	<!-- Page Content -->
	<div id="page-content-wrapper">
		<button type="button" id="navButton" class="hamburger is-closed" data-toggle="offcanvas">
			<span class="hamb-top"></span>
			<span class="hamb-middle"></span>
			<span class="hamb-bottom"></span>
		</button>
	</div>
	<!-- /#page-content-wrapper -->

</div>
