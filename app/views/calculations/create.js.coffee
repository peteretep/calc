$('<%= escape_javascript(render(:partial => @calculation))%>')
    .appendTo('#calculations')
    .hide()
    .fadeIn()

$('#new_calculation')[0].reset()