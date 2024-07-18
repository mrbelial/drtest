import 'package:drtest/tools/core.dart';
import 'package:flutter/material.dart';

class TocScreen extends StatelessWidget {
  TocScreen({super.key});

  final List<String> tableOfContent = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contents")),
      body: ListView.builder(
          padding: AppConst.defaultPadding,
          itemCount: tableOfContent.length,
          itemBuilder: (c, i) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(
                "${i + 1} ${tableOfContent[i]}",
                style: AppTextStyles.text3.apply(
                    color: i % 2 == 0
                        ? AppColors.textColor1
                        : AppColors.textColor2),
              ),
            );
          }),
    );
  }
}
