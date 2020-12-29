import 'package:FinalsProject/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:FinalsProject/models/post.dart';

class Database {
  final String uid;
  Database({this.uid});

  //collection references
  final CollectionReference bazUsers =
      FirebaseFirestore.instance.collection('bazusers');
  final CollectionReference posts =
      FirebaseFirestore.instance.collection('posts');

  //Create and Update User Data
  Future updateUser(
      String fullname, String age, String address, String email) async {
    return await bazUsers.doc(uid).set(
        {'fullname': fullname, 'age': age, 'address': address, 'email': email});
  }

  //Delete User
  bool deleteUser(String uid) {
    try {
      bazUsers.doc(uid).delete();
      return true;
    } catch (err) {
      print(err.toString());
      return false;
    }
  }

  //Create a post and MAYBE edit it
  bool posting(String content, String uid) {
    try {
      posts.doc().set({'content': content, 'uid': uid});
      return true;
    } catch (err) {
      print(err.toString());
      return false;
    }
  }

  //posts list from snapshot
  List<Post> _postListFromSnap(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Post(
        content: doc.data()['content'] ?? "",
      );
    }).toList();
  }

  //get stream
  Stream<List<Post>> get postsSnap {
    return posts.snapshots().map(_postListFromSnap);
  }

  //userdata from snapshot
  UserData _userData(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      fullname: snapshot.data()['fullname'],
      age: snapshot.data()['age'],
      address: snapshot.data()['address'],
      email: snapshot.data()['email'],
    );
  }

  //get user data
  Stream<UserData> get userData {
    return bazUsers.doc(uid).snapshots().map(_userData);
  }
}
