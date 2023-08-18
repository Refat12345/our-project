
import '../../model/addstore.dart';

abstract class AddstoreState {}

class AddstoreInitial extends AddstoreState {}
class droplist extends AddstoreState{}
class Loadingstate extends AddstoreState {}

class SuccessState extends AddstoreState{
  addproductmodel model;
  SuccessState(this.model);

}
class ErrorState extends AddstoreState{}

class ImageSuccess extends AddstoreState{}
class ImageError extends AddstoreState{}

