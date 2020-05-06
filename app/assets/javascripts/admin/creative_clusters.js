// $(document).ready(function(){
  
  $("#create-creatives-btn").click(function(){
    $("#creative-clusters-div").hide();
    $("#creative-upload-div").show();
  });

  $("#back-btn").click(function(){
    $("#creative-upload-div").hide();
    $("#creative-clusters-div").show();
  });

  $(".ad_sets_div").hide();
  $("#check-all-campaigns").change(function(){
    $("#all-campaigns input:checkbox").prop('checked', $(this).prop("checked"));
  });

  $(".ad-set-dropdown").click(function(){
    $(".toggle-ad-sets").toggle();
  });
  
  function checkbox_function(obj, index_first, index_second){
    
    row_text_append =  $(obj).attr("row_text");
    col_frame_append = $("#frame_"+ index_second).attr("src");
    
    if($("#combination-checkbox_"+index_first +index_second).is(':checked'))
    {  
      $(".appended-ad").append("<div class='col-sm-3' id="+ index_first + index_second + "><p>" + row_text_append + "</p><iframe src=" + col_frame_append + " " + " width='200px' height='200px'></iframe></div>"); 
    }else{
      $("#"+index_first +index_second).remove();
    }
  }

  function creative_function(obj, index){
    var col_val = $(obj).attr("col-no");
    var row_text = $(obj).attr("row_text");
    var col_frame = $("#frame_"+ index).attr("src");

    if ($(obj).attr("col-no") == 2)   
    {
      $("#my-modal").modal("show");
      $("#ad-copy-text-row").html("<p>"+row_text+"</p><iframe src="+col_frame+" width='520px' height='450px'></iframe>");
    }else {
      $("#ad-copy-text-row").html("<p>"+row_text+"</p><iframe src="+col_frame+" width='520px' height='450px'></iframe>"); 
    }    
  }
  
  function ad_set_function(obj, index){
    $("#ad_set_" +index).toggle();
    $("#camp_" +index ).change(function(){
      $("#ad_set_"+index+" "+"input:checkbox").prop('checked', $(this).prop("checked"));
    });
  }
  $('[data-toggle="tooltip"]').tooltip();
// });