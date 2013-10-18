$(document).ready(function (r) {
  var eventDateTime = $('.time_ticker').attr('dt-start-event'+r)
  var matchTime = Date.parse(eventDateTime);
  var currentTime = new Date();
  var untilMatch = (matchTime - currentTime)/1000;

  var interval = setInterval(function() {
    var ticker = $('.dt_until_event'+r)
    if (untilMatch <= 0) {
      ticker.html("Betting Closed!");
      clearInterval(interval);
      return;
    }            
    var c1 = "d, "
    var c2 = ":"
    var c3 = ":"
    var days = Math.floor(( untilMatch / 86400 ));
    if (days < 10) days = "0" + days;
    if (days == 0) {days = ""; c1=""}
    var hours = Math.floor((untilMatch % 86400)/3600);
    if (hours < 10) hours = "0" + hours;
    if (hours == 0) {hours = ""; c2=""}
    var minutes = Math.floor((untilMatch % 3600)/60);
    if (minutes < 10) minutes = "0" + minutes;
    if (minutes == 0) {minutes = ""; c3=""}
    var seconds = Math.floor((untilMatch % 3600) % 60);
    if (seconds < 10) seconds= "0" + seconds; 
    var text =  "Event begins in: " + days + c1 + hours + c2 + minutes + c3 + seconds;
    ticker.html(text);
    untilMatch--;
  }, 1000);
});
