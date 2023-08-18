
import '../../../model/product_details/product_details.dart';

abstract class ProductDetailsState{}

class InitialState extends ProductDetailsState{}

class LoadingState extends ProductDetailsState{}

class SuccessState extends ProductDetailsState
{
  ProductDetailsModel productDetailsModel;
  SuccessState(this.productDetailsModel);
}

class ErrorState extends ProductDetailsState{}

class CountState extends ProductDetailsState{}