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
  Future updateUser(String fullname, String email, String password) async {
    return await bazUsers
        .doc(uid)
        .set({'fullname': fullname, 'password': password, 'email': email});
  }

  //Create a post and MAYBE edit it
  bool posting(String content) {
    try {
      posts.doc().set({'content': content});
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
}
