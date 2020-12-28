import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:FinalsProject/models/post.dart';
import 'package:FinalsProject/UI/PostTile.dart';

class Posts extends StatefulWidget {
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<List<Post>>(context);

    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (content, index) {
        return PostTile(post: posts[index]);
      },
    );
  }
}
