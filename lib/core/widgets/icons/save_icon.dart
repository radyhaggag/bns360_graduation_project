import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/features/saved_items/presentation/bloc/saved_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import 'rounded_icon_btn.dart';

class SaveIcon extends StatelessWidget {
  const SaveIcon({
    super.key,
    this.size,
    required this.isJob,
    required this.itemId,
    this.notSavedColor,
  });

  final double? size;
  final bool isJob;
  final int itemId;
  final Color? notSavedColor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedBloc, SavedState>(
      buildWhen: (previous, current) {
        final rebuildStates = [
          current is SaveJobLoadingState && current.jobId == itemId,
          current is UnSaveJobLoadingState && current.jobId == itemId,
          current is SavePropertyLoadingState && current.propertyId == itemId,
          current is UnSavePropertyLoadingState && current.propertyId == itemId,
          current is SaveJobSuccessState && current.jobId == itemId,
          current is SavePropertySuccessState && current.propertyId == itemId,
          current is UnSaveJobSuccessState && current.jobId == itemId,
          current is UnSavePropertySuccessState && current.propertyId == itemId,
          current is SaveJobErrorState && current.jobId == itemId,
          current is SavePropertyErrorState && current.propertyId == itemId,
          current is UnSaveJobErrorState && current.jobId == itemId,
          current is UnSavePropertyErrorState && current.propertyId == itemId,
        ];

        return rebuildStates.any((element) => element);
      },
      builder: (context, state) {
        final isInSaved = isSaved(context, state);

        final loadingStates = [
          state is SaveJobLoadingState && state.jobId == itemId,
          state is UnSaveJobLoadingState && state.jobId == itemId,
          state is SavePropertyLoadingState && state.propertyId == itemId,
          state is UnSavePropertyLoadingState && state.propertyId == itemId,
        ];

        bool isLoading = loadingStates.any((element) => element);

        return RoundedIconBtn(
          isLoading: isLoading,
          backgroundColor: isInSaved
              ? AppColors.primary
              : context.theme.highlightColor.withAlpha(250),
          size: size ?? 35.r,
          icon: Icon(
            isInSaved ? Icons.bookmark : FeatherIcons.bookmark,
            color: isInSaved ? Colors.amber : notSavedColor,
          ),
          onPressed: () {
            onPressed.call(context, isInSaved: isInSaved);
          },
          addMargin: true,
        );
      },
    );
  }

  bool isSaved(BuildContext context, SavedState lastState) {
    if (lastState is SaveJobSuccessState && lastState.jobId == itemId) {
      return true;
    } else if (lastState is SavePropertySuccessState &&
        lastState.propertyId == itemId) {
      return true;
    } else if (lastState is UnSaveJobSuccessState &&
        lastState.jobId == itemId) {
      return false;
    } else if (lastState is UnSavePropertySuccessState &&
        lastState.propertyId == itemId) {
      return false;
    }

    if (isJob) {
      return context.read<SavedBloc>().savedJobInLocalIds.contains(itemId);
    } else {
      return context
          .read<SavedBloc>()
          .savedPropertiesInLocalIds
          .contains(itemId);
    }
  }

  void onPressed(BuildContext context, {required bool isInSaved}) {
    if (isJob) {
      if (isInSaved) {
        context.read<SavedBloc>().add(
              UnSaveJobEvent(jobId: itemId),
            );
      } else {
        context.read<SavedBloc>().add(
              SaveJobEvent(jobId: itemId),
            );
      }
    } else {
      if (isInSaved) {
        context.read<SavedBloc>().add(
              UnSavePropertyEvent(propertyId: itemId),
            );
      } else {
        context.read<SavedBloc>().add(
              SavePropertyEvent(propertyId: itemId),
            );
      }
    }
  }
}
