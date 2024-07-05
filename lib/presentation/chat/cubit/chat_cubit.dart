import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final FirebaseFirestore firestore;

  ChatCubit(this.firestore) : super(ChatState(messages: [], loading: true));

  void fetchMessages() {
    try {
      firestore.collection('chat').orderBy('timestamp').snapshots().listen((snapshot) {
        final messages = snapshot.docs.map((doc) => doc.data()).toList();
        emit(ChatState(messages: messages, loading: false));
      }, onError: (error) {
        print('Error fetching messages: $error');
        emit(ChatState(messages: [], loading: false));
      });
    } catch (e) {
      print('Exception in fetchMessages: $e');
      emit(ChatState(messages: [], loading: false));
    }
  }

  Future<void> sendMessage(String userId, String userName, String message) async {
    try {
      await firestore.collection('chat').add({
        'userId': userId,
        'userName': userName,
        'message': message,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error sending message: $e');
    }
  }
}
