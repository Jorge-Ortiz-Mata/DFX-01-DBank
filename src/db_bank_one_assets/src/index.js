import { db_bank_one } from "../../declarations/db_bank_one";

window.addEventListener("load", async () => {
  getValueNumber();
});

document.querySelector("form").addEventListener("submit", async (event) => {
  event.preventDefault();

  const button = event.target.querySelector("#submit-btn");

  const inputAmount = parseFloat(document.getElementById("input-amount").value);
  const outputAmount = parseFloat(document.getElementById("output-amount").value);

  button.setAttribute("disabled", true);

  if(inputAmount){
    await db_bank_one.topUp(inputAmount);
  } else if(outputAmount) {
    await db_bank_one.topDown(outputAmount);
  }

  // await db_bank_one.compound();

  getValueNumber();
  document.getElementById("input-amount").value = "";
  document.getElementById("output-amount").value = "";
  button.removeAttribute("disabled");
});

async function getValueNumber(){
  const value = await db_bank_one.getNumber();
  document.getElementById("value").innerHTML = Number(value).toFixed(2);  
};
