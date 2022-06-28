import Debug "mo:base/Debug";

actor DBank {
  var number = 100;
  var name = "Jorge Ortiz";
  let age = 25;
  let email = "jorge.ortiz@email.com";

  Debug.print(debug_show(name));
  Debug.print(debug_show(age));
  Debug.print(debug_show(email));
  Debug.print(debug_show(number));

  name := "Zaira Guevara";

  Debug.print(debug_show(name));
}