part of 'getshopinfo_cubit.dart';

@immutable
abstract class GetshopinfoState {}

class GetshopinfoInitial extends GetshopinfoState {}
class Loadingstate extends GetshopinfoState {}

class SuccessState extends GetshopinfoState{}
class ErrorState extends GetshopinfoState{}