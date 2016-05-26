package com.filevalidate;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Service("fileValidator")
public class FileValidator implements Validator{

	@Override
	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object uploadFile, Errors errors) {
		//uploadFile이 에러나면 뭔가를 하겠다.
		UploadFile file = (UploadFile) uploadFile;
		if(file.getFile().getSize()==0){
			errors.rejectValue("file", "uploadForm","파일을 선택하세요.");
		}
	}
}
