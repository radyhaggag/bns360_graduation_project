enum MessageType {
  text("Text"),
  image("Image");

  const MessageType(this.value);

  final String value;

  static MessageType fromTypeText(String typeText) {
    switch (typeText.toLowerCase()) {
      case 'text':
        return MessageType.text;
      case 'image':
        return MessageType.image;
      default:
        throw ArgumentError('Unknown message type: $typeText');
    }
  }
}
