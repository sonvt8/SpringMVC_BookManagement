<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ page import="com.sonvt8.root.constant.SortBookColumn"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Book Management List Page</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<jsp:include page="lib.jsp" />
<!-- /theme JS files -->
</head>
<body>
	<jsp:include page="navbar.jsp" />
	<!-- Page header -->
	<div class="page-header">
		<div class="page-header-content">
			<div class="page-title">
				<security:authorize access="hasRole('ADMIN')">
					<button
						onclick="window.location.href='${initParam.hostURL}${pageContext.request.contextPath}/add_book.jsp';"
						type="button" class="btn bg-teal-400 btn-labeled">
						<b><i class="icon-book"></i></b>New Book
					</button>
				</security:authorize>
			</div>
		</div>
	</div>
	<!-- /page header -->
	<!-- Page container -->
	<div class="page-container">

		<!-- Page content -->
		<div class="page-content">

			<!-- Main content -->
			<div class="content-wrapper">

				<!-- Table with togglable columns -->
				<div class="panel panel-flat">
					<div class="panel-heading">
						<h5 class="panel-title">Book Info</h5>
						<div class="heading-elements">
							<ul class="icons-list">
								<li><a data-action="collapse"></a></li>
								<li><a data-action="reload"></a></li>
								<li><a data-action="close"></a></li>
							</ul>
						</div>
					</div>

					<table class="table table-togglable table-hover">
						<thead>
							<tr>
								<th style="width: 5px;">#</th>
								<th style="width: 10px;">Title</th>
								<th style="width: 10px;">Author</th>
								<th style="width: 10px;">Category</th>
								<th style="width: 5px;">Price($)</th>
								<th style="width: 5px;">Quantity</th>
								<th style="width: 10px;">Released</th>
								<th class="text-center" style="width: 50px;">Photo</th>
								<th style="width: 100px; word-wrap: break-word">Description</th>
								<c:if test="${sessionScope.authorized_user.authLevel > 1}">
									<th class="text-center" style="width: 30px;"><i
										class="icon-menu-open2"></i></th>
								</c:if>

							</tr>
						</thead>
						<tbody>
							<c:forEach items="${books}" var="tempBook" varStatus="iterationCount">
								<c:url var="updateBook" value="/book/showFormForUpdate">
			                        <c:param name="bookId" value="${tempBook.id}" />
			                    </c:url>
			                    <c:url var="deleteBook" value="/book/delete">
			                        <c:param name="bookId" value="${tempBook.id}" />
			                    </c:url>
								<tr>
									<td>${iterationCount.count}</td>
									<td>${tempBook.title}</td>
									<td>${tempBook.author}</td>
									<td></td>
									<td>${tempBook.price}</td>
									<td>${tempBook.quantity}</td>
									<td>${tempBook.released}</td>
									<td style="height: 30%; width: 30%;" align="center"><img
										style="display: block;" width="100%" height="100%"
										src=""></td>
									<td>${tempBook.description}</td>
									<security:authorize access="hasRole('ADMIN')">
										<td class="text-center">
											<ul class="icons-list">
												<li class="dropup"><a href="#" class="dropdown-toggle"
														data-toggle="dropdown"> <i class="icon-menu9"></i>
												</a>
	
													<ul class="dropdown-menu dropdown-menu-right">
														<li><a href="${updateBook}"><i
																	class="icon-pencil7"></i> Edit</a></li>
														<li><a href="${deleteBook}"><i class="icon-trash"
																	onclick="if(!confirm('Are you sure you want to delete this city?')) return false;"></i>
																	Delete</a></li>
													</ul></li>
											</ul>
										</td>
									</security:authorize>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- /table with togglable columns -->

			</div>
			<!-- /main content -->

		</div>
		<!-- /page content -->

	</div>
	<!-- /page container -->
	<c:choose>
		<c:when test="${sessionScope.addOk != null}">
			<script type="text/javascript">
					$(function() {
						var addMessage = '<%=request.getSession().getAttribute("addOk")%>';
							new PNotify({
					            title: 'Insert Book',
					            text: addMessage,
					            addclass: 'bg-success'
					        });
					});
					<%request.getSession().removeAttribute("addOk");%>
				</script>
		</c:when>
		<c:when test="${sessionScope.deleteOk != null}">
			<script type="text/javascript">
					$(function() {
						var deleteMessage = '<%=request.getSession().getAttribute("deleteOk")%>';
					new PNotify({
						title : 'Delete Book',
						text : deleteMessage,
						addclass : 'bg-success'
					});
				});
				<%request.getSession().removeAttribute("deleteOk");%>
			</script>
		</c:when>
		<c:when test="${sessionScope.updateOk != null}">
			<script type="text/javascript">
					$(function() {
						var updateMessage = '<%=request.getSession().getAttribute("updateOk")%>';
						new PNotify({
							title : 'Update Book',
							text : updateMessage,
							addclass : 'bg-success'
						});
					});
				<%request.getSession().removeAttribute("updateOk");%>
			</script>
		</c:when>
	</c:choose>
	<jsp:include page="footer.jsp" />
</body>
</html>