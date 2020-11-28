function checkform() {
    var form = document.signupForm;
	
	var id = form.userID;
	var name = form.userName;
	var email = form.userEmail;
    var password = form.userPassword;
    var repassword = form.repassword;

    var regExp =  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
	
	if (id.value == "" || name.value == "" || email.value == "" || password == "" || repassword == "") {
		alert("공백이 존재합니다.")
		return false;
	}
    if (password.value != repassword.value){
        alert("비밀번호를 다시 확인해주세요.");
        return false;
    }
    if (!regExp.test(password.value)){
        alert("영문, 숫자, 특수문자를 포함해 8자리이상 입력하세요.");
        return false;
	    }
    form.submit();
}