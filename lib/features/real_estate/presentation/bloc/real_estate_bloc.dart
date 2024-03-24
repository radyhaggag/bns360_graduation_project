import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'real_estate_event.dart';
part 'real_estate_state.dart';

class RealEstateBloc extends Bloc<RealEstateEvent, RealEstateState> {
  RealEstateBloc() : super(RealEstateInitial()) {
    on<RealEstateEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
