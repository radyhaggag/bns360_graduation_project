import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/extensions/context.dart';
import '../../bloc/conversations_bloc.dart';

class PickedImageSection extends StatelessWidget {
  const PickedImageSection({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ConversationsBloc>();

    return BlocBuilder<ConversationsBloc, ConversationsState>(
      buildWhen: (previous, current) {
        final states = [
          MessageImagePickedSuccessState,
          MessagePickedImageRemovedSuccessState,
          SendMessageLoadingState,
          SendMessageSuccessState,
          SendMessageErrorState,
        ];
        return states.contains(current.runtimeType);
      },
      builder: (context, state) {
        if (bloc.pickedFile == null) {
          return const SizedBox.shrink();
        }
        return Padding(
          padding: EdgeInsetsDirectional.only(
            start: 15.w,
            top: 10.h,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  SizedBox(
                    width: 150.w,
                    height: 100.r,
                    child: Image(
                      image: FileImage(bloc.pickedFile!),
                      width: 150.w,
                    ),
                  ),
                  _RemovePickedImageBtn(
                    onTap: () => bloc.add(RemovePickedImageEvent()),
                  ),
                ],
              ),
              Flexible(
                child: Text(
                  textEditingController.text,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.theme.highlightColor,
                  ),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _RemovePickedImageBtn extends StatelessWidget {
  const _RemovePickedImageBtn({
    this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(4),
        margin: EdgeInsets.symmetric(
          vertical: 2.h,
          horizontal: 10.w,
        ),
        child: Icon(
          Icons.delete,
          color: AppColors.white,
          size: 15.r,
        ),
      ),
    );
  }
}
