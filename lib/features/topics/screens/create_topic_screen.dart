import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_chat_flutter/features/topics/blocs/topic_bloc.dart';

/// Screen, that is used for creating new chat topics.
class CreateTopicScreen extends StatefulWidget {
  final String token;

  /// Constructor for [CreateTopicScreen].
  const CreateTopicScreen({
    Key? key,
    required this.token,
  }) : super(key: key);

  @override
  State<CreateTopicScreen> createState() => _CreateTopicScreenState();
}

class _CreateTopicScreenState extends State<CreateTopicScreen> {
  final TextEditingController _chatNameController = TextEditingController();
  final TextEditingController _chatDescriptionController =
      TextEditingController();
  final TextEditingController _chatAvatarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(33, 33, 33, 1),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () {},
          ),
          title: const Text('Создание чата'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _chatNameController,
              cursorColor: const Color.fromRGBO(135, 116, 225, 1),
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(33, 33, 33, 1),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                hintText: 'Название чата',
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _chatDescriptionController,
              cursorColor: const Color.fromRGBO(135, 116, 225, 1),
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(33, 33, 33, 1),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                hintText: 'Описание чата',
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _chatAvatarController,
              cursorColor: const Color.fromRGBO(135, 116, 225, 1),
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(33, 33, 33, 1),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                hintText: 'Аватар чата ( url ) ',
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                child: const Text('Создать чат'),
                onPressed: () {
                  final String name = _chatAvatarController.text.trim();
                  final String desc = _chatAvatarController.text.trim();
                  final String avat = _chatAvatarController.text.trim();
                  context.read<TopicBloc>().add(CreateTopicEvent(
                        token: widget.token,
                        chatAvatar: avat.isNotEmpty ? avat : null,
                        chatName: name.isNotEmpty ? name : null,
                        chatDesc: desc.isNotEmpty ? desc : null,
                      ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
