package kong2.validator;

import kong2.showcase.ShowcaseModel;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class ShowcaseValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return ShowcaseModel.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "subject", "subject");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "showcase_category", "showcase_category");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address1", "address1");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address2", "address2");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "start_date", "start_date");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "end_date", "end_date");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "price", "price");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "tel", "tel");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "content", "content");
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "map", "map");
    }

}
