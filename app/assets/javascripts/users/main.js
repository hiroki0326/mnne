//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets

$(function(){
	$('body').on('click','.show-password-btn-box',function(e){
		const password = $('.show-password-input')
		const passwordBtn = $('.show-password-btn')
		console.log(password)
		if (password.attr('type') === 'password') {
			password.attr('type','text')
			passwordBtn.attr('class','fa fa-eye show-password-btn')
		} else {
			password.attr('type','password')
			passwordBtn.attr('class','fa fa-eye-slash show-password-btn')
		}
	})
});
