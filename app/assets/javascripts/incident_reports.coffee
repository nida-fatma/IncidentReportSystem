# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$(document).on 'turbolinks:load', ->
  $('.observer_detail').change ->
    $('.observer_detail_section').toggle()
    return
  $('#location-select').on 'change', ->
    if @value == 'other'
      $('.location-text').val ''
      $('.location-text').show()
    else
      $('.location-text').hide()
    return
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'
    width: '100%'
  $('#incident-file-upload').change ->
    $('#file-name').text if @files.length > 1 then @files.length + ' files selected' else @files[0].name
  $('.detail-incident').on 'change', ->
    $('.detail-incident-section').toggle()
    label = if this.checked then 'Report Incident in brief' else 'Report Incident in detail'
    $('.lable-text').text(label)
    return
  return


