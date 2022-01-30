const login = $('.login')
const register = $('.register')
const username = $('.username')
const pass = $('.password')

window.addEventListener('message', function(event) {
    var data = event.data
    if (data.type === 'open') {
        console.log('open')
        $('body').css('display', 'grid');
    } if (data.type === 'close') {
        console.log('close')
        $('body').css('display', 'none');
    }
})


login.on('click', () => {
    $.post('https://ldvr_login/login', JSON.stringify({name: username.val(), password: pass.val()}));
})


register.on('click', () =>{ 
    $.post('https://ldvr_login/register', JSON.stringify({name: username.val(), password: pass.val()}));
})