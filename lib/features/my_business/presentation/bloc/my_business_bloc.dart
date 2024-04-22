import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_business_event.dart';
part 'my_business_state.dart';

class MyBusinessBloc extends Bloc<MyBusinessEvent, MyBusinessState> {
  MyBusinessBloc() : super(MyBusinessInitial()) {
    on<GetMyBusinessEvent>((event, emit) {});
  }
}
