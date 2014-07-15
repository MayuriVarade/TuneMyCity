jQuery ->
  $('#initiative_state_id').parent().hide()
  states = $('#initiative_state_id').html()
  $('#initiative_country_id').change ->
    country = $('#initiative_country_id :selected').text()
    escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(states).filter("optgroup[label='#{escaped_country}']").html()
    if options
      $('#initiative_state_id').html(options)
      $('#initiative_state_id').parent().show()
    else
      $('#initiative_state_id').empty()
      $('#initiative_state_id').parent().hide()



