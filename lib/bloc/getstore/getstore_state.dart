part of 'getstore_cubit.dart';

@immutable
abstract class GetstoreState {}

class GetstoreInitial extends GetstoreState {}
class Loadingstate extends GetstoreState {}

class SuccessState extends GetstoreState{}
 class ErrorState extends GetstoreState{}

class GetCartLoadingState extends GetstoreState {}

class GetCartSuccessState extends GetstoreState {}

class GetCartErrorState extends GetstoreState {}

class changefavouriteState extends GetstoreState{}

class SuccesschangefavouriteState extends GetstoreState{

 final ChangeFavoritesModel model;
 SuccesschangefavouriteState(this.model);

}
class ErrorchangefavouriteState extends GetstoreState{}


class getfavshopLoadingstate extends GetstoreState {}

class getfavshopSuccessState extends GetstoreState{}
class getfavshopErrorState extends GetstoreState{}
class StateBloc extends GetstoreState{}
