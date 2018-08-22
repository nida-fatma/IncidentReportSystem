# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$(document).on 'turbolinks:load', ->
  $('.observer_detail').change ->
    $('.observer_detail_section').toggle()
    return
  $('body').on 'change', '#detail_incident_report_location', ->
    if @value == 'other'
      $('.location_text').val ''
      $('.location_text').show()
    else
      $('.location_text').hide()
    return
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'
    width: '100%'
  $('#incident-file-upload').change ->
    $('#file-name').text if @files.length > 1 then @files.length + ' files selected' else @files[0].name
  $('.detail-incident').on 'click', ->
    $('.detail-incident-section').toggle()
    return
  return


