jQuery ->
  $('#city_photo_state_id').parent().hide()
  states = $('#city_photo_state_id').html()
  $('#city_photo_country_id').change ->
    country = $('#city_photo_country_id :selected').text()
    escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(states).filter("optgroup[label='#{escaped_country}']").html()
    if options
      $('#city_photo_state_id').html(options)
      $('#city_photo_state_id').parent().show()
    else
      $('#city_photo_state_id').empty()
      $('#city_photo_state_id').parent().hide()

  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text("Fetching more products...")
        $.getScript(url)
    $(window).scroll()

  

  
