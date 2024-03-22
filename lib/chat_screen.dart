import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _user = ChatUser(id: '1', firstName: 'Mohab');
  final _bot = ChatUser(id: '2', firstName: 'Broxi');
  List<ChatMessage> messages = [];
  final _chatGpt = OpenAI.instance
      .build(baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "BROXI",
      )),
      body: DashChat(currentUser: _user, onSend: onSend, messages: messages),
    );
  }

  void onSend(ChatMessage message) async {
    setState(() {
      messages.insert(0, message);
    });
    List<Map<String, dynamic>> messagesHistory =
        messages.reversed.map((message) {
      if (message.user == _user) {
        return {'role': 'user', 'content': message.text};
      } else {
        return {'role': 'assistant', 'content': message.text};
      }
    }).toList();
    var request = ChatCompleteText(
        model: GptTurbo0301ChatModel(),
        messages: messagesHistory,
        maxToken: 200);
    var response = await _chatGpt.onChatCompletion(request: request);
    for (var element in response!.choices) {
      if (element.message != null) {
        setState(() {
          messages.insert(
              0,
              ChatMessage(
                  text: element.message!.content,
                  user: _bot,
                  createdAt: DateTime.now()));
        });
      }
    }
  }
}
