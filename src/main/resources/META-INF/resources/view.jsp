<%@page import="site.user.registration.model.Registration"%>
<%@page import="site.hadef.user.registration.web.util.CommonUtil"%>
<%@page import="com.liferay.portal.kernel.model.User"%>
<%@page import="java.util.List"%>
<%@page import="com.liferay.portal.kernel.util.ListUtil"%>
<%@ include file="init.jsp"%>

<portlet:renderURL var="allUsersURL">
	<portlet:param name="mvcPath" value="/view.jsp"></portlet:param>
</portlet:renderURL>

<portlet:renderURL var="newUserURL">
	<portlet:param name="mvcPath" value="/newUser.jsp"></portlet:param>
</portlet:renderURL>

<portlet:actionURL name="searchUser" var="searchUserURL">
	<portlet:param name="mvcPath" value="/view.jsp"></portlet:param>
</portlet:actionURL>

<nav
	class="navbar navbar-collapse-absolute navbar-expand-md navbar-underline navigation-bar navigation-bar-secondary">
	<div class="container-fluid container-fluid-max-xl">
		<a aria-controls="navigationBarCollapse01" aria-expanded="false"
			aria-label="Toggle navigation"
			class="collapsed navbar-toggler navbar-toggler-link"
			data-toggle="collapse" href="#navigationBarCollapse01" role="button">
			<span class="navbar-text-truncate"></span> <svg
				class="lexicon-icon lexicon-icon-caret-bottom" focusable="false"
				role="presentation">
				<use href="/images/icons/icons.svg#caret-bottom"></use>
			</svg>
		</a>
		<div class="collapse navbar-collapse" id="navigationBarCollapse01">
			<div class="container-fluid container-fluid-max-xl">
				<ul class="navbar-nav">
					<li aria-label="Current Page" class="nav-item"><a
						class="nav-link active" href="<%=allUsersURL%>"> <span
							class="navbar-text-truncate"><liferay-ui:message
									key="allUsers" /></span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<%=newUserURL%>"><liferay-ui:message key="newUser" /></span> </a></li>
				</ul>
			</div>
		</div>
	</div>
</nav>
<form class="form-group" action="<%=searchUserURL%>" method="post">
	<nav
		class="management-bar management-bar-light navbar navbar-expand-md">
		<div class="container my-3">
			<div class="input-group">
				<div class="input-group-item input-group-prepend">
					<input name="<portlet:namespace/>status" type="hidden" value="0" />
					<input aria-label="Search for second one"
						name="<portlet:namespace/>searchText" class="form-control"
						placeholder="Search.." type="text" />
				</div>
				<span
					class="input-group-append input-group-item input-group-item-shrink">
					<button class="btn btn-secondary" type="submit">
						<liferay-ui:message key="search" />
					</button>
				</span>
			</div>
		</div>
	</nav>
	<%
		List<Registration> xusers = null;
		if (request.getAttribute("searchText") != null) {
			String searchText = (String) request.getAttribute("searchText");
			xusers = CommonUtil.getRegisteredUserByEmailOrName(searchText);
		} else {
			xusers = CommonUtil.getAllRegisteredUsers();
		}
	%>
	<liferay-portlet:renderURL varImpl="iteratorURL">
		<portlet:param name="mvcPath" value="/view.jsp" />
	</liferay-portlet:renderURL>
	
	
	<liferay-ui:search-container delta="75" deltaConfigurable="true"
		emptyResultsMessage="empty_result"
		headerNames="No.,name,email,country,city" total="<%=xusers.size()%>"
		iteratorURL="${iteratorURL}">
		<%
			int counter = searchContainer.getStart() + 1;
		%>
		<liferay-ui:search-container-results
			results="<%=ListUtil.subList(xusers, searchContainer.getStart(), searchContainer.getEnd())%>" />
		<liferay-ui:search-container-row
			className="site.user.registration.model.Registration" modelVar="aUser">
			<liferay-ui:search-container-column-text valign="middle"
				align="center" name="number">
				<%=counter%>
			</liferay-ui:search-container-column-text>
			<liferay-ui:search-container-column-text property="name" name="name" />
			<liferay-ui:search-container-column-text property="email"
				name="email" />
			<liferay-ui:search-container-column-text property="country"
				name="country" />
			<liferay-ui:search-container-column-text property="country"
				name="country" />
			<liferay-ui:search-container-column-text property="city" name="city" />
			<portlet:actionURL var="deleteRegistrationURL" name="deleteRegistration">
				<portlet:param name="registrationId"
					value="<%=String.valueOf(aUser.getRegistrationId())%>" />
			</portlet:actionURL>
			<portlet:renderURL var="editRegistrationURL">
				<portlet:param name="mvcPath" value="/edit.jsp"></portlet:param>
				<portlet:param name="registrationId" value="<%=String.valueOf(aUser.getRegistrationId())%>"></portlet:param>
			</portlet:renderURL>
			<liferay-ui:search-container-column-text valign="middle"
				align="center" name="">
				<div class="autofit-col">
					<div class="dropdown dropdown-action">
						<a aria-expanded="false" aria-haspopup="true"
							class="component-action dropdown-toggle"
							style="text-decoration: none" data-toggle="dropdown" href="#1"
							role="button"> <span aria-hidden="true"
							class="inline-item icon-ellipsis-vertical"></span>
						</a>
						<ul class="dropdown-menu dropdown-menu-right">
							<li><a class="dropdown-item" href="<%=editRegistrationURL%>"><liferay-ui:message
										key="edit" /></a></li>
							<li><a class="dropdown-item" href="<%=deleteRegistrationURL%>">
									<liferay-ui:message key="delete" />
							</a></li>
						</ul>
					</div>
				</div>
			</liferay-ui:search-container-column-text>

			<%
				counter++;
			%>

		</liferay-ui:search-container-row>

		<liferay-ui:search-iterator />
	</liferay-ui:search-container>

</form>