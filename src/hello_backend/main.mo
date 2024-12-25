import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Text "mo:base/Text";

actor {
  stable var anne_voters: Nat = 0;
  Debug.print(debug_show(anne_voters));

  stable var jenni_voters: Nat = 0;
  Debug.print(debug_show(jenni_voters));

  stable var mike_voters: Nat = 0;
  Debug.print(debug_show(mike_voters));

  stable var thomas_voters: Nat = 0;
  Debug.print(debug_show(thomas_voters));

  var start_time = Time.now();
  Debug.print(debug_show(start_time));

  public func add_voters(candidate: Text) {
    if(Text.equal(Text.toLowercase(candidate), Text.toLowercase("Anne"))) {anne_voters += 1};
    if(Text.equal(Text.toLowercase(candidate), Text.toLowercase("Jenni"))) {jenni_voters += 1};
    if(Text.equal(Text.toLowercase(candidate), Text.toLowercase("Mike"))) {mike_voters += 1};
    if(Text.equal(Text.toLowercase(candidate), Text.toLowercase("Thomas"))) {thomas_voters += 1};
  };

  public query func checkVoters(candidate: Text): async Nat {
    if(Text.equal(Text.toLowercase(candidate), Text.toLowercase("Anne"))) return anne_voters;
    if(Text.equal(Text.toLowercase(candidate), Text.toLowercase("Jenni"))) return jenni_voters;
    if(Text.equal(Text.toLowercase(candidate), Text.toLowercase("Mike"))) return mike_voters;
    if(Text.equal(Text.toLowercase(candidate), Text.toLowercase("Thomas"))) return thomas_voters;
    return 0;
  };
};
