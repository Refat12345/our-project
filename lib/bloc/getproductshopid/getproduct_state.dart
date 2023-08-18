part of 'getproduct_cubit.dart';

@immutable
abstract class GetproductState {}

class GetproductInitial extends GetproductState {}
class Loadingstate extends GetproductState {}

class SuccessState extends GetproductState{

  getproductmodel? getProductmodel ;
  SuccessState(this.getProductmodel);
}
class ErrorState extends GetproductState{}

class changefavouriteState extends GetproductState{}

class SuccesschangefavouriteState extends GetproductState{

  final ChangeFavoritesModel model;
  SuccesschangefavouriteState(this.model);

}
class ErrorchangefavouriteState extends GetproductState{}


class AddProductLoadingstate extends GetproductState {}

class AddProductSuccessState extends GetproductState{
  addproductmodel model;
  AddProductSuccessState(this.model);

}
class AddProductErrorState extends GetproductState{}

class AddProductImageSuccess extends GetproductState{}
class AddProductImageError extends GetproductState{}



class Open_CloseLoadingstate extends GetproductState {}

class Open_CloseSuccessState extends GetproductState{

  addproductmodel model;
  Open_CloseSuccessState(this.model);
}
class Open_CloseErrorState extends GetproductState{}