part of 'editstoree_cubit.dart';

@immutable
abstract class EditstoreeState {}

class EditstoreeInitial extends EditstoreeState {}

class EditstoreLoadingstate extends EditstoreeState {}
class Editstoredroplist extends EditstoreeState {}

class EditstoreSuccessState extends EditstoreeState{
  // addproductmodel model;
  // SuccessState(this.model);

}
class EditstoreErrorState extends EditstoreeState{}

class EditstoreImageSuccess extends EditstoreeState{}
class EditstoreImageError extends EditstoreeState{}


class Loadingstate extends EditstoreeState {}

class SuccessState extends EditstoreeState{}
class ErrorState extends EditstoreeState{}