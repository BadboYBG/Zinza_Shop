//= require jquery
//= require bootstrap
//= require rails-ujs
//= require turbolinks
//= require_tree .

$(function(){
  $("#show-limit").on("change", function(){
    $(this).closest("form").trigger("submit");
  });
})