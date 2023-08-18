import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:untitled1/bloc/location/add_location_state.dart';
import 'package:untitled1/model/location/add_location_model.dart';
import 'package:untitled1/network/remote/http.dart';

class AddLocationCubit extends Cubit<AddLocationState> {
  AddLocationCubit() : super(InitialState());

  static AddLocationCubit get(context) => BlocProvider.of(context);



  AddLocationModel? addLocationModel;
  double ? longitude,latitude;

  Future addLocation()async {
    emit(LoadingState());
   await HttpHelper.postData(url: 'addLocation', data: {
      "city":"dsd",
      "latitude": "$latitude",
      "longitude": "$longitude"
    }).then((value) {
      emit(SuccessState());
    }).catchError((onError) {
      print(onError.toString());
    });
  }


  Future getLocation() async
  {
    emit(GetLocationLoadingState());
    Position position;
    await Geolocator.requestPermission();
    position=await Geolocator.getCurrentPosition();
    latitude=position.latitude;
    longitude=position.longitude;
    emit(GetLocationSuccessState());



  }
}
