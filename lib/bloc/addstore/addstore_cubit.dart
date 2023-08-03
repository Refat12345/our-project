import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'addstore_state.dart';


class AddstoreCubit extends Cubit<AddstoreState> {
  AddstoreCubit() : super(AddstoreInitial());
  static AddstoreCubit get(context) => BlocProvider.of(context);
  var selectitem;
  var  items = [
    'غذائيات',
    'كهربائيات ',
    'مواد تجميل',
  ];
  void changeitemselected (value) {
    selectitem = value;
    emit(droplist());
  }

}
