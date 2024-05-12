import 'dart:convert';

import 'package:drtest/models/public/idtitle_model.dart';
import 'package:drtest/models/question/drug_interaction_model.dart';
import 'package:drtest/models/question/question_model.dart';
import 'package:drtest/response/question/question_response.dart';
import 'package:flutter/services.dart';
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

  set weight(int v) => _responseObs.update((val) {
        val!.content!.weight = v;
        val.content!.bmi = calcBMI();
      });
  int get weight => model.weight;

  set height(int v) => _responseObs.update((val) {
        val!.content!.height = v;
        val.content!.bmi = calcBMI();
      });
  int get height => model.height;

  set bmi(double v) => _responseObs.update((val) => val!.content!.bmi = v);
  double get bmi => model.bmi;

  set serumCreatinine(double v) =>
      _responseObs.update((val) => val!.content!.serumCreatinine = v);
  double get serumCreatinine => model.serumCreatinine;

  set ul(int? v) => _responseObs.update((val) => val!.content!.ul = v);
  int? get ul => model.ul;

  //Question 1
  set qa1(bool v) => _responseObs.update((val) => val!.content!.q1Answer = v);

  //Question 2
  set qa2(int v) => _responseObs.update((val) => val!.content!.q2Answer = v);

  //CHA2DS2-VASc Calculator
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

  //HAS-BLED Calculator
  hbAnswer(int i, bool v) =>
      _responseObs.update((val) => val!.content!.hbAnswer[i].checked = v);

  IDTitleModel calcHB() {
    int point = 0;
    for (var item in model.hbAnswer) {
      if (item.checked) point += item.point;
    }
    model.hbPoint = point;
    // _responseObs.update((val) => val!.content!.hbPoint = point);
    var msg = "";

    switch (point) {
      case 0:
        msg = "0 points: 1.13 bleeds per 100 patient-years";
        break;
      case 1:
        msg = "1 point: 1.02 bleeds per 100 patient-years";
        break;
      case 2:
        msg = "2 points: 1.88 bleeds per 100 patient-years";
        break;
      case 3:
        msg = "3 points: 3.74 bleeds per 100 patient-years";
        break;
      case 4:
        msg = "4 points: 8.70 bleeds per 100 patient-years";
        break;
      default:
        msg = "5 to 9 points: Insufficient data";
    }

    var desc =
        """Bleeding risk scores should not be used in isolation to determine eligibility for oral anticoagulation but instead to identify and modify bleeding risk factors and to inform medical decision-making. (AHA/ACC/ACCP/HRS AF 2023, No benefit B-NR)
Estimated bleeding risk, in the absence of absolute contraindications to OAC, should not in itself guide treatment decisions to use OAC for stroke prevention. (ESC 2020 AF III A).
Concomitant regular administration of antiplatelet drugs or non-steroidal anti-inflammatory drug (NSAID) should be avoided in anticoagulated patients. (ECS 2020 AF)
Bleeding risk is dynamic, and attention to the change in bleeding risk profile is a stronger predictor of major bleeding events. (ESC 2020 AF)""";

    return IDTitleModel(point, msg, desc);
  }

  //Cockcroft-Gault Calculator
  IDTitleModel calcCG() {
    var v = ((140 - age) * weight) / (serumCreatinine * 72);
    if (isFemale) {
      v = v * .85;
    }

    model.cgAnswer = double.tryParse(v.toStringAsFixed(5)) ?? 0;

    return IDTitleModel(0, "$v (mL/min)");
  }

  //Child Pugh Calculator
  void cpAnswer(int i, int v, int p) {
    _responseObs.update((val) {
      val!.content!.cpQuestions[i].selectedID = v;
      val.content!.cpQuestions[i].point = p;
      calcCP();
    });
  }

  IDTitleModel calcCP() {
    var p = 0;
    for (var item in model.cpQuestions) {
      p += item.point;
    }
    model.cpPoint = p;
    return IDTitleModel(p, model.cpAnswer());
  }

  //Platelet Count

  //BMI
  double calcBMI() {
    var h = height / 100;
    return double.tryParse((weight / (h * h)).toStringAsFixed(2)) ?? 0;
  }

  List<TestDrugModel> getDrugsByIDs(List<int> ids) {
    return model.drugs.where((e) => ids.contains(e.id)).toList();
  }

  List<TestDrugModel> getDrugsByNames(List<String> names) {
    return model.drugs.where((e) => names.contains(e.name)).toList();
  }

  void doTestPage(TestPageModel item) {
    //
  }

  //stacks
  List<TestPageModel> get stacks => model.stacks;
  TestPageModel get selectedStack => model.stacks[model.selectedStack];

  int get selectedStackIndex => model.selectedStack;
  set selectedStackIndex(int v) =>
      _responseObs.update((val) => val!.content!.selectedStack = v);

  void addToStack(TestPageModel item) {
    if (!isItemStacked(item)) {
      _responseObs.update((val) => val!.content!.stacks.add(item));
    }
  }

  void removeFromStack(TestPageModel item) {
    _responseObs
        .update((val) => val!.content!.stacks.removeWhere((e) => e == item));
  }

  bool isItemStacked(TestPageModel item) =>
      stacks.indexWhere((e) => e == item) > -1;

  //Drugs
  List<TestDrugPageModel> get selectedDrugs => stacks.last.drugs;
  // List<TestDrugPageModel> get selectedDrugsModel =>
  // model.selectedDrugs.map((x) => x.drugs);

  void addToDrugs(TestPageModel item) {
    stacks.last.drugs.addAll(item.drugs);
  }

  void initStack() {
    stacks.clear();
    model.initPages();

    if (model.cgAnswer > -1) {
      stacks.add(model.pages.pages.firstWhere((x) => x.id == 1));
    }
    if (model.cpPoint > 0) {
      stacks.add(model.pages.pages.firstWhere((x) => x.id == 2));
    }
    if (model.bmi > 0) {
      stacks.add(model.pages.pages.firstWhere((x) => x.id == 3));
    }
    if (model.ulValue > 0) {
      stacks.add(model.pages.pages.firstWhere((x) => x.id == 4));
    }
    if (model.q2Answer == 2) {
      stacks.add(model.pages.pages.firstWhere((x) => x.id == 15));
    }
    if (model.q2Answer == 4) {
      stacks.add(model.pages.pages.firstWhere((x) => x.id == 16));
    }
    if (model.q2Answer == 6) {
      stacks.add(model.pages.pages.firstWhere((x) => x.id == 17));
    }
  }

  //DrugsInteraction
  List<DrugInteractionRowModel> get drugsInteraction =>
      model.drugInteractions?.drugs ?? [];
  List<DrugInteractionRowModel> filteredDrugs = [];

  initDrugInteraction() async {
    if (model.drugInteractions == null) {
      List<dynamic> drugsJson = jsonDecode(
          await rootBundle.loadString('assets/data/drug_interaction.json'));
      model.drugInteractions = DrugInteractionModel.fromJson(drugsJson);
      update();
    }
  }

  void filterDrugsInteraction(String query) {
    filteredDrugs = drugsInteraction
        .where(
            (drug) => drug.drugName.toLowerCase().contains(query.toLowerCase()))
        .toList();
    update();
  }

  void toggleDrugInteraction(int index) {
    filteredDrugs[index].isChecked = !filteredDrugs[index].isChecked;
    update();
  }
}
