import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              itemCount: 100,
              itemBuilder: (BuildContext context, int index) {
                return (index % 2== 0 )
                ? const HerMessageBubble()
                :MyMessageBubble();
              },
            ),
            ),
        
            //Caja de texto de mensaje
            MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
