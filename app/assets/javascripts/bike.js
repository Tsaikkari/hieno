window.onload = function() {
var pos = 0;
var bike = document.getElementById("bike");
var t = setInterval(move, 10);

function move() {
  if (pos >= 937) {
    clearInterval(t)
  }

  else {
    pos += 1;
    bike.style.left = pos + "px";
  }
}
};
