class LastMessageModel {
  final String username;
  final String profileImageUrl;
  final String contactId;
  final DateTime timeSent;
  final String lastMessage;

  LastMessageModel({
    required this.username,
    required this.profileImageUrl,
    required this.contactId,
    required this.timeSent,
    required this.lastMessage,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'profileImageUrl': profileImageUrl,
      'contactId': contactId,
      'timesent': timeSent.millisecondsSinceEpoch,
      'lastMessage': lastMessage,
    };
  }

  factory LastMessageModel.fromMap(Map<String, dynamic> map) {
    return LastMessageModel(
      username: map['username'] ?? "",
      profileImageUrl: map['profileImageUrl'] ?? "",
      contactId: map['contactId'] ?? "",
      timeSent: DateTime.fromMillisecondsSinceEpoch(map['timesent']),
      lastMessage: map['lastMessage'] ?? "",
    );
  }
}
