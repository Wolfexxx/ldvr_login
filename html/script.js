/// Elementek

const login = $('.login')
const register = $('.register')
const username = $('.username')
const pass = $('.password')

window.addEventListener('message', function(event) {
    var data = event.data
    if (data.type === 'open') {
        console.log('LDVR Loginsystem | OPEN')
        $('body').css('display', 'grid');
    } if (data.type === 'close') {
        console.log('LDVR Loginsystem | CLOSE')
        $('body').css('display', 'none');
    }
})

/// Login Clickelés

login.on('click', () => {
    $.post('https://ldvr_login/login', JSON.stringify({name: username.val(), password: pass.val()}));
})

/// Register Clickelés

register.on('click', () =>{ 
    $.post('https://ldvr_login/register', JSON.stringify({name: username.val(), password: pass.val()}));
})
