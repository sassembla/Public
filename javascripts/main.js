console.log('This would be the main JS file.');

var get_home_timeline = function(){
  twttr.anywhere(function(twitter) {
    twitter.User.current().homeTimeline().first(20).each(
        function(status) {
			alert("status	"+status);
             console.log(status.text);
        }
    );
  });
}

get_home_timeline();