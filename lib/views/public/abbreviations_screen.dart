import 'package:drtest/tools/core.dart';
import 'package:flutter/material.dart';

class AbbreviationsScreen extends StatelessWidget {
  const AbbreviationsScreen({super.key});
  
  final text = """AF: Atrial Fibrillation
AFL: Atrial Flutter
OACs: Oral Anti-Coagulants
DOAC: Direct Oral Anti-Coagulant
NOAC: New Oral Anti-Coagulant
VKA: Vitamin K Antagonist
MS: Mitral Stenosis
LV dysfunction: Left Ventricular dysfunction
HCM: Hypertrophic Cardiomyopathy
TIA: Transient Ischemic Attack
CAD: Coronary Artery Disease
PAD: Peripheral Artery Disease
TOE: Trans-Oesophageal Echocardiogram
LA ablation: Left Atrium Ablation
LAA: Left Atrial Appendage 
LAAO: Left Atrial Appendage Occlusion
pLAAO: Percutaneous Left Atrial Appendage Occlusion
ICH: Intracerebral Hemorrhage
SBP: Systolic Blood Pressure
TTR: Time in Therapeutic Range 
INR: International Normalized Ratio
CrCL: Creatinine Clearance
CKD: Chronic Kidney Disease
BMI: Body Mass Index
UFH: Unfractionated Heparin
LMWH: Low Molecular Weight Heparin
VTE: Venous Thromboembolism
MHV: Mechanical Heart Valve
BHV: Bioprosthetic Heart Valve
SDM: Shared Decision-Making 
aPTT: Activated Partial Thromboplastin Time
SC: Subcutaneous 
IV: Intravenous
HIT: Heparin-Induced Thrombocytopenia
OD: Optical Density
SRA: Serotonin Release Assay
HIPA: Heparin-Induced Platelet Aggregation
ACS: Acute Coronary Syndrome
PCI: Percutaneous Coronary Intervention
PCC: Prothrombin Complex Concentrate
FFP: Fresh Frozen Plasma
IPH: Intraparenchymal Hemorrhage 
IE: Infective Endocarditis
CABG: Coronary Artery Bypass Graft
SAH: Subarachnoid Hemorrhage
LRFM: Lifestyle and Risk Factor Modification
QOL: Quality of Life
PE: Pulmonary Emboli
CCS: Chronic Coronary Syndrome
DAPT: Dual Anti-platelet Therapy
CVD: Cerebrovascular Disease
STEMI: ST-Elevation Myocardial Infarction
ACT: Activated Clotting Time
LAA Thrombosis: Left Atrial Appendage Thrombosis
ICD: Implantable Cardioverter Defibrillator
AVR: Aortic Valve Replacement
""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Abbreviations"),
      ),
      body: ListView(
        padding: AppConst.defaultPadding,
        children: [
          Text(
            text,
            style: AppTextStyles.text2,
          ),
        ],
      ),
    );
  }
}
