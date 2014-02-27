$(document).ready(function () {
  var clockDateTime = $('.clock_ticker').attr('start-clock')
  var clockTime = Date.parse(clockDateTime);
  var currentTime = new Date(clockTime);
  var interval  = setInterval(function() {
    var t = $('.clock')
    
    var date = currentTime.getDate();
    var mnth = currentTime.getMonth();
    var year = currentTime.getFullYear();
    var secs = currentTime.getSeconds();
    var mins = currentTime.getMinutes();
    var hour = currentTime.getHours();
    
    if (secs < 10) secs = "0" + secs;
    if (mins < 10) mins = "0" + mins;
    if (hour < 10) hour = "0" + hrs;
    if (date < 10) date = "0" + date;
    if (mnth < 10) mnth = "0" + mnth;

    var txt = "Server UTC: " + date + "." + mnth + "." + year + " - " + hour + ":" + mins + ":" + secs + " -";
    t.html(txt);
  }, 1000);
});
