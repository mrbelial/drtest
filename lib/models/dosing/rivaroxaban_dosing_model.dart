import 'package:drtest/models/public/checkbox_model.dart';

class RivaroxabanDosingModel {
  List<CheckBoxModel> list = [];

  bool isloading = false;

  int get totalChecked => list.where((item) => item.checked).length;

  int get totalPoint => list
      .where((item) => item.checked)
      .map((item) => item.point)
      .reduce((a, b) => a + b);
}
