function checkform() {
    var form = document.signupForm;

    var id = form.id;
    var password = form.password;
    var repassword = form.repassword;

    var regExp =  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;

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