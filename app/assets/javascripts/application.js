// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
// require jquery_ujs
//
//= require jquery
//= require jquery-ui/widgets/datepicker
//= require bootstrap/collapse
//= require bootstrap/transition
//= require bootstrap/modal
//= require bootstrap/tooltip
//= require bootstrap/popover
//= require select2/dist/js/select2.js
//= require handlebars.runtime
//= require underscore
//= require gmaps/google
//= require backbone
//= require backbone-super
//= require bridgetroll
//= require_tree ../templates
//= require_tree ./enums
//= require datatables.net/js/jquery.dataTables
//= require datatables.net-bs/js/dataTables.bootstrap
//= stub section_organizer
//= require imported_event
//= require_tree .
//= require jquery_nested_form
//= require rails-ujs
//= require turbolinks


// TODO: Move to appropriate location and fix:
document.addEventListener('turbolinks:load', () => {
    $messages = $('#messages')
    $messages.scrollTop($messages.prop('5000'))
    $('#message_input').focus()
});