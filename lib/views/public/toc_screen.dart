import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/models/models.dart';
import 'package:drtest/models/question/part3_data.dart';
import 'package:drtest/tools/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TocModel {
  TocModel(this.title, this.childs, this.ontap);
  String title;
  List<String> childs;
  void Function() ontap;
}

class TocScreen extends StatelessWidget {
  TocScreen({super.key});
  final _testController = Get.put(TestController());

  List<TocModel> get tableOfContent => [
        TocModel(
            "Anticoagulant Selection",
            [
              'Confirm Diagnosis',
              'Evaluate Indications',
              'CHA2DS2-VASc Calculator',
              'Consider Contraindications',
              'HAS-BLED Calculator',
              'Cockcroft-Gault Calculator',
              'Child-Pugh Calculator',
              'Platelet Count',
              'BMI Calculator',
              'Clinical Scenarios for Anticoagulant Selection',
              'DOAC Drug Interactions',
            ],
            () => Get.toNamed("/test")),
        TocModel("Anticoagulant Dosing", [
          'Warfarin Dosing/ Need for Bridging',
          'Warfarin Dosing/ Initial dose, Maintenance Dose',
          'Warfarin Dosing/ Monitoring on the 3rd day',
          'Warfarin Dosing/ Maintenance dose Monitoring',
          'UFH Dosing',
          'UFH Dosing/ UFH Monitoring',
          'UFH Dosing/ Suspect for UFH Resistance',
          'UFH Dosing/ Need for Platelet Count Monitoring',
          'UFH Dosing/ Suspect for HIT',
          'UFH Dosing/ 4Ts Score Calculator',
          'Enoxaparin Dosing',
          'Enoxaparin Dosing/ Need for Monitoring',
          'Enoxaparin Dosing/ Need for Platelet Count Monitoring',
          'Enoxaparin Dosing/ Suspect for HIT',
          'Enoxaparin Dosing/ 4Ts Score Calculator',
          'Edoxaban Dosing',
          'Apixaban Dosing',
          'Rivaroxaban Dosing',
          'Dabigatran Dosing',
        ], () {
          _testController.initAll();
          _testController.model.ul = 250000;
          _testController.model.age = 25;
          _testController.model.weight = 65;
          _testController.model.height = 180;
          _testController.model.serumCreatinine = 1.2;

          _testController.calcAll();

          _testController.stacks.add(TestPageModel(
              title: "",
              value: "",
              type: TestPageTypeEnum.drug,
              drugs: [
                TestDrugPageModel("", [1, 2, 3, 4, 5, 6, 7]),
              ]));

          _testController.model.testFilteredDrug.drugs =
              _testController.model.drugs;

          Get.toNamed("/drugs");
        }),
        TocModel(
          "Anticoagulant Considerations",
          [
            'Management of Supratherapeutic INR',
            '4 Factor PCC Dosing/ FFP Dosing',
            'Management of Active Bleeding While on DOAC',
            'Activated PCC Dosing/ Idarucizumab Dosing',
            '4 factor PCC Dosing/ Andexanet alfa Dosing',
            'AF + ICH',
            'Post-operative AF',
            'AF due to Hyperthyroidism',
            'AF + Infective Endocarditis',
            'AF + CABG',
            'AF + Subarachnoid Hemorrhage',
            'AF + Epidural/Subdural Hematoma',
            'DOAC Dosing Error in AF Patients',
            'Administration of DOAC in Crushed Form',
            'Switching between Anticoagulants',
            'Modifiable Risk Factors in AF Patients',
            'AF Monitoring',
            'AF + PAD',
            'AF + CCS',
            'AF + ACS',
            'AF Ablation',
            'AF Cardioversion',
            'AF + Ischemic Stroke or TIA',
            'Pre/ Post-operative Management of OACs.',
            'Target INR in Patients with Mechanical Heart Valve',
          ],
          () {
            _testController.initAll();
            Get.toNamed("/part3", arguments: part3Data(TestModel()));
          },
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contents")),
      body: ListView.builder(
          padding: AppConst.defaultPadding,
          itemCount: tableOfContent.length,
          itemBuilder: (c, i) {
            var item = tableOfContent[i];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Column(
                children: [
                  appButton(title: item.title, onTap: item.ontap),
                  ListView.builder(
                    padding: AppConst.defaultPadding,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: item.childs.length,
                    itemBuilder: (context, index) {
                      var s = item.childs[index];
                      return Text(
                        "${index + 1} $s",
                        style: AppTextStyles.text3.apply(
                            color: index % 2 == 0
                                ? AppColors.textColor1
                                : AppColors.textColor3),
                      );
                    },
                  ),
                ],
              ),
            );
          }),
    );
  }
}
