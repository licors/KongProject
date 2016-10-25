package kong2.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import kong2.faq.controller.FaqModel;
import kong2.member.MemberModel;

public class FaqValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return FaqModel.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "content", "content");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "subject", "subject");
		
	}

	
}
