import 'package:drtest/models/public/idtitle_model.dart';
import 'package:drtest/models/question/drug_dosing_data.dart';
import 'package:drtest/models/question/drug_interaction_model.dart';
import 'package:drtest/models/question/question_model.dart';
import 'package:drtest/response/question/question_response.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/views/drug/dosing/calc/ufh_screen.dart';
import 'package:drtest/views/drug/dosing/extra/ptt_calc_screen.dart';
import 'package:drtest/views/drug/dosing/extra/ts_calc_screen.dart';
import 'package:flutter/widgets.dart';
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

  TestDrugModel getDrugById(int ids) {
    return model.drugs.firstWhere((e) => ids.isEqual(e.id));
  }
  // void doTestPage(TestPageModel item) {
  //   //
  // }

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
  List<TestDrugPageModel> get selectedStackDrugs => stacks.last.drugs;
  // List<TestDrugPageModel> get selectedDrugsModel =>
  // model.selectedDrugs.map((x) => x.drugs);

  void addToDrugs(TestPageModel item) {
    stacks.last.drugs.addAll(item.drugs);
  }

  void initStack() {
    stacks.clear();
    model.initPages();

    if (model.cgAnswer > -1) {
      model.pages.pages.firstWhere((x) => x.id == 1).isMarked = true;
      // stacks.add(model.pages.pages.firstWhere((x) => x.id == 1));
    }
    if (model.cpPoint > 0) {
      model.pages.pages.firstWhere((x) => x.id == 2).isMarked = true;
      // stacks.add(model.pages.pages.firstWhere((x) => x.id == 2));
    }
    if (model.bmi > 0) {
      model.pages.pages.firstWhere((x) => x.id == 3).isMarked = true;
      // stacks.add(model.pages.pages.firstWhere((x) => x.id == 3));
    }
    if (model.ulValue > 0) {
      model.pages.pages.firstWhere((x) => x.id == 4).isMarked = true;
      // stacks.add(model.pages.pages.firstWhere((x) => x.id == 4));
    }
    if (model.q2Answer == 2) {
      model.pages.pages.firstWhere((x) => x.id == 15).isMarked = true;
      // stacks.add(model.pages.pages.firstWhere((x) => x.id == 15));
    }
    if (model.q2Answer == 4) {
      model.pages.pages.firstWhere((x) => x.id == 16).isMarked = true;
      // stacks.add(model.pages.pages.firstWhere((x) => x.id == 16));
    }
    if (model.q2Answer == 6) {
      model.pages.pages.firstWhere((x) => x.id == 17).isMarked = true;
      // stacks.add(model.pages.pages.firstWhere((x) => x.id == 17));
    }
  }

  void fillStack() {
    stacks.clear();
    stacks.addAll(model.pages.pages.where((e) => e.isMarked).toList());

    stacks.add(TestPageModel(
        title: "Result",
        value: "Result",
        type: TestPageTypeEnum.result,
        drugs: []));
  }

  int get stackCount => model.pages.pages.where((e) => e.isMarked).length;

  //Test Drug Page
  void initTestFilteredDrugs() {
    for (var item in selectedStackDrugs) {
      model.testFilteredDrug.titles.add(item.title);

      for (var drug in item.drugIds) {
        if (!model.testFilteredDrug.drugIds.contains(drug)) {
          model.testFilteredDrug.drugIds.add(drug);
        }
      }
    }

    model.testFilteredDrug.drugs =
        getDrugsByIDs(model.testFilteredDrug.drugIds.toList());
  }

  TestDrugStyleModel getDrugInteractions(int drugId) {
    var selectedInteractionDrugs = drugsInteraction
        .where((e) =>
            e.isChecked && e.drugInteractions.any((x) => x.drugId == drugId))
        .map((e) => e.drugInteractions.firstWhere((x) => x.drugId == drugId))
        .toList();

    TestDrugStyleModel response = TestDrugStyleModel();

    if (selectedInteractionDrugs.isNotEmpty) {
      int redInteractions = selectedInteractionDrugs
          .where((item) => item.type == DrugInteractionEnum.red)
          .length;

      int darkBlueInteractions = selectedInteractionDrugs
          .where((item) => item.type == DrugInteractionEnum.darkBlue)
          .length;

      int yellowInteractions = selectedInteractionDrugs
          .where((item) => item.type == DrugInteractionEnum.yellow)
          .length;

      int lightBlueInteractions = selectedInteractionDrugs
          .where((item) => item.type == DrugInteractionEnum.lightBlue)
          .length;

      int purpleInteractions = selectedInteractionDrugs
          .where((item) => item.type == DrugInteractionEnum.purple)
          .length;

      if (redInteractions > 0) {
        response.message = model.drugInteractions.redMessage;
        response.color = AppColors.red;
        response.isAllowed = false;
      } else if (darkBlueInteractions > 0) {
        response.message = model.drugInteractions.darkBlueMessage;
        response.color = AppColors.yellow;
        response.isAllowed = false;
      } else if (yellowInteractions > 1) {
        response.message = model.drugInteractions.yellowMessage;
        response.color = AppColors.blue;
        response.isAllowed = false;
      } else if (lightBlueInteractions > 1) {
        response.message = model.drugInteractions.lightBlueMessage;
        response.color = AppColors.blue2;
        response.isAllowed = false;
      } else if (purpleInteractions > 0) {
        response.message = model.drugInteractions.purpleMessage;
        response.color = AppColors.purple;
        response.isAllowed = true;
      }
    }

    return response;
  }

  //DrugsInteraction
  List<DrugInteractionRowModel> get drugsInteraction =>
      model.drugInteractions.drugs;
  var drugInteractionQuery = "".obs;
  var drugInteractionOnlySelected = false.obs;

  void filterDrugsInteraction(String query) {
    drugInteractionQuery.value = query;
  }

  List<DrugInteractionRowModel> get filteredDrugsInteraction => drugsInteraction
      .where((drug) =>
          drug.drugName
              .toLowerCase()
              .contains(drugInteractionQuery.toLowerCase()) &&
          (!drugInteractionOnlySelected.value ||
              drug.isChecked == drugInteractionOnlySelected.value))
      .toList();

  void toggleDrugInteraction(int index, _) {
    filteredDrugsInteraction[index].isChecked =
        !filteredDrugsInteraction[index].isChecked;
    isloading = false;
  }

  //Drug Dosing
  DrugDosingModel get selectedDrugDosing =>
      model.drugDosing[model.selectedDrugDosing];

  void initDrugDosing() {
    model.drugDosing = drugDosing(model);
  }

  void selectDrugDosing(int id) {
    model.selectedDrugDosing =
        model.drugDosing.indexWhere((x) => x.drugId == id);
  }

  Widget getDrugDosingWidget(DrugDosingParams item) {
    switch (item.page) {
      case "/ufh_dosing":
        return UFHDosingScreen(item: item);
      case "/ptt_dosing":
        return PTTCalcScreen(item: item);
      case "/ts_dosing":
        return TsScoreScreen(item: item);
      default:
        return Container();
    }
  }

  //UFH Dosing
  set aptt(int v) => _responseObs.update((val) => val!.content!.aptt = v);
  set xaActivity(double v) =>
      _responseObs.update((val) => val!.content!.xaActivity = v);

  List<String> get apptDesciption => [
        """Consider bolus 25 Unit/kg (${model.perWeight(25)}).
Increase infusion by 3 unit/kg/hour (${model.perWeight(3)}).
Repeat assay in 6 hours.""",
        """Increase infusion by 2 unit/kg/hour (${model.perWeight(2)}).
Repeat assay in 6 hours.""",
        """Increase infusion by 1 unit/kg/hour (${model.perWeight(1)}).
Repeat assay in 6 hours.""",
        """No change. (within therapeutic range)
Repeat assay in 6 hours.
Once therapeutic for two assays, may change to once daily assays.""",
        """Decrease infusion by 1 unit/kg/hour (${model.perWeight(1)}).
Repeat assay in 6 hours.""",
        """Stop infusion for 1 hour, then decrease by 2 unit/kg/hour (${model.perWeight(2)}).
Repeat assay 6 hours after restarting the infusion.""",
        """Stop infusion for 1 hour, then decrease by 3 unit/kg/hour (${model.perWeight(3)}).
Repeat assay 6 hours after restarting the infusion.""",
        """Stop infusion for 2 hour, then decrease by 4 unit/kg/hour (${model.perWeight(4)}).
Repeat assay 6 hours after restarting the infusion.""",
        """Stop infusion for 2 hour, then decrease by 5 unit/kg/hour (${model.perWeight(5)}) and notify clinician.
Repeat assay 6 hours after restarting the infusion.""",
      ];

  String apttDesc() {
    if (model.aptt > 0) {
      switch (model.aptt) {
        case < 40:
          return apptDesciption[0];
        case < 50:
          return apptDesciption[1];
        case < 70:
          return apptDesciption[2];
        case < 111:
          return apptDesciption[3];
        case < 121:
          return apptDesciption[4];
        case < 131:
          return apptDesciption[5];
        case < 141:
          return apptDesciption[6];
        case < 151:
          return apptDesciption[7];
        case > 150:
          return apptDesciption[8];
        default:
          return "";
      }
    } else if (model.xaActivity > 0) {
      switch (model.xaActivity) {
        case < .10:
          return apptDesciption[0];
        case < .20:
          return apptDesciption[1];
        case < .30:
          return apptDesciption[2];
        case < .71:
          return apptDesciption[3];
        case < .80:
          return apptDesciption[4];
        case < .90:
          return apptDesciption[5];
        case < 1:
          return apptDesciption[6];
        case < 1.1:
          return apptDesciption[7];
        case > 1.0:
          return apptDesciption[8];
        default:
          return "";
      }
    }
    return "";
  }

  //tsScore

  //Child Pugh Calculator
  void tsAnswer(int i, int v, int p) {
    _responseObs.update((val) {
      val!.content!.tsScore[i].selectedID = v;
      val.content!.tsScore[i].point = p;
      calcCP();
    });
  }

  IDTitleModel calcTS() {
    var p = 0;
    for (var item in model.tsScore) {
      p += item.point;
    }
    model.tsPoint = p;
    return IDTitleModel(p, model.tsAnswer());
  }
}
