import 'package:bns360_graduation_project/core/utils/extensions/context.dart';
import 'package:bns360_graduation_project/core/utils/extensions/media_query.dart';
import 'package:bns360_graduation_project/core/widgets/messages/error_message_widget.dart';
import 'package:bns360_graduation_project/features/craftsman/presentation/bloc/craftsman_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/center_progress_indicator.dart';
import '../../domain/params/craftsman_screen_params.dart';
import '../widgets/craftsman_body.dart';

class CraftsmanScreen extends StatefulWidget {
  const CraftsmanScreen({
    super.key,
    required this.screenParams,
  });

  final CraftsmanScreenParams screenParams;

  @override
  State<CraftsmanScreen> createState() => _CraftsmanScreenState();
}

class _CraftsmanScreenState extends State<CraftsmanScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.screenParams.craftsmanEntity != null) {
      context.read<CraftsmanBloc>().add(
            SetCraftsmanEntityEvent(
              craftsmanEntity: widget.screenParams.craftsmanEntity!,
            ),
          );
    } else {
      context.read<CraftsmanBloc>().add(
            GetCraftsmanEvent(
              itemId: widget.screenParams.itemId,
            ),
          );
    }
    if (widget.screenParams.craftsmanEntity?.reviewSummary == null) {
      context.read<CraftsmanBloc>().add(
            GetCraftsmanReviewSummaryEvent(
              itemId: widget.screenParams.itemId,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor(context),
      body: BlocBuilder<CraftsmanBloc, CraftsmanState>(
        buildWhen: (previous, current) {
          final states = [
            GetCraftsmanLoadingState,
            GetCraftsmanErrorState,
            GetCraftsmanSuccessState,
          ];
          return states.contains(current.runtimeType);
        },
        builder: (context, state) {
          final entity = widget.screenParams.craftsmanEntity;

          if (entity != null) {
            return CraftsmanBody(
              craftsmanEntity: entity,
            );
          }
          if (state is GetCraftsmanSuccessState) {
            return CraftsmanBody(
              craftsmanEntity: state.craftsmanEntity,
            );
          } else if (state is GetCraftsmanLoadingState) {
            return FullScreenLoadingIndicator(
              color: context.theme.primaryColor,
            );
          } else if (state is GetCraftsmanErrorState) {
            return ErrorMessageWidget(
              message: state.message,
              height: context.height,
              width: context.width,
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
