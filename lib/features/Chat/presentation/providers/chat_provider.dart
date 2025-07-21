import 'package:flutter/material.dart';
import 'package:yes_no_app/configuration/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/features/Chat/domain/entities/messaje.dart';

class ChatProvider extends ChangeNotifier {
  final chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  final List<Message> messageList = [
    Message(text: 'hola perdida!', fromWho: FromWho.my),
    Message(text: '¿En dónde nos encontramos?', fromWho: FromWho.my),
  ];

  Future<void> sendMessge(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.my);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      herReply();
    }

    notifyListeners();
    moveScrollToBotton();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();

    moveScrollToBotton();
  }

  Future<void> moveScrollToBotton() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
