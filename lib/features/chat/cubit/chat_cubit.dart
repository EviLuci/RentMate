import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rentmate/features/chat/models/message.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ChatCubit() : super(ChatInitial());

  void sendMessage(String chatId, String text) {
    try {
      _firestore.collection('chats').doc(chatId).collection('messages').add({
        'senderId': 'currentUser', // Replace with actual user ID
        'text': text,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Send push notification
      FirebaseMessaging.instance.sendMessage(
        to: 'recipientToken', // Replace with recipient's FCM token
        data: {
          'title': 'New Message',
          'body': text,
        },
      );
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  void listenToMessages(String chatId) {
    try {
      emit(ChatLoading());
      _firestore
          .collection('chats')
          .doc(chatId)
          .collection('messages')
          .orderBy('timestamp', descending: true)
          .snapshots()
          .listen((snapshot) {
        final messages =
            snapshot.docs.map((doc) => Message.fromMap(doc.data())).toList();
        emit(ChatLoaded(messages));
      });
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }
}
