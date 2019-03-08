var pos = 0;
var bike = document.getElemnetById("bike");
var t = setInterval(move, 10);

function move() {
  if(pos >= 62.5) {
    clearInterval(t);
  }
  else {
    pos += 1;
    bike.left = pos + "px";
  }
}
