import 'package:bns360_graduation_project/core/widgets/buttons/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../features/favorites/presentation/bloc/favorites_bloc.dart';
import '../../utils/extensions/context.dart';
import 'rounded_icon_btn.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    super.key,
    this.addMargin = true,
    this.backgroundColor,
    this.size,
    this.notRounded = false,
    required this.isBusiness,
    required this.itemId,
  });

  final bool addMargin;
  final Color? backgroundColor;
  final double? size;
  final bool notRounded;
  final bool isBusiness;
  final int itemId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      buildWhen: (previous, current) {
        final rebuildStates = [
          current is AddCategoryItemToFavoriteLoadingState &&
              current.itemId == itemId,
          current is RemoveCategoryItemFromFavoriteLoadingState &&
              current.itemId == itemId,
          current is AddCraftsmanToFavoriteLoadingState &&
              current.itemId == itemId,
          current is RemoveCraftsmanFromFavoriteLoadingState &&
              current.itemId == itemId,
          current is AddCategoryItemToFavoriteSuccessState &&
              current.itemId == itemId,
          current is RemoveCategoryItemFromFavoriteSuccessState &&
              current.itemId == itemId,
          current is AddCraftsmanToFavoriteSuccessState &&
              current.itemId == itemId,
          current is RemoveCraftsmanFromFavoriteSuccessState &&
              current.itemId == itemId,
          current is AddCategoryItemToFavoriteErrorState &&
              current.itemId == itemId,
          current is RemoveCategoryItemFromFavoriteErrorState &&
              current.itemId == itemId,
          current is AddCraftsmanToFavoriteErrorState &&
              current.itemId == itemId,
          current is RemoveCraftsmanFromFavoriteErrorState &&
              current.itemId == itemId,
        ];

        return rebuildStates.any((element) => element);
      },
      builder: (context, state) {
        final isInFavorite = isFavorite(context);

        final loadingStates = [
          state is AddCategoryItemToFavoriteLoadingState &&
              state.itemId == itemId,
          state is RemoveCategoryItemFromFavoriteLoadingState &&
              state.itemId == itemId,
          state is AddCraftsmanToFavoriteLoadingState && state.itemId == itemId,
          state is RemoveCraftsmanFromFavoriteLoadingState &&
              state.itemId == itemId,
        ];

        bool isLoading = loadingStates.any((element) => element);

        if (notRounded) {
          return CustomIconButton(
            isLoading: isLoading,
            icon: Icon(
              isInFavorite ? Icons.favorite : FeatherIcons.heart,
              size: size,
              color: isInFavorite ? Colors.red : context.theme.cardColor,
            ),
            padding: EdgeInsets.zero,
            // constraints: BoxConstraints(minHeight: 30.r, minWidth: 30.r),
            // style: IconButton.styleFrom(
            backgroundColor: context.theme.highlightColor,
            // ),
            onPressed: () {
              onPressed.call(context, isInFavorite: isInFavorite);
            },
          );
        }
        return RoundedIconBtn(
          isLoading: isLoading,
          icon: Icon(
            isInFavorite ? Icons.favorite : Icons.favorite_border,
            color: isInFavorite ? Colors.red : null,
          ),
          size: size ?? 35.r,
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.all(10),
          onPressed: () {
            onPressed.call(context, isInFavorite: isInFavorite);
          },
          addMargin: addMargin,
        );
      },
    );
  }

  bool isFavorite(BuildContext context) {
    if (isBusiness) {
      return context
          .read<FavoritesBloc>()
          .savedFavoriteCategoriesIds
          .contains(itemId);
    } else {
      return context
          .read<FavoritesBloc>()
          .savedFavoriteCraftsmenIds
          .contains(itemId);
    }
  }

  void onPressed(BuildContext context, {required bool isInFavorite}) {
    if (isBusiness) {
      if (isInFavorite) {
        context.read<FavoritesBloc>().add(
              RemoveCategoryItemFromFavorite(itemId: itemId),
            );
      } else {
        context.read<FavoritesBloc>().add(
              AddCategoryItemToFavorite(itemId: itemId),
            );
      }
    } else {
      if (isInFavorite) {
        context.read<FavoritesBloc>().add(
              RemoveCraftsmanFromFavorite(itemId: itemId),
            );
      } else {
        context.read<FavoritesBloc>().add(
              AddCraftsmanToFavorite(itemId: itemId),
            );
      }
    }
  }
}
