window.addEventListener('turbolinks:load', () =>{
    var form = document.querySelector('form')
    var pass = document.querySelector('#user_password')
    var passConfirm = document.querySelector('#user_password_confirmation')

    pass.addEventListener('input', passwordMatch );
    passConfirm.addEventListener('input', passwordMatch );

    function passwordMatch() {
        var passValue = pass.value;
        var confirmValue = passConfirm.value;

        if (confirmValue == '' || passValue == '') {
            form.querySelector('.passNotMatch').classList.add('hide');
            form.querySelector('.passMatch').classList.add('hide')
            return
        }

        if (passValue != confirmValue) {
            form.querySelector('.passNotMatch').classList.remove('hide');
            form.querySelector('.passMatch').classList.add('hide')
        } else {
            form.querySelector('.passNotMatch').classList.add('hide');
            form.querySelector('.passMatch').classList.remove('hide')
        }
    }
});
