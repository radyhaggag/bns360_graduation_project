import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'category_item_event.dart';
part 'category_item_state.dart';

class CategoryItemBloc extends Bloc<CategoryItemEvent, CategoryItemState> {
  CategoryItemBloc() : super(CategoryItemInitial()) {
    on<CategoryItemEvent>((event, emit) {});
  }
}
