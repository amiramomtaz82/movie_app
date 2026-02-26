class UserDM{
  static  UserDM ?currentUser;
  String id;
  String name;
  String email;
String avatar;

  String phoneNumber;
  List<String> favouriteEvents;

  UserDM({required this.id,
    this.avatar="assets/images/Component 11 – 2.png"
    ,required this.email
    ,required this.name

    ,required this.phoneNumber
    , this.favouriteEvents=const []});
  Map<String,dynamic>  toJson (){
    return {"id":id,
      "name":name,
"avatar":avatar,
      "email":email,
      "phoneNumber":phoneNumber,
      "favouriteEvents":favouriteEvents,};

  }
  static UserDM fromJson(Map<String,dynamic > json){
    return   UserDM(
        id: json["id"],
        email: json["email"],
        name: json["name"],
avatar: json["avatar"],
        phoneNumber: json["phoneNumber"]
        ,favouriteEvents: List<String>.from(json["favouriteEvents"] ?? []));


  }
}