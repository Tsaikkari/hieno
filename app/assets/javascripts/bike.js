window.onload = function() {
  var pos = 0;
  var bike = document.getElementById("bike");
  var t = setInterval(move, 3);
  
  function move() {
    if (bike) {
      if (pos >= screen.width * 0.65) {
        clearInterval(t)
      }
    
      else {
        pos += 1;
        bike.style.left = pos + "px";
      }
    }
  }
  };
  