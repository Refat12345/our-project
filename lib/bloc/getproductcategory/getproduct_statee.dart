part of 'getproduct_cubitt.dart';

@immutable
abstract class GetproductStatee {}

class GetproductInitial extends GetproductStatee {}


class getproductcategoryLoadingstate extends GetproductStatee {}
class getproductcategorySuccessState extends GetproductStatee{}
class getproductcategoryErrorState extends GetproductStatee{}

class getcategoryyLoadingstate extends GetproductStatee {}
class getcategoryySuccessState extends GetproductStatee{}
class getcategoryyErrorState extends GetproductStatee{}




class changefavouriteState extends GetproductStatee{}
class SuccesschangefavouriteState extends GetproductStatee{
  final ChangeFavoritesModel model;
  SuccesschangefavouriteState(this.model);

}
class ErrorchangefavouriteState extends GetproductStatee{}



class getallfavouriteLoadingstate extends GetproductStatee {}
class getallfavouriteSuccessState extends GetproductStatee{

  getfavouritemodel? Getfavouritemodel;
  getallfavouriteSuccessState(this.Getfavouritemodel);

}
class getallfavouriteErrorState extends GetproductStatee{}
