import 'package:flutter/material.dart';
import 'package:rr23_2/components/post.dart';
import 'package:rr23_2/models/comment_model.dart';

class PostDetail extends StatefulWidget {
  final List<String> imageList;
  final String username;
  final String location;
  final String caption;
  final List<CommentModel> commentList;
  const PostDetail({super.key, required this.imageList, required this.username, required this.location, required this.caption, required this.commentList});

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Search",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary
            ),
          ),
          bottom: TabBar(
            labelColor: Theme.of(context).colorScheme.primary,
            tabs: const [
              Tab(text: "Post"),
              Tab(text: "Comments")
            ]
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(child: Post(imageList: widget.imageList, username: widget.username, location: widget.location, caption: widget.caption)),
            ListView.builder(
              itemCount: widget.commentList.length,
              itemBuilder: (BuildContext context, int index) {
                CommentModel currentComment = widget.commentList[index];
                return ListTile(
                  onTap: () {},
                  title: Text(currentComment.username, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(currentComment.comment),
                );
              },
            ),
          ]
        ),
      )
    );
  }
}