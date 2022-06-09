part of 'general_cubit.dart';

@immutable
abstract class GeneralState {}

class GeneralInitial extends GeneralState {}

class Slider extends GeneralState {}

class DropDownMenu extends GeneralState {}

class SelectedItem extends GeneralState {}

class SelectedColor extends GeneralState {}

class SelectedAddress extends GeneralState {}

class SelectedPaymentMethod extends GeneralState {}

class Favorites extends GeneralState {}
