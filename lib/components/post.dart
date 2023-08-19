import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  final List<String> imageList;
  final String username;
  final String location;
  final String caption;
  const Post({super.key, required this.imageList, required this.username, required this.location, required this.caption});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {

  int currentIndex = 0;
  bool isLiked = false;
  bool isArchived = false;
  bool isCommenting = false;
  TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/${widget.username}.jpg"),
                    radius: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.username,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Visibility(
                        visible: widget.location.isNotEmpty,
                        child: Text(
                          widget.location,
                          style: const TextStyle(
                            fontSize: 15
                          ) ,
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: 400,
                  enableInfiniteScroll: false,
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason){
                    setState(() {
                      currentIndex = index;
                    });
                  }
                ),
                itemCount: widget.imageList.length,
                itemBuilder: (context, index, realIndex){
                  final image = widget.imageList[index];
      
                  return Container(
                    color: Colors.grey,
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    )
                  );
                },
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                        focusNode.requestFocus();
                      });
                    },
                    icon: isLiked ? const Icon(Icons.favorite, color: Colors.red) : const Icon(Icons.favorite_outline)
                  ),
                  IconButton(onPressed: () {setState(() {
                    isCommenting = !isCommenting;
                  });}, icon: const Icon(Icons.comment_outlined)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.send_outlined)),
                  const SizedBox(
                    width: 10,
                  ),
                  Visibility(
                    visible: widget.imageList.length > 1,
                    child: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(widget.imageList.length, (index) {
                          return Container(
                            width: 7,
                            height: 7,
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentIndex == index ? Colors.blue : Colors.grey,
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isArchived = !isArchived;
                      });
                    },
                    icon: isArchived ? const Icon(Icons.bookmark) : const Icon(Icons.bookmark_outline)
                  )
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    "${widget.username} ",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18
                    ),
                    
                  ),
                  Text(
                    widget.caption,
                    style: const TextStyle(
                      fontSize: 18
                    ),
                  )
                ],
              ),
              Visibility(
                visible: isCommenting,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    decoration: InputDecoration(
                      hintText: 'Enter your comment...',
                      suffixIcon: IconButton(
                        onPressed: () {
                          if(textEditingController.text.isEmpty){
                            SnackBar snackBar = const SnackBar(content: Text("Please fill in the comment field"),
                            duration: Duration(seconds: 1));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            return;
                          }
                        },
                        icon: const Icon(Icons.send)
                      )
                    ),
                    
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          );
  }
}