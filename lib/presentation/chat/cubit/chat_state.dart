part of 'chat_cubit.dart';

class ChatState extends Equatable {
  final List<Map<String, dynamic>> messages;
  final bool loading;

  ChatState({required this.messages, required this.loading});

  @override
  List<Object> get props => [messages, loading];
}
