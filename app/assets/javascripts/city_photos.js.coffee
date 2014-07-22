jQuery ->
  # $('#user_city_id').parent().hide()
  $('#city_photo_state_id').parent().hide()
  states = $('#city_photo_state_id').html()
  # cities = $('#user_city_id').html()
  $('#city_photo_country_id').change ->
    country = $('#city_photo_country_id :selected').text()
    escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    $('#city_photo_state_id').change ->
    # state = $('#user_state_id :selected').text()
    # escaped_state = state.replace()
    options = $(states).filter("optgroup[label='#{escaped_country}']").html()
    # options1 = $(cities).filter("optgroup[label='#{escaped_state}']").html()
    if options
      $('#city_photo_state_id').html(options)
      $('#city_photo_state_id').parent().show()
    else
      $('#city_photo_state_id').empty()
      $('#city_photo_state_id').parent().hide()
      

    

  $('#city_photo_city_id').parent().hide()
  cities = $('#city_photo_city_id').html()
  $('#city_photo_state_id').change ->
   state = $('#city_photo_state_id :selected').text()
   escaped_state = state.replace()
   options1 = $(cities).filter("optgroup[label='#{escaped_state}']").html()
   if options1
      $('#city_photo_city_id').html(options1)
      $('#city_photo_city_id').parent().show()
    else
      $('#city_photo_city_id').empty()
      $('#city_photo_city_id').parent().hide()