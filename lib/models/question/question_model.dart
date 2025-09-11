import 'package:drtest/models/public/checkbox_model.dart';
import 'package:drtest/models/public/idtitle_model.dart';
import 'package:drtest/models/public/radiobox_model.dart';
import 'package:drtest/models/question/drug_dosing_data.dart';
import 'package:drtest/models/question/drug_interaction_model.dart';
import 'package:drtest/models/question/drug_interaction_data.dart';
import 'package:drtest/tools/core.dart';
import 'package:flutter/material.dart';

class TestModel {
  int id = 0;

  bool isFemale = false;
  int age = 0;
  int weight = 0;
  int height = 0;
  double serumCreatinine = 0;
  int? ul;
  int get ulValue => ul ?? 0;

  List<DrugDosingModel> drugDosing = [];
  int selectedDrugDosing = 0;

  String q1Desc =
      """● For patients with atrial flutter, anticoagulant therapy is recommended according to the same risk profile used for AF.(AHA/ACC/HRS 2019, I C)
● Oral anticoagulation is recommended in patients with atrial flutter at elevated thromboembolic risk to prevent ischemic stroke and thromboembolism. (ESC/EACTS/AF 2024 I B)""";

  double bmi = 0;
  int aptt = 0;
  double xaActivity = 0;

  double perWeight(double v) => double.parse((v * weight).toStringAsFixed(2));

  List<TestDrugModel> drugs = [
    TestDrugModel(1, "Warfarin"),
    TestDrugModel(2, "UFH"),
    TestDrugModel(3, "Enoxaparin"),
    TestDrugModel(4, "Apixaban"),
    TestDrugModel(5, "Edoxaban"),
    TestDrugModel(6, "Dabigatran"),
    TestDrugModel(7, "Rivaroxaban"),
  ];

  //Question 1
  String q1Title =
      "Clinical diagnosis of Atrial fibrillation or Atrial flutter?";
  bool q1Answer = false;

  //Question 2
  String q2Title = "Any of the following indications for OACs present?";
  int q2Answer = -1;
  List<IDTitleModel> qa2 = [
    IDTitleModel(
        7,
        "CHA2DS2-VA Score ≥ 2",
        """● Anticoagulation is recommended to prevent stroke and systemic thromboembolism. (AHA/ACC/ACCP/HRS AF 2023, 1 A), (AF/ESC 2020 1A), (AHA/ACC/HRS AF 2019 1 A)
● A CHA2DS2-VA score of 2 or more is recommended as an indicator of elevated thromboembolic risk for decisions on initiating oral anticoagulation. (ESC/EACTS/AF 2024 I C)"""),
    IDTitleModel(
        8,
        "CHA2DS2-VA Score = 1",
        """● A CHA2DS2-VA score of 1 should be considered an indicator of elevated thromboembolic risk for decisions on initiating oral anticoagulation. (ESC/EACTS/AF 2024 IIa C)
● Anticoagulation is reasonable to prevent stroke and systemic thromboembolism. (AHA/ACC/ACCP/HRS AF 2023, 2a A), (AF/ESC 2020 IIa B)
● Prescribing an oral anticoagulant to reduce thromboembolic stroke risk may be considered. (AHA/ACC/HRS AF 2019 IIb C-LD)
● Patients with AF at intermediate annual risk of thromboembolic events by risk scores (eg, equivalent to CHA2DS2-VASc score of 1 in men or 2 in women), who remain uncertain about the benefit of anticoagulation, can benefit from consideration of factors that might modify their risk of stroke to help inform the decision. (AHA/ACC/ACCP/HRS AF 2023, 2a C-LD)"""),
    IDTitleModel(9, "Don’t know the CHA2DS2-VA Score"),
    IDTitleModel(10, "Cardiac Amyloidosis (ESC/EACTS/AF 2024), (ACC Cardiac Amyloidosis 2023)",
        """● Oral anticoagulation is recommended in all patients with AF and hypertrophic cardiomyopathy or cardiac amyloidosis, regardless of CHA2DS2-VA score, to prevent ischemic stroke and thromboembolism. (ESC/EACTS/AF 2024 I B)
● Guidelines recommend anticoagulation when AF is present, regardless of the CHA2DS2-VASc risk score. (2023 ACC Expert Consensus Decision Pathway on Comprehensive Multidisciplinary Care for the Patient With Cardiac Amyloidosis)
● Anticoagulation in cardiac amyloidosis is currently recommended for stroke prophylaxis in AF, regardless of the CHA2DS2Vasc score, after careful assessment of bleeding risk. 
● Patients with cardiac amyloidosis have been found to have higher thromboembolic rates despite having a lower CHA2DS2Vasc score when compared with nonamyloid patients.
● The CHA2DS2Vasc score has shown a limited ability to identify patients at risk of thromboembolism, and it should not be used for the thromboembolic risk assessment or decision-making for anticoagulation initiation. (Bukhari S, Khan SZ, Bashir Z. Atrial fibrillation, thromboembolic risk, and anticoagulation in cardiac amyloidosis: a review. Journal of Cardiac Failure. 2023 Jan 1;29(1):76-86.)"""),
    IDTitleModel(
        0,
        "Rheumatic Mitral Stenosis (AHA/ACC/ACCP/HRS AF 2023)",
        """● In patients with mitral stenosis of moderate or greater severity and history of AF, long-term anticoagulation with warfarin is recommended over DOACs, independent of the CHA2DS2- VASc score to prevent cardiovascular events, including stroke or death. (AHA/ACC/ACCP/HRS AF 2023, 1 B-R)
● For patients with AF and rheumatic MS, long-term VKA oral anticoagulation is recommended. (ACC/AHA/VHD 2020, 1 C-EO)"""),
    IDTitleModel(
        1,
        "Mechanical heart valve implementation (ESC VHD 2021), (ESC VHD 2020)",
        """● OAC using a VKA is recommended lifelong for all patients with a MHV prosthesis. \n(ESC/VHD 2021 I B)\n
● In patients with a mechanical prosthetic valve, anticoagulation with a VKA is recommended.\n(ACC/AHA/VHD 2020 1 A)"""),
IDTitleModel(
        2,
        "Hypertrophic Cardiomyopathy (ESC/EACTS/AF 2024), (AHA/ACC/ACCP/HRS AF 2023), (EHRA/NOAC AF 2021)",
        """● Oral anticoagulation is recommended in all patients with AF and hypertrophic cardiomyopathy or cardiac amyloidosis, regardless of CHA2DS2-VA score, to prevent ischemic stroke and thromboembolism. (ESC/EACTS/AF 2024 I B)
● In patients with HCM and clinical AF, anticoagulation is recommended with direct-acting oral anticoagulants (DOACs) as first-line option and vitamin K antagonists as second-line option, independent of CHA2DS2-VASc score. (2024 AHA/ACC/AMSSM/HRS/PACES/SCMR Guideline for the Management of Hypertrophic Cardiomyopathy)
● In hypertrophic cardiomyopathy, the risk of stroke is high enough independent of risk score to indicate anticoagulation. (AHA/ACC/ACCP/HRS AF 2023)
● Hypertrophic cardiomyopathy  have roughly an equivalent risk to a CHADsVASc of 3. (AHA/ACC/ACCP/HRS AF 2023)
● In both obstructive and non-obstructive hypertrophic cardiomyopathy, AF is associated with a high rate of thromboembolism. (EHRA/NOAC AF 2021)
● Patients with hypertrophic cardiomyopathy may be eligible for NOAC therapy. (EHRA/NOAC AF 2021)"""),
    IDTitleModel(
        3,
        "First 3 months after bioprosthetic heart valve implementation (ESC/VHD 2021), (ACC/AHA/VHD 2020)",
        """● For patients with new-onset AF ≤3 months after surgical or transcatheter bioprosthetic valve replacement, anticoagulation with a VKA is reasonable.\n(ACC/AHA/VHD 2020 2a B-NR)\n
● OAC using a VKA should be considered for the first 3 months after surgical implantation of a bio prosthesis in the mitral or tricuspid position.\n(ESC/VHD 2021 IIa B)"""),
    IDTitleModel(4, """Congenital heart disease
Moderate or severe forms of congenital heart disease including: 
● low-flow states such as Fontan circulation, blind-ending cardiac chambers, and cyanosis. (AHA/ACC/ACCP/HRS AF 2023)
● Intracardiac repair, cyanosis, Fontan palliation, or systemic right ventricle and a history of AF, AFL, or intra-atrial re-entrant tachycardia. (AF/ESC 2020)""",
        """● It may be reasonable to treat with anticoagulation independent of conventional risk score to reduce risk of thromboembolic events. (AHA/ACC/ACCP/HRS AF 2023, 2b C-LD)
● Oral anticoagulation should be considered in all adult congenital heart disease patients with AF/AFL and intracardiac repair, cyanosis, Fontan palliation, or systemic right ventricle to prevent ischaemic stroke and thromboembolism, regardless of other thromboembolic risk factors. (ESC/EACTS/AF 2024)
● Oral anticoagulation should be considered in all adult patients with intracardiac repair, cyanosis, Fontan palliation, or systemic right ventricle and a history of AF, AFL, or intra-atrial re-entrant tachycardia. (AF/ESC 2020 IIa C)"""),
    IDTitleModel(5, """Cardioversion
● 3 weeks before elective cardioversion when AF duration is ≥ 48 hours or unknown without imaging evaluation. (AHA/ACC/ACCP/HRS AF 2023), (AHA/ACC/HRS 2019), (EHRA/NOAC AF 2021).
● Cardioversion during the last 4 weeks when AF duration of ≥24 hours (AF/ESC 2020), or ≥ 48 hours (AHA/ACC/HRS 2019), or regardless of duration. (AHA/ACC/ACCP/HRS AF 2023)""",
        """● In patients with AFL who undergo successful cardioversion or ablation resulting in restoration of sinus rhythm, anticoagulation should be continued for at least 4 weeks post procedure. (AHA/ACC/ACCP/HRS AF 2023, 1 C-LD)
● Therapeutic oral anticoagulation for at least 3 weeks (adherence to DOACs or INR ≥2.0 for VKAs) is recommended before scheduled cardioversion of AF and atrial flutter to prevent procedure-related thromboembolism. (ESC/EACTS/AF 2024 I B)
● Oral anticoagulation is recommended to continue for at least 4 weeks in all patients after cardioversion and long-term in patients with thromboembolic risk factor(s) irrespective of whether sinus rhythm is achieved, to prevent thromboembolism.(ESC/EACTS/AF 2024 I B)
● In patients with AF duration of ≥48 hours, a 3-week duration of uninterrupted therapeutic anticoagulation or imaging evaluation to exclude intracardiac thrombus is recommended before elective cardioversion. (AHA/ACC/ACCP/HRS AF 2023, 1 B-R) 
● In patients with AF undergoing cardioversion, therapeutic anticoagulation should be established before cardioversion and continued for at least 4 weeks afterwards without interruption to prevent thromboembolism. (AHA/ACC/ACCP/HRS AF 2023, 1 B-NR)
● For patients with AF or atrial flutter of 48 hours duration or longer, or when the duration of AF is unknown, anticoagulation with warfarin (INR 2.0 to 3.0), a factor Xa inhibitor, or direct thrombin inhibitor is recommended for at least 3 weeks before and at least 4 weeks after cardioversion, regardless of the CHA2DS2-VASc score or the method (electrical or pharmacological) used to restore sinus rhythm. (AHA/ACC/HRS 2019 I B-R)
● For patients with AF or atrial flutter of more than 48 hours duration or unknown duration that requires immediate cardioversion for hemodynamic instability, anticoagulation should be initiated as soon as possible and continued for at least 4 weeks after cardioversion unless contraindicated.(AHA/ACC/HRS 2019 I C)
● In patients with AF of >48 h (or unknown) duration undergoing electrical or pharmacological cardioversion, effective oral anticoagulation needs to be established for at least 3 weeks prior to cardioversion or a pre-cardioversion transesophageal echocardiography needs to rule out left atrial thrombi, irrespective of CHA2DS2-VASc score. (EHRA/NOAC AF 2021)
● In patients with AF duration of >24 h undergoing cardioversion, therapeutic anticoagulation should be continued for at least 4 weeks even after successful cardioversion to sinus rhythm.(AF/ESC 2020 IIa B)
● For cardioversion of AF/AFL, effective anticoagulation is recommended for a minimum of 3 weeks before cardioversion. (AF/ESC 2020 IB)
● In patients with a definite duration of AF≤ 24 h and a very low stroke risk (CHA2DS2-VASc of 0 in men or 1 in women) post-cardioversion anticoagulation for 4 weeks may be omitted. (AF/ESC 2020 IIb C)"""),
    IDTitleModel(6, """Ablation
● Catheter ablation during the last 3 months. (AHA/ACC/ACCP/HRS AF 2023)
● Surgical ablation during the last 3 months. (AHA/ACC/ACCP/HRS AF 2023)
● Catheter ablation during the last 2 months. (ESC/EACTS/AF 2024), (AF/ESC 2020)
● Planning for catheter ablation in the next 3 weeks without imaging. (AF/ESC 2020)""",
        """● In patients who have undergone catheter ablation of AF, oral anticoagulation should be continued for at least 3 months after the procedure with a longer duration determined by underlying risk. (AHA/ACC/ACCP/HRS AF 2023, 1 B-NR)
● In patients undergoing surgical ablation, anticoagulation therapy is reasonable for at least 3 months after the procedure to reduce the risk of stroke or systemic embolism.(AHA/ACC/ACCP/HRS AF 2023, 2a B-NR)
● Initiation of oral anticoagulation is recommended at least 3 weeks prior to catheter-based ablation in AF patients at elevated thromboembolic risk, to prevent peri-procedural ischaemic stroke and thromboembolism. (ESC/EACTS/AF 2024 I C)
● Continuation of oral anticoagulation is recommended for at least 2 months after AF ablation in all patients, irrespective of rhythm outcome or CHA2DS2-VA score, to reduce the risk of 
peri-procedural ischaemic stroke and thromboembolism. (ESC/EACTS/AF 2024 I C)
● In AF patients with stroke risk factors not taking OAC before ablation, it is recommended that pre-procedural management of stroke risk includes initiation of anticoagulation and preferably, therapeutic OAC for at least 3 weeks before ablation (I C), or alternatively, the use of TOE to exclude LA thrombus before ablation ( IIa C). (AF/ESC 2020)
● In patients undergoing LA surgical ablation of atrial arrhythmias and or LA appendage ligation/excision, anticoagulation therapy is reasonable for at least 3 months after the procedure.
(ACC/AHA/VHD 2020, 2a B-NR)"""),
  ];

  //Question 3
  String q3Title =
      "CHA2DS2-VA Calculator (ESC/EACTS/AF 2024)";
  String q3Desc =
      """● For stroke risk assessment, a risk-factor-based approach is recommended, using the CHA2DS2-VASc clinical stroke risk score to initially identify patients at ‘low stroke risk’ (CHA2DS2-VASc score = 0 in men, or 1 in women) who should not be offered antithrombotic therapy. (AF/ESC 2020, I A)
● Patients with AF should be evaluated for their annual risk of thromboembolic events using a validated clinical risk score, such as CHA2DS2-VASc. (AHA/ACC/ACCP/HRS AF 2023, 1 B-NR)
● Oral anticoagulation is recommended in patients with clinical AF at elevated thromboembolic risk to prevent ischemic stroke and thromboembolism. (ESC/EACTS/AF 2024 I A)
● In patients with AF at risk for stroke, reevaluation of the need for and choice of stroke risk reduction therapy at periodic intervals is recommended to reassess stroke and bleeding risk, net clinical benefit, and proper dosing. (AHA/ACC/ACCP/HRS AF 2023)
● Individualized reassessment of thromboembolic risk is recommended at periodic intervals in patients with AF to ensure anticoagulation is started in appropriate patients. (ESC EACTS AF 2024 I B)
● Typically, periodic assessment should be performed once a year but might need to be performed more frequently in the context of changes in clinical status, such as reduction in renal function or development of additional risk factors. (AHA/ACC/ACCP/HRS AF 2023, 1 B-NR)
● In patients with AF (except with moderate to-severe mitral stenosis or a mechanical heart valve), the CHA2DS2-VASc score is recommended for assessment of stroke risk. (AHA/ACC/HRS 2019, I B)""";
  int q3Point = 0;
  List<CheckBoxModel> q3Answer = [
    CheckBoxModel(
        "Congestive heart failure (Clinical HF, or objective evidence of moderate to severe LV dysfunction, or HCM)",
        1,
        false),
    CheckBoxModel("Hypertension (or on antihypertensive therapy)", 1, false),
    CheckBoxModel(
        "Diabetes mellitus (Treatment with oral hypoglycemic drugs and/or insulin or fasting blood glucose>125 mg/dL (7 mmol/L))",
        1,
        false),
    CheckBoxModel(
        "Stroke (Previous stroke, TIA, or thromboembolism)", 2, false),
    CheckBoxModel(
        "Vascular disease (Angiographically significant, CAD, previous myocardial, infarction, PAD, or aortic plaque)",
        1,
        false),
  ];

  //Question 4
  String q4Title =
      """Is there contraindication for long term OACs due to irreversible cause including any of the following? (AHA/ACC/ACCP/HRS AF 2023), (AF/ESC 2020)
1- Severe bleeding due to a nonreversible cause involving the gastrointestinal, pulmonary, or genitourinary systems? 
2- Spontaneous intracranial/intraspinal bleeding due to a nonreversible cause? 
3- Serious bleeding related to recurrent falls when cause of falls is not felt to be treatable? 
4- High risk of major bleeding on oral anticoagulation and patient preference? 
5-Severe thrombocytopenia (<25000-50000 platelets/µL), or severe anemia under investigation?""";

  String q4Yes =
      """● Percutaneous LAAO is reasonable. (AHA/ACC/ACCP/HRS AF 2023, 2a B-NR)
● Percutaneous LAA occlusion may be considered in patients with AF and contraindications for long-term anticoagulant treatment to prevent ischaemic stroke and thromboembolism. (ESC/EACTS/AF 2024 IIb C)
● LAA occlusion may be considered. (AF/ESC 2020 IIb B)
● Stand-alone endoscopic surgical closure of the left atrial appendage may be considered in patients with AF and contraindications for long-term anticoagulant treatment to prevent ischemic stroke and thromboembolism. (ESC EACTS AF 2024 II C)
● Percutaneous LAA occlusion may be considered in patients with AF at increased risk of stroke who have contraindications to long-term anticoagulation. (AHA/ACC/HRS AF 2019, IIb B-NR)
● In patients with AF, a moderate to high risk of stroke (CHA2DS2-VASc score ≥ 2), and a contraindication to long-term oral anticoagulation due to a nonreversible cause, percutaneous LAAO (pLAAO) is reasonable. (AHA/ACC/ACCP/HRS AF 2023, 2a  B-NR)
● In patients with AF and a moderate to high risk of stroke and a high risk of major bleeding on oral anticoagulation, pLAAO may be a reasonable alternative to oral anticoagulation based on patient preference, with careful consideration of procedural risk and with the understanding that the evidence for oral anticoagulation is more extensive. (AHA/ACC/ACCP/HRS AF 2023, 2b  B-R)""";

  String q4No =
      """● In the absence of history of moderate to severe rheumatic mitral stenosis or a mechanical heart valve, DOACs are recommended over Warfarin to reduce the risk of mortality, stroke, systemic embolism, and ICH. (AHA/ACC/ACCP/HRS AF 2023, 1 A), (AF/ESC 2020 1A), (AHA/ACC/HRS AF 2019 1 A)
● Direct oral anticoagulants are recommended in preference to VKAs to prevent ischaemic stroke and thromboembolism, except in patients with mechanical heart valves or moderate-to-severe 
mitral stenosis. (ESC/EACTS/AF 2024).
● NOACs are preferred over VKAs in all NOAC eligible AF patients. (EHRA/NOAC AF 2021)""";

  //Has_Bled
  int hbPoint = 0;
  String hbDesc =
      """● For a formal risk-score-based assessment of bleeding risk, the HAS-BLED score should be considered to help address modifiable bleeding risk factors and to identify patients at high risk of bleeding (HAS-BLED score >_3) for early and more frequent clinical review and follow-up. (ESC/AF 2020 IIa B)
● Patients with AF should be evaluated for factors that specifically indicate a higher risk of bleeding, such as previous bleeding and use of drugs that increase bleeding risk, in order to identify possible interventions to prevent bleeding on anticoagulation. (AHA/ACC/ACCP/HRS 2023)
● Assessment and management of modifiable bleeding risk factors is recommended in all patients eligible for oral anticoagulation, as part of shared decision-making to ensure safety and prevent bleeding. (ESC/EACTS/AF 2024 I B)
● Use of bleeding risk scores to decide on starting or withdrawing oral anticoagulation is not recommended in patients with AF to avoid under-use of anticoagulation. (ESC/EACTS/AF 2024 III B)
● Reevaluation of the need for and choice of anticoagulant therapy at periodic intervals is recommended to reassess stroke and bleeding risks. (AHA/ACC/HRS 2019, I C)""";
  List<CheckBoxModel> hbAnswer = [
    CheckBoxModel(
        "Uncontrolled hypertension (SBP >160 mmHg) [1 point]", 1, false),
    CheckBoxModel(
        "Abnormal renal function (Dialysis, transplant, serum creatinine >200 mmol/L) (≥2.3 mg/dl) [1 point]",
        1,
        false),
    CheckBoxModel(
        "Abnormal hepatic function (Cirrhosis, bilirubin >  2 upper limit of normal, AST/ALT/ALP >3  upper limit of normal) [1 point]",
        1,
        false),
    CheckBoxModel(
        "Stroke (Previous ischemic or hemorrhagic stroke) [1 point]", 1, false),
    CheckBoxModel(
        "Bleeding history or predisposition (Previous major hemorrhage or anemia or severe thrombocytopenia) [1 point]",
        1,
        false),
    CheckBoxModel(
        "Labile INR (TTR <60% in patient receiving VKA) [1 point]", 1, false),
    CheckBoxModel(
        "Elderly (Aged >65 years or extreme frailty) [1 point]", 1, false),
    CheckBoxModel("Excessive alcohol drinking [1 point]", 1, false),
    CheckBoxModel(
        "Concomitant use of antiplatelet or NSAID [1 point]", 1, false),
  ];

  //Cockcroft-Gault
  double cgAnswer = 0;
  String cgDesc =
      """Kidney function should be assessed using the Cockcroft-Gault formula. (EHRA/NOAC AF 2021)""";

  //Ts Scpre
  int tsPoint = 0;
  String tsAnswer() {
    switch (tsPoint) {
      case < 4:
        return "0 to 3 points: Low probability";
      case < 6:
        return "4 to 5 points: Intermediate probability";
      case < 9:
        return "6 to 8 points: High probability";
      default:
        return "Point: $tsPoint";
    }
  }

  List<RadioGroupModel> tsScore = [
    RadioGroupModel(
        id: 1,
        title: "Thrombocytopenia",
        selectedID: 0,
        point: 0,
        radios: [
          RadioBoxModel(
              1,
              "Platelet count fall >50% AND nadir ≥20,000/microL (2 points)",
              2),
          RadioBoxModel(
              2,
              "Platelet count fall 30 to 50% OR nadir 10,000 to 19,000/microL (1 point)",
              1),
          RadioBoxModel(
              3,
              "Grade 2: Inappropriate behavior, impending stupor, somnolence (2 points)",
              2),
          RadioBoxModel(4,
              "Platelet count fall <30% OR nadir <10,000/microL (0 points)", 0),
        ]),
    RadioGroupModel(
        id: 2,
        title: "Timing of platelet count fall",
        selectedID: 0,
        point: 0,
        radios: [
          RadioBoxModel(
              1,
              "Clear onset between days 5 and 10 of heparin exposure OR platelet count fall at ≤1 day if prior heparin exposure within the last 30 days (2 points)",
              2),
          RadioBoxModel(
              2,
              "Consistent with fall in platelet count at 5 to 10 days but unclear (eg, missing platelet counts) OR onset after day 10 OR fall ≤1 day with prior heparin exposure within 30 to 100 days (1 point)",
              1),
          RadioBoxModel(
              3,
              "Platelet count fall at <4 days without recent heparin exposure (0 points)",
              1),
        ]),
    RadioGroupModel(
        id: 3,
        title: "Thrombosis or other sequelae",
        selectedID: 0,
        point: 0,
        radios: [
          RadioBoxModel(
              1,
              "Confirmed new thrombosis, skin necrosis, or acute systemic reaction after intravenous unfractionated heparin bolus (2 points)",
              2),
          RadioBoxModel(
              2,
              "Progressive or recurrent thrombosis, non-necrotizing (erythematous) skin lesions, or suspected thrombosis that has not been proven (1 point)",
              1),
          RadioBoxModel(3, "None (0 points)", 1),
        ]),
    RadioGroupModel(
        id: 4,
        title: "Other causes for thrombocytopenia present",
        selectedID: 0,
        point: 0,
        radios: [
          RadioBoxModel(1, "None apparent (2 points)", 2),
          RadioBoxModel(2, "Possible (1 point)", 1),
          RadioBoxModel(3, "Definite (0 points)", 1),
        ]),
  ];

  //Child Pugh
  int cpPoint = 0;
  String cpDesc =
      """Assess Child-Pugh score in patients with liver disease. (EHRA/NOAC AF 2021)""";
  String cpAnswer() {
    if (cpPoint < 5) {
      return """point: $cpPoint
● Consider liver function assessment every 12 months. (AHA/ACC/ACCP/HRS 2023)""";
    }
    if (cpPoint < 7) {
      return """5 to 6 points: Child class A
● Consider renal function assessment every 1-2 months. (AHA/ACC/ACCP/HRS 2023)""";
    }
    if (cpPoint < 10) {
      return """7 to 9 points: Child class B
● Consider liver function assessment every 3 months. (AHA/ACC/ACCP/HRS 2023)""";
    }
    return """10 to 15 points: Child class C
● Consider liver function assessment every 6 months. (AHA/ACC/ACCP/HRS 2023)""";
  }

  List<RadioGroupModel> cpQuestions = [
    RadioGroupModel(
        id: 1,
        title: "Encephalopathy",
        selectedID: 0,
        point: 0,
        radios: [
          RadioBoxModel(1, "None (1 point)", 1),
          RadioBoxModel(2, "Grade 1: Altered mood/confusion (2 points)", 2),
          RadioBoxModel(
              3,
              "Grade 2: Inappropriate behavior, impending stupor, somnolence (2 points)",
              2),
          RadioBoxModel(
              4,
              "Grade 3: Markedly confused, stupors but arousable (3 points)",
              3),
          RadioBoxModel(5, "Grade 4: Comatose/unresponsive (3 points)", 3),
        ]),
    RadioGroupModel(id: 2, title: "Ascites", selectedID: 0, point: 0, radios: [
      RadioBoxModel(1, "Absent (1 point)", 1),
      RadioBoxModel(2, "Slight (2 points)", 2),
      RadioBoxModel(3, "Moderate (3 points)", 3),
    ]),
    RadioGroupModel(
        id: 3,
        title: "Bilirubin",
        selectedID: 0,
        point: 0,
        radios: [
          RadioBoxModel(1, "<2 mg/dL (1 point)", 1),
          RadioBoxModel(2, "2 to 3 mg/dL (2 points)", 2),
          RadioBoxModel(3, ">3 mg/dL (3 points)", 3),
        ]),
    RadioGroupModel(id: 4, title: "Albumin", selectedID: 0, point: 0, radios: [
      RadioBoxModel(1, ">3.5 g/dL (1 point)", 1),
      RadioBoxModel(2, "2.8 to 3.5 g/dL (2 points)", 2),
      RadioBoxModel(3, "<2.8 g/dL (3 points)", 3),
    ]),
    RadioGroupModel(
        id: 4,
        title: "Prothrombin time prolongation",
        selectedID: 0,
        point: 0,
        radios: [
          RadioBoxModel(
              1, "Less than 4 seconds above control/INR <1.7 (1 point)", 1),
          RadioBoxModel(
              2, "4 to 6 seconds above control/INR 1.7 to 2.3 (2 points)", 2),
          RadioBoxModel(
              3, "More than 6 seconds above control/INR >2.3 (3 points)", 3),
        ]),
  ];

  //Selected Test Page Model
  // List<TestPageModel> selectedDrugs = [];
  List<TestPageModel> stacks = [];
  int selectedStack = 0;

  //Test Page Model
  TestPageModel get pages => tempPages!;
  TestPageModel? tempPages;
  void initPages() {
    tempPages = TestPageModel(
        title: "Any of the following clinical scenarios present?",
        value: "Clinical Scenarios",
        type: TestPageTypeEnum.page,
        pages: [
          TestPageModel(
            title: "",
            value: "CKD",
            page: "/ckd",
            helpDesc: """✓	Stage 1 (CrCl ≥90 mL/min): 
● Edoxaban is contraindicated in CrCl≥ 90. (AHA /ACC/ ACCP HRS 2023)

✓	Stage 2 (CrCl 60-90 mL/ min): 
● In the absence of a history of moderate to severe rheumatic mitral stenosis or a mechanical heart valve, DOACs are recommended over Warfarin to reduce the risk of mortality, stroke, systemic embolism, and ICH. (AHA/ACC/ACCP/HRS AF 2023, 1 A), (ESC 2020 1A), (AHA/ACC/HRS AF 2019 1 A)
● NOACs are preferred over VKAs in all NOAC-eligible AF patients. (EHRA NOAC AF 2021)

✓	Stage 3 (CrCl 30-59 mL/min):
● Treatment with warfarin or, preferably, evidence-based doses of direct thrombin or factor Xa inhibitors is recommended. (AHA/ACC/ACCP/HRS AF 2023, 1 B-R)
● For patients with AF (except with moderate to severe mitral stenosis or a mechanical heart valve) and moderate-to-severe CKD (serum creatinine ≥1.5 mg/dL [apixaban], CrCl 15 to 30 mL/min [dabigatran], CrCl ≤50 mL/min [rivaroxaban], or CrCl 15 to 50 mL/min [edoxaban]) with an elevated CHA2DS2-VASc score, treatment with reduced doses of direct thrombin or factor Xa inhibitors may be considered (e.g., dabigatran, rivaroxaban, apixaban, or edoxaban). (AHA/ACC/ HRS 2019, IIb B-R)

✓	Stage 4 (CrCl 15-29 mL/min):
● Treatment with warfarin or labeled doses of DOACs is reasonable to reduce the risk of stroke. (AHA/ACC/ACCP/HRS AF 2023, 2a B-NR)
● For patients with AF (except with moderate-to-severe mitral stenosis or a mechanical heart valve) and moderate-to-severe CKD (serum creatinine ≥1.5 mg/dL [apixaban], CrCl 15 to 30 mL/min [dabigatran], CrCl ≤50 mL/min [rivaroxaban], or CrCl 15 to 50 mL/min [edoxaban]) with an elevated CHA2DS2-VASc score, treatment with reduced doses of direct thrombin or factor Xa inhibitors may be considered (e.g., dabigatran, rivaroxaban, apixaban, or edoxaban). (AHA/ACC/HRS 2019, IIb B-R)

✓	End-stage CKD (CrCl <15 mL/min) or on dialysis:
● It might be reasonable to prescribe warfarin (INR 2.0-3.0) or an evidence-based dose of apixaban for oral anticoagulation to reduce the risk of stroke. (AHA/ACC/ACCP/HRS AF 2023, 2b B-NR), (AHA/ACC/HRS AF 2019 IIb B-NR).
● NOACs have not been approved in Europe for patients with CrCl <_15 mL/min or on dialysis. (AF/ESC 2020)
● Dabigatran, rivaroxaban, or edoxaban are not recommended because of the lack of evidence from clinical trials that the benefit exceeds the risk. (AHA/ACC/HRS AF 2019 No Benefit C-EO)
""",
            id: 1,
            type: TestPageTypeEnum.page,
            pages: [
              TestPageModel(
                  title: "",
                  value: "CrCl ≥ 90 mL/min",
                  type: TestPageTypeEnum.drug,
                  // isMarked: cgAnswer >= 90,
                  drugs: [
                    TestDrugPageModel(
                        """Edoxaban is contraindicated in CrCl≥ 90. (AHA/ACC/ACCP/HRS 2023)""",
                        [1, 2, 3, 4, 6, 7]),
                  ]),
              TestPageModel(
                  title: "",
                  value: "CrCl 60-90  mL/ min",
                  type: TestPageTypeEnum.drug,
                  isMarked: cgAnswer >= 60 && cgAnswer < 90,
                  drugs: [
                    TestDrugPageModel("""Stage 2 (CrCl 60-90 mL/ min):
● In the absence of a history of moderate to severe rheumatic mitral stenosis or a mechanical heart valve, DOACs are recommended over Warfarin to reduce the risk of mortality, stroke, systemic embolism, and ICH. (AHA/ACC/ACCP/HRS AF 2023, 1 A), (ESC 2020 1A), (AHA/ACC/HRS AF 2019 1 A)
● Direct oral anticoagulants are recommended in preference to VKAs to prevent ischaemic stroke and thromboembolism, except in patients with mechanical heart valves or moderate-to-severe 
mitral stenosis. (ESC EACTS AF 2024).
● NOACs are preferred over VKAs in all NOAC-eligible AF patients. (EHRA NOAC AF 2021)""", [1, 2, 3, 4, 5, 6, 7]),
                  ]),
              TestPageModel(
                  title: "",
                  value: "CrCl 30-59 mL/min",
                  type: TestPageTypeEnum.drug,
                  isMarked: cgAnswer >= 30 && cgAnswer < 60,
                  drugs: [
                    TestDrugPageModel(
                        """● Treatment with warfarin or, preferably, evidence-based doses of direct thrombin or factor Xa inhibitors is recommended. (AHA/ACC/ACCP/HRS AF 2023, 1 B-R)
● For patients with AF (except with moderate to-severe mitral stenosis or a mechanical heart valve) and moderate-to-severe CKD (serum creatinine ≥1.5 mg/dL [apixaban], CrCl 15 to 30 mL/min [dabigatran], CrCl ≤50 mL/min [rivaroxaban], or CrCl 15 to 50 mL/min [edoxaban]) with an elevated CHA2DS2-VASc score, treatment with reduced doses of direct thrombin or factor Xa inhibitors may be considered (eg, dabigatran, rivaroxaban, apixaban, or edoxaban). (AHA/ACC/HRS 2019, IIb B-R)""",
                        [1, 2, 3, 4, 5, 6, 7]),
                  ]),
              TestPageModel(
                  title: "",
                  value: "CrCl 15-29 mL/min",
                  type: TestPageTypeEnum.drug,
                  isMarked: cgAnswer >= 15 && cgAnswer < 30,
                  drugs: [
                    TestDrugPageModel(
                        """● Treatment with warfarin or labeled doses of DOACs is reasonable to reduce the risk of stroke. (AHA/ACC/ACCP/HRS AF 2023, 2a B-NR)
● For patients with AF (except with moderate to-severe mitral stenosis or a mechanical heart valve) and moderate-to-severe CKD (serum creatinine ≥1.5 mg/dL [apixaban], 
CrCl 15 to 30 mL/min [dabigatran], CrCl ≤50 mL/min [rivaroxaban], or CrCl 15 to 50 mL/min [edoxaban]) with an elevated CHA2DS2-VASc score, treatment with reduced doses of direct thrombin or factor Xa inhibitors may be considered (eg, dabigatran, rivaroxaban, apixaban, or edoxaban). (AHA/ACC/HRS 2019, IIb B-R)""",
                        [1, 2, 3, 4, 5, 6, 7]),
                  ]),
              TestPageModel(
                  title: "",
                  value: "End-stage CKD (CrCl <15 mL/min) or on dialysis",
                  type: TestPageTypeEnum.drug,
                  isMarked: cgAnswer < 15,
                  drugs: [
                    TestDrugPageModel(
                        """● It might be reasonable to prescribe warfarin (INR 2.0-3.0) or an evidence-based dose of apixaban for oral anticoagulation to reduce the risk of stroke. (AHA/ACC/ACCP/HRS AF 2023, 2b B-NR),(AHA/ACC/HRS AF 2019 IIb B-NR).
● NOACs have not been approved in Europe for patients with CrCl <_15 mL/min or on dialysis. (AF/ESC 2020)
● Dabigatran, rivaroxaban or edoxaban are not recommended because of the lack of evidence from clinical trials that benefit exceeds risk. (AHA/ACC/HRS AF 2019 No Benefit C-EO)""",
                        [1, 2, 3, 4, 7]),
                  ]),
            ],
          ),
          TestPageModel(
              title: "",
              value: "Liver disease",
              page: "/ld",
              helpDesc: """✓	Child A: 
● It is reasonable to prescribe any DOACs over warfarin. (AHA/ACC/ACCP/HRS AF 2023, 2a B-NR)
✓	Child B: 
● It is reasonable to prescribe DOACs (apixaban, dabigatran, or edoxaban) over warfarin. (AHA/ACC/ACCP/HRS AF 2023, 2a B-NR)
● Rivaroxaban is contraindicated due to the potentially increased risk of bleeding. (AHA/ACC/ACCP/HRS AF 2023, Harm C-LD), (AF/ESC 2020)
✓	Child C: All DOACs are contraindicated. (ESC/AF 2020)
""",
              id: 2,
              type: TestPageTypeEnum.page,
              pages: [
                TestPageModel(
                    title: "",
                    value: "Child A",
                    type: TestPageTypeEnum.drug,
                    isMarked: cpPoint >= 5 && cpPoint <= 6,
                    drugs: [
                      TestDrugPageModel(
                          """● It is reasonable to prescribe any DOACs over warfarin. (AHA/ACC/ACCP/HRS AF 2023, 2a B-NR)""",
                          [1, 2, 3, 4, 5, 6, 7]),
                    ]),
                TestPageModel(
                    title: "",
                    value: "Child B",
                    type: TestPageTypeEnum.drug,
                    isMarked: cpPoint >= 7 && cpPoint <= 9,
                    drugs: [
                      TestDrugPageModel(
                          """● It is reasonable to prescribe DOACs (apixaban, dabigatran, or edoxaban) over warfarin. (AHA/ACC/ACCP/HRS AF 2023, 2a B-NR)
● Rivaroxaban is contraindicated due to the potentially increased risk of bleeding. (AHA/ACC/ACCP/HRS AF 2023, Harm C-LD), (AF/ESC 2020)""",
                          [1, 2, 3, 4, 5, 6]),
                    ]),
                TestPageModel(
                    title: "",
                    value: "Child C",
                    type: TestPageTypeEnum.drug,
                    isMarked: cpPoint >= 10 && cpPoint <= 15,
                    drugs: [
                      TestDrugPageModel(
                          """● All DOACs are contraindicated.\n(ESC/AF 2020)""",
                          [1, 2, 3]),
                    ]),
              ]),
          TestPageModel(
              title: "",
              value: "Overweight/Underweight",
              page: "/bmi",
              type: TestPageTypeEnum.page,
              helpDesc: """✓	BMI≥ 40: 
● Use NOACs with caution, consider NOAC plasma level measurements, or consider VKA. (EHRA/NOAC AF 2021)
● In patients with AF and class III obesity (BMI≥ 40 kg/m2), DOACs are reasonable to choose over warfarin for stroke risk reduction. (AHA/ACC/ACCP/HRS AF 2023, 2a B-NR)
● At a BMI ≥ 50 kg/m2 plasma level measurements with any of the NOACs or conversion to VKA therapy may be reasonable. (EHRA/NOAC AF 2021)
● In patients with AF who are overweight or obese (with body mass index [BMI] >27 kg/m2), weight loss is recommended, with an ideal target of at least 10% weight loss to reduce AF symptoms, burden, recurrence, and progression to persistent AF. (AHA/ACC/ACCP/HRS AF 2023, 1 B-R)
● In obese patients with AF, weight loss together with management of other risk factors should be considered to reduce AF incidence, AF progression, AF recurrences, and symptoms. (AF/ESC 2020, IIa B)

✓	BMI 17.5-40:
● NOACs standard dose is recommended. (EHRA/NOAC AF 2021)
● In patients with AF who are overweight or obese (with body mass index [BMI] >27 kg/m2), weight loss is recommended, with an ideal target of at least 10% weight loss to reduce AF symptoms, burden, recurrence, and progression to persistent AF. (AHA/ACC/ACCP/HRS AF 2023, 1 B-R)
● In obese patients with AF, weight loss together with management of other risk factors should be considered to reduce AF incidence, AF progression, AF recurrences, and symptoms. (AF/ESC 2020, IIa B)

✓	BMI<17.5
● Apixaban or edoxaban (with dedicated dose-reduction criteria) can be used. (EHRA/NOAC AF 2021)
● Consider Dabigatran / Rivaroxaban with plasma level measurement. (EHRA/NOAC AF 2021)
● Consider plasma level measurements for NOACs. (EHRA/NOAC AF 2021)
● Consider VKA. (EHRA/NOAC AF 2021)
""",
              id: 3,
              pages: [
                TestPageModel(
                    title: "",
                    value: "BMI≥ 40",
                    type: TestPageTypeEnum.drug,
                    isMarked: bmi >= 40,
                    drugs: [
                      TestDrugPageModel(
                          """● Use NOACs with caution, consider NOAC plasma level measurements, or consider VKA. (EHRA/NOAC AF 2021)
● In patients with AF and class III obesity (BMI≥ 40 kg/m2), DOACs are reasonable to choose over warfarin for stroke risk reduction. (AHA/ACC/ACCP/HRS AF 2023, 2a B-NR)
● At a BMI ≥ 50 kg/m2  plasma level measurements with any of the NOACs or conversion to VKA therapy may be reasonable. (EHRA/NOAC AF 2021)
● In patients with AF who are overweight or obese (with body mass index [BMI] >27 kg/m2), weight loss is recommended, with an ideal target of at least 10% weight loss to reduce AF symptoms, burden, recurrence, and progression to persistent AF. (AHA/ACC/ACCP/HRS AF 2023, 1 B-R)
● In obese patients with AF, weight loss together with management of other risk factors should be considered to reduce AF incidence, AF progression, AF recurrences, and symptoms. (AF/ESC 2020, IIa B)""",
                          [1, 2, 3, 4, 5, 6, 7]),
                    ]),
                TestPageModel(
                    title: "",
                    value: "BMI 17.5-40",
                    isMarked: bmi >= 17.5 && bmi <= 40,
                    type: TestPageTypeEnum.drug,
                    drugs: [
                      TestDrugPageModel(
                          """● NOACs standard dose is recommended. (EHRA/NOAC AF 2021)
● In patients with AF who are overweight or obese (with body mass index [BMI] >27 kg/m2), weight loss is recommended, with an ideal target of at least 10% weight loss to reduce AF symptoms, burden, recurrence, and progression to persistent AF. (AHA/ACC/ACCP/HRS AF 2023, 1 B-R)
● In obese patients with AF, weight loss together with management of other risk factors should be considered to reduce AF incidence, AF progression, AF recurrences, and symptoms. (AF/ESC 2020, IIa B)""",
                          [1, 2, 3, 4, 5, 6, 7]),
                    ]),
                TestPageModel(
                    title: "",
                    value: "BMI<17.5",
                    type: TestPageTypeEnum.drug,
                    isMarked: bmi <= 17.5,
                    drugs: [
                      TestDrugPageModel(
                          """● Apixaban or edoxaban (with dedicated dose-reduction criteria) can be used. (EHRA/NOAC AF 2021)
● Consider Dabigatran / Rivaroxaban with plasma level measurement. (EHRA/NOAC AF 2021)
● Consider plasma level measurements for NOACs. (EHRA/NOAC AF 2021)
● Consider VKA. (EHRA/NOAC AF 2021)""", [1, 2, 3, 4, 5, 6, 7]),
                    ]),
              ]),
          TestPageModel(
              title: "",
              value: "Thrombocytopenia",
              page: "/Thrombocytopenia",
              type: TestPageTypeEnum.page,
              helpDesc: """✓	≥ 50000 Cell/ µl:
● Consider full-dose anticoagulation. (ESC/AF 2020), (UpToDate)
✓	25'000-50'000 Cell/ µl:
● Consider half-dose NOAC. (EHRA/NOAC AF 2021), (UpToDate)
● Consider half-dose LMWH. (UpToDate)
● Absolute contraindications to OACs. (ESC/AF 2020)
✓	< 25'000 Cell/ µl
● Avoid anticoagulation therapy due to the high risk of spontaneous Bleeding. (EHRA/NOAC AF 2021)
● Absolute contraindications to OACs. (ESC/ AF 2020)
● Temporarily hold anticoagulant until platelet count increases above 25'000 / µl.  (UpToDate)
""",
              id: 4,
              pages: [
                TestPageModel(
                  title:
                      "● Consider full dose anticoagulation.\n(AF/ESC 2020), (UpToDate)",
                  value: "≥ 50000/ µl",
                  type: TestPageTypeEnum.message,
                  isMarked: ulValue >= 50000,
                ),
                TestPageModel(
                    title: "",
                    value: "25'000-50'000 / µl",
                    type: TestPageTypeEnum.drug,
                    isMarked: ulValue >= 25000 && ulValue < 50000,
                    drugs: [
                      TestDrugPageModel("""
● Consider half-dose NOAC. (EHRA/NOAC AF 2021), (UpToDate)
● Consider half-dose LMWH. (UpToDate)
● Absolute contraindications to OACs. (ESC/ AF 2020)""", [2, 3, 4, 5, 6, 7]),
                    ]),
                TestPageModel(
                  id: 100,
                  title:
                      """● Avoid anticoagulation therapy due to high risk of spontaneous Bleeding. (EHRA/NOAC AF 2021)
● Absolute contraindications to OACs. (ESC/ AF 2020)
● Temporarily hold anticoagulant until platelet count increases above  25'000 / µl. (UpToDate)""",
                  value: "< 25'000 / µl",
                  type: TestPageTypeEnum.message,
                  isMarked: ulValue < 25000,
                ),
              ]),
          TestPageModel(
            title: "",
            value: "Lactation",
            type: TestPageTypeEnum.drug,
            helpDesc:
                """All NOACs are secreted into the breast milk. (ESC/AF 2020)
● We do not use the following during breastfeeding, consistent with the 2018 ASH and 2012 ACCP guidelines (1) Oral direct thrombin inhibitors (dabigatran), (2) Oral direct factor Xa inhibitors (rivaroxaban, apixaban, edoxaban). (UpToDate)
● A review of observational data and a case report with testing of drug levels, however, suggest that dabigatran and rivaroxaban levels in breast milk are quite low, whereas apixaban levels are higher. (UpToDate)
● Based on available data, warfarin is not present in breast milk. Warfarin is considered compatible with breastfeeding (ACOG 2018). The manufacturer recommends monitoring breastfeeding infants for bruising or bleeding. (UpToDate)
● If oral anticoagulation is chosen for continued postpartum thromboprophylaxis, warfarin can be started immediately after delivery. (UpToDate)
● NOACs should not be used in breastfeeding women, and LMWH should be used instead. (ESC/AF 2020)
""",
            id: 5,
            drugs: [
              TestDrugPageModel(
                  """● All NOACs are secreted into the breast milk. (ESC/AF 2020)
● We do not use the following during breastfeeding, consistent with the 2018 ASH and 2012 ACCP guidelines (1) Oral direct thrombin inhibitors (dabigatran), (2) Oral direct factor Xa inhibitors (rivaroxaban, apixaban, edoxaban). (UpToDate)
● A review of observational data and a case report with testing of drug levels, however, suggest that dabigatran and rivaroxaban levels in breast milk are quite low, whereas apixaban levels are higher. (UpToDate)
● Based on available data, warfarin is not present in breast milk. Warfarin is considered compatible with breastfeeding (ACOG 2018). The manufacturer recommends monitoring of breastfeeding infants for bruising or bleeding. (UpToDate)
● If oral anticoagulation is chosen for continued postpartum thromboprophylaxis, warfarin can be started immediately after delivery. (UpToDate)
● NOACs should not be used in breastfeeding women, and LMWH should be used instead. (ESC/AF 2020)""",
                  [1, 2, 3])
            ],
          ),
          TestPageModel(
            title: "",
            value: "AKI",
            type: TestPageTypeEnum.drug,
            helpDesc:
                """● NOACs need to be stopped and switched to unfractionated heparin before resumption after stabilization. (AHA/ACC/ACCP/HRS AF 2023, 2a B-NR)""",
            id: 6,
            drugs: [
              TestDrugPageModel(
                  """● NOACs need to be stopped and switched to unfractionated heparin before resumption after stabilization. (AHA/ACC/ACCP/HRS AF 2023, 2a B-NR)""",
                  [2])
            ],
          ),
          TestPageModel(
            title: "",
            value: "Cancer",
            type: TestPageTypeEnum.drug,
            helpDesc:
                """● In most patients with AF and cancer (remote history or receiving active cancer treatment), DOACs are reasonable to choose over VKAs for stroke risk reduction. (AHA/ACC/ACCP/HRS AF 2023, 2a B-NR)
● For most patients with AF and cancer who are on chemotherapy, we follow the general approach to the selection of OACs. (UpToDate)
● For most hemodynamically stable patients with cancer who do not have contraindications, we prefer an oral factor Xa inhibitor rather than LMW heparin or IV UFH followed by warfarin. (UpToDate)
● Among the factor Xa inhibitors, we suggest apixaban, as an oral monotherapy option (ie, administered without an initial five days of parenteral LMW heparin) (UpToDate, Grade 2C)
● We tend to avoid edoxaban and rivaroxaban in those with upper GI cancers since more bleeding has been reported with these agents compared with apixaban or LMW heparin. (UpToDate)
● We generally do not use dabigatran in this population. (UpToDate)
● The use of NOACs compared to warfarin was associated with a significantly reduced risk of stroke, systemic embolism, and VTE, a strong trend towards fewer ischemic strokes. (EHRA/NOAC AF 2021)
""",
            id: 7,
            drugs: [
              TestDrugPageModel(
                  """● In most patients with AF and cancer (remote history or receiving active cancer treatment), DOACs are reasonable to choose over VKAs for stroke risk reduction.(AHA/ACC/ACCP/HRS AF 2023, 2a B-NR)
● For most patients with AF and cancer who are on chemotherapy, we follow the general approach to selection of OACs. (UpToDate)
● For most hemodynamically stable patients with cancer who do not have contraindication, we prefer an oral factor Xa inhibitor rather than LMW heparin or IV UFH followed by warfarin.(UpToDate)
● Among the factor Xa inhibitors, we suggest apixaban, as an oral monotherapy option (ie, administered without an initial five days of parenteral LMW heparin) (UpToDate, Grade 2C)
● We tend to avoid edoxaban and rivaroxaban in those with upper GI cancers since more bleeding has been reported with these agents compared with apixaban or LMW heparin. (UpToDate)
● We generally do not use dabigatran in this population. (UpToDate)
● The use of NOACs compared to warfarin was associated with a significantly reduced risk of stroke, systemic embolism and VTE, a strong trend towards fewer ischemic strokes. (EHRA/NOAC AF 2021)""",
                  [1, 2, 3, 4, 5, 6, 7])
            ],
          ),
          TestPageModel(
            title: "",
            value: "History of GI Bleeding",
            type: TestPageTypeEnum.drug,
            helpDesc:
                """● After correction of the bleeding source, OAC should be restarted. The risk of bleeding in patients treated with apixaban or dabigatran 110 mg is similar to warfarin. (ESC/ AF 2020)
● In patients with a recent bleeding event, attention should be directed towards addressing the predisposing pathology (e.g. bleeding ulcer or polyp in a patient with gastrointestinal bleeding), and the reintroduction of OAC as soon as feasible, as part of a multidisciplinary team decision. (ESC/ AF 2020)
● Lower risks of major bleeding were reported in the apixaban, dabigatran 110 mg twice daily group, and edoxaban 30 mg or 60 mg daily dose groups compared with the warfarin group. (AHA/ACC/ACCP HRS 2023)
● Nonsignificant differences in major bleeding were reported between dabigatran 150 mg twice daily group or the rivaroxaban group and warfarin. (AHA/ACC/ACCP HRS 2023)
● Gastrointestinal bleeding risks were significantly higher in the dabigatran 150 mg twice daily, edoxaban 60 mg once daily, and rivaroxaban groups compared with the warfarin group. (AHA/ACC/ACCP HRS 2023)
● The apixaban group did not significantly increase the risk of gastrointestinal bleeding compared with the warfarin group. (AHA/ACC/ACCP HRS 2023)
""",
            id: 8,
            drugs: [
              TestDrugPageModel(
                  """● After correction of the bleeding source, OAC should be restarted. The risk of bleeding in patients treated with apixaban or dabigatran 110 mg is similar to warfarin.(ESC/ AF 2020)
● In patients with a recent bleeding event, attention should be directed towards addressing the predisposing pathology (e.g. bleeding ulcer or polyp in a patient with gastrointestinal bleeding), and the reintroduction of OAC as soon as feasible, as part of a multidisciplinary team decision. (ESC/ AF 2020)
● Lower risks of major bleeding reported in the apixaban, dabigatran 110 mg twice daily group, and edoxaban 30 mg or 60 mg daily dose groups compared with the warfarin group. (AHA/ACC/ACCP HRS 2023)
● Nonsignificant differences in major bleeding reported between dabigatran 150 mg twice daily group or the rivaroxaban group and warfarin. (AHA/ACC/ACCP HRS 2023)
● Gastrointestinal bleeding risks were significantly higher in the dabigatran 150 mg twice daily, edoxaban 60 mg once daily, and rivaroxaban groups compared with the warfarin group. (AHA/ACC/ACCP HRS 2023)
● The apixaban group did not significantly increase the risk of gastrointestinal bleeding compared with the warfarin group. (AHA/ACC/ACCP HRS 2023)""",
                  [1, 2, 3, 4, 6])
            ],
          ),
          TestPageModel(
            title: "",
            value: "Bariatric Surgery",
            type: TestPageTypeEnum.drug,
            helpDesc:
                """● Warfarin may be reasonable to choose over DOACs for stroke risk reduction in view of concerns about DOAC drug absorption. (AHA/ACC/ACCP/HRS AF 2023, 2b C-LD)
● Rivaroxaban (in the stroke prevention dose) may not be a preferred primary choice after gastric bypass surgery due to potentially relevant reductions in rivaroxaban exposure. (EHRA/NOAC AF 2021)
""",
            id: 9,
            drugs: [
              TestDrugPageModel(
                  """● Warfarin may be reasonable to choose over DOACs for stroke risk reduction in view of concerns about DOAC drug absorption. (AHA/ACC/ACCP/HRS AF 2023, 2b  C-LD)
● Rivaroxaban (in the stroke prevention dose) may not be a preferred primary choice after gastric bypass surgery due to potentially relevant reductions in rivaroxaban exposure. (EHRA/NOAC AF 2021)""",
                  [1, 2, 3, 4, 5, 6, 7])
            ],
          ),
          TestPageModel(
            title: "",
            value: "History of PCI",
            type: TestPageTypeEnum.drug,
            helpDesc:
                """● DOACs are preferred over VKAs. (AHA/ACC/ACCP/HRS AF 2023, 1 A)""",
            id: 10,
            drugs: [
              TestDrugPageModel(
                  "DOACs are preferred over VKAs.\n(AHA/ACC/ACCP/HRS AF 2023, 1 A)",
                  [1, 2, 3, 4, 5, 6, 7])
            ],
          ),
          TestPageModel(
              title: "",
              value: "Valve Disease",
              type: TestPageTypeEnum.page,
              helpDesc:
                  """✓	Native valve heart Including aortic stenosis, aortic regurgitation, and mitral regurgitation:

● NOAC is an effective alternative to VKA anticoagulation and should be administered on the basis of the patient’s CHA2DS2VASc score. (ACC/AHA/VHD 2020 1 A)
● In patients with aortic stenosis, aortic regurgitation, and mitral regurgitation NOACs are recommended in preference to VKAs in patients eligible for anticoagulants. (ESC/VHD 2021 I A)
● In patients with AF and valve disease other than moderate or greater mitral stenosis or a mechanical heart valve, DOACs are recommended over VKAs. (AHA/ACC/ACCP/HRS AF 2023, 1 B-NR)
● Use of NOACs is not recommended in patients with AF and moderate-to-severe mitral stenosis. (AF/ESC 2020, III C)
● For patients with AF and native valve heart disease (except rheumatic mitral stenosis [MS]) or who received a bioprosthetic valve >3 months ago, a non–vitamin K oral anticoagulant (NOAC) is an effective alternative to VKA anticoagulation and should be administered on the basis of the patient’s CHA2DS2-VASc score. (ACC/AHA/VHD 2020, 1 A)


✓	Mechanical Heart Valves/ Rheumatic Mitral Stenosis
● OAC using a VKA is recommended lifelong for all patients with an MHV prosthesis. (ESC/VHD 2021 I B)
● Warfarin is recommended. (AHA/ACC/HRS AF 2019 1 B)
● Dabigatran should not be used. (AHA/ACC/HRS 2019 Harm B-R)
● NOACs are not recommended in patients with a mechanical valve prosthesis. (ESC/VHD 2021 III B)
● NOACs are not recommended in patients with a mechanical valve prosthesis. (ACC/AHA/VHD 2020 III B)
● NOACs are contraindicated in patients with a prosthetic mechanical valve. (AF/ESC 2020 III B) 
● Life-long anticoagulation with a VKA is recommended. (ACC/AHA/VHD 2020 1 A)
● In patients with a mechanical prosthetic valve, anticoagulation with a VKA is recommended. (ESC/VHD 2020 1A)
● Anticoagulation with the direct thrombin inhibitor, dabigatran, is contraindicated. (ACC/AHA/VHD 2020 Harm B-R)
● Use of anti-Xa direct oral anticoagulants has not been assessed and is not recommended. (ACC/AHA/VHD 2020 Harm B-R)
● In patients with rheumatic mitral stenosis or mitral stenosis of moderate or greater severity and history of AF, long-term anticoagulation with warfarin is recommended over DOACs, independent of the CHA2DS2-VASc score to prevent cardiovascular events, including stroke or death. (AHA/ACC/ACCP/HRS AF 2023, 1 B-R)
● In patients with a mechanical prosthetic valve, anticoagulation with a VKA is recommended. (ACC/AHA/VHD 2020, 1 A)
● In patients with mechanical heart valves with or without AF who require long-term anticoagulation with VKA to prevent valve thrombosis, NOACs are not recommended. (ACC/AHA/VHD 2020, Harm B-R))
● VKAs are the anticoagulation drugs of choice for patients with rheumatic MS and mechanical heart valves. (ACC/AHA/VHD 2020)
● NOAC therapy should be discouraged unless new evidence reverses. (EHRA/NOAC AF 2021)
● For patients with AF and rheumatic MS, long-term VKA oral anticoagulation is recommended. (ACC/AHA/VHD 2020 1 C-EO)
● NOACs are not recommended. (ACC/AHA/VHD 2020 Harm B-R)
● Use of NOACs is not recommended in patients with AF and moderate-to-severe mitral stenosis. (AF/ESC 2020 III C) 
● In patients with rheumatic mitral stenosis or mitral stenosis of moderate or greater severity and history of AF, long-term anticoagulation with warfarin is recommended over DOACs, independent of the CHA2DS2-VASc score to prevent cardiovascular events, including stroke or death. (AHA/ACC/ACCP/HRS AF 2023, 1 B-R)
● VKAs are the anticoagulation drugs of choice for patients with rheumatic MS and mechanical heart valves. (ACC/AHA/VHD 2020)
● The use of NOACs is not recommended in patients with AF and moderate to severe mitral stenosis. (ESC/VHD 2021, III C)
● NOAC therapy should be discouraged unless new evidence reverses. (EHRA/NOAC AF 2021)

✓	Surgical valve repair
● OAC with VKA should be considered during the first 3 months after mitral and tricuspid repair. (ESC/VHD 2021 IIa C)

✓	Bioprosthetic valve >3 months
● NOAC is an effective alternative to VKA. (ACC/AHA/VHD 2020)
● Anticoagulation should be administered on the basis of the patient’s CHA2DS2-VASc score. (ACC/AHA/VHD 2020 1 A)
● NOACs should be considered over VKA after 3 months following surgical implantation of a BHV, in patients with AF. (ESC/VHD 2021 IIa B)
● NOACs are recommended in preference to VKAs in patients with aortic stenosis, aortic and mitral regurgitation, or aortic bio prostheses >3 months after Implantation. (ACC/AHA/VHD 2020 I A)
✓	Bioprosthetic valve ≤3 months
● For patients with new-onset AF ≤3 months after surgical or transcatheter bioprosthetic valve replacement, anticoagulation with a VKA is reasonable. (ACC/AHA/VHD 2020 2a B-NR)
● OAC using a VKA should be considered for the first 3 months after surgical implantation of a bioprosthesis in the mitral or tricuspid position. (ESC/VHD 2021 IIa B)
""",
              id: 11,
              pages: [
                TestPageModel(
                    title: "",
                    value:
                        " Native valve heart (Including aortic stenosis, aortic regurgitation, mitral regurgitation)",
                    type: TestPageTypeEnum.drug,
                    drugs: [
                      TestDrugPageModel(
                          """● NOAC is an effective alternative to VKA anticoagulation and should be administered on the basis of the patient’s CHA2DS2VASc score. (ACC/AHA/VHD 2020 1 A)
● In patients with aortic stenosis, aortic regurgitation, mitral regurgitation NOACs are recommended in preference to VKAs in patients eligible for anticoagulant. (ESC/VHD 2021 I A)
● In patients with AF and valve disease other than moderate or greater mitral stenosis or a mechanical heart valve, DOACs are recommended over VKAs. (AHA/ACC/ACCP/HRS AF 2023, 1 B-NR)
● Use of NOACs is not recommended in patients with AF and moderate-to-severe mitral stenosis. (AF/ESC 2020, III C)
● For patients with AF and native valve heart  disease (except rheumatic mitral stenosis [MS]) or who received a bioprosthetic valve >3 months ago, a non–vitamin K oral anticoagulant (NOAC) is an effective alternative to VKA anticoagulation and should be administered on the basis of the patient’s CHA2DS2-VASc score. (ACC/AHA/VHD 2020, 1 A)""",
                          [1, 2, 3, 4, 5, 6, 7]),
                    ]),
                TestPageModel(
                    title: "",
                    value:
                        " Mechanical Heart Valves/ Rheumatic Mitral Stenosis ",
                    type: TestPageTypeEnum.drug,
                    isMarked: q2Answer == 0 || q2Answer == 1,
                    drugs: [
                      TestDrugPageModel(
                          """● OAC using a VKA is recommended lifelong for all patients with an MHV prosthesis. (ESC/VHD 2021  I B)
● Warfarin is recommended. (AHA/ACC/HRS AF 2019 1 B)
● Dabigatran should not be used. (AHA/ACC/HRS 2019 Harm B-R)
● NOACs are not recommended in patients with a mechanical valve prosthesis. (ESC/VHD 2021 III B)
● NOACs are not recommended in patients with a mechanical valve prosthesis. (ACC/AHA/VHD 2020 III B)
● NOACs are contraindicated in patients with a prosthetic mechanical valve. (AF/ESC 2020 III B) 
● Life long anticoagulation with a VKA is recommended. (ACC/AHA/VHD 2020 1 A)
● In patients with a mechanical prosthetic valve, anticoagulation with a VKA is recommended. (ESC/VHD 2020 1A)
● Anticoagulation with the direct thrombin inhibitor, dabigatran, is contraindicated. (ACC/AHA/VHD 2020 Harm B-R)
● Use of anti-Xa direct oral anticoagulants has not been assessed and is not recommended. (ACC/AHA/VHD 2020 Harm B-R)
● In patients with rheumatic mitral stenosis or mitral stenosis of moderate or greater severity and history of AF, long-term anticoagulation with warfarin is recommended over DOACs,independent of the CHA2DS2-VASc score to prevent cardiovascular events, including stroke or death. (AHA/ACC/ACCP/HRS AF 2023, 1 B-R)
● In patients with a mechanical prosthetic  valve, anticoagulation with a VKA is recommended. (ACC/AHA/VHD 2020, 1 A)
● In patients with mechanical heart valves with or without AF who require long-term anticoagulation with VKA to prevent valve thrombosis, NOACs are not recommended. (ACC/AHA/VHD 2020, Harm B-R))
● VKAs are the anticoagulation drugs of choice for patients with rheumatic MS and mechanical heart valves. (ACC/AHA/VHD 2020)
● NOAC therapy should be discouraged unless new evidence reverses. (EHRA/NOAC AF 2021)
● For patients with AF and rheumatic MS, long-term VKA oral anticoagulation is recommended. (ACC/AHA/VHD 2020 1 C-EO)
● NOACs are not recommended. (ACC/AHA/VHD 2020 Harm B-R)
● Use of NOACs is not recommended in patients with AF and moderate-to-severe mitral stenosis. (AF/ESC 2020 III C) 
● In patients with rheumatic mitral stenosis or mitral stenosis of moderate or greater severity and history of AF, long-term anticoagulation with warfarin is recommended over DOACs, independent of the CHA2DS2-VASc score to prevent cardiovascular events, including stroke or death. (AHA/ACC/ACCP/HRS AF 2023, 1 B-R)
● VKAs are the anticoagulation drugs of choice for patients with rheumatic MS and mechanical heart valves. (ACC/AHA/VHD 2020)
● The use of NOACs is not recommended in patients with AF and moderate to severe mitral stenosis. (ESC/VHD 2021, III C)
● NOAC therapy should be discouraged unless new evidence reverses. (EHRA/NOAC AF 2021)""",
                          [1, 2, 3]),
                    ]),
//                 TestPageModel(
//                     title: "",
//                     value: "Mechanical Heart Valves",
//                     type: TestPageTypeEnum.drug,
//                     drugs: [
//                       TestDrugPageModel(
//                         """OAC using a VKA is recommended lifelong for all patients with an MHV prosthesis. (ESC VHD 2021  I B)
// Warfarin is recommended. (AHA/ACC/HRS AF 2019 1 B)
// Dabigatran should not be used. (AHA/ACC/HRS 2019 Harm B-R)
// NOACs are not recommended in patients with a mechanical valve prosthesis. (ESC VHD 2021 III B)
// NOACs are not recommended in patients with a mechanical valve prosthesis. (ACC/AHA VHD 2020 III B)
// NOACs are contraindicated in patients with a prosthetic mechanical valve.(ESC 2020 AF III B)
// Life long anticoagulation with a VKA is recommended. (ACC/AHA VHD 2020 1 A)
// In patients with a mechanical prosthetic valve, anticoagulation with a VKA is recommended. (1A ESC VHD 2020)
//  Anticoagulation with the direct thrombin inhibitor, dabigatran, is contraindicated.(ACC/AHA VHD 2020 Harm B-R)
// Use of anti-Xa direct oral anticoagulants has not been assessed and is not recommended.(ACC/AHA VHD 2020 Harm B-R)
// In patients with rheumatic mitral stenosis or mitral stenosis of moderate or greater severity and history of AF, long-term anticoagulation with warfarin is recommended over DOACs, independent of the CHA2DS2- VASc score to prevent cardiovascular events, including stroke or death. (AHA/ACC/ACCP/HRS AF 2023, 1 B-R)""",
//                         [1, 2, 3],
//                         TestPageModel(
//                           title: "",
//                           value: "What is the target INR?",
//                           type: TestPageTypeEnum.page,
//                           pages: [
//                             TestPageModel(
//                               title: "",
//                               value: "ACC/AHA/VHD 2020",
//                               type: TestPageTypeEnum.page,
//                               pages: [
//                                 TestPageModel(
//                                   title:
//                                       "Anticoagulation with a VKA is indicated to achieve an INR of 3.0. 1 B-NR",
//                                   value:
//                                       "Mechanical aortic valve replacement  + AF ?",
//                                   type: TestPageTypeEnum.message,
//                                 ),
//                                 TestPageModel(
//                                   title:
//                                       "Anticoagulation with a VKA is indicated to achieve an INR of 3.0. 1 B-NR",
//                                   value: "Mechanical mitral valve Replacement?",
//                                   type: TestPageTypeEnum.message,
//                                 ),
//                                 TestPageModel(
//                                   title:
//                                       "Anticoagulation with a VKA is indicated to achieve an INR of 3.0. 1 B-NR",
//                                   value:
//                                       "Mechanical bileaflet or current-generation single-tilting disk aortic valve replacement?",
//                                   type: TestPageTypeEnum.message,
//                                 ),
//                               ],
//                             ),
//                             TestPageModel(
//                               title: "",
//                               value: "(ESC/VHD 2021)",
//                               type: TestPageTypeEnum.page,
//                               pages: [
//                                 TestPageModel(
//                                   title: "Target INR is 3.",
//                                   value:
//                                       "Carbomedics, Medtronic Hall, ATS, Medtronic Open-Pivot, St Jude Medical,Sorin BicarboN?",
//                                   type: TestPageTypeEnum.message,
//                                 ),
//                                 TestPageModel(
//                                   title: "Target INR is 4.",
//                                   value:
//                                       "Lillehei-Kaster, Omniscience, Starr-Edwards (ball-cage), Bjork-Shiley and other tilting-disc valves?",
//                                   type: TestPageTypeEnum.message,
//                                 ),
//                                 TestPageModel(
//                                   title: "Target INR is 3.5.",
//                                   value:
//                                       "Other bileaflet valves with insufficient data?",
//                                   type: TestPageTypeEnum.message,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ]),

                TestPageModel(
                    title: "",
                    value: "Surgical valve repair",
                    type: TestPageTypeEnum.drug,
                    drugs: [
                      TestDrugPageModel(
                          """● OAC with VKA should be considered during the first 3 months after mitral and tricuspid repair. (ESC/VHD 2021 IIa C)""",
                          [1, 2, 3]),
                    ]),
                TestPageModel(
                    title: "Bioprosthetic valve",
                    value: "Bioprosthetic valve",
                    type: TestPageTypeEnum.page,
                    pages: [
                      TestPageModel(
                          title: "",
                          value: ">3 months",
                          type: TestPageTypeEnum.drug,
                          drugs: [
                            TestDrugPageModel(
                                """● NOAC is an effective alternative to VKA. (ACC/AHA/VHD 2020)
● Anticoagulation should be administered on the basis of the patient’s CHA2DS2-VASc score. (ACC/AHA/VHD 2020 1 A)
● NOACs should be considered over VKA after 3 months following surgical implantation of a BHV, in patients with AF. (ESC/VHD 2021 IIa B)
● NOACs are recommended in preference to VKAs in patients with aortic stenosis, aortic and mitral regurgitation, or aortic bio prostheses >3 months after Implantation. (ACC/AHA/VHD 2020 I A)""",
                                [1, 2, 3, 4, 5, 6, 7]),
                          ]),
                      TestPageModel(
                          title: "",
                          value: "≤3 months",
                          type: TestPageTypeEnum.drug,
                          drugs: [
                            TestDrugPageModel(
                              """● For patients with new-onset AF ≤3 months after surgical or transcatheter bioprosthetic valve replacement, anticoagulation with a VKA is reasonable.(ACC/AHA/VHD 2020 2a B-NR)
● OAC using a VKA should be considered for the first 3 months after surgical implantation of a bio prosthesis in the mitral or tricuspid position. (ESC/VHD 2021 IIa B)""",
                              [1, 2, 3],
                              TestPageModel(
                                title: "",
                                value:
                                    "Case of surgical implantation of a BHV in mitral position in patient with AF?",
                                type: TestPageTypeEnum.drug,
                                pages: [
                                  TestPageModel(
                                      title: "",
                                      value: "No",
                                      type: TestPageTypeEnum.drug,
                                      drugs: [
                                        TestDrugPageModel(
                                            """● For patients with new-onset AF ≤3 months after surgical or transcatheter bioprosthetic valve replacement, anticoagulation with a VKA is reasonable. (ACC/AHA/VHD 2020 2a B-NR)
● OAC using a VKA should be considered for the first 3 months after surgical implantation of a bio prosthesis in the mitral or tricuspid position. (ESC/VHD 2021 IIa B)""",
                                            [1, 2, 3]),
                                      ]),
                                  TestPageModel(
                                      title: "",
                                      value: "Yes",
                                      type: TestPageTypeEnum.drug,
                                      drugs: [
                                        TestDrugPageModel(
                                            """● NOACs may be considered over VKA within 3 months following surgical implantation of a BHV in mitral position in patients with AF. (ESC/VHD 2021 IIb C)""",
                                            [1, 2, 3]),
                                      ])
                                ],
                              ),
                            ),
                          ]),
                    ]),
              ]),
          TestPageModel(
              title:
                  """● Pregnant individuals with AF and elevated risk of stroke may be considered for anticoagulation with the recognition that no anticoagulation strategy is completely safe for both the mother and fetus, and an SDM discussion should take place regarding risks to both mother and fetus. (AHA/ACC/ACCP/HRS 2023 2b, C-LD)
● NOACs are contraindicated in pregnancy. (EHRA/NOAC/AF 2021)""",
              value: "Pregnancy",
              type: TestPageTypeEnum.page,
              helpDesc:
                  """● Pregnant individuals with AF and elevated risk of stroke may be considered for anticoagulation with the recognition that no anticoagulation strategy is completely safe for both the mother and fetus and an SDM discussion should take place regarding risks to both mother and fetus. (AHA/ACC/ACCP/HRS 2023 2b, C-LD)
● NOACs are contraindicated in pregnancy. (EHRA/NOAC/AF 2021)

✓	More than one week to delivery AND Warfarin dose ≤5 mg/day

● Continue warfarin for all trimesters. (ACC/AHA VHD 2020 2a B-NR)
● For pregnant women with mechanical prostheses who require a dose of warfarin ≤5 mg/d to maintain a therapeutic INR, continuation of warfarin for all 3 trimesters is reasonable after full discussion with the patient about risks and benefits. (ACC/AHA/VHD 2020 2a B-NR)
● For pregnant women with mechanical prostheses who require a dose of warfarin ≤5 mg/d to maintain a therapeutic INR, dose-adjusted LMWH at least 2 times per day during the first trimester, followed by warfarin for the second and third trimesters, may be considered. (ACC/AHA/VHD 2020 2b B-NR)

✓	More than one week to delivery AND Warfarin dose >5 mg/day AND availability of Xa levels monitoring
● Dose adjusted LMWH for 1st trimester followed by warfarin for 2th and 3th trimesters. (ACC/AHA VHD 2020 2a B-NR)
● For pregnant women with mechanical prostheses who require >5 mg/d of warfarin to achieve a therapeutic INR, dose-adjusted LMWH (with a target anti-Xa level of 0.8 to 1.2 U/mL at 4 to 6 hours after dose) at least 2 times per day during the first trimester, followed by warfarin during the second and third trimesters, is reasonable. (ACC AHA VHD 2020 2a B-NR)
OR
● Dose adjusted LMWH for all 3 trimesters. (ACC/AHA/VHD 2020 2b B-NR)
● For pregnant women with mechanical prostheses who require a warfarin dose >5 mg/d to achieve a therapeutic INR, dose-adjusted LMWH (with a target anti-Xa level of 0.8 to 1.2 U/mL at 4 to 6 hours after dose) at least 2 times per day for all 3 trimesters may be considered. (ACC/AHA/VHD 2020 2b B-NR)

✓	More than one week to delivery AND Warfarin dose >5 mg/day AND unavailability of Xa levels monitoring
● Continuous dose-adjusted UFH for the 1st trimester followed by warfarin for the 2nd and 3rd trimesters. (ACC/AHA VHD 2020 2a B-NR)
● For pregnant women with mechanical prostheses who require a dose of warfarin >5 mg/d to achieve a therapeutic INR, and for whom dose-adjusted LMWH is unavailable, dose-adjusted continuous intravenous UFH during the first trimester (with aPTT 2 times control), followed by warfarin for the second and third trimesters, is reasonable. (ACC/AHA/VHD 2020 2a B-NR)

✓	At least One week to delivery
● Discontinue warfarin, and switch to IV UFH or dose-adjusted LMWH. (ACC/AHA VHD 2020 1 C-LD)
● Pregnant women with mechanical valve prostheses who are on warfarin should switch to twice-daily LMWH (with a target anti-Xa level of 0.8 U/mL to 1.2 U/mL at 4 to 6 hours after dose) or intravenous UFH (with an activated partial thromboplastin time [aPTT] 2 times control) at least 1 week before planned delivery. (ACC/AHA/VHD 2020 1 C-LD)

✓	At least 36 hr. before delivery
● Switch to continuous IV UFH (with an aPTT 2 times control). (ACC/AHA VHD 2020 1 C-LD)
● Pregnant women with a mechanical valve prosthesis who are on LMWH should switch 
to UFH (with an aPTT 2 times control) at least 36 hours before planned delivery. (ACC/ AHA/VHD 2020 1 C-LD)

✓	4-6 hr. before planned delivery
● Stop IV UFH. (ACC/AHA/VHD 2020 1 C-LD)
● Pregnant women with valve prostheses should stop UFH at least 6 hours before planned vaginal delivery. (ACC/AHA/VHD 2020 1 C-LD)
""",
              id: 12,
              pages: [
                TestPageModel(
                    title: "Warfarin dose >5 mg/day?",
                    value: "More than one week to delivery?",
                    type: TestPageTypeEnum.page,
                    pages: [
                      TestPageModel(
                          title:
                              "Dose adjusted LMWH with monitoring of Xa levels avaiable?",
                          value: "Yes",
                          type: TestPageTypeEnum.page,
                          pages: [
                            TestPageModel(
                                title: "",
                                value: "Yes",
                                type: TestPageTypeEnum.drug,
                                drugs: [
                                  TestDrugPageModel(
                                      """● Dose adjusted LMWH for 1st  trimester followed by warfarin for 2th and 3th trimesters. (ACC/AHA/VHD 2020 2a B-NR)

● For pregnant women with mechanical prostheses who require >5 mg/d of warfarin to achieve a therapeutic INR, dose-adjusted LMWH (with a target anti-Xa level of 0.8 to 1.2 U/mL at 4 to 6 hours after dose) at least 2 times per day during the first trimester, followed by warfarin during the second and third trimesters, is reasonable. (ACC/AHA/VHD 2020 2a B-NR)""",
                                      [1, 2, 3]),
                                  TestDrugPageModel(
                                      """● Dose adjusted LMWH for all 3 trimesters. (ACC/AHA/VHD 2020 2b B-NR)
● For pregnant women with mechanical prostheses who require a warfarin dose >5 mg/d to achieve a therapeutic INR, dose adjusted LMWH (with a target anti-Xa level of 0.8 to 1.2 U/mL at 4 to 6 hours after dose) at least 2 times per day for all 3 trimesters may be considered. (ACC/AHA/VHD 2020 2b B-NR)""",
                                      [2, 3]),
                                ]),
                            TestPageModel(
                                title: "",
                                value: "No",
                                type: TestPageTypeEnum.drug,
                                drugs: [
                                  TestDrugPageModel(
                                      """● Continuous dose adjusted UFH for the 1st trimester followed by warfarin for the 2th and 3th trimesters. (ACC/AHA/VHD 2020 2a B-NR)

● For pregnant women with mechanical prostheses who require a dose of warfarin >5 mg/d to achieve a therapeutic INR, and for whom dose-adjusted LMWH is unavailable, dose-adjusted continuous intravenous UFH during the first trimester (with aPTT 2 times control), followed by warfarin for the second and third trimesters, is reasonable. (ACC/AHA/VHD 2020 2a B-NR)""",
                                      [1, 2, 3]),
                                ])
                          ]),
                      TestPageModel(
                          title: "",
                          value: "No",
                          type: TestPageTypeEnum.drug,
                          drugs: [
                            TestDrugPageModel(
                                """● Continue warfarin for all trimesters. (ACC/AHA/VHD 2020 2a B-NR)
● For pregnant women with mechanical prostheses who require a dose of warfarin ≤5 mg/d to maintain a therapeutic INR, continuation of warfarin for all 3 trimesters is reasonable after full discussion with the patient about risks and benefits. (ACC/AHA/VHD 2020 2a B-NR)
● For pregnant women with mechanical prostheses who require a dose of warfarin ≤5 mg/d to maintain a therapeutic INR, dose-adjusted LMWH at least 2 times per day during the first trimester, followed by warfarin for the second and third trimesters, may be considered. (ACC/AHA/VHD 2020 2b B-NR)""",
                                [1, 2, 3])
                          ]),
                    ]),
                TestPageModel(
                    title: "",
                    value: "At least One week before delivery?",
                    type: TestPageTypeEnum.drug,
                    drugs: [
                      TestDrugPageModel(
                          """● Discontinue warfarin, switch to IV UFH or dose-adjusted LMWH. (ACC/AHA/VHD 2020 1 C-LD)
● Pregnant women with mechanical valve prostheses who are on warfarin should switch to twice-daily LMWH (with a target anti-Xa level of 0.8 U/mL to 1.2 U/mL at 4 to 6 hours after dose) or intravenous UFH (with an activated partial thromboplastin time [aPTT] 2 times control) at least 1 week before planned delivery. (ACC/AHA/VHD 2020 1 C-LD)""",
                          [2, 3])
                    ]),
                TestPageModel(
                    title: "",
                    value: "At least 36 hr. before delivery?",
                    type: TestPageTypeEnum.drug,
                    drugs: [
                      TestDrugPageModel(
                          """● Switch to continuous IV UFH (with an aPTT 2 times control). (ACC/AHA/VHD 2020 1 C-LD)
● Pregnant women with mechanical valve prostheses who are on LMWH should switch to UFH (with an aPTT 2 times control) at least 36 hours before planned delivery. (ACC/AHA/VHD 2020 1 C-LD)""",
                          [2])
                    ]),
                TestPageModel(
                  title: """● Stop IV UFH. (ACC/AHA/VHD 2020 1 C-LD)
● Pregnant women with valve prostheses should stop UFH at least 6 hours before planned vaginal delivery. (ACC/AHA/VHD 2020 1 C-LD)""",
                  value: "4-6 hr. before planned delivery?",
                  type: TestPageTypeEnum.message,
                ),
              ]),
          TestPageModel(
            title: "",
            value: "Undergoing Cardioversion",
            type: TestPageTypeEnum.drug,
            helpDesc:
                """● NOACs are recommended with at least similar efficacy and safety as warfarin. (ESC/ AF 2020 I A)
● Direct oral anticoagulants are recommended in preference to VKAs in eligible patients with AF undergoing cardioversion for thromboembolic risk reduction. (ESC EACTS AF 2024 I A)
● For patients with AF or atrial flutter of less than 48 hours duration with a CHA2DS2-VASc score of 2 or greater in men and 3 or greater in women, administration of heparin, a factor Xa inhibitor, or a direct thrombin inhibitor is reasonable as soon as possible before cardioversion, followed by long-term anticoagulation therapy. (AHA/ACC/HRS 2019, IIa B-NR)
""",
            id: 13,
            drugs: [
              TestDrugPageModel(
                  """● NOACs are recommended with at least similar efficacy and safety as warfarin. (AF/ESC 2020 I A)
● For patients with AF or atrial flutter of less than 48 hours’ duration with a CHA2DS2-VASc score of 2 or greater in men and 3 or greater in women, administration of heparin, a factor Xa inhibitor, or a direct thrombin inhibitor is reasonable as soon as possible before cardioversion, followed by long-term anticoagulation therapy. (AHA/ACC/HRS 2019, IIa B-NR)""",
                  [1, 2, 3, 4, 5, 6, 7])
            ],
          ),
//           TestPageModel(
//             title:
//                 """● For patients with AF receiving DOACs, optimal management of drug interactions is recommended for those receiving concomitant therapy with interacting drugs, especially CYP3A4 and/or p-glycoprotein inhibitors or inducers. (AHA/ACC/ACCP/HRS/AF 2023, 1 C-LD)
//● Warfarin remains the preferred agent in patients with AF receiving CYP3A4/p-glycoprotein–inducing agents. (AHA/ACC/ACCP/HRS 2023)""",
//             value:
//                 "Is there contraindication for DOAC due to drug-drug interactions?",
//             type: TestPageTypeEnum.page,
//             id: 14,
//             pages: [
//               TestPageModel(
//                 title: "",
//                 value: "Yes",
//                 type: TestPageTypeEnum.drug,
//                 drugs: [
//                   TestDrugPageModel("", [1, 2, 3])
//                 ],
//               ),
//               TestPageModel(
//                 title: "",
//                 value: "No",
//                 type: TestPageTypeEnum.drug,
//                 drugs: [
//                   TestDrugPageModel("", [1, 2, 3, 4, 5, 6, 7])
//                 ],
//               ),
//               TestPageModel(
//                 title: "",
//                 value: "Consider drug list",
//                 type: TestPageTypeEnum.page,
//                 pages: [],
//               ),
//             ],
//           ),

          TestPageModel(
            title: "",
            value: "Hypertrophic Cardiomyopathy",
            type: TestPageTypeEnum.drug,
            helpDesc:
                """● In patients with HCM and clinical AF, anticoagulation is recommended with direct-acting oral anticoagulants (DOACs) as the first-line option and vitamin K antagonists as the second-line option, independent of CHA2DS2-VASc score. (2024 AHA/ACC/AMSSM/HRS/PACES/SCMR Guideline for the Management of Hypertrophic Cardiomyopathy)
● In hypertrophic cardiomyopathy, the risk of stroke is high enough independent of risk score to indicate anticoagulation. (AHA/ACC/ACCP/HRS AF 2023)
● Hypertrophic cardiomyopathy has roughly an equivalent risk to a CHADsVASc of 3. (AHA/ACC/ACCP/HRS AF 2023)
● In both obstructive and non-obstructive hypertrophic cardiomyopathy, AF is associated with a high rate of thromboembolism. (EHRA/NOAC AF 2021)	
""",
            id: 15,
            drugs: [
              TestDrugPageModel(
                  """● In patients with HCM and clinical AF, anticoagulation is recommended with direct-acting oral anticoagulants (DOACs) as first-line option and vitamin K antagonists as second-line option, independent of CHA2DS2-VASc score. (2024 AHA/ACC/AMSSM/HRS/PACES/SCMR Guideline for the Management of Hypertrophic Cardiomyopathy)
● In hypertrophic cardiomyopathy, the risk of stroke is high enough independent of risk score to indicate anticoagulation. (AHA/ACC/ACCP/HRS AF 2023)
● Hypertrophic cardiomyopathy  have roughly an equivalent risk to a CHADsVASc of 3. (AHA/ACC/ACCP/HRS AF 2023)
● In both obstructive and non-obstructive hypertrophic cardiomyopathy, AF is associated with a high rate of thromboembolism. (EHRA/NOAC AF 2021)""",
                  [1, 2, 3, 4, 5, 6, 7])
            ],
          ),
          TestPageModel(
            title: "",
            value: "Congenital heart disease",
            type: TestPageTypeEnum.drug,
            helpDesc:
                """● It may be reasonable to treat with anticoagulation independent of conventional risk score to reduce risk of thromboembolic events. (AHA/ACC/ACCP/HRS AF 2023, 2b C-LD)
● Oral anticoagulation should be considered in all adult congenital heart disease patients with AF/AFL and intracardiac repair, cyanosis, Fontan palliation, or systemic right ventricle to prevent ischaemic stroke and thromboembolism, regardless of other thromboembolic risk factors. (ESC/EACTS/AF 2024 IIa C)
● Oral anticoagulation should be considered in all adult patients with intracardiac repair, cyanosis, Fontan palliation, or systemic right ventricle and a history of AF, AFL, or intra-atrial re-entrant tachycardia. (ESC/ AF 2020 IIa C)
""",
            id: 16,
            drugs: [
              TestDrugPageModel(
                  """● It may be reasonable to treat with anticoagulation independent of conventional risk score to reduce risk of thromboembolic events. (AHA/ACC/ACCP/HRS AF 2023, 2b C-LD)
● Oral anticoagulation should be considered in all adult congenital heart disease patients with AF/AFL and intracardiac repair, cyanosis, Fontan palliation, or systemic right ventricle to prevent ischaemic stroke and thromboembolism, regardless of other thromboembolic risk factors. (ESC/EACTS/AF 2024 IIa C)
● Oral anticoagulation should be considered in all adult patients with intracardiac repair, cyanosis, Fontan palliation, or systemic right ventricle and a history of AF, AFL, or intra-atrial re-entrant tachycardia. (ESC/ AF 2020 IIa C)""",
                  [1, 2, 3, 4, 5, 6, 7])
            ],
          ),
          TestPageModel(
            title: "",
            value: "Ablation",
            type: TestPageTypeEnum.drug,
            helpDesc:
                """● In patients who have undergone catheter ablation of AF, oral anticoagulation should be continued for at least 3 months after the procedure with a longer duration determined by underlying risk. (AHA/ACC/ACCP/HRS AF 2023, 1 B-NR)
● In patients undergoing surgical ablation, anticoagulation therapy is reasonable for at least 3 months after the procedure to reduce the risk of stroke or systemic embolism (AHA/ACC/ACCP/HRS AF 2023, 2a B-NR)
● In AF patients with stroke risk factors not taking OAC before ablation, it is recommended that pre-procedural management of stroke risk includes initiation of anticoagulation and preferably, therapeutic OAC for at least 3 weeks before ablation (I C), or alternatively, the use of TOE to exclude LA thrombus before ablation ( IIa C). (ESC/ AF 2020)
""",
            id: 17,
            drugs: [
              TestDrugPageModel(
                  """● In patients who have undergone catheter ablation of AF, oral anticoagulation should be continued for at least 3 months after the procedure with a longer duration determined by underlying risk. (AHA/ACC/ACCP/HRS AF 2023, 1 B-NR)
● In patients undergoing surgical ablation, anticoagulation therapy is reasonable for at least 3 months after the procedure to reduce the risk of stroke or systemic embolism.(AHA/ACC/ACCP/HRS AF 2023, 2a B-NR)
● In AF patients with stroke risk factors not taking OAC before ablation, it is recommended that pre-procedural management of stroke risk includes initiation of anticoagulation and preferably, therapeutic OAC for at least 3 weeks before ablation (I C), or alternatively, the use of TOE to exclude LA thrombus before ablation ( IIa C). (ESC/ AF 2020)""",
                  [1, 2, 3, 4, 5, 6, 7])
            ],
          ),
          TestPageModel(
            title: "",
            value: "Cardiac Amyloidosis",
            type: TestPageTypeEnum.drug,
            helpDesc:
                """● There is insufficient randomized clinical trial evidence to inform the use of direct oral anticoagulants vs warfarin in cardiac amyloidosis, although the former offer ease of administration. (2023 ACC Expert Consensus Decision Pathway on Comprehensive Multidisciplinary Care for the Patient With Cardiac Amyloidosis)""",
            id: 18,
            drugs: [
              TestDrugPageModel(
                  """● There is insufficient randomized clinical trial evidence to inform the use of direct oral anticoagulants vs warfarin in cardiac amyloidosis, although the former offer ease of administration. (2023 ACC Expert Consensus Decision Pathway on Comprehensive Multidisciplinary Care for the Patient With Cardiac Amyloidosis)""",
                  [1, 2, 3, 4, 5, 6, 7])
            ],
          ),
        ]);
  }

  TestFilteredDrugModel testFilteredDrug = TestFilteredDrugModel();

  DrugInteractionModel drugInteractions =
      DrugInteractionModel.fromList(drugInteractionData);
}

enum TestPageTypeEnum { page, drug, message, result, toPage, end }

class TestPageModel {
  TestPageModel({
    required this.title,
    required this.value,
    required this.type,
    this.page = "",
    this.drugs = const [],
    this.pages = const [],
    this.id = 0,
    this.isMarked = false,
    this.appbarTitle,
    this.helpDesc,
  });

  String? appbarTitle;
  String? helpDesc;
  int id;
  String title;
  String value;
  String page;
  bool isMarked;
  TestPageTypeEnum type;
  List<TestDrugPageModel> drugs;
  List<TestPageModel> pages;
}

class TestDrugModel {
  TestDrugModel(this.id, this.name);
  int id;
  String name;
  // List<int> druginteractions = [];
}

class TestDrugPageModel {
  TestDrugPageModel(this.title, this.drugIds, [this.page]);
  TestPageModel? page;
  String title;
  List<int> drugIds;
  List<TestDrugModel> drugs = [];
}

class TestFilteredDrugModel {
  List<String> titles = [];
  Set<int> drugIds = {};
  List<TestDrugModel> drugs = [];
}

class TestDrugStyleModel {
  String message = "";
  Color color = AppColors.primary;
  bool isAllowed = true;
  String extra = "";
  String title = "";
  DrugInteractionEnum type = DrugInteractionEnum.none;
  String purpleMessage = "";
}
