// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

//= require jquery3
//= require popper
//= require bootstrap-sprockets

$("#login-button").click(function(event){
  event.preventDefault();

$('form').fadeOut(500);
$('.wrapper').addClass('form-success');
});
function Button_Click() {
  window.location.reload();
}
(function () {
  var app;

  $(document).ready(function () {
    return app.init();
  });

  app = {
    text: "Life Sports Site",
    index: 0,
    chars: 0,
    speed: 200,
    container: ".text .content",
    init: function () {
      this.chars = this.text.length;
      return this.write();
    },
    write: function () {
      $(this.container).append(this.text[this.index]);
      if (this.index < this.chars) {
        this.index++;
        return window.setTimeout(function () {
          return app.write();
        }, this.speed);
      }
    } };


}).call(this);