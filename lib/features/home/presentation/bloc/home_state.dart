part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class GetBannersLoadingState extends HomeState {}

class GetBannersSuccessState extends HomeState {
  final List<BannerEntity> banners;

  const GetBannersSuccessState({required this.banners});
}

class GetBannersErrorState extends HomeState {
  final String message;

  const GetBannersErrorState({required this.message});
}

class GetPlacesToExploreLoadingState extends HomeState {}

class GetPlacesToExploreSuccessState extends HomeState {
  final List<CategoryItemInfoEntity> placesToExplore;

  const GetPlacesToExploreSuccessState({required this.placesToExplore});
}

class GetPlacesToExploreErrorState extends HomeState {
  final String message;

  const GetPlacesToExploreErrorState({required this.message});
}
