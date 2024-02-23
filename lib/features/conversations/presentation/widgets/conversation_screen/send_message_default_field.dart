import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';
import '../../bloc/conversations_bloc.dart';

class SendMessageDefaultField extends StatelessWidget {
  const SendMessageDefaultField({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConversationsBloc, ConversationsState>(
      buildWhen: (previous, current) {
        final states = [
          SendMessageLoadingState,
          SendMessageSuccessState,
          SendMessageErrorState,
        ];
        return states.contains(current.runtimeType);
      },
      builder: (context, state) {
        return TextField(
          textAlignVertical: TextAlignVertical.center,
          maxLines: 5,
          minLines: 1,
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: S.of(context).write_your_message,
            contentPadding: EdgeInsets.fromLTRB(12.r, 8.r, 12.r, 8.r),
            isCollapsed: false,
            isDense: false,
            fillColor: Colors.transparent,
            filled: true,
            border: withOutBorder,
            focusedBorder: withOutBorder,
            enabledBorder: withOutBorder,
            enabled: state is! SendMessageLoadingState,
            suffixIcon: InkWell(
              onTap: () => context.read<ConversationsBloc>().add(
                    PicKMessageImageEvent(),
                  ),
              child: Container(
                margin: EdgeInsetsDirectional.only(
                  end: 15.w,
                ),
                child: Icon(
                  Icons.photo_camera_outlined,
                  size: 25.r,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  InputBorder get withOutBorder => OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(50),
      );
}
