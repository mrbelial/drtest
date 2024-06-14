import 'package:drtest/models/public/checkbox_model.dart';

class EdoxabanDosingModel {
  List<CheckBoxModel> list = [];

  bool isloading = false;

  int get totalChecked => list.where((item) => item.checked).length;

  CheckBoxModel getByPoint(int p) {
    return list.firstWhere((item) => item.point == p);
    // print(item.title);
    // return item;
  }

  int get totalPoint => list
      .where((item) => item.checked)
      .map((item) => item.point)
      .reduce((a, b) => a + b);
}
