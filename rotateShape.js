var c = document.getElementById('cv1').getContext('2d');
var w = c.canvas.width;
var h = c.canvas.height;

function Enemy(x, y, size, a, dx, dy, da){

  // location of the shape
  this.x = x;
  this.y = y;

  // how big the shape is
  this.size = size;

  // how far to rotate
  this.angle = a;

  // dx, dy, and da are how much the
  // position and anlge change every
  // time we move. These are also known
  // as position and angular velocities
    this.dx = dx;
    this.dy = dy;
    this.da = da;


  this.move = function(){

    this.angle += this.da;
    this.x += this.dx;
    this.y += this.dy;

    var s = this.size;

    if(this.x <  s / 2 ||
       this.x + s / 2 > w)
    {
      this.dx = -this.dx;
      this.da = -this.da;
    }

    if (this.y < s / 2 ||
       this.y + s / 2 > h)
  {
     this.dy = -this.dy;
     this.da = -this.da;
   }

  }

  this.draw = function(){

  c.save();

    var x = this.x;
    var y = this.y;
    var s = this.size;

    c.translate(x,y);
    c.rotate(this.angle * Math.PI / 180);
    c.fillStyle = "#" +randomColor()
    c.fillRect(-s / 2, -s / 2, s, s);
    c.restore();
  };
}

var e = new Enemy(Math.random()*255, 50, 50, 0, 1,1,4);
var cmTID;
var timeStep = 40;

function updateAll() {
  e.move();
  c.clearRect(0, 0, w, h);
  e.draw();
  clearTimeout(cmTID);
  cmTID = setTimeout(updateAll, timeStep);
}

updateAll();

function randomColor()
{
   var color = Math.floor(Math.random()*2556);

   console.log(color);

   return color;
}
