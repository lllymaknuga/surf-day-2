import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_chat_flutter/features/auth/blocs/auth_bloc.dart';
import 'package:surf_study_jam/surf_study_jam.dart';

import '../blocs/topic_bloc.dart';

class ChatsScreen extends StatelessWidget {
  final List<SjChatDto> chats;
  final String username;

  const ChatsScreen({Key? key, required this.chats, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: _AppBar(username: username),
      ),
      backgroundColor: const Color.fromRGBO(46, 46, 46, 1),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.read<TopicBloc>().add(
                    EntryTopicEvent(sjChatDto: chats[index]),
                  );
            },
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ChatWidget(
                    chatItem: chats[index],
                  ),
                  if (index != chats.length - 1)
                    const Divider(
                      height: 2,
                      color: Colors.grey,
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  final String username;
  const _AppBar({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(33, 33, 33, 1),
      title: Row(
        children: [
          Expanded(
            child: Text('Чаты. Приветсвуем $username'),
          ),
          IconButton(
            onPressed: () =>
                context.read<AuthBloc>().add(const LogOutAuthEvent()),
            icon: const Icon(
              Icons.exit_to_app,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatWidget extends StatelessWidget {
  final SjChatDto chatItem;

  const _ChatWidget({Key? key, required this.chatItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: _ChatTitle(
        chatName: chatItem.name,
      ),
      subtitle: _SubTitleChat(description: chatItem.description),
      leading: _ChatAvatar(
        chatUrl: chatItem.avatar,
      ),
    );
  }
}

class _SubTitleChat extends StatelessWidget {
  final String? description;

  const _SubTitleChat({
    Key? key,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      description ?? 'Чат без описания',
      style: const TextStyle(
        color: Colors.grey,
      ),
    );
  }
}

class _ChatTitle extends StatelessWidget {
  final String? chatName;

  const _ChatTitle({Key? key, this.chatName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      chatName ?? 'Чат без названия',
      style: const TextStyle(color: Colors.white),
    );
  }
}

class _ChatAvatar extends StatelessWidget {
  final String? chatUrl;

  const _ChatAvatar({
    required this.chatUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Random rng = Random();
    if (chatUrl != null) {
      if (chatUrl!.contains('https://')) {
        return Container(
          height: 50,
          width: 50,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: Color.fromRGBO(
                  rng.nextInt(255), rng.nextInt(255), rng.nextInt(255), 1),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          child: Center(
            child: Image.network(chatUrl!),
          ),
        );
      }
    }
    return SizedBox(
      width: 50,
      height: 50,
      child: Material(
        color: Color.fromRGBO(
            rng.nextInt(255), rng.nextInt(255), rng.nextInt(255), 1),
        shape: const CircleBorder(),
      ),
    );
  }
}
