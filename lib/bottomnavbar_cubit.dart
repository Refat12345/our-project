import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'bottomnavbar_state.dart';

class BottomnavbarCubit extends Cubit<BottomnavbarState> {
  BottomnavbarCubit() : super(BottomnavbarInitial());

  int currentIndex = 0;

  static BottomnavbarCubit get(context) => BlocProvider.of(context);

  void changeBottomNavBar(index) {
    currentIndex = index;
    emit(Bottomnav());
  }
}
