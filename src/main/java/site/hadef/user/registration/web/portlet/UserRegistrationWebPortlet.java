package site.hadef.user.registration.web.portlet;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;
import com.liferay.portal.kernel.servlet.SessionMessages;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.PortalUtil;

import java.io.IOException;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.Portlet;
import javax.portlet.PortletException;

import org.osgi.service.component.annotations.Component;

import site.hadef.user.registration.web.constants.UserRegistrationWebPortletKeys;

/**
 * @author hdala
 */
@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.header-portlet-css=/css/main.css",
		"com.liferay.portlet.instanceable=true",
		"com.liferay.portlet.css-class-wrapper=user_page",
		"javax.portlet.display-name=UserRegistrationWeb",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.name=" + UserRegistrationWebPortletKeys.USERREGISTRATIONWEB,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class UserRegistrationWebPortlet extends MVCPortlet {
	
	Log _log = LogFactoryUtil.getLog(UserRegistrationWebPortlet.class);
	public void searchUser(ActionRequest actionRequest, ActionResponse actionResponse)
			throws IOException, PortletException {
		String searchText = ParamUtil.getString(actionRequest, "searchText");
		SessionMessages.add(actionRequest,
				PortalUtil.getPortletId(actionRequest) + SessionMessages.KEY_SUFFIX_HIDE_DEFAULT_SUCCESS_MESSAGE);
		SessionMessages.add(actionRequest,
				PortalUtil.getPortletId(actionRequest) + SessionMessages.KEY_SUFFIX_HIDE_DEFAULT_ERROR_MESSAGE);
		actionRequest.setAttribute("searchText", searchText);
	}
}