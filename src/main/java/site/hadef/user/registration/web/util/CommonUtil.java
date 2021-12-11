package site.hadef.user.registration.web.util;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.Validator;

import java.util.List;

import javax.portlet.RenderRequest;

import site.hadef.user.registration.web.model.RegisterValidator;
import site.user.registration.model.Registration;
import site.user.registration.service.RegistrationLocalServiceUtil;

public class CommonUtil {
	
	private static Log _log = LogFactoryUtil.getLog(CommonUtil.class);
	
	public static RegisterValidator validateUserRegistration(RenderRequest renderRequest) {
		RegisterValidator validator = (RegisterValidator) renderRequest.getAttribute("errorMessages");
		if(Validator.isNotNull(validator)) {
			return validator;
		}
		return new RegisterValidator(false, false, false, false, false, false);
	}
	
	public static List<Registration> getRegisteredUserByEmailOrName(String searchText){
		return RegistrationLocalServiceUtil.findByNameOrEmail(searchText);
	}
	
	public static List<Registration> getAllRegisteredUsers(){
		List<Registration> registration = RegistrationLocalServiceUtil.getRegistrations(-1, -1);
		return registration;
	}

	public static Registration getRegisteredUser(long registrationId) {
		Registration registration = null;
		try {
			registration = RegistrationLocalServiceUtil.getRegistration(registrationId);
			return registration;
		} catch (PortalException e) {
			_log.error(e.getMessage());
		}
		return null;
	}
}
