import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/main_network_image.dart';
import '../../../domain/entities/message_entity.dart';
import 'message_text_template.dart';

class MessageImageTemplate extends StatelessWidget {
  const MessageImageTemplate({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180.w,
      height: 132.r,
      child: MainNetworkImage(
        imageUrl: imageUrl,
        width: 180.w,
      ),
    );
  }
}

class MessageImageWithTextTemplate extends StatelessWidget {
  const MessageImageWithTextTemplate({super.key, required this.message});

  final MessageEntity message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          MessageImageTemplate(imageUrl: message.imageUrl!),
          MessageTextTemplate(
            message: message,
            width: 180.w,
            isUnderImage: false,
          ),
        ],
      ),
    );
  }
}
