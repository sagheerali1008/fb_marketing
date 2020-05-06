(function($) {
  "use strict"

    // //basic slider
    let basicSlide = document.getElementById('basic-slider');
    noUiSlider.create(basicSlide, {
      start: [0, 2],
      step: 1,
      margin: 1,   
      connect: true,
      // tooltips: true,
      range: {
        'min': 0,
        'max': 20
      },
    //   pips: {
    //     mode: 'steps',
    //     stepped: true,
    //     density: 4
    // },
    pips: {
        mode: 'steps',
        density: 3,
        format: wNumb({
            decimals: 0,
            suffix: '%'
        })
    }
    });
    var paddingMin1 = document.getElementById('slider-padding-value-min1');
    var paddingMax1 = document.getElementById('slider-padding-value-max1');
    basicSlide.noUiSlider.on('update', function (values, handle) {
      if (handle) {
        // paddingMax1.innerHTML = " - "+parseInt(values[handle]);
        $("#audience_fb_custom_ratio").val(parseInt(values[handle])/100);            
      } else {
        // paddingMin1.innerHTML = parseInt(values[handle]);
        $("#audience_starting_ratio").val(parseInt(values[handle])/100);
      }
    });
    // //basic slider ^
    

  })(jQuery);