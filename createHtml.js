

genHtml();

function genHtml()
{
  header1();
  create_Form();
  createCanvas();
}


function create_Form()
{
  var form = document.createElement('form');
  var input = document.createElement('input');
  var input_Submit = document.createElement('input')

  input.setAttribute("type", "text");
  input.id = "logon_value"

  input_Submit.id = "play"
  input.setAttribute("value","")
  input_Submit.setAttribute("type","button");
  input_Submit.setAttribute("value","Play?");
  input.style.position = "fixed";
  input_Submit.style.position = "fixed";
  input_Submit.style.left = "160px";


  document.body.appendChild(input);
  document.body.appendChild(input_Submit);
}


function header1()
{
  var h1 = document.createElement('h1');
  document.body.appendChild(h1);

  h1.textContent = "Would you like to play Rock Paper Scissors?"
}

function createCanvas()
{
  var cv1 = document.createElement('canvas');
  cv1.id = "cv1";
  cv1.style.height = "500px";
  cv1.style.width = "500px";
  document.body.appendChild(cv1);
}
