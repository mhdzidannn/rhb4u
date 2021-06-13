import 'package:flutter/widgets.dart';
import 'package:rhb4u/model/data.dart';

class QuestionNotifier with ChangeNotifier {

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int _correctAns = 1;
  int get correctAns => this._correctAns;

  late int _selectedAns;
  int get selectedAns => this._selectedAns;

  checkAns(int selectedIndex) {

    _isAnswered = true;
    _selectedAns = selectedIndex;

    if (_correctAns != _selectedAns){
      return 'Opss ! Nice try !';
    } else {
      return 'You got it right !';
    }

  }

  late DataModel dataModel;
  DataModel get getDataModel => this.dataModel;
  
  set setDataModel(DataModel model){
    dataModel = model;
  }

}