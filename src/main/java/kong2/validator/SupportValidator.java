package kong2.validator;

import kong2.support.SupportModel;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class SupportValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return SupportModel.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "email");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "type", "type");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "content", "content");
    }

}
