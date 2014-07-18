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

  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text("Fetching more products...")
        $.getScript(url)
    $(window).scroll()


