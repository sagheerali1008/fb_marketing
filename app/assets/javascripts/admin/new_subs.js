function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}

$(document).ready(function(){
  var values = [49, 79, 99, 149,379,529,849,1299,1699,2150,2699,2999,4199,4999,6499,7799,9200,11000];
  var input = document.getElementById('input'),
  output00 = document.getElementById('output00'),
  output000 = document.getElementById('output000'),
  output0000 = document.getElementById('output0000'),
  output = document.getElementById('output');

  $('#output').text(values[$("#input").val() - 1])
  $('#output00').text(values[$("#input").val() - 1])
  $('#output000').text(values[$("#input").val() - 1])
  $('#output0000').text(values[$("#input").val() - 1])

  $('#input').change(function(){
    $('#my_score').val(values[this.value - 1])
    output00.innerHTML = values[this.value - 1];
    output000.innerHTML = values[this.value - 1];
    output0000.innerHTML = values[this.value-1];
    output.innerHTML = values[this.value - 1];
  });

  $('.subscription_type').click(function(){

    plan = $(this).text();
    $('#plann-name').val(plan);
  });

  $("#agree-checkbox").change(function(){
    if($('#agree-checkbox').is(":checked")){
      if($("#output0000").text() !== ""){
        $('#upgrade-btn').prop('disabled', false);
      }
    }else{
      $('#upgrade-btn').prop('disabled', true);
    }
  })

  $("#upgrade-btn").click(function(){
    totalAmount = $("#output0000")[0].innerText;
    $('#total_amt_id').text(totalAmount);
    paypal_amt = $("#total_amt_id").text();
    plann_details = $('#plann-name').val();
  });
}); 

$(document).ready(function(){
  var values = [39, 63, 79, 119,299,423,679,1039,1459,1720,2159,2399,3359,3999,5199,6239,7360,8800];
  var input = document.getElementById('input22'),
  output6 = document.getElementById('output6'),
  output7 = document.getElementById('output7'),
  output20 = document.getElementById('output20'),
  output = document.getElementById('output22');

  $('#output6').text(values[$("#input22").val() - 1]*12)
  $('#output7').text(values[$("#input22").val() - 1]*12)
  $('#output20').text(values[$("#input22").val() - 1]*12)
  $('#output22').text(values[$("#input22").val() - 1])

  $('#input22').change(function(){
    $('#my_score22').val(values[this.value - 1])
    output6.innerHTML = values[this.value - 1]*12;
    output7.innerHTML = values[this.value - 1]*12;
    output20.innerHTML = values[this.value - 1]*12;
    output.innerHTML = values[this.value - 1];
  });

  $('.subscription_type').click(function(){
    plan = $(this).text();
    $('#plann-name').val(plan);
  });

  $("#agree-checkbox-1").change(function(){

    if($('#agree-checkbox-1').is(":checked")){

      if($("#output20").text() !== ""){
        $('#upgrade-btn-1').prop('disabled', false);
      }
    }else{
      $('#upgrade-btn-1').prop('disabled', true);
    }
  });
  $("#upgrade-btn-1").click(function(){
    totalAmount = $("#output20").text();
    $('#total_amt_id-1').text(totalAmount);
    paypal_amt = $("#total_amt_id-1").text();
    plann_details = $('#plann-name').val();
  });
}); 

$(document).ready(function(){
  var values = [44, 71, 89, 134,339,476,764,1169,1529,1935,2429,2699,3779,4499,5849,7019,8280,9900];
  var input = document.getElementById('input11'),
  output9 = document.getElementById('output9'),
  output10 = document.getElementById('output10'),
  output21 = document.getElementById('output21'),
  output = document.getElementById('output11');

  $('#output9').text(values[$("#input11").val() - 1]*3)
  $('#output10').text(values[$("#input11").val() - 1]*3)
  $('#output21').text(values[$("#input11").val() - 1]*3)
  $('#output11').text(values[$("#input11").val() - 1])

  $('#input11').change(function(){
    $('#my_score11').val(values[this.value - 1])
    output9.innerHTML = values[this.value - 1]*3;
    output10.innerHTML = values[this.value - 1]*3;
    output21.innerHTML = values[this.value - 1]*3;
    output.innerHTML = values[this.value - 1];
  });

  $('.subscription_type').click(function(){
    plan = $(this).text();
    $('#plann-name').val(plan);
  });

  $("#agree-checkbox-2").change(function(){
    
    if($('#agree-checkbox-2').is(":checked")){
      
      if($("#output21").text() !== ""){
        
        $('#upgrade-btn-2').prop('disabled', false);
      }
    }else{
      $('#upgrade-btn-2').prop('disabled', true);
    }
  });

  $("#upgrade-btn-2").click(function(){
    totalAmount = $("#output21").text();
    $('#total_amt_id-2').text(totalAmount);
    paypal_amt = $("#total_amt_id-2").text();
    plann_details = $('#plann-name').val();
  });

  $("#subscribe-btn").click(function(){
    paypal.Buttons({
      style: {
        size: 'small',
        color:  'blue',
        shape:  'pill',
        label:  'pay',
        layout: 'horizontal',
        height: 25
      },
      createOrder: function(data, actions) {
        // This function sets up the details of the transaction, including the amount and line item details.
        return actions.order.create({
          purchase_units: [{
            amount: {
              value: paypal_amt
            }
          }]
        });
      },

      onApprove: function(data, actions) {
        return actions.order.capture().then(function(details) {
          
          $('#all-modals #paymentModal-1').modal('hide');

          alert('Transaction completed by ' + details.payer.name.given_name );

          // Call your server to save the transaction
          return fetch('/payment_complete', {
            method: 'post',
            headers: {
              'content-type': 'application/json'
            },
            body: JSON.stringify({
             data: {orderID: data.orderID, terms_and_conditions :true,
              paypal_amt: paypal_amt, plann_details: plann_details}
            })
          });
        });
      }
    }).render('.pay-pal-btn');
    $(this).hide();
  });

  $("#subscribe-btn-1").click(function(){
    paypal.Buttons({
      style: {
        size: 'small',
        color:  'blue',
        shape:  'pill',
        label:  'pay',
        layout: 'horizontal',
        height: 25
      },
      createOrder: function(data, actions) {
        // This function sets up the details of the transaction, including the amount and line item details.
        return actions.order.create({
          purchase_units: [{
            amount: {
              value: paypal_amt
            }
          }]
        });
      },

      onApprove: function(data, actions) {
        return actions.order.capture().then(function(details) {

          $('#all-modals #paymentModal-2').modal('hide');
          alert('Transaction completed by ' + details.payer.name.given_name );
          // Call your server to save the transaction
          return fetch('/payment_complete', {
            method: 'post',
            headers: {
              'content-type': 'application/json'
            },
            body: JSON.stringify({
              data: {orderID: data.orderID, terms_and_conditions :true,
              paypal_amt: paypal_amt, plann_details: plann_details}
            })
          });
        });
      }
    }).render('.pay-pal-btn-1');
    $(this).hide();
  });

  $("#subscribe-btn-2").click(function(){
    paypal.Buttons({
      style: {
        size: 'small',
        color:  'blue',
        shape:  'pill',
        label:  'pay',
        layout: 'horizontal',
        height: 25
      },
      createOrder: function(data, actions) {
        // This function sets up the details of the transaction, including the amount and line item details.
        return actions.order.create({
          purchase_units: [{
            amount: {
              value: paypal_amt
            }
          }]
        });
      },

      onApprove: function(data, actions) {
        return actions.order.capture().then(function(details) {       
          $('#all-modals #paymentModal-3').modal('hide');

          alert('Transaction completed by ' + details.payer.name.given_name );
          // Call your server to save the transaction
          return fetch('/payment_complete', {
            method: 'post',
            headers: {
              'content-type': 'application/json'
            },
            body: JSON.stringify({
             data: {orderID: data.orderID, terms_and_conditions :true,
              paypal_amt: paypal_amt, plann_details: plann_details}
            })
          });
        });
      }
    }).render('.pay-pal-btn-2');
    $(this).hide();
  });
});