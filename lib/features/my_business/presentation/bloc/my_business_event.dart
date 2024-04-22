part of 'my_business_bloc.dart';

abstract class MyBusinessEvent extends Equatable {
  const MyBusinessEvent();

  @override
  List<Object> get props => [];
}

class GetMyBusinessEvent extends MyBusinessEvent {}
