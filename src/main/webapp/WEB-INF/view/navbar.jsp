<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="navbar navbar-inverse bg-slate-700 navbar-component"
	style="position: relative; z-index: 27;">
	<div class="navbar-header">
		<a class="navbar-brand" href="index.jsp"><img
			src="assets/images/logo_light.png" alt=""></a>

		<ul class="nav navbar-nav pull-right visible-xs-block">
			<li><a data-toggle="collapse" data-target="#navbar-navigation"><i
					class="icon-menu2"></i></a></li>
		</ul>
	</div>

	<div class="navbar-collapse collapse" id="navbar-navigation">
		<ul class="nav navbar-nav">
			<li class="active"><a href="index.jsp">Books</a></li>
			<li><a href="#">Link</a></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown">Dropdown <span class="caret"></span></a>
				<ul class="dropdown-menu dropdown-menu-right">
					<li><a href="#">Action</a></li>
					<li><a href="#">Another action</a></li>
					<li><a href="#">Something else here</a></li>
					<li><a href="#">One more line</a></li>
				</ul>
			</li>
		</ul>

		<ul class="nav navbar-nav navbar-right">
			<form:form method="post" action="${pageContext.request.contextPath}/logout" class="form-inline my-2 my-lg-0">
				  <input class="btn btn-outline-success" type="submit" value="Logout">
			</form:form>
			<%-- <c:choose>
				<c:when test="${sessionScope.authorized_user != null}">
					<p class="navbar-text">
						Signed in as <a href="#" class="navbar-link">${sessionScope.authorized_user.uid}</a>
					</p>
					<form:form method="post" action="${pageContext.request.contextPath}/logout" class="form-inline my-2 my-lg-0">
				      <input class="btn btn-outline-success" type="submit" value="Logout">
				    </form:form>
				</c:when>
				<c:otherwise>
					<li><a href="index.jsp"><i
							class="icon-enter position-left"></i> Login</a></li>
				</c:otherwise>
			</c:choose> --%>
		</ul>
	</div>
</div>