import 'package:captivate/rewrite_caption.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  State<CreatePost> createState() => CreatePostState();
}

class CreatePostState extends State<CreatePost> {
  late final TextEditingController textFieldController;
  String enteredText = '';
  String generatedCaption = '';
  final picker = ImagePicker();
  bool isLoading = false;

  @override
  void initState() {
    textFieldController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textFieldController = TextEditingController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget button() {
      return Container(
        height: MediaQuery.of(context).size.height * 0.035,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.blue, Colors.red],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: MaterialButton(
          onPressed: () async {
            // print(textFieldController.text);

            setState(() {
              isLoading = true;
            });

            final caption = await rewriteCaption(textFieldController.text);

            setState(() {
              textFieldController.text = caption;
              isLoading = false;
            });
            // print(caption);
            setState(() {
              textFieldController.text = caption;
            });
          },
          child: const Text(
            'Rewrite with A.I',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Create Post"),
          centerTitle: true,
          leading: const Icon(Icons.arrow_back_ios),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                // captionField("assets/default_logo.jpg"),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage("assets/default_logo.jpg"),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5),
                              Text(
                                'John Doe',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '@johndoe',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: textFieldController,
                        onChanged: (text) {
                          setState(() {
                            enteredText = text;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "What do you want to talk about?",
                          hintStyle:
                              TextStyle(color: Colors.grey.withOpacity(0.5)),
                          border: InputBorder.none,
                        ),
                        maxLines: null,
                      ),
                      if (isLoading) const CircularProgressIndicator(),
                      if (generatedCaption.isNotEmpty)
                        Text(
                          generatedCaption,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/image_icon.png",
                              scale: 3,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/video_icon.png",
                              scale: 3,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              "assets/text_icon.png",
                              scale: 3,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.115,
                          ),
                          // button(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.sizeOf(context).width * 0.115,
                              ),
                              // InkWell(
                              //   onTap: () async {
                              //     print(textFieldController.text);
                              //     final caption = await rewriteCaption(
                              //         textFieldController.text);
                              //     setState(() {
                              //       generatedCaption = caption;
                              //     });
                              //   },
                              //   child: button(),
                              // ),

                              button(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
