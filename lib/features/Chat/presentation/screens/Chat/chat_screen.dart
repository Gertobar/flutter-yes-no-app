import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/features/Chat/domain/entities/messaje.dart';
import 'package:yes_no_app/features/Chat/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/features/Chat/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/features/Chat/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/features/Chat/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://firebase.soulectiontracklists.com/cdn/image/t_square_extra_large/images/artists/duncan-gerow/tracks/rihanna-ft-bryson-tiller-the-neptunes-wild-thoughts.webp',
            ),
          ),
        ),
        title: Text('prueba'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];


                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble(message: message)
                      : MyMessageBubble(message: message,);
                },
              ),
            ),

            //Caja de texto de mensaje
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessge(value) ,
            ),
          ],
        ),
      ),
    );
  }
}
