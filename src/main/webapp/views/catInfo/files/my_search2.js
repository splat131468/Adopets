
$('.droppage').click(function () {
	console.log("hello this is droppage inner");
    $(this).attr('tabindex', 1).focus();
    $(this).toggleClass('active');
    $(this).find('.droppage-menu').slideToggle(300);
    });
    $('.droppage').focusout(function () {
    $(this).removeClass('active');
    $(this).find('.droppage-menu').slideUp(300);
    });
    $('.droppage .droppage-menu li').click(function () {
    $(this).parents('.droppage').find('span').text($(this).text());
    $(this).parents('.droppage').find('input').attr('value', $(this).attr('id'));
    });
    /*End Dropdown Menu*/
    
    
    $('.droppage-menu li').click(function () {
    var input = '<strong>' + $(this).parents('.droppage').find('input').val() + '</strong>',
    msg = '<span class="msg">Hidden input value: ';
    $('.msg').html(msg + input + '</span>');
    }); 