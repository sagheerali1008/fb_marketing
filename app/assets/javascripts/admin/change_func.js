$(document).ready(function () {
  $('#result').text($("#source").val());
  const $source = document.querySelector('#source');
  const $result = document.querySelector('#result');
  const typeHandler = function(e) {
    $result.innerHTML = e.target.value;    
  }
  $source.addEventListener('input', typeHandler) // register for oninput
  $source.addEventListener('propertychange', typeHandler) 
});