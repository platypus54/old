
var grabResponse = document.querySelector("#choice");
var removeCanvas = document.querySelector("#pie1");

// player object
var player1 = new Player(selection());
var computer = new Player("Master Foo");


player1.setPlayerName("displayPlayer");
grabResponse.addEventListener('click',playGame)

function playGame(e)
{

  var choice = document.querySelectorAll('input');

  document.querySelector("#error").textContent = "";

  if(checkTheBoxes(choice) > 1)
  {
    return ((document.querySelector("#error")).textContent = "Error::choose 1");
  }
  else
  {
      for(var i = 0; i < (choice.length - 1); i++)
      {
          if(choice[i].checked)
          {
            chooseImage(choice[i].value);
          }
      }
    }

  rps(player1,computer);

  genTable(player1, computer);

  removeAllChildNodes(removeCanvas);


  $(document).ready(function()
  {
        var player_count = Number(player1.wins);
        var player_name = String(player1.first)

        var computer_count = Number(computer.wins);

        var plot1 = $.jqplot('pie1', [[ [player_name, player_count],['Master Foo',computer_count] ]], {

          gridPadding:
          {
            top:0, bottom:38, left:0, right:0
          },

          seriesDefaults:
          {
              renderer:$.jqplot.PieRenderer,
              trendline:{ show:false },
              rendererOptions: { padding: 8, showDataLabels: true }
          },

          legend:
          {
              show:true,
              placement: 'outside',
              rendererOptions: {
                  numberRows: 1
              },
              location:'l',
              marginTop: '15px'
          }
      });
  });

}

function checkTheBoxes(element)
{
		var item = 0;
    var i = 0

    do{
      if(element[i].checked)
      {
          item++;
      }
      i++
    } while (i < element.length);

		return item;
}

function chooseImage(value)
{
  var images = ["paper.png", "rock1.png","scissors.png"];

  switch (value)
  {
    case "R":
        document.querySelector("#player_image").src = "images/"+ images[1];
        document.querySelector("#player_image").value = "R";
      break;
    case "S":
        document.querySelector("#player_image").src = "images/"+ images[2];
        document.querySelector("#player_image").value =  "S";
      break;
    case "P":
        document.querySelector("#player_image").src = "images/"+ images[0];
        document.querySelector("#player_image").value = "P";
      break;
  }
  genComputer(images);
}


function genComputer(array)
{
  var number = Math.floor(Math.random()*3);
  var value = ["P","R","S"];

  document.querySelector("#computer_image").src = "images/"+ array[number];
  document.querySelector("#computer_image").value = value[number];
}

function removeAllChildNodes(parent)
{
    while (parent.firstChild)
    {
        parent.removeChild(parent.firstChild);
    }
}
