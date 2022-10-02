import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:soft_bd_task/utils/constant.dart';
import 'package:soft_bd_task/model/movie_model.dart';

class SoftbdTaskProvider extends ChangeNotifier {
  MovieModel? movieModel;

  String genderValue = 'Gender';
  int stepperIndex = 0;
  String? dob;
  bool isObscurePassText = true,isClicked=false;
  bool isObscureRePassText = true;
  bool get isLoading => movieModel != null;
  stepperIndexChange(int index) {
    stepperIndex = index;

    notifyListeners();
  }
  onStepCancelIndex(){
    stepperIndex--;
    notifyListeners();
  }
  onStepContinueIndex(){
    stepperIndex++;
    notifyListeners();
  }

  setobScurePass() {
    isObscurePassText = !isObscurePassText;
    notifyListeners();
  }

  setobScureRePass() {
    isObscureRePassText = !isObscureRePassText;
    notifyListeners();
  }

  setGender(String gender) {
    genderValue = gender;
    notifyListeners();
  }

  selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    if (selectedDate != null) {
      dob = DateFormat('dd/MM/yyyy').format(selectedDate);
    }
  }
 bool searchInterestList(String title){
    for (var i in interestList){
      if(i==title){
        return true;
      }
    }
    return false;
  }
 isClicketed(String title){
    isClicked=!isClicked;
    if(isClicked==true){
      _addInterest(title);
    }
    else{
      _removeInterest(title);
    }
    notifyListeners();
 }

  _addInterest(String title){
    interestList.add(title);
  }
  _removeInterest(String title){
    interestList.remove(title);

  }


  Future<void> getMovieData() async {
    var dio = Dio();
    try {
      var response = await dio.get('https://www.jsonkeeper.com/b/2W1I');

      if (response.statusCode == 200) {
        movieModel = MovieModel.fromJson(response.data);
      }
      print(movieModel!.data!.length);
      notifyListeners();
    } on DioError catch (e) {
      print(e.toString());
    }
    return;
  }
}
