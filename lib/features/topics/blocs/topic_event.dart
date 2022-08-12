part of 'topic_bloc.dart';

abstract class TopicEvent {
  const TopicEvent();
}

class GetTopicEvent extends TopicEvent {
  const GetTopicEvent();
}

class EntryTopicEvent extends TopicEvent {
  final SjChatDto sjChatDto;

  const EntryTopicEvent({required this.sjChatDto});
}

class CreateTopicEvent extends TopicEvent {
  final String? chatName;
  final String? chatDesc;
  final String? chatAvatar;
  final String token;

  const CreateTopicEvent(
      {required this.token, this.chatName, this.chatDesc, this.chatAvatar});
}

class CreateFormTopicEvent extends TopicEvent {
  const CreateFormTopicEvent();
}

class ExitTopicEvent extends TopicEvent {
  const ExitTopicEvent();
}
