import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled1/bloc/location/get_location_state.dart';

class GetLocationCubit extends Cubit<GetLocationState>
{
  GetLocationCubit():super(InitialState());

  static const CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(32.863715,  36.2371496),
    zoom: 14.4746,
  );

}
