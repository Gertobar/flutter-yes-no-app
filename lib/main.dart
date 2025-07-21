import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/configuration/theme/app_theme.dart';
import 'package:yes_no_app/features/Chat/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/features/Chat/presentation/screens/Chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
        title: 'Yes No App',
        theme: AppTheme(selectedColor: 2).theme(),
        debugShowCheckedModeBanner: false,
        home: const ChatScreen(),
      ),
    );
  }
}
