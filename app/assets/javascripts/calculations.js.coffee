# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  action = ->
    if ($("#calculation_a").val() > 0 and $("#calculation_a").val() < 100) and ($("#calculation_b").val() > 0 and $("#calculation_b").val() < 100)
      $(".calculate_btns").prop "disabled", false
    else
      $(".calculate_btns").prop "disabled", true
      
  $("#calculation_a, #calculation_b").on "keyup", action


  $("#new_calculation").on("ajax:beforeSend", (e, data, status, xhr) ->
    $("#new_calculation :input").attr("disabled", true);
  )
  $("#new_calculation").on("ajax:success", (e, data, status, xhr) ->
    $("#new_calculation :input").attr("disabled", false);
  ).bind "ajax:error", (e, xhr, status, error) ->
    $("#calculations").append "<p>ERROR</p>"