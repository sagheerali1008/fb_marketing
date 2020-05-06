$(document).ready(function () {
$('#title2').hide();
$('.NextButton1').hide();
$('#title3').hide();
$('.TriggerSettingsContainer').hide();
$('.form1').hide();
$('.back1').hide();

  $('#location').click(function () {
    $('#SelectEventStep').hide();
    $('.RecentEventsDescriptionCardGrid').show();
    $('#title1').hide();
    $('#title2').show();
    $('#title3').hide();
    $('.TriggerSettingsContainer').show();
    $('.form1').hide();
    $('.NextButton1').show();
    $('.NextButton').hide();
    $('.back1').show();
    $('.back').hide();
  });

  $('.abc').click(function () {
    $('#SelectEventStep').hide();
    $('.RecentEventsDescriptionCardGrid').show();
    $('#title1').hide();
    $('#title2').show();
    $('#title3').hide();
    $('.TriggerSettingsContainer').show();
    $('.form1').hide();
    $('.NextButton1').show();
    $('.NextButton').hide();
    $('.back1').show();
    $('.back').hide();
  });

  $('.xyz').click(function () {
    $('#SelectEventStep').hide();
    $('#title1').hide();
    $('#title2').hide();
    $('#title3').show();
    $('.form1').show();
    $('.TriggerSettingsContainer').hide();
    $('.back').show();
    $('.back1').hide();  
  });
  
  $('#pqr').click(function () {
    $('#SelectEventStep').show();
    $('#title1').show();
    $('#title2').hide();
    $('#title3').hide();
    $('.form1').hide();
    $('.NextButton1').hide();
    $('.NextButton').show();
    $('.TriggerSettingsContainer').hide();
    $('.back').show();
    $('.back1').hide();

  });
  $('.back1').click(function () {
    $('#SelectEventStep').show();
    $('#title1').show();
    $('#title2').hide();
    $('#title3').hide();
    $('.form1').hide();
    $('.NextButton').show();
    $('.NextButton1').hide();
    $('.TriggerSettingsContainer').hide();
    $('.back').hide();
    $('.back1').show();  
  });

  $('.back').click(function () {
    $('#SelectEventStep').hide();
    $('.RecentEventsDescriptionCardGrid').show();
    $('#title1').hide();
    $('#title2').show();
    $('#title3').hide();
    $('.TriggerSettingsContainer').show();
    $('.form1').hide();
    $('.NextButton1').show();
    $('.NextButton').hide();
    $('.back1').show();
    $('.back').hide();   
  });

  $('.NextButton').click(function () {
    $('#SelectEventStep').hide();
    $('.NextButton').hide();
    $('.NextButton1').show();
    $('.RecentEventsDescriptionCardGrid').show();
    $('#title1').hide();
    $('#title2').show();
    $('#title3').hide();
    $('.TriggerSettingsContainer').show();
    $('.form1').hide();
  }); 

  $('.NextButton1').click(function () {
    $('#SelectEventStep').hide();
    $('#title1').hide();
    $('#title2').hide();
    $('#title3').show();
    $('.form1').show();
    $('.TriggerSettingsContainer').hide();
  });

  $('.Edit').click(function () {
    $('.hide-show').toggle();
  });

  $('.RecentEventCardGrid').click(function () {
    $('#SelectEventStep').hide();
    $('#title1').hide();
    $('#title2').show();
    $('#title3').hide();
    $('.form1').hide();
    $('.TriggerSettingsContainer').show();  
  });

  //only number allow in textfield jquery. 
  $(function(){

  $('#source').keypress(function(e) {
  if(isNaN(this.value+""+String.fromCharCode(e.charCode))) return false;
  })

  .on("cut copy paste",function(e){
  e.preventDefault();
  });

 });

  const $source1 = document.querySelector('#source1');
  const $result1 = document.querySelector('#result1');
  const typeHandler = function(e) {
    $result1.innerHTML = e.target.value;
  }

  $source1.addEventListener('input', typeHandler) // register for oninput
  $source1.addEventListener('propertychange', typeHandler)  
  $("#result1").text($("#source1").val());
});