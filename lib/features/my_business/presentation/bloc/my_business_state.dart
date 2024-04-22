part of 'my_business_bloc.dart';

abstract class MyBusinessState extends Equatable {
  const MyBusinessState();  

  @override
  List<Object> get props => [];
}
class MyBusinessInitial extends MyBusinessState {}
