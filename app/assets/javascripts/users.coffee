# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.approval_checkbox').change ->
    if $(this).is(':checked')
      $.ajax
        url: '/admins/' + $(this).closest('td').attr('id') + '/approve'
        type: 'POST'
        data: confirmed: true
    else
      alert 'no'
    return
  return