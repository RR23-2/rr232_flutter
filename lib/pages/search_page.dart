import 'package:flutter/material.dart';
import 'package:rr23_2/components/post_detail.dart';
import 'package:rr23_2/models/comment_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  List<CommentModel> post1 = [CommentModel(username: "xintthing", comment: "Kulit menyapa kacang tidak kenal"), CommentModel(username: "dikaraditya_08", comment: "Plot Wist ternyata salah kulit"), CommentModel(username: "aosofel", comment: "kulit: asing banget kek ga pernah aku lindungi aja"), CommentModel(username: "fachri0507", comment: "Apenih, kacang lupa kulit kah?")];
  List<CommentModel> post2 = [CommentModel(username: "aldctr4_", comment: "dia ga salah kok, kan dia up nya di seperdua malam")];
  List<CommentModel> post3 = [CommentModel(username: "defa_andrea", comment: "Setidaknya kamu menang dalam lomba kekalahan"), CommentModel(username: "daffafad_", comment: "Tombol jadi panitia >>>>>"), CommentModel(username: "syena_parfume", comment: "Masih bisa buat menang😭"), CommentModel(username: "friliananando", comment: "Tapi kalo soal kalah kan lu yang menang 😎"), CommentModel(username: "otakuhidayah", comment: "gua yg jd panitia : kau kira aku peduli 👺")];
  List<CommentModel> post4 = [CommentModel(username: "adlifmla", comment: "Spiderman far from jahannam"), CommentModel(username: "yok_nda_tau", comment: "Spiderman accross the halal verse"), CommentModel(username: "faizazr_28", comment: "Fathir farkhair")];
  List<List<CommentModel>> commentList = [];

  Widget postList(String image, String username, String location, String caption){
    commentList.add(post1);
    commentList.add(post2);
    commentList.add(post3);
    commentList.add(post4);
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(const RoundedRectangleBorder(borderRadius: BorderRadius.zero))
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context){
            return PostDetail(imageList: [image], username: username, location: location, caption: caption, commentList: commentList[int.parse(image.substring(16, 17)) - 1],);
          }),
        );
      },
      child: Image.asset(image, width: MediaQuery.of(context).size.width / 3, height: MediaQuery.of(context).size.width / 3, fit: BoxFit.cover)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            postList("assets/explorer/1.jpg", "id_dagelan", "", "Kulit lupa kacangnya"),
            postList("assets/explorer/2.jpg", "id_dagelan", "", "Reza merezahkan"),
            postList("assets/explorer/3.jpg", "id_dagelan", "", "Kalian ikut lomba apa der ?")
          ],
        ),
        Row(
          children: [
            postList("assets/explorer/4.jpg", "id_dagelan", "", "Universe mana ni ?"),
          ],
        )
      ],
      
    );
  }
}