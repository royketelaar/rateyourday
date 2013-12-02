# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Twitter typeahead exmaple.
$ ->
	$('#user_employment').typeahead
		name: 'companies'
		local: $('#employment-field').data('companies')


		