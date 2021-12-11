package site.hadef.user.registration.web.commands;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCActionCommand;
import com.liferay.portal.kernel.util.ParamUtil;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;

import org.osgi.service.component.annotations.Component;

import site.hadef.user.registration.web.constants.UserRegistrationWebPortletKeys;
import site.user.registration.service.RegistrationLocalServiceUtil;
@Component(immediate = true, property = { "javax.portlet.name=" + UserRegistrationWebPortletKeys.USERREGISTRATIONWEB,
"mvc.command.name=deleteRegistration" }, service = MVCActionCommand.class)
public class DeleteRegistrationMVCActionCommand implements MVCActionCommand{
	
	private static Log _log = LogFactoryUtil.getLog(DeleteRegistrationMVCActionCommand.class);
	
	@Override
	public boolean processAction(ActionRequest actionRequest, ActionResponse actionResponse) throws PortletException {
		String registrationIdStr = ParamUtil.getString(actionRequest, "registrationId");
		long registrationId = Long.valueOf(registrationIdStr);
		try {
			RegistrationLocalServiceUtil.deleteRegistration(registrationId);
		} catch (PortalException e) {
			_log.error("Registration error: "+e.getMessage());
		}
		return false;
	}

}
