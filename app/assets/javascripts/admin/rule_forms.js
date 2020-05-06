$(document).ready(function(){
  $("#rules_form").validate({
    rules: {
      'rule[name]': {
        required: true
      },
      'rule[filter_value]': {
        required: true,
        number: true
      },
      'rule[status]': {
        required: true
      },
      'rule[insight]': {
        required: true
      },
      'rule[value]': {
        required: true,
        number: true
      },
      'rule[attribution_window]': {
        required: true
      },
      'rule[operator]': {
        required: true
      },
      'rule[time_preset]': {
        required: true
      },
      'rule[filter_operation]': {
        required: true
      },
      'rule[filter_field]': {
        required: true
      },
      'rule[evaluation_spec]': {
        required: true
      },
      'rule[schedule_spec]': {
        required: true
      },
      'rule[evaluation_type]': {
        required: true
      },
      'rule[entity_type]': {
        required: true
      }
    },
    messages: {
      'rule[name]': {
       required: "Please enter Rule name"
      },
      'rule[filter_value]': {
       required: "Please enter value",
       number: "please enter digit only"
      },
      'rule[value]': {
       required: "Please enter value",
       number: "please enter digit only"
      },
      'rule[filter_operation]': {
       required: "Please select filter operation"
      },
      'rule[operator]': {
       required: "Please select operator"
      },
      'rule[time_preset]': {
       required: "Please select time preset"
      },
      'rule[attribution_window]': {
       required: "Please select attribution_window"
      },
      'rule[filter_field]': {
       required: "Please select filter field"
      },
      'rule[insight]': {
       required: "Please select insight"
      },
      'rule[evaluation_spec]': {
       required: "Please select evaluation spec"
      },
      'rule[entity_type]': {
       required: "Please select entity type"
      },
      'rule[schedule_spec]': {
       required: "Please select schedule spec"
      },
      'rule[evaluation_type]': {
       required: "Please select evaluation type"
      },
      'rule[status]': {
       required: "Please select status"
      }
    }
  });

  $('.btn-submit-rules').click(function() {  
    if ($("form[id='rules_form']").valid()) {
    }
  });
});


