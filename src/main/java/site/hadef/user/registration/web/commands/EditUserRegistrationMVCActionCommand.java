package site.hadef.user.registration.web.commands;

import com.liferay.counter.kernel.service.CounterLocalServiceUtil;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.portlet.bridges.mvc.MVCActionCommand;
import com.liferay.portal.kernel.servlet.SessionMessages;
import com.liferay.portal.kernel.theme.ThemeDisplay;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.kernel.util.WebKeys;

import java.util.Date;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;

import org.osgi.service.component.annotations.Component;

import site.hadef.user.registration.web.constants.UserRegistrationWebPortletKeys;
import site.hadef.user.registration.web.model.RegisterValidator;
import site.user.registration.model.Registration;
import site.user.registration.service.RegistrationLocalServiceUtil;

@Component(immediate = true, property = { "javax.portlet.name=" + UserRegistrationWebPortletKeys.USERREGISTRATIONWEB,
"mvc.command.name=editUser" }, service = MVCActionCommand.class)
public class EditUserRegistrationMVCActionCommand implements MVCActionCommand{
	private static Log _log = LogFactoryUtil.getLog(UserRegistrationMVCActionCommand.class);

	@Override
	public boolean processAction(ActionRequest actionRequest, ActionResponse actionResponse) throws PortletException {
ThemeDisplay themeDisplay = (ThemeDisplay) actionRequest.getAttribute(WebKeys.THEME_DISPLAY);
		
		long registrationId = ParamUtil.getLong(actionRequest, "registrationId");
		String name = ParamUtil.getString(actionRequest, "name");
		String email = ParamUtil.getString(actionRequest, "email");
		String phone = ParamUtil.getString(actionRequest, "phone");
		String address = ParamUtil.getString(actionRequest,"address");
		String city = ParamUtil.getString(actionRequest,"city");
		long country = ParamUtil.getLong(actionRequest, "country");
		
		Registration registration;
		try {
			registration = RegistrationLocalServiceUtil.getRegistration(registrationId);
			
			boolean isError = false;
			RegisterValidator validator = new RegisterValidator(false,false,false,false,false,false);

			if (name.isEmpty() || Validator.isNull(name)) {
				validator.setName(true);
				isError = true;
			}
			if (email.isEmpty() || Validator.isNull(email)) {
				validator.setEmail(true);
				isError = true;
			}
			
			if (phone.isEmpty() || Validator.isNull(phone)) {
				validator.setPhone(true);
				isError = true;
			}
			if (address.isEmpty() || Validator.isNull(address)) {
				validator.setAddress(true);
				isError = true;
			}
			if (city.isEmpty() || Validator.isNull(city)) {
				validator.setCity(true);
				isError = true;
			}

			if (isError) {
				actionRequest.setAttribute("errorMessages", validator);
				return false;
			}
			
			registration.setName(name);
			registration.setEmail(email);
			registration.setPhone(phone);
			registration.setAddress(address);
			registration.setCity(city);
			registration.setCountry(country);
			registration.setCreateDate(new Date());
			registration.setModifiedDate(new Date());
			registration.setUserId(themeDisplay.getUserId());	
			registration = RegistrationLocalServiceUtil.updateRegistration(registration);
			SessionMessages.add(actionRequest, "success-message");
		} catch (PortalException e) {
			_log.error("Error in updating user details");
		}
		
		

		return false;
	}
}
