
// script for GoodInitiative //
  $(document).ready(function(){
  var timelyrefreshPinFeeds = function(){
  url = '/refresh'
  $.get(url,function(data,status){
   $('#pinsfeed').html(data)
   return false
   });
  };
  setInterval(timelyrefreshPinFeeds,60000);

   $(".votes").click(function()
  {
     var id = $(this).attr("id");
     var name = $(this).attr("name");
    var parent = $(this)
          if (name=='GoodInitiative')
         {
              

              $.get('/votedup', {id: id},
                   function(data,status){
                   parent.html(data);
                                          });
         }
         else
        {
             $.get('/voteddown', {id: id},
                   function(data,status){
                   parent.html(data);
                                          });
        }
   return false;
  });

  });

// end of script //

// script for likes in City Photo//
  $(document).ready(function(){
  var timelyrefreshPinFeeds = function(){
  url = '/refreshcity_photo'
  $.get(url,function(data,status){
   $('#initiativefeed').html(data)
   return false
   });
  };
  setInterval(timelyrefreshPinFeeds,60000);

   $(".likes").click(function()
  {
     var id = $(this).attr("id");
     var name = $(this).attr("name");
    var parent = $(this)
          if (name=='likes')
         {
              

              $.get('/likes', {id: id},
                   function(data,status){
                   parent.html(data);
                                          });
         }
         else
        {
             $.get('/downs', {id: id},
                   function(data,status){
                   parent.html(data);
                                          });
        }
   return true;
  });

  });


// end of script //