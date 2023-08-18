part of 'searchstore_cubit.dart';

@immutable
abstract class SearchstoreState {}

class SearchstoreInitial extends SearchstoreState {}
class Loadingstate extends SearchstoreState {}

class SuccessState extends SearchstoreState{}
class ErrorState extends SearchstoreState{}


class searchproductLoadingstate extends SearchstoreState {}

class searchproductSuccessState extends SearchstoreState{}
class searchproductErrorState extends SearchstoreState{}




class ImageSuccess extends SearchstoreState{}
class ImageError extends SearchstoreState{}

class changefavouriteState extends SearchstoreState{}
class SuccesschangefavouriteState extends SearchstoreState{
  final ChangeFavoritesModel model;
  SuccesschangefavouriteState(this.model);

}
class ErrorchangefavouriteState extends SearchstoreState{}
