import 'package:drtest/models/dosing/dabigatran_dosing_model.dart';
import 'package:drtest/models/dosing/edoxaban_dosing_model.dart';
import 'package:drtest/models/public/checkbox_model.dart';
import 'package:drtest/models/public/idtitle_model.dart';
import 'package:drtest/models/question/drug_dosing_data.dart';
import 'package:drtest/models/question/drug_interaction_model.dart';
import 'package:drtest/models/question/question_model.dart';
import 'package:drtest/response/question/question_response.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/views/drug/dosing/dabigatran_dosing_screen.dart';
import 'package:drtest/views/drug/dosing/edoxaban_dosing_screen.dart';
import 'package:drtest/views/drug/dosing/lmwh_dosing_screen.dart';
import 'package:drtest/views/drug/dosing/ufh_screen.dart';
import 'package:drtest/views/drug/dosing/ptt_calc_screen.dart';
import 'package:drtest/views/drug/dosing/ts_calc_screen.dart';
import 'package:drtest/views/drug/dosing/wafarin_extra_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  void closeDosing() {
    Get.offNamedUntil(
        "/home", (route) => route.settings.name != '/drug_dosing');
  }

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
        "0 point in male or 1 point in female (Estimated annual thromboembolic risk of <  1%)\nIt is reasonable to omit anticoagulant therapy. (AHA/ACC/HRS AF 2019 IIa B)\nShould not be offered antithrombotic therapy. (ESC 2020 1 A)";

    if (tp > 1) {
      msg =
          "CHA2DS2-VASc Score of ≥ 2 in men and ≥ 3 in women (Estimated annual thromboembolic risk of ≥ 2% per year)\nAnticoagulation is recommended to prevent stroke and systemic thromboembolism.\n(AHA/ACC/ACCP/HRS AF 2023, 1 A)\n(ESC 2020 AF 1A)\n(AHA/ACC/HRS AF 2019 1 A)";
    } else if (tp > 0) {
      msg =
          """CHA2DS2-VASc of 1 point in male or 2 points in female (Estimated annual thromboembolic risk of ≥ 1% but <2% per year)
Anticoagulation is reasonable to prevent stroke and systemic thromboembolism.
(AHA/ACC/ACCP/HRS AF 2023, 2a  A), (ESC 2020 AF IIa B)
Prescribing an oral anticoagulant to reduce thromboembolic stroke risk may be considered. (AHA/ACC/HRS AF 2019 IIb C-LD)
Patients with AF at intermediate annual risk of thromboembolic events by risk scores (eg, equivalent to CHA2DS2-VASc score of 1 in men or 2 in women), who remain uncertain about the benefit of anticoagulation, can benefit from consideration of factors that might modify their risk of stroke to help inform the decision. (AHA/ACC/ACCP/HRS AF 2023, 2a  C-LD)""";
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
        """In patients who are deemed at high risk for stroke, bleeding risk scores should not be used in isolation to determine eligibility for oral anticoagulation but instead to identify and modify bleeding risk factors and to inform medical decision-making. (AHA/ACC/ACCP/HRS AF 2023, No benefit B-NR)
Estimated bleeding risk, in the absence of absolute contraindications to OAC, should not in itself guide treatment decisions to use OAC for stroke prevention. (ESC 2020 AF III A).
Concomitant regular administration of antiplatelet drugs or non-steroidal anti-inflammatory drug (NSAID) should be avoided in anticoagulated patients. (ECS 2020 AF)
Bleeding risk is dynamic, and attention to the change in bleeding risk profile is a stronger predictor of major bleeding events. (ESC 2020 AF)
Stroke and bleeding risk reassessment at periodic intervals is recommended to inform treatment decisions (e.g. initiation of OAC in patients no longer at low risk of stroke) and address potentially modifiable bleeding risk factors. (ESC 2020 AF, I)
Consider modifiable bleeding risk factors including Hypertension/elevated SBP, Concomitant antiplatelet/NSAID, Excessive alcohol intake, Non-adherence to OAC. (AF ESC 2020)
Assessment of risk factors specific for bleeding may suggest interventions to reduce bleeding risk, such as discontinuing antiplatelet medications or nonsteroidal anti-inflammatory medications or the use of LAAO device. (AHA ACC ACCP HRS 2023)
Patients at high bleeding risk (eg HAS-BLED ≥3) should have their modifiable bleeding risk factors identified and addressed,1, 44 and should be scheduled for an earlier and more frequent clinical follow-up. (EHRA NOAC AF 2021)""";

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

  void addToDrugs(TestPageModel item, String title) {
    for (var item in item.drugs) {
      item.title = "$title\n ${item.title}";
    }
    stacks.last.drugs.addAll(item.drugs);
  }

  void initStack() {
    stacks.clear();
    model.initPages();

    if (model.cgAnswer > -1) {
      model.pages.pages.firstWhere((x) => x.id == 1).isMarked = true;
      // stacks.add(model.pages.pages.firstWhere((x) => x.id == 1));
    }
    if (model.cpPoint >= 5) {
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
    if (model.q2Answer == 10) {
      model.pages.pages.firstWhere((x) => x.id == 18).isMarked = true;
    }
  }

  void fillStack() {
    stacks.clear();
    stacks.addAll(model.pages.pages.where((e) => e.isMarked).toList());

    stacks.add(TestPageModel(
      title: "Result",
      value: "Result",
      page: "/drug_interaction",
      type: TestPageTypeEnum.toPage,
    ));

    stacks.add(TestPageModel(
        title: "Result",
        value: "Result",
        type: TestPageTypeEnum.result,
        drugs: []));
  }

  int get stackCount => model.pages.pages.where((e) => e.isMarked).length;
  List<TestPageModel> banList = [];

  //Test Drug Page
  void initTestFilteredDrugs() {
    model.testFilteredDrug.titles = [];
    model.testFilteredDrug.drugIds = {};

    var v = model.pages.pages.firstWhereOrNull((x) => x.id == 4);
    if (v != null) {
      var v2 = v.pages.firstWhereOrNull((x) => x.id == 4);
      if (v2 != null) {
        if (v2.isMarked) {
          model.testFilteredDrug.titles.add("${v.value} ${v2.title}");
          return;
        }
      }
    }

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

  List<DrugInteractionWithType> selectedInteractionDrugList() {
    List<DrugInteractionWithType> selectedInteractionDrugs = [];
    drugsInteraction
        .where((e) => e.isChecked)
        .forEach((e) => selectedInteractionDrugs.addAll(e.drugInteractions));

    return selectedInteractionDrugs;
  }

  TestDrugStyleModel getDrugInteractions(int drugId) {
    List<DrugInteractionWithType> selectedInteractionDrugs = [];
    drugsInteraction
        .where((e) =>
            e.isChecked && e.drugInteractions.any((x) => x.drugId == drugId))
        .forEach((e) => selectedInteractionDrugs
            .addAll(e.drugInteractions.where((x) => x.drugId == drugId)));

    TestDrugStyleModel response = TestDrugStyleModel();

    if (selectedInteractionDrugs.isNotEmpty) {
      int redInteractions = 0;
      int darkBlueInteractions = 0;
      int yellowInteractions = 0;
      int lightBlueInteractions = 0;
      int purpleInteractions = 0;

      // redInteractions = selectedInteractionDrugs
      //     .where((item) => item.type == DrugInteractionEnum.red)
      //     .where((item) => item.calcType == DrugInteractionCalcType.check)
      //     .length;

      // darkBlueInteractions = selectedInteractionDrugs
      //     .where((item) => item.type == DrugInteractionEnum.darkBlue)
      //     .where((item) => item.calcType == DrugInteractionCalcType.check)
      //     .length;

      // yellowInteractions = selectedInteractionDrugs
      //     .where((item) => item.type == DrugInteractionEnum.yellow)
      //     .where((item) => item.calcType == DrugInteractionCalcType.check)
      //     .length;

      // lightBlueInteractions = selectedInteractionDrugs
      //     .where((item) => item.type == DrugInteractionEnum.lightBlue)
      //     .where((item) => item.calcType == DrugInteractionCalcType.check)
      //     .length;

      // purpleInteractions = selectedInteractionDrugs
      //     .where((item) => item.type == DrugInteractionEnum.purple)
      //     .where((item) => item.calcType == DrugInteractionCalcType.check)
      //     .length;

      //Drug Interaction calc Type != check
      for (var item in selectedInteractionDrugs) {
        DrugInteractionEnum color = DrugInteractionEnum.none;

        switch (item.calcType) {
          case DrugInteractionCalcType.ageLess:
            if (model.age < item.value) {
              color = item.type;
            }
            break;
          case DrugInteractionCalcType.ageMore:
            if (model.age > item.value) {
              color = item.type;
            }
            break;
          case DrugInteractionCalcType.check:
            color = item.type;
            break;
          case DrugInteractionCalcType.crcfLess:
            if (model.cgAnswer < item.value) {
              color = item.type;
            }
            break;
          case DrugInteractionCalcType.crcfMore:
            if (model.age > item.value) {
              color = item.type;
            }
            break;
          case DrugInteractionCalcType.weightLess:
            if (model.weight < item.value) {
              color = item.type;
            }
            break;
          case DrugInteractionCalcType.weightMore:
            if (model.age > item.value) {
              color = item.type;
            }
            break;
          case DrugInteractionCalcType.singleRed:
            color = item.type;
            break;
        }
        switch (color) {
          case DrugInteractionEnum.red:
            redInteractions++;
            break;
          case DrugInteractionEnum.darkBlue:
            darkBlueInteractions++;
            break;
          case DrugInteractionEnum.yellow:
            yellowInteractions++;
            break;
          case DrugInteractionEnum.lightBlue:
            lightBlueInteractions++;
            break;
          case DrugInteractionEnum.purple:
            purpleInteractions++;
            if (item.desc.isNotEmpty) {
              response.purpleMessage += "\n${item.desc}";
            }
            break;
          case DrugInteractionEnum.none:
            break;
        }
      }

      if (redInteractions > 0) {
        response.message = model.drugInteractions.redMessage;
        response.extra = "(Contraindicated)";
        response.color = AppColors.red;
        response.isAllowed = false;
        response.type = DrugInteractionEnum.red;
      } else if (darkBlueInteractions > 0) {
        response.message = model.drugInteractions.darkBlueMessage;
        response.extra = "(Contraindicated)";
        response.color = AppColors.red;
        response.type = DrugInteractionEnum.darkBlue;
        // response.color = AppColors.blue;
        response.isAllowed = false;
      } else if (yellowInteractions > 1) {
        response.message = model.drugInteractions.yellowMessage;
        response.extra = "(Caution Required)";
        response.color = AppColors.yellow;
        response.type = DrugInteractionEnum.yellow;
        response.isAllowed = false;
      } else if (lightBlueInteractions > 1) {
        response.message = model.drugInteractions.lightBlueMessage;
        response.extra = "(Caution Required)";
        response.color = AppColors.yellow;
        response.type = DrugInteractionEnum.lightBlue;
        // response.color = AppColors.blue2;
        response.isAllowed = false;
      } else if (purpleInteractions > 0) {
        response.message = model.drugInteractions.purpleMessage;
        response.color = AppColors.purple;
        response.type = DrugInteractionEnum.purple;
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

  void initDrugInteraction() {
    for (var drug in drugsInteraction) {
      for (var item in drug.drugInteractions) {
        switch (item.calcType) {
          case DrugInteractionCalcType.ageLess:
            if (model.age < item.value) {
              drug.isChecked = true;
            }
            break;
          case DrugInteractionCalcType.ageMore:
            if (model.age > item.value) {
              drug.isChecked = true;
            }
            break;
          case DrugInteractionCalcType.check:
            break;
          case DrugInteractionCalcType.crcfLess:
            if (model.cgAnswer < item.value) {
              drug.isChecked = true;
            }
            break;
          case DrugInteractionCalcType.crcfMore:
            if (model.age > item.value) {
              drug.isChecked = true;
            }
            break;
          case DrugInteractionCalcType.weightLess:
            if (model.weight < item.value) {
              drug.isChecked = true;
            }
            break;
          case DrugInteractionCalcType.weightMore:
            if (model.age > item.value) {
              drug.isChecked = true;
            }
            break;
          case DrugInteractionCalcType.singleRed:
            break;
        }
      }
    }
  }

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
    // var isRDB = filteredDrugsInteraction[index].drugInteractions.any((item) => [
    //       DrugInteractionEnum.red,
    //       DrugInteractionEnum.darkBlue
    //     ].contains(item.type));

    // if (isRDB) {
    //   var singleRed = selectedInteractionDrugList()
    //       .where((x) => x.calcType == DrugInteractionCalcType.singleRed)
    //       .length;

    //   if (singleRed > 0) {
    //     ShowMSG.error("Warning", "Can not select this drug");
    //     return;
    //   }
    // }
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
      case "/lmwh_dosing":
        return LMWHDosingScreen(item: item);
      case "/wafarin_extra":
        return WafarinExtraScreen();
      case "/edoxaban_dosing":
        return EdoxabanDosingScreen();
      case "/dabigatran_dosing":
        return DabigatranDosingScreen();
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
  void tsAnswer(int i, int v, int p) {
    _responseObs.update((val) {
      val!.content!.tsScore[i].selectedID = v;
      val.content!.tsScore[i].point = p;
      calcTS();
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

  List<String> initLMWHDosing() {
    List<String> list = [];
    if (model.cgAnswer < 30) {
      list.add(
          "CrCl < 30 ml/min:\n1 mg/kg (${model.perWeight(1)}) SC once daily.");
    }

    if (model.bmi < 18 || model.weight < 55) {
      list.add(
          "BMI < 18 Kg/m2 or Total body weight < 55 Kg:\n1 mg/kg (${model.perWeight(1)}) SC twice daily.");
    }

    if (model.bmi >= 40) {
      list.add(
          "BMI ≥ 40:\n0.7-0.8 mg/kg (${model.perWeight(.7)}-${model.perWeight(.8)}) twice daily.");
    }

    if (stacks.indexWhere((x) => x.id == 12) > -1) {
      list.add("Pregnancy:\n1 mg/kg (${model.perWeight(1)}) SC twice daily.");
    }

    if (stacks.indexWhere((x) => x.id == 7) > -1) {
      list.add("Cancer:\n1 mg/kg (${model.perWeight(1)}) SC twice daily.");
    }

    if (list.isEmpty) {
      list.add(
          "None:\n1.5 mg/kg (${model.perWeight(1.5)}) once daily or 1 mg/kg (${model.perWeight(1)}) SC twice daily.");
    }

    return list;
  }

  final _edoxabanDosingModel = EdoxabanDosingModel().obs;
  EdoxabanDosingModel get edoxabanDosingModel => _edoxabanDosingModel.value;
  set edoxabanLoading(bool v) =>
      _edoxabanDosingModel.update((val) => val!.isloading = v);

  void edoxabanDosingInit() {
    if (edoxabanDosingModel.list.isEmpty) {
      var status = getDrugInteractions(5);
      edoxabanDosingModel.list = [
        CheckBoxModel("CrCl 15 - 50 mL/min?", 0,
            model.cgAnswer >= 15 && model.cgAnswer <= 30),
        CheckBoxModel("Body weight ≤ 60 kg?", 0, model.weight <= 60),
        CheckBoxModel(
            "Concomitant use of strong P-Gp inhibitor (e.g verapamil, quinidine, or dronedarone)?",
            5,
            status.type == DrugInteractionEnum.purple,desc: "30 mg QD"),
        CheckBoxModel(
            "Disproportionate and non-modifiable bleeding risk?", 0, false),
      ];
    }
  }

  String edoxabanDosing() {
    List<CheckBoxModel> list = [];
    list.addAll(edoxabanDosingModel.list.where((x) => x.checked));
    list.sort((a, b) => a.point.compareTo(b.point));
    return list.firstOrNull?.desc ?? "";

    // edoxabanDosingModel.getByPoint(2).checked
    //   ? getDrugInteractions(5).purpleMessage
    //   : edoxabanDosingModel.totalChecked > 0
    //       ? "30 mg daily or 15 mg daily.\n(AF ESC 2020)"
    //       : "60 mg daily.\n(AF ESC 2020)"
  }

  //Dabigatran
  final _dabigatranDosingModel = DabigatranDosingModel().obs;

  DabigatranDosingModel get dabigatranDosingModel =>
      _dabigatranDosingModel.value;

  set dabigatranLoading(bool v) =>
      _dabigatranDosingModel.update((val) => val!.isloading = v);

  void dabigatranDosingInit() {
    if (dabigatranDosingModel.list.isEmpty) {
      var status = getDrugInteractions(6);
      dabigatranDosingModel.list = [
        CheckBoxModel("Age >_80 years?", 0, model.age >= 80),
        CheckBoxModel(
            "Concomitant use of of strong P-Gp inhibitor (e.g. verapamil)",
            2,
            status.type == DrugInteractionEnum.purple),
        CheckBoxModel("History of GI bleeding", 0, false),
        CheckBoxModel(
            "Concerned about disproportionate and non-modifiable bleeding risk",
            0,
            false),
        CheckBoxModel("High bleeding risk (HAS-BLED >_3)", 0, false),
        CheckBoxModel(
            "Concomitant single or Dual antiplatelet therapy ? (IIa B)",
            0,
            false),
      ];
      dabigatranDosingModel.redlist = [
        CheckBoxModel(
            "Concomitant therapy of dronedarone or ketoconazole for patients with CrCl 30 to 50 mL/min?",
            0,
            false),
        CheckBoxModel("CrCl 15 to 30 mL/min?", 0,
            model.cgAnswer >= 15 && model.cgAnswer <= 30),
      ];
    }
  }

  String get dabigatranDosing => dabigatranDosingModel.totalRedChecked > 0
      ? "75 mg twice daily.\n(AHA ACC ACCP HRS 2023)"
      : dabigatranDosingModel.totalChecked > 0
          ? "110 mg twice daily.\n(AF ESC 2020)"
          : "150 mg twice daily.\n(AF ESC 2020)";
}
