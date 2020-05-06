function statusChangeCallback(response) {
  console.log('running statusChangeCallback');
  console.log(response.status)
  if (response.status === 'connected') { 
    accessToken = response.authResponse.accessToken;
    userID = response.authResponse.userID;
    $.ajax({
      type:'GET',
      async: true,
      url: "/welcome/set_business/",
      data: { access_token: accessToken, user_id: userID },
      success:function(response){
        console.log("success");
      }
    });
    document.getElementById('status').innerHTML = 'connected!';
    document.getElementById('facebook-btn').style.display = "none";
    document.getElementById('business-btn').style.display = "block";
    FB.api('/me', function(response) {
      console.log('Successful login for: ' + response.name);
      document.getElementById('status').innerHTML =
      'Thanks for logging in, ' + response.name + '!';
    });
  }
  else {
    document.getElementById('status').innerHTML = 'Please log ' +
    'into Brainio.';
  }
  console.log(response);
}

window.fbAsyncInit = function() {
  FB.init({
    appId            : '1167856626751020',
    autoLogAppEvents : true,
    xfbml            : true,
    version          : 'v5.0'
  });
  FB.getLoginStatus(function(response) {
  statusChangeCallback(response);
  });
};

(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "https://connect.facebook.net/en_US/sdk.js";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));