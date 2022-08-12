import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_practice_chat_flutter/features/chat/screens/chat_screen.dart';
import 'package:surf_practice_chat_flutter/features/topics/blocs/topic_bloc.dart';
import 'package:surf_practice_chat_flutter/features/topics/screens/loading_screen.dart';
import 'package:surf_study_jam/surf_study_jam.dart';

import '../../auth/blocs/auth_bloc.dart';
import '../../chat/repository/chat_repository.dart';
import 'chats_screen.dart';
import 'create_topic_screen.dart';

/// Screen with different chat topics to go to.
class TopicsScreen extends StatelessWidget {
  final String token;
  final String username;

  /// Constructor for [TopicsScreen].
  const TopicsScreen({Key? key, required this.token, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TopicBloc(
        ChatRepository(
          StudyJamClient().getAuthorizedClient(token),
        ),
      )..add(const GetTopicEvent()),
      child: BlocBuilder<TopicBloc, TopicState>(
        builder: (context, state) {
          if (state is CreateFormTopicState) {
            return SingleChildScrollView(
              child: CreateTopicScreen(token: token),
            );
          } else if (state is LoadedTopicState) {
            return ChatScreen(
              sjChatDto: state.sjChatDto,
              chatRepository: ChatRepository(
                StudyJamClient().getAuthorizedClient(token),
              ),
            );
          } else if (state is InitialTopicState) {
            return ChatsScreen(
              username: username,
              chats: state.chats,
            );
          }
          return const LoadingScreen();
        },
      ),
    );
  }
}
