import 'package:batta/model/model_login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class BoardDetailScreen extends StatefulWidget {
  final String boardNum, type, title, content, username, datetime;
  final String? profImage;
  const BoardDetailScreen({
    super.key,
    required this.boardNum,
    required this.type,
    required this.title,
    required this.content,
    required this.username,
    required this.datetime,
    this.profImage,
  });

  @override
  State<BoardDetailScreen> createState() => _BoardDetailScreenState();
}

class _BoardDetailScreenState extends State<BoardDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    String username = Provider.of<LoginModel>(context).getUsername();
    String content = "";

    doWriteComment() async {
      final url = Uri.parse("http://10.0.2.2:8000/batta/writeboard/");
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: <String, String>{
          "boardNum": widget.boardNum,
          "username": username,
          "content": content,
        },
      );
      if (response.statusCode == 200) {
      } else {
        throw Exception(response.statusCode.toString());
      }
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 13, 32, 101),
          title: Text(widget.title),
          centerTitle: true,
        ),
        backgroundColor: const Color(0xFFEFECE5),
        body: SingleChildScrollView(
          // padding: EdgeInsets.symmetric(
          //   vertical: height * 0.02,
          //   horizontal: width * 0.04,
          // ),
          padding: EdgeInsets.fromLTRB(
            width * 0.04,
            height * 0.02,
            width * 0.04,
            0,
          ),
          child: Center(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.person,
                              size: 30,
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.username),
                                Text(widget.datetime),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(widget.content),
                  ],
                ),
                // ListView.separated(
                //   scrollDirection: Axis.vertical,
                //   itemBuilder: (context, index) {
                // return Comments(
                //   boardNum: widget.boardNum,
                //   commentNum: '$index',
                //   content: "댓글 $index",
                //   username: "익명",
                //   datetime: "2023-05-15 02:45",
                //   profImage: "asdf",
                // );
                //   },
                //   separatorBuilder: (context, index) => const Divider(
                //     thickness: 2,
                //     height: 20,
                //     color: Color(0xFF0D2065),
                //   ),
                //   itemCount: 5,
                // ),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: TextField(
                        decoration: const InputDecoration.collapsed(
                          hintText: "Send a message",
                        ),
                        onChanged: (value) {
                          setState(() {
                            content = value;
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: IconButton(
                          icon: const Icon(Icons.send), onPressed: () {}),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
