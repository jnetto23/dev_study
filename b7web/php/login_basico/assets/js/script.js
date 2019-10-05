(function() {
    window.addEventListener('load', init);
    function init() {
        // Validação de Formulários;
        let formSignup = document.getElementById('signup');
        let formSignin = document.getElementById('signin');
        let formForgot = document.getElementById('forgot');
        
        if(formSignup) {
            validForm(formSignup, (stt) => {
                // Validar confirmação de senha
                let pwd  = formSignup.querySelector('#pwd');
                let pwd2 = formSignup.querySelector('#pwd2');
                if(pwd.value !== pwd2.value) {
                    addErrorInput(pwd2, 'Password confirmation does not match')
                    return;
                };

                if(!stt) formSignup.submit();
            });
        };
        if(formSignin) {
            validForm(formSignin, (stt) => {
                if(!stt) formSignin.submit();
            });
        };
        if(formForgot) {
            validForm(formForgot, (stt) => {
                if(!stt) formForgot.submit();
            });
        };
    };
    
   
    function validForm(form, cb) {
        inputs = form.querySelectorAll('input:not([type=submit])');
        form.addEventListener('submit', e => {
            e.preventDefault();
            let errors = validInputs(inputs);
            cb(errors);
        });
    };
    
    function validInputs(inputs) {
        let nErrors = 0;
        Array.prototype.forEach.call(inputs, input => {
            input.addEventListener('input', () => {
                if(input.type !== 'checkbox' && input.value.trim().length != 0) removeErrorInput(input);
            });

            input.addEventListener('change', () => {
                if(input.type === 'checkbox' && input.checked != false) removeErrorInput(input);
            });

            if(input.dataset.hasOwnProperty('error')) {
                if(
                    (input.type !== 'checkbox' && input.value.trim().length < 1) ||
                    (input.type === 'checkbox' && input.checked == false)
                ){
                    let err = input.dataset.error || 'This field is required';
                    addErrorInput(input, err);
                };
            };
            
            if(document.querySelector(`#error-${input.getAttribute('id')}`)) nErrors ++;
        });
        
        return nErrors;
    };

    function removeErrorInput(input) {
        if(document.querySelector(`#error-${input.getAttribute('id')}`) != null) {
            input.classList.remove('form-error');
            document.querySelector(`#error-${input.getAttribute('id')}`).remove();
        };
    };
    
    function addErrorInput(input, msg) {
        input.classList.add('form-error');
        if(document.querySelector(`#error-${input.getAttribute('id')}`) === null) {
            let el = document.createElement('span');
            let msgError = document.createTextNode(msg);
            el.appendChild(msgError);
            el.classList.add('form-error');
            el.setAttribute('id', `error-${input.getAttribute('id')}`);
            if(input.type == 'checkbox') {
                (input.parentNode).insertBefore(el,(input.parentNode).nextElementSibling);    
            } else {
                (input.parentNode).insertBefore(el,input.nextElementSibling);
            }   
        }
           
        return;
    };
})();