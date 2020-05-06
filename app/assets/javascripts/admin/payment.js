$(document).ready(function(){

  $("#save-details-btn-1").click(function(){
    var a = $("#your-name-1").val();
    var b = $("#company-name-1").val();
    var c = $("#work-email-1").val();
    var d = $("#address-1").val();
    var e = $("#city-1").val();
    var f = $("#country-1").val();
    var g = $("#post-zip-code-1").val();
    var h = $("#state-province-region-1").val();
    var i = $("#tax-id-1").val();

    if(!a == ''){
      $("#one-1").html(a);
    }
    else{
     $("#one-1").html(a);
    }
    if(!b == ''){
      $("#two-1").html(b);
    }
    else{
      $("#two-1").html(b);
    }
    if(!c == ''){
      $("#three-1").html(c);
    }
    else{
      $("#three-1").html(c);
    }
    if(!d == ''){
      $("#four-1").html(d);
    }
    else{
      $("#four-1").html(d);
    }
    if(!e == ''){
      $("#five-1").html(e);
    }
    else{
      $("#five-1").html(e);
    }
    if(!f == ''){
      $("#six-1").html(f);
    }
    else{
      $("#six-1").html(f); 
    }
    if(!g == ''){
      $("#seven-1").html(g);
    }
    else{
      $("#seven-1").html(g);
    }
    if(!h == ''){
      $("#eight-1").html(h);
    }
    else{
      $("#eight-1").html(h);
    }
    if(!i == ''){
      $("#nine-1").html(i);
    }
    else{
      $("#nine-1").html(i);
    }

    if (!a == "" || !b == "" || !c == "" || !d == "" || !e == "" || !f == "" || !g == "" || !h == ""|| !i == "") {

      $("#details-label-1").hide();
      $("#user-details-1").text("Edit Details");
    }
    else {
      
      $("#details-label-1").show();
      $("#user-details-1").text("Add Contact Details");
    }

    $("#userdetailsModal-1").modal('hide');
  });

  $('#user-details-1').click(function(){
    $('#all-modals #userdetailsModal-1').modal('show');
  });
  
  $('#card-details').click(function() {
    $('#all-modals #carddetailsModal-1').modal('show');
  });

});

$(document).ready(function(){

  $("#save-details-btn-2").click(function(){
    var a = $("#your-name-2").val();
    var b = $("#company-name-2").val();
    var c = $("#work-email-2").val();
    var d = $("#address-2").val();
    var e = $("#city-2").val();
    var f = $("#country-2").val();
    var g = $("#post-zip-code-2").val();
    var h = $("#state-province-region-2").val();
    var i = $("#tax-id-2").val();

    if(!a == ''){
      $("#one-2").html(a);
    }
    else{
     $("#one-2").html(a);
    }
    if(!b == ''){
      $("#two-2").html(b);
    }
    else{
      $("#two-2").html(b);
    }
    if(!c == ''){
      $("#three-2").html(c);
    }
    else{
      $("#three-2").html(c);
    }
    if(!d == ''){
      $("#four-2").html(d);
    }
    else{
      $("#four-2").html(d);
    }
    if(!e == ''){
      $("#five-2").html(e);
    }
    else{
      $("#five-2").html(e);
    }
    if(!f == ''){
      $("#six-2").html(f);
    }
    else{
      $("#six-2").html(f);
    }
    if(!g == ''){
      $("#seven-2").html(g);
    }
    else{
      $("#seven-2").html(g);
    }
    if(!h == ''){
      $("#eight-2").html(h);
    }
    else{
      $("#eight-2").html(h);
    }
    if(!i == ''){
      $("#nine-2").html(i);
    }
    else{
      $("#nine-2").html(i); 
    }

    if (!a == "" || !b == "" || !c == "" || !d == "" || !e == "" || !f == "" || !g == "" || !h == ""|| !i == "") {

      $("#details-label-2").hide();
      $("#user-details-2").text("Edit Details");
    }
    else {

      $("#details-label-2").show();
      $("#user-details-2").text("Add Contact Details");
    }

    $("#userdetailsModal-2").modal('hide');
  });

  $('#user-details-2').click(function(){
    $('#all-modals #userdetailsModal-2').modal('show');
  });
  $('#card-details2').click(function() {
    $('#all-modals #carddetailsModal-2').modal('show');
  });
});

$(document).ready(function(){

  $("#save-details-btn-3").click(function(){
    var a = $("#your-name-3").val();
    var b = $("#company-name-3").val();
    var c = $("#work-email-3").val();
    var d = $("#address-3").val();
    var e = $("#city-3").val();
    var f = $("#country-3").val();
    var g = $("#post-zip-code-3").val();
    var h = $("#state-province-region-3").val();
    var i = $("#tax-id-3").val();

    if(!a == ''){
      $("#one-3").html(a);
    }
    else{
     $("#one-3").html(a); 
    }
    if(!b == ''){
      $("#two-3").html(b);
    }
    else{
      $("#two-3").html(b);
    }
    if(!c == ''){
      $("#three-3").html(c);
    }
    else{
      $("#three-3").html(c);
    }
    if(!d == ''){
      $("#four-3").html(d);
    }
    else{
      $("#four-3").html(d);
    }
    if(!e == ''){
      $("#five-3").html(e);
    }
    else{
      $("#five-3").html(e);
    }
    if(!f == ''){
      $("#six-3").html(f);
    }
    else{
      $("#six-3").html(f);
    }
    if(!g == ''){
      $("#seven-3").html(g);
    }
    else{
      $("#seven-3").html(g);
    }
    if(!h == ''){
      $("#eight-3").html(h);
    }
    else{
      $("#eight-3").html(h);
    }
    if(!i == ''){
      $("#nine-3").html(i);
    }
    else{
      $("#nine-3").html(i);
    }

    if (!a == "" || !b == "" || !c == "" || !d == "" || !e == "" || !f == "" || !g == "" || !h == ""|| !i == "") {

      $("#details-label-3").hide();
      $("#user-details-3").text("Edit Details");
    }
    else {

      $("#details-label-3").show();
      $("#user-details-3").text("Add Contact Details");
    }

    $("#userdetailsModal-3").modal('hide');
  });

  $('#user-details-3').click(function(){
    $('#all-modals #userdetailsModal-3').modal('show');
  });
  $('#card-details-3').click(function() {
    $('#all-modals #carddetailsModal-3').modal('show');
  });
});