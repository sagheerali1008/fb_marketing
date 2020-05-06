$(document).ready(function(){
  $("#campaign_form").validate({
    rules: {
      'campaign[name]': {
        required: true
      },
      'campaign[objective]': {
        required: true
      },
      'campaign[status]': {
        required: true
      },
      'campaign[buying_type]': {
        required: true
      },
      'campaign[campaign_id]': {
        required: true
      },
      'campaign[daily_budget]': {
        required: true,
        number: true
      }
    },
    messages: {
      'campaign[name]': {
        required: "Please enter campaign name"
      },
      'campaign[objective]': {
        required: "Please enter email address"
      },
      'campaign[status]': {
        required: "Please enter email address"
      },
      'campaign[buying_type]': {
        required: "Please enter email address"
      },
      'campaign[campaign_id]': {
        required: "Please enter email address"
      },
      'campaign[daily_budget]': {
        required: "Please enter daily budget",
        number: "Daily budget must be number"
      }
    }
  });

  $('.btn-submit-campaign').click(function() {  
    if ($("form[id='campaign-form']").valid()) {
    }
  });
});