import 'package:drtest/models/public/idtitle_model.dart';
import 'package:drtest/models/question/question_model.dart';
import 'package:drtest/response/question/question_response.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  final _responseObs = QuestionResponse().obs;
  QuestionResponse get responseModel => _responseObs.value;

  bool get isloading => responseModel.isLoading;
  set isloading(bool v) => _responseObs.update((val) => val!.isLoading = v);

  TestModel get model => _responseObs.value.content!;

  newTest() => _responseObs.value = QuestionResponse();

  set isFemale(bool v) =>
      _responseObs.update((val) => val!.content!.isFemale = v);
  bool get isFemale => model.isFemale;

  set age(int v) => _responseObs.update((val) => val!.content!.age = v);
  int get age => model.age;

  //Question 1
  set qa1(bool v) => _responseObs.update((val) => val!.content!.q1Answer = v);

  //Question 2
  set qa2(int v) => _responseObs.update((val) => val!.content!.q2Answer = v);

  //Question 3
  q3Answer(int i, bool v) =>
      _responseObs.update((val) => val!.content!.q3Answer[i].checked = v);

  IDTitleModel calcq3() {
    int point = 0;
    if (isFemale) {
      point++;
    }

    if (age >= 75) {
      point += 2;
    } else if (age >= 65) {
      point++;
    }

    for (var item in model.q3Answer) {
      if (item.checked) point += item.point;
    }

    _responseObs.update((val) => val!.content!.q3Point = point);

    var tp = isFemale ? point - 1 : point;
    var msg =
        "It is reasonable to omit anticoagulant therapy. (AHA/ACC/HRS AF 2019 IIa B)\nShould not be offered antithrombotic therapy. (ESC 2020 1 A)";

    if (tp > 1) {
      msg =
          "Anticoagulation is recommended to prevent stroke and systemic thromboembolism.\n(AHA/ACC/ACCP/HRS AF 2023, 1 A)\n(ESC 2020 AF 1A)\n(AHA/ACC/HRS AF 2019 1 A)";
    } else if (tp > 0) {
      msg =
          "Anticoagulation is reasonable to prevent stroke and systemic thromboembolism.\n(AHA/ACC/ACCP/HRS AF 2023, 2a  A), (ESC 2020 AF IIa B)\nPrescribing an oral anticoagulant to reduce thromboembolic stroke risk may be considered. (AHA/ACC/HRS AF 2019 IIb C-LD)";
    }
    return IDTitleModel(tp, msg);
  }

  List<TestDrugModel> getDrugsByIDs(List<int> ids) {
    return model.drugs.where((e) => ids.contains(e.id)).toList();
  }

  List<TestDrugModel> getDrugsByNames(List<String> names) {
    return model.drugs.where((e) => names.contains(e.name)).toList();
  }

  void doTestPage(TestPageModel item){
    //
  }
}
