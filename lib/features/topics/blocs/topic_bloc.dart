import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_study_jam/surf_study_jam.dart';

import '../../chat/repository/chat_repository.dart';

part 'topic_event.dart';

part 'topic_state.dart';

class TopicBloc extends Bloc<TopicEvent, TopicState> {
  final IChatRepository _repository;

  TopicBloc(IChatRepository repository)
      : _repository = repository,
        super(const LoadingTopicState()) {
    on<GetTopicEvent>(_onGet);
    on<EntryTopicEvent>(_onEntry);
    on<ExitTopicEvent>(_onExit);
    on<CreateFormTopicEvent>(_onCreateForm);
    on<CreateTopicEvent>(_onCreate);
  }

  Future<void> _onCreate(CreateTopicEvent event, Emitter emit) async {
    emit(const LoadingTopicState());
    SjChatSendsDto chat = SjChatSendsDto(
        description: event.chatDesc,
        name: event.chatName,
        avatar: event.chatAvatar);
    SjChatDto t = await StudyJamClient()
        .getAuthorizedClient(event.token)
        .createChat(chat);
    add(EntryTopicEvent(sjChatDto: t));
  }

  Future<void> _onExit(ExitTopicEvent event, Emitter emit) async {
    emit(const LoadingTopicState());
    final List<SjChatDto> data = await _repository.getChatById();
    emit(InitialTopicState(chats: data));
  }

  Future<void> _onGet(GetTopicEvent event, Emitter emit) async {
    final List<SjChatDto> data = await _repository.getChatById();
    emit(InitialTopicState(chats: data));
  }

  void _onEntry(EntryTopicEvent event, Emitter emit) =>
      emit(LoadedTopicState(event.sjChatDto));

  void _onCreateForm(CreateFormTopicEvent event, Emitter emit) =>
      emit(const CreateFormTopicState());
}
