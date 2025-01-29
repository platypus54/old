var grabResponse = document.querySelector("#play");

grabResponse.addEventListener('click',loadGame)

function loadGame(e)
{
  if(document.querySelector("#logon_value").value == "yes")
    window.location.href = "../celestial/RockPaperScissors.html";
}
