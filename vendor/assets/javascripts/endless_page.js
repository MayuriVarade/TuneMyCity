jQuery(function() {
    if ($('.pagination').length) {
      $(window).scroll(function() {
        var url;
        url = $('.pagination .next_page').attr('href');
        if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 5) {
          $('.pagination').text("Fetching more products...");
          // $('.nav').html('<a id="nextpage" href="'+url+'">Next Page</a>');
          return $.getScript(url);
        }
      });
      return $(window).scroll();
    }
  });
