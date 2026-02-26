import 'package:cloud_firestore/cloud_firestore.dart';

import 'data_model.dart';

Future <void> createUserInFireStore(UserDM user) async{
  var userCollection=
  FirebaseFirestore.instance.collection("users");
  var emptyDoc=userCollection.doc(user.id);
  //this to create or search for doc with id
  emptyDoc.set(user.toJson());

//steps:
  //1- create collection  2- empty doc 3- fill it with user using toJson function


}

Future<UserDM> getUserFromFireStore(String uid)async{
  var userCollection
  =FirebaseFirestore.instance.collection("users");

  DocumentSnapshot snapshot=await userCollection.doc(uid).get();

  if (!snapshot.exists || snapshot.data() == null) {
    throw Exception("User data not found in Firestore");
  }

  Map <String,dynamic> json =snapshot.data() as Map<String,dynamic>;


  return UserDM.fromJson(json);

}