import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whats_app_clone/common/models/last_message_model.dart';
import 'package:whats_app_clone/common/models/message_model.dart';
import 'package:whats_app_clone/feature/auth/controller/auth_controller.dart';
import 'package:whats_app_clone/feature/chat/repository/chat_repository.dart';

final chatControllerProvider = Provider((ref) {
  final chatRepository = ref.watch(chatRepositoryProvider);
  return ChatColtroller(
    chatRepository: chatRepository,
    ref: ref,
  );
});

class ChatColtroller {
  final ChatRepository chatRepository;
  final ProviderRef ref;

  ChatColtroller({required this.chatRepository, required this.ref});

  Stream<List<MessageModel>> getAllOneToOneMessage(String receiverId) {
    return chatRepository.getAllOneToOneMessage(receiverId);
  }

  Stream<List<LastMessageModel>> getAllLastMessageList() {
    return chatRepository.getAllLastMessageList();
  }

  void sendTextMessage({
    required BuildContext context,
    required String textMessage,
    required String receiverId,
  }) {
    ref.read(userInfoAuthProvider).whenData(
          (value) => chatRepository.sendTextMessage(
            context: context,
            textMessage: textMessage,
            receiverId: receiverId,
            senderData: value!,
          ),
        );
  }
}
