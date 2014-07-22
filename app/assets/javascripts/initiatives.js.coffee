jQuery ->
  # $('#user_city_id').parent().hide()
  $('#initiative_state_id').parent().hide()
  states = $('#initiative_state_id').html()
  # cities = $('#user_city_id').html()
  $('#initiative_country_id').change ->
    country = $('#initiative_country_id :selected').text()
    escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    $('#initiative_state_id').change ->
    # state = $('#user_state_id :selected').text()
    # escaped_state = state.replace()
    options = $(states).filter("optgroup[label='#{escaped_country}']").html()
    # options1 = $(cities).filter("optgroup[label='#{escaped_state}']").html()
    if options
      $('#initiative_state_id').html(options)
      $('#initiative_state_id').parent().show()
    else
      $('#initiative_state_id').empty()
      $('#initiative_state_id').parent().hide()
      

    

  $('#initiative_city_id').parent().hide()
  cities = $('#initiative_city_id').html()
  $('#initiative_state_id').change ->
   state = $('#initiative_state_id :selected').text()
   escaped_state = state.replace()
   options1 = $(cities).filter("optgroup[label='#{escaped_state}']").html()
   if options1
      $('#initiative_city_id').html(options1)
      $('#initiative_city_id').parent().show()
    else
      $('#initiative_city_id').empty()
      $('#initiative_city_id').parent().hide()