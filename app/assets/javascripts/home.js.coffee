# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $('select').change ->

    sendData=new Object()
    sendData.role_id=@.value
    sendData.user_id=@.parentNode.parentNode.getAttribute 'user_id'
    $.ajax({
      url:"/users/changeRole"
      method:"post"
      data:sendData
      error:(jqXHR ,  textStatus,  errorThrown)->
        alert textStatus+" : "+errorThrown
    })