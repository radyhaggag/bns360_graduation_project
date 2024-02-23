enum MessageType {
  text(0),
  image(1),
  textAndImage(2);

  const MessageType(this.id);

  final int id;

  static MessageType parse(int id) {
    switch (id) {
      case 0:
        return MessageType.text;
      case 1:
        return MessageType.image;
      case 2:
        return MessageType.textAndImage;
      default:
        throw ArgumentError('Unknown message type with id: $id');
    }
  }
}
