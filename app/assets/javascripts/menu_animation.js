// JavaScript Document

$(function(){
    $('#main_menu').find('> li').hover(function(){
        $(this).find('ul')
        .removeClass('noJS')
        .stop(true, true).slideToggle('fast');
    });
});