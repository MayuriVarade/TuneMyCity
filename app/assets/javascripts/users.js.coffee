jQuery ->
  # $('#user_city_id').parent().hide()
  $('#user_state_id').parent().hide()
  states = $('#user_state_id').html()
  # cities = $('#user_city_id').html()
  $('#user_country_id').change ->
    country = $('#user_country_id :selected').text()
    escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    # state = $('#user_state_id :selected').text()
    # escaped_state = state.replace()
    options = $(states).filter("optgroup[label='#{escaped_country}']").html()
    # options1 = $(cities).filter("optgroup[label='#{escaped_state}']").html()
    if options
      $('#user_state_id').html(options)
      $('#user_state_id').parent().show()
    else
      $('#user_state_id').empty()
      $('#user_state_id').parent().hide()
      

    

  $('#user_city_id').parent().hide()
  cities = $('#user_city_id').html()
  $('#user_state_id').change ->
   state = $('#user_state_id :selected').text()
   escaped_state = state.replace()
   options1 = $(cities).filter("optgroup[label='#{escaped_state}']").html()
   if options1
      $('#user_city_id').html(options1)
      $('#user_city_id').parent().show()
    else
      $('#user_city_id').empty()
      $('#user_city_id').parent().hide()