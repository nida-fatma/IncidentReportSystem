# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

  $(document).ready ->

    $('.observer_detail').change ->
      $('.observer_detail_section').toggle()

    $('body').on 'change', '#detail_incident_report_location', ->
      if @value == 'other'
        $('.location_text').val ''
        $('.location_text').show()
      else
        $('.location_text').hide()
    return
  return

