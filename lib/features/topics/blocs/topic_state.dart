part of 'topic_bloc.dart';

abstract class TopicState {
  const TopicState();
}

class LoadingTopicState extends TopicState {
  const LoadingTopicState();
}

class InitialTopicState extends TopicState {
  final List<SjChatDto> chats;

  const InitialTopicState({required this.chats});
}

class LoadedTopicState extends TopicState {
  final SjChatDto sjChatDto;

  const LoadedTopicState(this.sjChatDto);
}

class CreateTopicState extends TopicState {
  const CreateTopicState();
}

class CreateFormTopicState extends TopicState {
  const CreateFormTopicState();
}

class ErrorTopicState extends TopicState {
  const ErrorTopicState();
}
