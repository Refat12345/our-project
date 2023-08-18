part of 'getstore_cubit.dart';

@immutable
abstract class GetstoreState {}

class GetstoreInitial extends GetstoreState {}
class Loadingstate extends GetstoreState {}

class SuccessState extends GetstoreState{}
 class ErrorState extends GetstoreState{}