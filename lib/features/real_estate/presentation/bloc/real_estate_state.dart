part of 'real_estate_bloc.dart';

abstract class RealEstateState extends Equatable {
  const RealEstateState();  

  @override
  List<Object> get props => [];
}
class RealEstateInitial extends RealEstateState {}
