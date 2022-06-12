import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'general_state.dart';

class GeneralCubit extends Cubit<GeneralState> {
  GeneralCubit() : super(GeneralInitial());

  RangeValues currentRangeValues = const RangeValues(10, 1000);
  RangeValues currentRangeValues2 = const RangeValues(10, 1000);

  void rangeSlider(RangeValues values) {
    currentRangeValues = values;
    emit(Slider());
  }

  void rangeSlider2(RangeValues values) {
    currentRangeValues2 = values;
    emit(Slider2());
  }

  String dropDownValue = 'Lowest';

  void dropDown(String v) {
    dropDownValue = v;
    emit(DropDownMenu());
  }

  List<bool> isSelected = [false, false, false,false,false];

  void selectedItem(int index) {
    for (int indexBtn = 0; indexBtn < isSelected.length; indexBtn++) {
      if (indexBtn == index) {
        isSelected[indexBtn] = true;
        emit(SelectedItem());
      } else {
        isSelected[indexBtn] = false;
        emit(SelectedItem());
      }
    }
  }
  List<bool> colorSelected = [false, false, false,false,false];

  void selectedColor(int index) {
    for (int indexBtn = 0; indexBtn < colorSelected.length; indexBtn++) {
      if (indexBtn == index) {
        colorSelected[indexBtn] = true;
        emit(SelectedColor());
      } else {
        colorSelected[indexBtn] = false;
        emit(SelectedColor());
      }
    }
  }
  List<bool> address = [false, false];

  void selectedAddress(int index) {
    for (int indexBtn = 0; indexBtn < address.length; indexBtn++) {
      if (indexBtn == index) {
        address[indexBtn] = true;
        emit(SelectedAddress());
      } else {
        address[indexBtn] = false;
        emit(SelectedAddress());
      }
    }
  }
  List<bool> paymentMethod = [false, false];

  void selectedPaymentMethod(int index) {
    for (int indexBtn = 0; indexBtn < paymentMethod.length; indexBtn++) {
      if (indexBtn == index) {
        paymentMethod[indexBtn] = true;
        emit(SelectedPaymentMethod());
      } else {
        paymentMethod[indexBtn] = false;
        emit(SelectedPaymentMethod());
      }
    }
  }

  Icon suffix = const Icon(
    Icons.favorite_border,
    color: Colors.grey,
  );

  void addFav(bool isFav) {
    isFav = !isFav;
    suffix = isFav
        ? const Icon(
      Icons.favorite,
      color: Colors.red,
    )
        : const Icon(
      Icons.favorite_border,
      color: Colors.grey,
    );
    emit(Favorites());
  }
}
