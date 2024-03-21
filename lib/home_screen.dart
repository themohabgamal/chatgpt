import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatbot/chat_screen.dart';
import 'package:chatbot/suggetion_box.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black,
            Colors.blue,
          ], // Set your gradient colors here
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              size: 40,
            ),
          ),
          title: const Text(
            "BROXI",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: "Cera Pro",
                fontSize: 32),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'assets/bot.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(0),
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: AnimatedTextKit(
                      displayFullTextOnTap: true,
                      isRepeatingAnimation: false,
                      repeatForever: false,
                      animatedTexts: [
                        TyperAnimatedText(
                          "Hello, What can I do for you?",
                          speed: const Duration(milliseconds: 50),
                          textStyle: const TextStyle(
                              fontFamily: "Cera Pro",
                              fontSize: 24,
                              color: Colors.white),
                        )
                      ]),
                ),
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Here are some features",
                    style: TextStyle(
                        fontFamily: "Cera Pro",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const SuggetionBox(
                    header: "Ask For Information",
                    body: "feel free to ask whatever goes in your mind",
                    color: Colors.deepOrange),
                const SuggetionBox(
                    header: "Powerful AI",
                    body:
                        "giving facts and up-to-date information with a trained ai bot",
                    color: Colors.deepPurple),
                const SuggetionBox(
                    header: "Fast and Accurate",
                    body:
                        "Our model is trained to be as fast and accurate as possible",
                    color: Colors.greenAccent),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ChatScreen();
              }));
            },
            elevation: 10,
            backgroundColor: Colors.white,
            tooltip: "Chat with Broxi",
            child: Image.asset(
              "assets/gpt.png",
              width: 33,
            )),
      ),
    );
  }
}
