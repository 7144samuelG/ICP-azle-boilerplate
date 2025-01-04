import Result "mo:base/Result";
import Text "mo:base/Text";
import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";


actor {
  type Voter={
    id:Principal;
    votersname:Text;
  };

  //define storages for voters
  let voters=HashMap.HashMap<Principal,Voter>(1,Principal.equal,Principal.hash);

  //register voters
public shared ({caller}) func register_voter(votersname:Text):async Result.Result<Text,Text>{

  //check if voter is already registered

  switch(voters.get(caller)){

    case (null){

      //register new voter

      let new_voter:Voter={
        id=caller;
        votersname;
      };

      //add new voter to voters storage

      voters.put(caller,new_voter);
      return #ok("voter registered");
    };
    case (?_found){
      return #err("already registered")
    }
  }
};

//check voters registered

public query func get_all_voters():async [Voter]{
   return Iter.toArray(voters.vals());
};

//deregister as a voter
public shared ({caller}) func dereister_voter():async Result.Result<Text,Text>{

  //check if voter is registered

  switch(voters.get(caller)){
    case (null){
      return #err("voters is not registered");
    };
    case (?_found){

      //deregister voter

      voters.delete(caller);
      return #ok("deregistered")
    };
  
}


}
}
