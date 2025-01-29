function rps(player_object, computer_object)
{
  var player = document.querySelector("#player_image").value;
  var computer = document.querySelector("#computer_image").value;
  var value = ["paper","rock","scissors"];


   if(player == value[0] && computer == value[1] ||
      player == value[1] && computer == value[2] ||
      player == value[2] && computer == value[0])
      {
          document.querySelector("#displayResults").textContent= "YOU WIN";
          player_object.incrementWin();
          computer_object.incrementLoss();
      }
    else if(player == computer)
    {
          document.querySelector("#displayResults").textContent = "TIE GAME";
          player_object.incrementTie();
    }
    else
    {
        document.querySelector("#displayResults").textContent = "YOU LOSE";
        player_object.incrementLoss();
        computer_object.incrementWin();
    }

}


// sets the player name;
function selection()
{
    return prompt("Enter a name for player1");
}

// Player Object
function Player(name)
{
    this.first = name.toUpperCase();
    this.wins = 0;
    this.loss = 0;
    this.tie = 0;

    this.setPlayerName = function(id)
    {
          (document.querySelector("#"+id)).textContent = this.first;
    }

    this.incrementWin = function()
    {
      this.wins++;
    }

    this.incrementLoss = function()
    {
      this.loss++;
    }

    this.incrementTie = function()
    {
      this.tie++;
    }

    this.toString = function()
    {
      var string = "<td>" + this.first + "</td>" +
                   "<td>" + this.wins + "</td>" +
                   "<td>" + this.loss + "</td>";

      return string;
    }
}


function genTable(player_object, computer_object)
{
  var players = [];
  var table = document.querySelector('#table_stats');
  var para = document.querySelector('#ties');

  console.log(para);

  players.push(player_object);
  players.push(computer_object);

  table.innerHTML= "<tr><th>Name</th>"+"<th>Wins</th>"+"<th>Loss</th></tr>"+
                    players[0] + "<tr>" + players[1] + "</tr>";

  para.textContent = "Ties:" + player_object.tie;

}
