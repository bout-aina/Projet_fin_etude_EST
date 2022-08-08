"use strict";

$('*').on( "hover", function (){} );
/**/
/* mobile device detect */
/**/
function is_mobile_device () {
  if ( ( $(window).width()<767) || (navigator.userAgent.match(/(Android|iPhone|iPod|iPad)/) ) ) {
    return true;
  } else {
    return false;
  }
}
onload = function () { 
for (var lnk = document.links, j = 0; j < lnk.length; j++) 
  if (lnk [j].href === document.URL) {
    $(lnk [j]).addClass('active-link');
    $(lnk [j]).parent().parent().parent('li').children('a').addClass('active-link');
  } 
}

/**/
/* MARK */
/**/
function star_rating() {
  var stars_active = false;
  var mark
  var rating

  $(".woocommerce .stars").on("mouseover", function() {
    if (!stars_active) {
      $(this).find("span:not(.stars-active)").append("<span class='stars-active' data-set='no'>&#xf005;&#xf005;&#xf005;&#xf005;&#xf005;</span>");
      stars_active = true;
    }
  });
  $(".woocommerce .stars").on("mousemove", function (e) {
    var cursor = e.pageX;
    var ofs = $(this).offset().left;
    var fill = cursor - ofs;
    var width = $(this).width(); 
    var persent = Math.round(100*fill/width);

    $(".woocommerce .stars span a").css({"line-height":String((width+1)/5)+"px","width":String(width/5)+"px"})
    $(".woocommerce .stars span .stars-active").css("margin-top","0px");
    $(this).find(".stars-active").css('width',String(persent)+"%");
    $(".stars-active").removeClass("fixed-mark");

  });
  $(".woocommerce .stars").on("click", function (e){
    var cursor = e.pageX;
    var ofs = $(this).offset().left;
    var fill = cursor - ofs;
    var width = $(this).width(); 
    var persent = Math.round(100*fill/width);

    mark = $(this).find(".stars-active");
    mark.css('width',String(persent)+"%").attr("data-set",String(persent));
    rating = $( this ).closest( '#respond' ).find( '#rating' );
    rating.val( $($(this).find("span a[class*='star-']")[Math.ceil((persent).toFixed(2)/20)-1]).text());
  });
  $(".woocommerce .stars").on("mouseleave", function (e){
    if ($(mark).attr("data-set") == "no"){
      mark.css("width","0");
    }
    else{
      var persent = $(mark).attr("data-set");
      $(mark).css("width",String(persent)+"%");
      $(".stars-active").addClass("fixed-mark");
    }
  });
}

/* woocommerce_price_slider */
function woocommerce_price_slider(){
  var current_min_price
  var current_max_price
  window.woocommerce_price_slider_params = {
    'currency_symbol' : '$',
    'currency_pos' : 'left',
  }

  // woocommerce_price_slider_params is required to continue, ensure the object exists
  if ( typeof woocommerce_price_slider_params === 'undefined' ) {
    return false;
  }
  // Get markup ready for slider
  $( 'input#min_price, input#max_price' ).hide();
  $( '.price_slider, .price_label' ).show();

  // Price slider uses jquery ui
  var min_price = $( '.price_slider_amount #min_price' ).data( 'min' ),
    max_price = $( '.price_slider_amount #max_price' ).data( 'max' );

  current_min_price = parseInt( min_price, 10 );
  current_max_price = parseInt( max_price, 10 );


  if ( woocommerce_price_slider_params.min_price ) current_min_price = parseInt( woocommerce_price_slider_params.min_price, 10 );
  if ( woocommerce_price_slider_params.max_price ) current_max_price = parseInt( woocommerce_price_slider_params.max_price, 10 );
  $( 'body' ).on( 'price_slider_create price_slider_slide', function( event, min, max ) {
    if ( woocommerce_price_slider_params.currency_pos === 'left' ) {

      $( '.price_slider_amount span.from' ).html( woocommerce_price_slider_params.currency_symbol + min );
      $( '.price_slider_amount span.to' ).html( woocommerce_price_slider_params.currency_symbol + max );

    } else if ( woocommerce_price_slider_params.currency_pos === 'left_space' ) {

      $( '.price_slider_amount span.from' ).html( woocommerce_price_slider_params.currency_symbol + " " + min );
      $( '.price_slider_amount span.to' ).html( woocommerce_price_slider_params.currency_symbol + " " + max );

    } else if ( woocommerce_price_slider_params.currency_pos === 'right' ) {

      $( '.price_slider_amount span.from' ).html( min + woocommerce_price_slider_params.currency_symbol );
      $( '.price_slider_amount span.to' ).html( max + woocommerce_price_slider_params.currency_symbol );

    } else if ( woocommerce_price_slider_params.currency_pos === 'right_space' ) {

      $( '.price_slider_amount span.from' ).html( min + " " + woocommerce_price_slider_params.currency_symbol );
      $( '.price_slider_amount span.to' ).html( max + " " + woocommerce_price_slider_params.currency_symbol );

    }

    $( 'body' ).trigger( 'price_slider_updated', min, max );
  });

  $( '.price_slider' ).slider({
    range: true,
    animate: true,
    min: min_price,
    max: max_price,
    values: [ current_min_price, current_max_price ],
    create : function( event, ui ) {

      $( '.price_slider_amount #min_price' ).val( current_min_price );
      $( '.price_slider_amount #max_price' ).val( current_max_price );

      $( 'body' ).trigger( 'price_slider_create', [ current_min_price, current_max_price ] );
    },
    slide: function( event, ui ) {

      $( 'input#min_price' ).val( ui.values[0] );
      $( 'input#max_price' ).val( ui.values[1] );

      $( 'body' ).trigger( 'price_slider_slide', [ ui.values[0], ui.values[1] ] );
    },
    change: function( event, ui ) {

      $( 'body' ).trigger( 'price_slider_change', [ ui.values[0], ui.values[1] ] );

    },
  });
};

/**/
/* woocommerce button add */
/**/
function woocommerce_button_add() {

  // Orderby
  $( '.woocommerce-ordering' ).on( 'change', 'select.orderby', function() {
    $( this ).closest( 'form' ).submit();
  });

  // Quantity buttons
  $( 'div.quantity:not(.buttons_added), td.quantity:not(.buttons_added)' ).addClass( 'buttons_added' ).append( '<input type="button" value="+" class="plus" />' ).prepend( '<input type="button" value="-" class="minus" />' );

  // Target quantity inputs on product pages
  $( 'input.qty:not(.product-quantity input.qty)' ).each( function() {
    var min = parseFloat( $( this ).attr( 'min' ) );

    if ( min && min > 0 && parseFloat( $( this ).val() ) < min ) {
      $( this ).val( min );
    }
  });

  $( document ).on( 'click', '.plus, .minus', function() {

    // Get values
    var $qty    = $( this ).closest( '.quantity' ).find( '.qty' ),
      currentVal  = parseFloat( $qty.val() ),
      max     = parseFloat( $qty.attr( 'max' ) ),
      min     = parseFloat( $qty.attr( 'min' ) ),
      step    = $qty.attr( 'step' );

    // Format values
    if ( ! currentVal || currentVal === '' || currentVal === 'NaN' ) currentVal = 0;
    if ( max === '' || max === 'NaN' ) max = '';
    if ( min === '' || min === 'NaN' ) min = 0;
    if ( step === 'any' || step === '' || step === undefined || parseFloat( step ) === 'NaN' ) step = 1;

    // Change the value
    if ( $( this ).is( '.plus' ) ) {

      if ( max && ( max == currentVal || currentVal > max ) ) {
        $qty.val( max );
      } else {
        $qty.val( currentVal + parseFloat( step ) );
      }

    } else {

      if ( min && ( min == currentVal || currentVal < min ) ) {
        $qty.val( min );
      } else if ( currentVal > 0 ) {
        $qty.val( currentVal - parseFloat( step ) );
      }

    }
    // Trigger change event
    $qty.trigger( 'change' );
  });
};


/**/
/* woocommerce shipping calc */
/**/
function woocommerce_shipping_calc_slide () {
  $( document ).on( 'click', '.shipping-calculator-button', function() {
    $( '.shipping-calculator-form' ).slideToggle( 'slow' );
    return false;
  })
  $( '.shipping-calculator-form' ).show();
};
$(document).ready(function() {

  /**/
  /* move gradient */
  /**/
  move_gradient();

  if ($('.tp-banner').length) {
    $('.tp-banner').revolution({
       dottedOverlay:"none",
      delay:16000,
      startwidth:1170,
      startheight:700,
      hideThumbs:10,
      videoJsPath:"rs-plugin/videojs/",
      
      thumbWidth:100,
      thumbHeight:50,
      thumbAmount:5,
      navigation: {
                    keyboardNavigation: "off",
                    keyboard_direction: "horizontal",
                    mouseScrollNavigation: "off",
                    onHoverStop: "on",
                    touch: {
                        touchenabled: "on",
                        swipe_threshold: 75,
                        swipe_min_touches: 1,
                        swipe_direction: "horizontal",
                        drag_block_vertical: false
                    },
                    arrows: {
                        style: "uranus",
                        enable: true,
                        hide_onmobile: false,
                        hide_onleave: true,
                        hide_delay: 200,
                        hide_delay_mobile: 1200,
                        tmp: '',
                        left: {
                            h_align: "left",
                            v_align: "center",
                            h_offset: 20,
                            v_offset: 0
                        },
                        right: {
                            h_align: "right",
                            v_align: "center",
                            h_offset: 20,
                            v_offset: 0
                        }
                    }
                },
                  
                  parallax:"mouse",
      parallaxBgFreeze:"on",
      parallaxLevels:[7,4,3,2,5,4,3,2,1,0],
                  
      keyboardNavigation:"off",
      
      navigationHAlign:"center",
      navigationVAlign:"bottom",
      navigationHOffset:0,
      navigationVOffset:20,

      soloArrowLeftHalign:"left",
      soloArrowLeftValign:"center",
      soloArrowLeftHOffset:20,
      soloArrowLeftVOffset:0,

      soloArrowRightHalign:"right",
      soloArrowRightValign:"center",
      soloArrowRightHOffset:20,
      soloArrowRightVOffset:0,
          
      shadow:0,
      fullWidth:"off",
      fullScreen:"on",

      spinner:"spinner4",
      
      stopLoop:"off",
      stopAfterLoops:-1,
      stopAtSlide:-1,

      shuffle:"off",
      
      autoHeight:"off",           
      forceFullWidth:"off",                 
                  
      hideThumbsOnMobile:"off",
      hideNavDelayOnMobile:1500,            
      hideBulletsOnMobile:"off",
      hideArrowsOnMobile:"off",
      hideThumbsUnderResolution:0,
      
      hideSliderAtLimit:0,
      hideCaptionAtLimit:0,
      hideAllCaptionAtLilmit:0,
      startWithSlide:0,
    })
  };
  /**/
  /* parallax */
  /**/
  $('.parallaxed').parallax();
  /**/
  /*hover effect*/
  /**/
  var over_hover = $('.overflow-block')

  jQuery(over_hover).each(function (){
    $(this).mouseout(function(e) {
      $(this).parent().parent().removeClass('animate');
    });
    $(this).mousemove(function(e) {
      $(this).parent().parent().addClass('animate');
    });
  });

   var widget_hover = $('.widget_pages ul ul>li>a')

  jQuery(widget_hover).each(function (){
    $(this).mouseout(function(e) {
      $(this).parent().removeClass('color');
    });
    $(this).mousemove(function(e) {
      $(this).parent().addClass('color');
    });
  });

  /**/
  /*Sticky call*/
  /**/
  sticky ();

  /**/
  /*Counter*/
  /**/
  counter ();

  /**/
  /*search*/
  /**/
  $('#search form').attr('action','');
  $('#search form label input').attr('placeholder','Search to the site');
  $('#search form input[type="submit"]').attr("value","\uf002").css('font-size','25px')

  /**/
  /*contact form*/
  /**/
  $('#text-2 .textwidget form input[type="text"]').attr('placeholder','Your Name');
  $('#text-2 .textwidget form input[type="email"]').attr('placeholder','Your E-Mail');
  $('#text-2 .textwidget form textarea').attr('placeholder','Your Message');

  /**/
  /********   Carousel   *********/
  /**/
  var owl_gallery_three_items = $("#gallery-three-items")
  $("#gallery-three-items").owlCarousel({
    items: 3,
    navigation: false,
    pagination: false,
  });
  $(owl_gallery_three_items).parent().parent().parent().find(".carousel-button .next").on( "click", function(){
    owl_gallery_three_items.trigger('owl.next');
  })
  jQuery(owl_gallery_three_items).parent().parent().parent().find(".carousel-button .prev").on( "click", function (){
    owl_gallery_three_items.trigger('owl.prev');
  });
  /**/
  /********   Carousel-widget  *********/
  /**/
  var owl_widget = $('.owl-widget')
  jQuery(owl_widget).each(function (){
    jQuery(this).owlCarousel({
      items: 1,
      singleItem:true,
      itemsDesktop: [270],
      navigation: false,
      pagination: false,
    });
     var owl = $(this)
    $(this).parent().find(".carousel-button .next").on( "click", function(){
      owl.trigger('owl.next');
    })
    jQuery(this).parent().find(".carousel-button .prev").on( "click", function (){
    owl.trigger('owl.prev');
    })
  });

  /**/
  /********   Carousel   *********/
  /**/
	var owl = $("#owl-example")
  $("#owl-example").owlCarousel({
	items: 4,
	itemsDesktop: [1199,3],
	navigation: false,
	pagination: false,
  });
 	$(owl).parent().find(".carousel-button .next").on( "click", function(){
		owl.trigger('owl.next');
	})
	jQuery(owl).parent().find(".carousel-button .prev").on( "click", function (){
		owl.trigger('owl.prev');
	});

  /**/
  /********   Carousel   *********/
  /**/
  var owl_project = $("#project-carousel")
  $('#project-carousel').owlCarousel({
    items: 4,
    itemsDesktop: [1199,3],
    pagination: false,
    navigation: false,
  })
  $(owl_project).parent().parent().find(".carousel-button .next").on( "click", function(){
    owl_project.trigger('owl.next');
  })
  jQuery(owl_project).parent().parent().find(".carousel-button .prev").on( "click", function (){
    owl_project.trigger('owl.prev');
  });

  /**/
  /********   Carousel   *********/
  /**/
  var owl_pf_single = $("#pf-single-carousel")
  $('#pf-single-carousel').owlCarousel({
    items: 1,
    singleItem:true,
    itemsDesktop: [1199,3],
    pagination: false,
    navigation: false,
  })
  $(owl_pf_single).parent().find(".sl-controll .next").on( "click", function(){
    owl_pf_single.trigger('owl.next');
  })
  jQuery(owl_pf_single).parent().find(".sl-controll .prev").on( "click", function (){
    owl_pf_single.trigger('owl.prev');
  });

  /**/
  /********   Carousel   *********/
  /**/
  var owl_client = $("#client-carousel")
  $('#client-carousel').owlCarousel({
    items: 1,
    singleItem:true,
    animateOut: 'fadeOut',
    animateIn: 'fadeIn',
    mouseDrag: false,
    itemsDesktop: [570],
    pagination: true,
    navigation: false,
  })

  /**/
  /********   Carousel   *********/
  /**/
  var owl_tabs = $("#tabs-carousel")
  $('#tabs-carousel').owlCarousel({
    itemsCustom : [
      [0, 2],
      [738, 2],
      [980, 3],
      [1170, 3], 
    ],
    pagination: false,
    navigation: false,
  })
  $(owl_tabs).parent().find(".carousel-button .next").on( "click", function(){
      owl_tabs.trigger('owl.next');
    })
    jQuery(owl_tabs).parent().find(".carousel-button .prev").on( "click", function (){
      owl_tabs.trigger('owl.prev');
    });
  /**/
  /*flickr widget*/
  /**/
  if($('ul#flickr-badge').length) {
    jQuery('ul#flickr-badge').jflickrfeed({
      limit: 6,
      qstrings: {
      id: '56342020@N03'
    },
    itemTemplate: '<li><div class="container"><a href="{{image_m}}" class="fancy"></a><span><img src="{{image_m}}" alt="{{title}}" /></span></div></li>'
    });
  }
});

/**/
/* sticky menu */
/**/
$('.stick-wrapper').css({
  'height' : $('.sticky').innerHeight(),
  'top' : - $('.sticky').innerHeight()
})

function sticky() {

  var orgElementPos = $('.stick-wrapper').offset();
  var orgElementTop = orgElementPos.top;
  var winHeight = $(window).innerHeight();
  var orgElementHeight = $('.sticky').innerHeight();
  var orgElement = $('.sticky');
  var coordsOrgElement = orgElement.offset();
  var leftOrgElement = coordsOrgElement.left;  
  var widthOrgElement = orgElement.css('width');

  
  if ( !is_mobile_device() && (window.innerWidth > 768)) {
    if ($(window).scrollTop() >= (orgElementTop)) {
      // scrolled past the original position;sticky element.
      if ( $(window).scrollTop() >= ( orgElementTop + $('.sticky').innerHeight() ) ) {
        $('.sticky').css('position','fixed').css('background-color','rgba(255, 255, 255, 0.99)');
      }
      else {
        $('.sticky').css('position','fixed').css('background-color','rgba(255, 255, 255, 1)');
      }
      //element should always have same top position and width.     
      $('.sticky').css('position','fixed').css('top','0');
    } else {
      if ( !$('body.pc').length ) { 
        $('body').addClass('pc');
      }
      // not scrolled past the menu; only show the original position.
      $('.sticky').css('position','relative').css('background-color','rgba(255, 255, 255, 1)');
    }}
  }
window.is_set1 = true;
function mobileMainMenu(){  
  if( is_mobile_device() || (window.innerWidth < 768) ) {
    if (is_set1) {
      $('.stick-wrapper').removeAttr('style');
      $('body').addClass('mobile').removeClass('pc');
      // $('.mobile .sticky').css('position','static');
      // $('.mobile .stick-wrapper').css('position','static');
      $('.sticky .nav .switcher').css('display', 'block');
      $('.mobile .nav').css({
        'position': 'absolute',
        'top':'10px',
        'z-index':'100',
        'right':'10px'
      });
      $('nav>ul>li>ul').parent().addClass('has_child');
      $('.nav>ul').hide();
      $( ".mobile .nav .has_child" ).append("<i></i>");
      $('.nav .has_child i').on( "click", function() {  
        /*if( $(this).parent().children('ul').length ) {*/
          $(this).toggleClass('active');
          $(this).parent().children('ul').slideToggle('fast');
        /*}*/
      });
      is_set1 = false;
    }
  } else {
    $('body').removeClass('mobile').addClass('pc');
    $('.nav .has_child i').remove();
    $('.stick-wrapper').css('position','relative');
    $('.has_child>ul').removeAttr('style');
    $('.stick-wrapper').css({
  'height' : $('.sticky').innerHeight(),
  'top' : - $('.sticky').innerHeight()
  });
    $('.nav').removeAttr('style');
    $( ".nav li .has_child").remove();
    $('.sticky .nav .switcher').css('display', 'none');
    $('.nav>ul').css({"display":"block"});
    return is_set1 = true;
  }
}
$('.nav .switcher').on( "click", function() { 
  if( $(this).next('ul').length ) {
    $(this).toggleClass('color');
    $(this).next('ul').slideToggle('fast').css("display","block");
    return false;
  }
});

/**/
/* menu position */
/**/
var menuPos = function(){
var elem = $(".nav>ul>li>a");
  $.each(elem,function() {
  var atr = $(this).attr("href");
    if (atr[0]=="#") {
      if ($(atr).length) {
        var ofs = $(atr).offset().top;
        $(window).scroll(function() {
          var winScr = $(window).scrollTop();
          if ((winScr+3)>ofs) {
            var link = $(".nav li a[href="+atr+"]");
            $(".nav li a").removeClass("active");
            link.addClass("active");
          };
        })
      } else{
        return false;
      }
    }
  });
}
/**/
/*  parallax  */
/**/
jQuery.fn.parallax = function () {
    var winWidth = $(window).width();
    var winHeight = $(window).height();

    this.each(function() {
      var bgobj = $(this);
      var bgContHeight = bgobj.outerHeight();
      var bgOfsTop = bgobj.offset().top

      var parallaxContainer = bgobj.find('.parallax-image');
      var imgContWidth = parallaxContainer.outerWidth();

      var img = bgobj.find('.parallax-image img');
      var imgHeight = img.outerHeight();
      var imgWidth = img.outerWidth();

      var leftCoef = parallaxContainer.attr("data-parallax-left");
      var topCoef = parallaxContainer.attr("data-parallax-top");
      var scrollCoef = parallaxContainer.attr("data-parallax-scroll-speed");

      function formula (a,b,c) {
        return (a-b)*c 
      }
      
      var leftOfs = -formula(imgWidth,imgContWidth,leftCoef)
      var topOfs  = -formula(imgHeight,bgContHeight,topCoef)

      var corectir = (((imgHeight - bgContHeight) - (imgHeight - bgContHeight)*(scrollCoef))*topCoef)

      var const_1 = formula(imgHeight,bgContHeight,scrollCoef)
      var const_2 = bgOfsTop - winHeight
      var const_3 = winHeight + bgContHeight
      var const_4 = const_1/const_3;
      var const_5 = const_4*const_2;
      var const_6 = const_5 - corectir;

      if (winWidth>1024){
        img.css({'height':'auto' , 'width':'auto' });
        var imgWidth = img.outerWidth();
        var imgContWidth = parallaxContainer.outerWidth();

        if (imgWidth != 0) {
          var leftOfs = -formula(imgWidth,imgContWidth,leftCoef)
          var parOfs = (const_6 - const_4*$(window).scrollTop()).toFixed(3); 
          parallaxContainer.css({'-webkit-transform':'translateY('+ parOfs + 'px) translateZ(0)','-moz-transform':'translateY('+ parOfs + 'px) translateZ(0)','-ms-transform':'translateY('+ parOfs + 'px) translateZ(0)','transform':'translateY('+ parOfs + 'px) translateZ(0)','left':+leftOfs+'px'});
        };

        if (imgWidth < bgobj.outerWidth()) {
          img.css('width', "100%");
          parallaxContainer.css({'left':'0px'});
        };

      }else{
        img.removeAttr('width');
        img.removeAttr('height');
        parallaxContainer.removeAttr('left');

        img.css({'width':+imgContWidth+'px' });
        parallaxContainer.css({'left':'0px','-webkit-transform':'translateY('+ Math.round((img.height() - bgobj.outerHeight())/-2) +'px) translateZ(0)','-moz-transform':'translateY('+ Math.round((img.height() - bgobj.outerHeight())/-2) +'px) translateZ(0)','-ms-transform':'translateY('+ Math.round((img.height() - bgobj.outerHeight())/-2) +'px) translateZ(0)','transform':'translateY('+ Math.round((img.height() - bgobj.outerHeight())/-2) +'px) translateZ(0)'});

        if (img.height() < parallaxContainer.height()) {
            img.css('width', img.width() * (bgobj.outerHeight() / img.height()));
            parallaxContainer.css({'left':+Math.round((img.width() - parallaxContainer.width())/-2) +'px','-webkit-transform':'translateY(0px)','-moz-transform':'translateY(0px)','-ms-transform':'translateY(0px)','transform':'translateY(0px)'});
        }   
      }

      $(window).scroll(function() {
        if (winWidth>1024) {
          var parOfs = (const_6 - const_4*$(window).scrollTop()).toFixed(3);

          parallaxContainer.css({'-webkit-transform':'translateY('+ parOfs + 'px) translateZ(0)','-moz-transform':'translateY('+ parOfs + 'px) translateZ(0)','-ms-transform':'translateY('+ parOfs + 'px) translateZ(0)','transform':'translateY('+ parOfs + 'px) translateZ(0)'});
        }     
      });
    });
};

/**/
/*tabs plugin*/
/**/
$('.choose-team a').on( "click", function() {
  var click_id=$(this).attr('id');

  if (click_id != $('.choose-team a.active').attr('id')) {
    $('.choose-team a').removeClass('active');
    $(this).addClass('active');
    $('.choose-team>div').removeClass('none');
    $('.choose-team>div.active').removeClass('active').addClass('none');
    $('#con_' + click_id).addClass('active');
  }
})

/**/
/* google map */
/**/
function initialize()
{
  var stylez = [
    {
      "featureType": "landscape",
      "elementType": "geometry",
      "stylers": [
        { "weight": 0.1 },
        { "saturation": -15 },
        { "lightness": 38 },
        { "hue": "#0055ff" },
        { "gamma": 1.91 },
        { "visibility": "on" },
        { "color": "#f7f6f7" }
      ]
    },{
      "featureType": "poi",
      "elementType": "geometry",
      "stylers": [
        { "color": "#c3c3c3" }
      ]
    },{
      "featureType": "road.highway",
      "elementType": "geometry",
      "stylers": [
        { "color": "#f4f4f2" }
      ]
    },{
      "featureType": "road.highway",
      "elementType": "labels.text.fill",
      "stylers": [
        { "visibility": "on" },
        { "color": "#080202" }
      ]
    },{
      "featureType": "road.highway",
      "elementType": "labels.text.stroke",
      "stylers": [
        { "color": "#f4f4f6" }
      ]
    },{
      "featureType": "road.arterial",
      "elementType": "labels.text.fill",
      "stylers": [
        { "color": "#020101" }
      ]
    },{
      "featureType": "road.arterial",
      "elementType": "labels.text.stroke",
      "stylers": [
        { "color": "#ffffff" }
      ]
    },{
      "featureType": "road.arterial",
      "elementType": "geometry.stroke",
      "stylers": [
        { "color": "#d2d2d2" },
        { "lightness": -10 }
      ]
    },{
      "featureType": "landscape",
      "stylers": [
        { "color": "#f6f6f6" }
      ]
    },{
      "featureType": "road.local",
      "elementType": "geometry",
      "stylers": [
        { "visibility": "simplified" },
        { "color": "#d2d2d2" }
      ]
    },{
    },{
      "featureType": "road.local",
      "elementType": "labels.text.fill",
      "stylers": [
        { "color": "#040c06" }
      ]
    },{
      "featureType": "transit.station",
      "elementType": "labels.text.fill",
      "stylers": [
        { "visibility": "on" },
        { "color": "#1d080f" }
      ]
    },{
      "featureType": "water",
      "stylers": [
        { "color": "#b8b7b7" },
        { "hue": "#005eff" },
        { "saturation": 41 }
      ]
    },{
      "featureType": "administrative",
      "elementType": "labels.text.fill",
      "stylers": [
        { "color": "#080621" }
      ]
    },{
      "featureType": "poi",
      "elementType": "labels.text.fill",
      "stylers": [
        { "color": "#010201" }
      ]
    },{
      "featureType": "road",
      "elementType": "labels.icon",
      "stylers": [
        { "hue": "#0800ff" },
        { "saturation": -82 },
        { "gamma": 0.32 }
      ]
    },{
      "featureType": "transit.station",
      "elementType": "labels.icon",
      "stylers": [
        { "hue": "#2a00ff" },
        { "saturation": -44 },
        { "lightness": 3 },
        { "gamma": 0.33 },
        { "weight": 0.1 }
      ]
    },{
    }
  ]
  var coordLat = 33.596757;
  var coordLng = -7.629680;
  var delta
  if( jQuery(window).width() < 756 )
  {
    delta = 0;
  }  
  var point = new google.maps.LatLng(coordLat,coordLng);
  var center = new google.maps.LatLng(coordLat,coordLng);  
  var mapOptions = {  
    zoom: 12,
    center: center,
    scrollwheel: false,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  var map = new google.maps.Map(document.getElementById('map'), mapOptions);
  var image = 'images/gmap_default.png';
  var styledMapOptions = {
      name: "gray-style"
  }
  var jayzMapType = new google.maps.StyledMapType(
      stylez, styledMapOptions);
  map.mapTypes.set('graystyle', jayzMapType);
  map.setMapTypeId('graystyle');
  var marker = new google.maps.Marker({
    map: map,
    position: point,
  });

  google.maps.event.addListener(marker, 'click', function() {
      infobox.open(map, this);
      map.panTo(point);
  });
  map.panTo(point);
}
if (document.getElementById('map')) {
	
  google.maps.event.addDomListener(window, 'load', initialize);
};


/**/
/* on scroll */
/**/
$(window).scroll(function(){

  /**/
  /* sticky scroll */
  /**/
  sticky();
  /**/
  /* counter scroll call */
  /**/
  counter ();
  /**/
  /* scroll top */
  /**/
  if( $(this).scrollTop() > 200 ) {
    $('#scroll-top').fadeIn();
  } else {
    $('#scroll-top').fadeOut();
  }
});

/**/
/* on document load */
/**/
$(function(){
  onload ();

  /**/
  /* mobile menu */
  /**/
  mobileMainMenu();

  /**/
  /* Scroll top button */
  /**/
  $('#scroll-top').on( "click", function() {
      $('html, body').animate({scrollTop: 0});
      return false;
  });

  $(window).scroll(progress_bar_loader);
  progress_bar_loader ();

  /**/
  /*  Skill bar  */
  /**/
  function progress_bar_loader (){
    if (!is_mobile_device()){
        $('.skill-bar-progress').each(function(){
          var el = this;
          if (is_visible(el)){
            if ($(el).attr("processed")!="true"){
              $(el).css("width","0%");
              $(el).attr("processed","true");
              var val = parseInt($(el).attr("data-value"), 10);
              var fill = 0;
              var speed = val/100; 
              var timer = setInterval(function (){
                if (fill<val){
                  fill += 1;
                  $(el).css("width",String(fill)+"%");
                  var ind = $(el).parent().parent().find(".skill-bar-perc");
                  $(ind).text(fill+"%");
                }
              },(10/speed));      
            }
          }
        });
      } else {
        $(".skill-bar-progress").each(function(){
          var el = this;
          var fill = $(el).attr("data-value");
          var ind = $(el).parent().parent().find(".skill-bar-perc");
          $(el).css('width',fill+'%');
          $(ind).text(fill+"%");
        });   
    }
  }
  function is_visible (el){
  var w_h = $(window).height();
  var dif = $(el).offset().top - $(window).scrollTop();
  if ((dif > 0) && (dif<w_h)){
    return true;

  } else {
    return false;
  }

  }

  /**/
  /* calendar */
  /**/
  if ($("#calendar").length) {
  
  $('#calendar').datepicker({
    prevText: '<i class="fa fa-angle-left"></i>',
    nextText: '<i class="fa fa-angle-right"></i>',
    firstDay: 1,
    dayNamesMin: [ "S", "M", "T", "W", "T", "F", "S" ]
  });
  }

  /**/
  /*  toogles  */
  /**/
  $('.toggles .active').next().show();
  $(".toggles .content-title").on( "click", function(){
  $(this).toggleClass('active');
  $(this).next().stop().slideToggle(500); 
  })

  /**/
  /*    accordions    */
  /**/
  $('.accordions .active').next().show();
  $(".accordions .content-title").on( "click", function(){

      $(this).addClass('active').siblings("div").removeClass('active');
      $(this).siblings('.content').slideUp(500);
      $(this).next().stop().slideDown(500);
  })

  /**/
  /* widget menu */
  /**/
  $('.widget_pages li>ul').parent().addClass('has_child');
  $('.widget_pages li>a').on( "click", function(e) {
    e.stopPropagation();
  })
  $('.widget_pages li').on( "click", function(e) {
    e.stopPropagation();

    if( $(this).children('ul').length ) { 
    $(this).toggleClass('active');
    $(this).children('ul').slideToggle(500);
    }

    
  });

  /**/
  /*  Tabs  */
  /**/
  $(".container-tabs.active").show();
  $(".tabs .tabs-btn").on( "click", function() {
    var idBtn = ($(this).attr("data-tabs-id"))
    var containerList = $(".tabs .container-tabs");
    var f = $(".tabs [data-tabs-id=cont-"+idBtn+"]");

    $(f).addClass("active").siblings(".container-tabs").removeClass('active');
    $(".container-tabs").fadeOut( 0 );
    $(".container-tabs.active").fadeIn( 300 );
    $(this).addClass("active").siblings(".tabs-btn").removeClass('active');
  });

  /**/
  /* woocommerce tabs */
  /**/
  $( '.woocommerce-tabs .panel' ).hide();
  $('div' + $(".woocommerce-tabs .tabs .active a").attr( 'href' )).show();
  $( '.woocommerce-tabs ul.tabs li a' ).on( "click", function() {
    var $tab = $( this ),
    $tabs_wrapper = $tab.closest( '.woocommerce-tabs' );
    $( 'ul.tabs li', $tabs_wrapper ).removeClass( 'active' );
    $( 'div.panel', $tabs_wrapper ).hide();
    $( 'div' + $tab.attr( 'href' ), $tabs_wrapper).show();
    $tab.parent().addClass( 'active' );
    return false;
  });

  /**/
  /* fancybox */
  /**/
  if ($(".fancy").length) {
    $(".fancy").fancybox();
    $('.fancybox').fancybox({
      helpers: {
        media: {}
      }
    });
  }

  /**/
  /*woocommerce*/
  /**/
  star_rating()
  if ($(".woocommerce").length) {
    woocommerce_price_slider( $ )
    woocommerce_button_add( $ )
    woocommerce_shipping_calc_slide ( $ )
  };

  /**/
  /* list-grid switcher */
  /**/
  $(".woocommerce .products").addClass("grid-view");
  $("#list-or-grid>div").on("click", function () {
    $(this).addClass("active").siblings().removeClass("active");
    if ($(this).hasClass("grid-view")) {
      if ($(".woocommerce .products").hasClass("grid-view")) {
        return false;
      } else {
        $(".woocommerce .products").fadeOut(300,function() {
          $(".woocommerce .products").addClass("grid-view").removeClass("list-view").fadeIn(300);
        });
      }   
    }
    if ($(this).hasClass("list-view")){
      if ($(".woocommerce .products").hasClass("list-view")) {
        return false;
      } else {
        $(".woocommerce .products").fadeOut(300,function(){
          $(".woocommerce .products").addClass("list-view").removeClass("grid-view").fadeIn(300);
        });
      }
    }
  });

  /**/
  /* scroll down */
  /**/
  $('.scroll-down-button').on( "click", function() {
    $('html, body').animate({scrollTop: $('#home').offset().top},{duration: 1500, easing: "easeInOutExpo"});
    return false;
  });

  /**/
  /* info box */
  /**/
  $(".info-boxes .close-button").on( "click", function() {
    $(this).parent().animate({'opacity' : '0'}, 300).slideUp(300);
  });
  
  /**/
  /* feedback */
  /**/
  if ($("#feedback-form").length) {
    $("#feedback-form").validate(
    {
      onkeyup: false,
      onfocusout: false,
      errorElement: 'p',
      errorLabelContainer: $("#feedback-form-errors .message"),
      rules:
      {
        name:
        {
          required: true
        },
        email:
        {
          required: true,
          email: true
        },
        message:
        {
          required: true
        }
      },
      messages:
      {
        name:
        {
          required: 'Please enter your name',
        },
        email:
        {
          required: 'Please enter your email address',
          email: 'Please enter a VALID email address'
        },
        message:
        {
          required: 'Please enter your message'
        }
      },
      invalidHandler: function()
      {
        $("#feedback-form-errors").slideDown('fast');
        $("#feedback-form-success").slideUp('fast');

      },
      submitHandler: function(form)
      {
        $("#feedback-form-errors").slideUp('fast');
        var $form = $(form).ajaxSubmit();
        console.log($(form).parent())
        submit_handler($form, $(form).parent().children(".email_server_responce") );
      }
    });
  }

  /* Ajax, Server response */ 
  var submit_handler =  function (form, wrapper){

    var $wrapper = $(wrapper); //this class should be set in HTML code
    
    $wrapper.css("display","block");
    var data = {
      action: "email_server_responce",
      values: $(form).serialize()
    };
    //send data to server
    $.post("php/contacts-process.php", data, function(s_response) {
      s_response = $.parseJSON(s_response);
      if(s_response.info == 'success'){
        $wrapper.addClass("message message-success").append("<div class='info-boxes confirmation-message' id='feedback-form-success'><div class='info-box-icon'><i class='fa fa-check'></i></div><strong>Success!</strong><br>Your message was successfully delivered.</div>");
        $wrapper.delay(5000).hide(500, function(){
          $(this).removeClass("message message-success").text("").fadeIn(500);
          $wrapper.css("display","none");
        });
        $(form)[0].reset(); 
      } else { 
        $wrapper.addClass("message message-error").append("<div class='info-boxes error-message'><div class='info-box-icon'><i class='fa fa-times'></i></div><strong>Error Box</strong><br>Server fail! Please try again later!</div>");
        $wrapper.delay(5000).hide(500, function(){
          $(this).removeClass("message message-success").text("").fadeIn(500);
          $wrapper.css("display","none");
        });
      }
    });
  return false;
  }

  /**/
  /*Twitter*/
  /**/
  if ($('.latest-tweets').length) {
    $('.latest-tweets').tweet({
      username: 'Creative_WS',
      count: 2,
      loading_text: 'loading twitter feed...',
      template: "<li><div class='pic'><i class='fa fa-twitter'></i></div><p><a href='{user_url}'>@{screen_name}</a>{join}{text}<br>{time}</p></li>"
      
    });
  };
});
sticky_menu_width ();
function sticky_menu_width () {
    var width_sticky = $(".sticky").parent().innerWidth();
  $("head .width-sticky").remove();
  $("head").append("<style class='width-sticky'>.page-boxed .sticky{width:"+width_sticky+"px; margin: 0 auto;}</style>")
}
/**/
/*isotope*/
/**/
$( function() {
  $('.isotope').isotope({
    itemSelector: '.isotope .item',
    masonry: {
    }
  });

});

$(window).load(function() {
  /**/
  /* parallax */
  /**/
  $('.parallaxed').parallax();

  /**/
  /* menu position */
  /**/
  menuPos();

  $(".page-title").css('display','block')
  $('.sl-text-content p').addClass('matrix')
  /* ISOTOP  load */
  /**/
  var $container = $('.isotope');
  // init
  $container.isotope({
    // options
    itemSelector: '.item',
  });

  // filter isotope on initalise
  if(jQuery('.portfolio-filter a.active').length){
      var selector = jQuery('.portfolio-filter a.active').attr('data-filter');
      $container.isotope({ filter: selector });
  }

  $('.portfolio .portfolio-filter').on('click', 'a', function() {   
    $('.portfolio .isotope').isotope(
    {
      filter: $(this).data('filter')
    });
    $(this).addClass('active').siblings().removeClass('active');    
    
    return false;
  });
});

$(window).resize(function()
{
  var winWidth = jQuery(window).width();
  var winHeight = jQuery(window).height();
  //sticky
  sticky();
  mobileMainMenu();
  if ($("body").hasClass("page-boxed")) {
    sticky_menu_width();
  }

  $('.isotope').isotope({
    masonry: {}
  });
  /**/
  /* parallax */
  /**/
  $('.parallaxed').parallax();
});
/**/
/* counter */
/**/
var is_count = true
function counter(){
  if($(".counter").length) {
      var winScr = $(window).scrollTop()
      var winHeight = $(window).height()
      var ofs = $('.counter').offset().top

      if ( (winScr+winHeight)>ofs && is_count) {
        $(".counter").each(function () {
          var atr = $(this).attr('data-count');
          var item = $(this);
          var n = atr;
          var d = 0;
          var c;
         
          $(item).text(d);
          var interval = setInterval(function() {
            c = atr/30;
            d+=c;
            if ( (atr-d)<c) {
              d=atr;
            }
            $(item).text(Math.floor(d) );

          if (d==atr) {
            clearInterval(interval);
          }
        },30);
      });
      is_count = false;
    }
  }
}

/**/
/* test */
/**/
function move_gradient() {
  $('.picture').each( function (){
  	$(this).mousemove(function(e){
  	e.stopPropagation();

  	$(this).addClass('active');
    // position of element
    var pos = $(this).offset();
    var elem_left = pos.left;
    var elem_top = pos.top;
    // position of cursor inside
    var Xinner = e.pageX - elem_left;
    var Yinner = e.pageY - elem_top;
     
    $('.grad').css({'transform': 'matrix(1, 0, 0, 1,'+Xinner+','+ Yinner})
  })});
  $('.picture').mouseout(function(e){
  	e.stopPropagation();
  	$('.picture').removeClass('active');
  })
}