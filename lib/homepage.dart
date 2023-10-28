import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ImageProvider x;
  late ImageProvider facebook;
  late ImageProvider yt;
  late ImageProvider tikTok;
  late ImageProvider instagram;
  late ImageProvider linkedIn;

  @override
  void initState() {
    super.initState();
    x = const AssetImage("assets/X_logo.png");
    facebook = const AssetImage("assets/Facebook_logo.png");
    instagram = const AssetImage("assets/Instagram_logo.png");
    linkedIn = const AssetImage("assets/LinkedIn_logo.png");
    yt = const AssetImage("assets/YT_logo.png");
    tikTok = const AssetImage("assets/TikTok_logo.png");
  }

  @override
  void didChangeDependencies() {
    precacheImage(x, context);
    precacheImage(facebook, context);
    precacheImage(instagram, context);
    precacheImage(linkedIn, context);
    precacheImage(yt, context);
    precacheImage(tikTok, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Media"),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: x,
                width: MediaQuery.sizeOf(context).width * 0.2,
              ),
              Image(
                image: yt,
                width: MediaQuery.sizeOf(context).width * 0.2,
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: instagram,
                width: MediaQuery.sizeOf(context).width * 0.3,
              ),
              Image(
                image: tikTok,
                width: MediaQuery.sizeOf(context).width * 0.2,
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: linkedIn,
                width: MediaQuery.sizeOf(context).width * 0.3,
              ),
              Image(
                image: facebook,
                width: MediaQuery.sizeOf(context).width * 0.2,
              ),
            ],
          ),
        ],
      )),
    );
  }
}
