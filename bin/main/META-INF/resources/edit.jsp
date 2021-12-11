<%@page import="site.user.registration.model.Registration"%>
<%@page import="com.liferay.portal.kernel.util.Validator"%>
<%@page import="site.hadef.user.registration.web.util.CommonUtil"%>
<%@page import="site.hadef.user.registration.web.model.RegisterValidator"%>
<%@page import="com.liferay.portal.kernel.service.CountryServiceUtil"%>
<%@page import="com.liferay.portal.kernel.model.Country"%>
<%@page import="com.liferay.portal.kernel.model.User"%>
<%@page import="java.util.List"%>
<%@ include file="init.jsp"%>

<portlet:renderURL var="allUsersURL">
	<portlet:param name="mvcPath" value="/view.jsp"></portlet:param>
</portlet:renderURL>

<portlet:renderURL var="newUserURL">
	<portlet:param name="mvcPath" value="/newUser.jsp"></portlet:param>
</portlet:renderURL>

<%
	RegisterValidator errorMessages = CommonUtil.validateUserRegistration(renderRequest);
	List<Country> countries = CountryServiceUtil.getCountries();
	String registrationIdStr = (String) renderRequest.getParameter("registrationId");
	long registrationId = Long.valueOf(registrationIdStr);
	Registration userRegistered = CommonUtil.getRegisteredUser(registrationId);
	if(Validator.isNotNull(userRegistered)){
%>
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

					<li aria-label="Current Page" class="nav-item"><a class="nav-link active"
						href="<%=allUsersURL%>"> <span class="navbar-text-truncate"><liferay-ui:message
									key="allUsers" /></span>
					</a></li>
					<li class="nav-item"><a
						class="nav-link" href="<%=newUserURL%>"> <span
							class="navbar-text-truncate"><liferay-ui:message
									key="newUser" /></span>
					</a></li>
				</ul>
			</div>
		</div>
	</div>
</nav>
<div id="uni-members-blog">
	<div
		class="container-fluid container-fluid-max-xl container-form-lg container-view">
		<div class="row">
			<div class="col-lg-12">
				<div class="card-page card-page-equal-height" id="memForm">
					<div class="card-page-item col-12">
						<div class="">
							<portlet:actionURL var="editUserURL" windowState="normal"
								name="editUser">
								<portlet:param name="mvcPath" value="/view.jsp"></portlet:param>
								<portlet:param name="registrationId" value="<%=registrationIdStr %>"></portlet:param>
							</portlet:actionURL>

							<form class="sheet" method="post" action="<%=editUserURL%>">
								<div aria-orientation="vertical" class="panel-group"
									role="tablist">

									<div class="sheet-header">
										<h2 class="sheet-title">
											<liferay-ui:message key="addNewUser" />
										</h2>
										<h3 class="sheet-subtitle">
											<liferay-ui:message key="addNewUser-subtitle" />
										</h3>
									</div>
									<div class="sheet-section">

										<div class="form-group-autofit">
											<div
												class="form-group-item <%=(errorMessages.isName()) ? "has-warning" : ""%>"">
												<label for="name"><liferay-ui:message key="name" />
													<span class="reference-mark"><i
														class="icon-asterisk"></i></span> </label> <input class="form-control"
													name="<portlet:namespace/>name" id="publicationTitle"
													placeholder="" type="text" maxLength="280" value="<%=userRegistered.getName() %>"/>
												<%
													if (errorMessages.isName()) {
												%>
												<div class="form-feedback-item">
													<liferay-ui:message key="fieldRequired" />
												</div>
												<%
													}
												%>

											</div>
										</div>
										<div class="form-group-autofit">
											<div
												class="form-group-item <%=(errorMessages.isEmail()) ? "has-warning" : ""%>"">
												<label for="email"><liferay-ui:message key="email" />
													<span class="reference-mark"><i
														class="icon-asterisk"></i></span> </label> <input class="form-control"
													name="<portlet:namespace/>email" id="email" placeholder=""
													type="text" maxLength="280"  value="<%=userRegistered.getEmail() %>"/>
												<%
													if (errorMessages.isEmail()) {
												%>
												<div class="form-feedback-item">
													<liferay-ui:message key="fieldRequired" />
												</div>
												<%
													}
												%>
												<%
													if (errorMessages.isEmail()) {
												%>
												<div class="form-feedback-item">
													<liferay-ui:message key="fieldRequired" />
												</div>
												<%
													}
												%>
											</div>
										</div>
										<div class="form-group-autofit">
											<div
												class="form-group-item <%=(errorMessages.isPhone()) ? "has-warning" : ""%>"">
												<label for="phone"><liferay-ui:message key="phone" />
													<span class="reference-mark"><i
														class="icon-asterisk"></i></span> </label>
														<input class="form-control"
													name="<portlet:namespace/>phone" id="phone"
													placeholder="" type="text"  value="<%=userRegistered.getPhone()%>"/>
												<%
													if (errorMessages.isPhone()) {
												%>
												<div class="form-feedback-item">
													<liferay-ui:message key="fieldRequired" />
												</div>
												<%
													}
												%>
											</div>
										</div>

										<div class="form-group-autofit">
											<div
												class="form-group-item <%=(errorMessages.isAddress()) ? "has-warning" : ""%>"">
												<label for="address"><liferay-ui:message
														key="address" /> <span class="reference-mark"><i
														class="icon-asterisk"></i></span> </label>
														<input class="form-control"
													name="<portlet:namespace/>address" id="address" 
													placeholder="" type="text"  value="<%=userRegistered.getAddress()%>"/>
												<%
													if (errorMessages.isAddress()) {
												%>
												<div class="form-feedback-item">
													<liferay-ui:message key="fieldRequired" />
												</div>
												<%
													}
												%>
											</div>
										</div>

										<div class="form-group-autofit">
											<div
												class="form-group-item <%=(errorMessages.isCity()) ? "has-warning" : ""%>"">
												<label for="city"><liferay-ui:message key="city" />
													<span class="reference-mark"><i
														class="icon-asterisk"></i></span> </label>
												<input class="form-control"
													name="<portlet:namespace/>city" id="city"
													placeholder="" type="text" value="<%=userRegistered.getCity() %>"/>
												<%
													if (errorMessages.isCity()) {
												%>
												<div class="form-feedback-item">
													<liferay-ui:message key="fieldRequired" />
												</div>
												<%
													}
												%>
											</div>
										</div>


										<div class="form-group-autofit">
											<div class="form-group-item">
												<label for="country"> <liferay-ui:message
														key="country" />
												</label> <select class="form-control"
													name="<portlet:namespace/>country" id="country">
													<%
														for (Country country : countries) {
													%>
													<option value="<%=country.getCountryId()%>"><%=country.getName(themeDisplay.getLocale())%></option>
													<%
														}
													%>
												</select>
											</div>
										</div>
									</div>

									<div id="output"></div>
								</div>
								<div class="sheet-footer">
									<div class="btn-group-item">
										<div class="btn-group-item">
											<button class="btn btn-primary" type="submit"
												style="color: white">
												<liferay-ui:message key="submit" />
											</button>
										</div>

									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%
}
%>