package kong2.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import kong2.member.controller.MemberModel;


public class MemberValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		
		// ��ȿ���˻��Ϸ��� model�� Validation�������� ���θ� Ȯ���ϰ� �����ϸ� �˻����
		return MemberModel.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		// memberModel�� ��ȿ���˻��ϴ� Ÿ������ ����
		MemberModel member = (MemberModel) target;
		
		// ValidationUtils Ŭ������ ������� �ʰ� ��ȿ�� �˻��ϴ� �ٸ����
		
		/*if(member.getId() == null || member.getId().trim().isEmpty()) {
			errors.rejectValue("id", "id");
		}
		
		if(member.getPasswd() == null || member.getPasswd().trim().isEmpty()) {
			errors.rejectValue("passwd", "passwd");
		}
		
		if(member.getPasswd().equals(member.getPasswd2()) == false) {
			errors.rejectValue("passwd2", "passwd2");
		}
		
		if(member.getBirth() == null || member.getBirth().trim().isEmpty()) {
			errors.rejectValue("birth", "birth");
		}
		
		if(member.getEmail() == null || member.getEmail().trim().isEmpty()) {
			errors.rejectValue("email", "email");
		}*/
		
		// rejectIfEmptyOrWhitespace(errors, "1", "2");
		// "1" = �˻��� ��ü , "2" = ���������� �� ���� (properties�� ����� ����)
		// "1"�� ���ų� ������ ���κ��� ��������� "2"�� �����޽����� ��������.
		// <form:input type="text" path="1">
		// <form:errors path="2">
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "id");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "password");
		
		if(member.getPassword().equals(member.getPassword2()) == false) {
			errors.rejectValue("password2", "password2");
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "name");
  	    ValidationUtils.rejectIfEmpty(errors, "email", "email");
	}

}
