<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
	<head>
	    <meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>Book Management Login Page</title>
		<meta name="description" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="robots" content="all,follow">
		<jsp:include page="lib.jsp" />
	</head>
	<body class="login-container login-cover">
			<!-- Page container -->
		<div class="page-container">
		
			<!-- Page content -->
			<div class="page-content">
		
				<!-- Main content -->
				<div class="content-wrapper">
		
					<!-- Form with validation -->
					<form action="${pageContext.request.contextPath}/authenticateTheUser" method="post" class="form-validate">
						<div class="panel panel-body login-form">
							<div class="text-center">
								<div class="icon-object border-slate-300 text-slate-300">
									<i class="icon-reading"></i>
								</div>
								<h5 class="content-group">
									Login to your account <small class="display-block">Get
										smart and nothing can touch you</small>
								</h5>
							</div>
							
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							
							<div class="form-group has-feedback has-feedback-left">
								<input type="text" class="form-control" placeholder="Username" name="username" required="required">
								<div class="form-control-feedback">
									<i class="icon-user text-muted"></i>
								</div>
							</div>
		
							<div class="form-group has-feedback has-feedback-left">
								<input type="password" class="form-control" placeholder="Password" name="password" required="required">
								<div class="form-control-feedback">
									<i class="icon-lock2 text-muted"></i>
								</div>
							</div>
		
							<div class="form-group">
								<button type="submit" class="btn bg-blue btn-block">
									Login <i class="icon-arrow-right14 position-right"></i>
								</button>
							</div>
						</div>
					</form>
					<!-- /form with validation -->
		
				</div>
				<!-- /main content -->
		
			</div>
			<!-- /page content -->
		
		</div>
		<!-- /page container -->
		<%--If login fail, Spring security will return an error param --%>
		<c:if test="${param.error != null}">
			<script type="text/javascript">
				$(function() {
					new PNotify({
						title : 'Login Fail!',
						text : 'Sorry! you entered invalid username / password',
						addclass : 'bg-danger'
					});
				});
			</script>
		</c:if>
		<c:if test="${param.logout != null}">
			<script type="text/javascript">
				$(function() {
					new PNotify({
						title : 'Logout',
						text : 'You have been logged out',
						addclass : 'bg-success'
					});
				});
			</script>
		</c:if>
	    <jsp:include page="footer.jsp" />
	</body>
</html>