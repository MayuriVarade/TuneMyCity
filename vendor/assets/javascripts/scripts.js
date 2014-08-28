
jQuery(window).load( function($) {

//
  // Flexslider
  //
  if( jQuery(".flexslider").length > 0) {
    jQuery
    (".flexslider").flexslider({
      'controlNav': true,
      'directionNav': true
    });
  }

  jQuery('#entry-listing').isotope({
    animationOptions: {
      duration: 750,
      easing: 'linear',
      queue: false
    },
    itemSelector: 'article.entry',
    transformsEnabled: false
  });

});

jQuery(document).ready(function($) {


  var $menu = $("#navigation");
  $menu.superfish({
    animation: {
      opacity: "show",
      height: "show"
    },
    speed: "fast",
    delay: 250
  });

  $(".searchsubmit").bind("click", function() {
    $(this).parent().submit();
  });

  $(".fancybox").fancybox({
    fitToView: true
  });

  $("a[data-lightbox^=fancybox]").fancybox({
    fitToView: true
  });


  // Responsive menu
  $("<select />").appendTo("nav");

  // Create default option "Go to..."
  $("<option />", {
    "selected": "selected",
    "value": "",
    "text": "Go to..."
  }).appendTo("nav select");

  // Populate dropdown with menu items
  $("nav a").each(function () {
    var el = $(this);
    $("<option />", {
      "value": el.attr("href"),
      "text": el.text()
    }).appendTo("nav select");
  });

  $("nav select").change(function () {
    window.location = $(this).find("option:selected").val();
  });

  // $(function(){
  //   $.fn.formLabels();
  // });

  // $("#jp500").jPlayer({
  //   ready: function (event) {
  //     $(this).jPlayer("setMedia", {
  //       m4a:"../../../www.jplayer.org/audio/m4a/TSP-01-Cro_magnon_man.m4a",
  //       oga:"../../../www.jplayer.org/audio/ogg/TSP-01-Cro_magnon_man.ogg"
  //     });
  //   },
  //   swfPath: "js",
  //   supplied: "m4a, oga",
  //   wmode: "window",
  //   // cssSelectorAncestor: "#jp-203"
  // });

  //fitVids
  // $(".inner-container .format-video .entry-image").fitVids();


  $('#styler a').not("#style-toggle a").click(function(){
      var css = $(this).attr('href');
      var logo = $(this).attr('id'); 
      $('#color').attr('href', css);
      $('.logo img').attr('src','demo/' + logo + '.png');
      return false;
  });

  var st = false;
  $('#style-toggle a').click(function(e){
     if (!st) {
         $('#styler').animate({
             left:'+=200'
         },'fast');
         st = true;
     }
      else {
         $('#styler').animate({
             left:'-=200'
         },'fast');
         st = false;
     }
    e.preventDefault();
  });

});

jQuery(window).load( function() {

  // Page width calculations

  jQuery(window).resize(setContainerWidth);
  var $box = jQuery(".box");

  function setContainerWidth() {
    var columnNumber = parseInt((jQuery(window).width()+15) / ($box.outerWidth(true))),
      containerWidth = (columnNumber * $box.outerWidth(true)) - 15;

    if ( columnNumber > 1 )  {
      jQuery("#box-container").css("width",containerWidth+'px');
    } else {
      jQuery("#box-container").css("width", "100%");
    }

  }

  setContainerWidth();
  loadAudioPlayer();

});

function loadAudioPlayer() {
  jQuery(".format-audio").each(function() {
    var $audio_id = jQuery(this).find(".audio-wrap").data("audio-id"),
      $media = jQuery(this).find(".audio-wrap").data("audio-file"),
      $play_id = '#jp-'+$audio_id,
      $play_ancestor = '#jp-play-'+$audio_id,
      $extension = $media.split('.').pop();

    if ( $extension.toLowerCase() =='mp3' ) {
      var $extension = 'mp3';
    } else if ( $extension.toLowerCase() =='mp4' ||  $extension.toLowerCase() =='m4a' ) {
      var $extension = 'm4a';
    } else if ( $extension.toLowerCase() =='ogg' || $extension.toLowerCase() =='oga' ) {
      var $extension = 'oga';
    } else {
      var $extension = '';
    }


    jQuery($play_id).jPlayer({
      ready: function (event) {
        var playerOptions = {
          $extension: $media
        };
        playerOptions[$extension] = $media;
        jQuery(this).jPlayer("setMedia", playerOptions);
      },
//      swfPath: '../../js', uncomment this for swf support
      supplied: $extension,
      wmode: 'window',
      cssSelectorAncestor: $play_ancestor
    });

  });

jQuery.ias({
    container   : "#entry-listing",
    item        : ".entry",
    pagination  : ".nav",
    next        : "#nextpage",
    loader  : "",
    onRenderComplete: function(items) {
      var $newElems = jQuery(items).addClass("newItem");

      $newElems.hide().imagesLoaded(function(){
        if( jQuery(".flexslider").length > 0) {
          jQuery(".flexslider").flexslider({
            'controlNav': true,
            'directionNav': true
          });
        }
        jQuery(this).show();
        jQuery('#infscr-loading').fadeOut('normal');
        jQuery("#entry-listing").isotope('appended', $newElems );
        loadAudioPlayer();
      });
    }
    });

jQuery.ias({
    container   : "#entry-listing",
    item        : ".entry",
    pagination  : ".nav",
    next        : "#nextpage",
    loader  : "/assets/ajax-loader.gif",
    onRenderComplete: function(items) {
      var $newElems = jQuery(items).addClass("newItem");

      $newElems.hide().imagesLoaded(function(){
        if( jQuery(".flexslider").length > 0) {
          jQuery(".flexslider").flexslider({
            'controlNav': true,
            'directionNav': true
          });
        }
        jQuery(this).show();
        jQuery('#infscr-loading').fadeOut('normal');
        jQuery("#entry-listing").isotope('appended', $newElems );
        loadAudioPlayer();
      });
    }
    });

var clicky_site_ids = clicky_site_ids || [];
clicky_site_ids.push(66565660);
(function() {
  var s = document.createElement('script');
  s.type = 'text/javascript';
  s.async = true;
  s.src = '//static.getclicky.com/js';
  ( document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0] ).appendChild( s );
})();
/*{literal}<![CDATA[*/window.olark||(function(i){var e=window,h=document,a=e.location.protocol=="https:"?"https:":"http:",g=i.name,b="load";(function(){e[g]=function(){(c.s=c.s||[]).push(arguments)};var c=e[g]._={},f=i.methods.length; while(f--){(function(j){e[g][j]=function(){e[g]("call",j,arguments)}})(i.methods[f])} c.l=i.loader;c.i=arguments.callee;c.f=setTimeout(function(){if(c.f){(new Image).src=a+"//"+c.l.replace(".js",".png")+"&"+escape(e.location.href)}c.f=null},20000);c.p={0:+new Date};c.P=function(j){c.p[j]=new Date-c.p[0]};function d(){c.P(b);e[g](b)}e.addEventListener?e.addEventListener(b,d,false):e.attachEvent("on"+b,d); (function(){function l(j){j="head";return["<",j,"></",j,"><",z,' onl'+'oad="var d=',B,";d.getElementsByTagName('head')[0].",y,"(d.",A,"('script')).",u,"='",a,"//",c.l,"'",'"',"></",z,">"].join("")}var z="body",s=h[z];if(!s){return setTimeout(arguments.callee,100)}c.P(1);var y="appendChild",A="createElement",u="src",r=h[A]("div"),G=r[y](h[A](g)),D=h[A]("iframe"),B="document",C="domain",q;r.style.display="none";s.insertBefore(r,s.firstChild).id=g;D.frameBorder="0";D.id=g+"-loader";if(/MSIE[ ]+6/.test(navigator.userAgent)){D.src="javascript:false"} D.allowTransparency="true";G[y](D);try{D.contentWindow[B].open()}catch(F){i[C]=h[C];q="javascript:var d="+B+".open();d.domain='"+h.domain+"';";D[u]=q+"void(0);"}try{var H=D.contentWindow[B];H.write(l());H.close()}catch(E){D[u]=q+'d.write("'+l().replace(/"/g,String.fromCharCode(92)+'"')+'");d.close();'}c.P(2)})()})()})({loader:(function(a){return "="+(a?a[1]:(+new Date))})(document.cookie.match(/olarkld=([0-9]+)/)),name:"olark",methods:["configure","extend","declare","identify"]});
/* custom configuration goes here (www.olark.com/documentation) */
olark.identify('3277-554-10-9027');/*]]>{/literal}*/
}


