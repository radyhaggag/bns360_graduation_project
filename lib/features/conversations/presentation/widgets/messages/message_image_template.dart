import 'package:bns360_graduation_project/core/widgets/main_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/entities/message_entity.dart';

class MessageImageTemplate extends StatelessWidget {
  const MessageImageTemplate({super.key, required this.message});

  final MessageEntity message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 132.r,
      height: 132.r,
      child: MainNetworkImage(
        imageUrl: message.imageUrl!,
      ),
    );
  }
}
