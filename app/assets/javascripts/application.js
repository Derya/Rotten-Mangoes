// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap

// index page stuff
$(function() {

  $('.movie-pair').each(function() {
    var left = $(this).find(".movie-holder-outer.left");
    var right = $(this).find(".movie-holder-outer.right");
    left.css("background-color",left.data("color"));
    right.css("background-color",right.data("color"));

    if (left.height() > right.height()) {
      $(this).css("background-color",right.css("background-color"));
    } else {
      $(this).css("background-color",left.css("background-color"));
    }
  });


});