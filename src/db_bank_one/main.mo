import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
 
  stable var number: Float = 300;

  stable var startTime = Time.now();

  public func topUp(amount: Float) {
    number += amount;
    Debug.print(debug_show(number));
  };

  public func topDown(amount: Float) {
    let tempValue: Float = number - amount;
    if (tempValue >= 0){ 
      number -= amount;
      Debug.print(debug_show(number));
    } else {
      Debug.print("Hey, the result is not a natural value.");
    }
  };

  public query func getNumber(): async Float {
    return number;
  };

  public func compound(){
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedNSNew = timeElapsedNS / 1000000000;
    number := number * (1.01 ** Float.fromInt(timeElapsedNSNew));
    startTime := currentTime;
  };
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

  It shows an error once the value is under 0, so, we added an IF-ELSE
  statment in order to not make the application fail.
  Besides, we don't need to add 'debug_show' in order to show 
  messages.

  Query method is declared in order to get some data. 

  The 'stable' keyword means that the value of an variable will persist 
  even if you restart the program or the server.
  
*/