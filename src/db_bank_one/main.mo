import Debug "mo:base/Debug";

actor DBank {
  var name = "Jorge Ortiz";
  let age = 25;
  var number = 300;

  Debug.print(debug_show(name));
  Debug.print(debug_show(age));

  name := "Zaira Guevara";

  Debug.print(debug_show(name));

  public func topUp(amount: Nat) {
    number += amount;
    Debug.print(debug_show(number));
  };

  public func topDown(amount: Nat) {
    number -= amount;
    Debug.print(debug_show(number));
  };

  // topUp();
}

/* 

  We can declare functions as in the previous lines, and call them with topUp();
  We can do that in the console too: 
    * Run: dfx start.
    * Open a new console and run: dfx deploy.
    * Run: dfx canister call db_bank_one topUp.


  We can run these functions from the webroser:
    * Run: dfx canister id __Candid_UI
    * Go to http://127.0.0.1:8000/?canisterId=CANISTER_ID
    * Run: dfx canister id db_bank_one.
    * Insert that ID in the field shown.
  
*/