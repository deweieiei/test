import 'dart:convert';
import 'dart:math';

import 'package:chang05/IP/ip.dart';
import 'package:chang05/transaction_consumer_provider/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final titleControllor = TextEditingController();
  final amountControllor = TextEditingController();
  final informationControllor = TextEditingController();
  final dateControllor = TextEditingController();
  final telephonControllor = TextEditingController();
  void post() async {
    var url = Uri.parse('http://$ip/apidew/apiserverless-dew/authen/post.php');
    var postcustomer = await http.post(url, body: {
      'id': '${context.read<UserProvider>().id}',
      'infor': '${titleControllor.text}',
      'time': '${dateControllor.text}',
      'amount': '${amountControllor.text}',
      'phone': '${telephonControllor.text}',
      'line': '${informationControllor.text}'
    });

    var resTojson = json.decode(postcustomer.body);

    context.read<Post>().text = resTojson['item']['infor'];
    context.read<Post>().time = resTojson['item']['time'];
    context.read<Post>().am = resTojson['item']['count'];
    context.read<Post>().number = resTojson['item']['phone'];
    context.read<Post>().line = resTojson['item']['line'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ListView(children: [
          Container(
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(color: Colors.white, spreadRadius: 4),
                    ],
                    image: DecorationImage(
                        image:
                            NetworkImage('https://picsum.photos/250?image=9')),
                  ),
                ),
                Text("CreatePost"),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Colors.red),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: max(4, 2),
                            maxLength: 750,
                            textInputAction: TextInputAction.go,
                            controller: titleControllor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
