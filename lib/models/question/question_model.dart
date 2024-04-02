import 'package:drtest/models/public/idtitle_model.dart';

class TestModel {
  int id = 0;
  //Question 1
  String q1Title =
      "Clinical diagnosis of Atrial fibrillation or Atrial flutter?";
  bool q1Answer = false;

  //Question 2
  String q2Title = "Any of the following indication for OACs present?";
  int q2Answer = 0;
  List<IDTitleModel> qa2 = [
    IDTitleModel(0,
        "Moderate to severe mitral stenosis(AHA/ACC/ACCP/HRS AF 2023, 1 B-R),(ESC VHD 2021)"),
    IDTitleModel(1, "Mechanical heart valve implementation(ESC VHD 2021)"),
    IDTitleModel(2,
        "Hypertrophic Cardiomyopathy (AHA/ACC/ACCP/HRS AF 2023),(EHRA AF 2021)"),
    IDTitleModel(3,
        "First 3 months after bioprosthetic heart valve implementation(ESC VHD 2021)"),
    IDTitleModel(4, """Congenital heart disease
Moderate or severe forms of congenital heart disease including: 
low-flow states such as Fontan circulation, blind-ending cardiac chambers, and cyanosis. (AHA/ACC/ACCP/HRS AF 2023, 2b C-LD)
Intracardiac repair, cyanosis, Fontan palliation, or systemic right ventricle and a history of AF, AFL, or intra-atrial re-entrant tachycardia. (ESC 2020 AF IIa C)"""),
    IDTitleModel(5, """Cardioversion
3 weeks before elective cardioversion when AF duration is ≥ 48 hours or unknown without imaging evaluation. (AHA/ACC/ACCP/HRS AF 2023, 1 B-R) (AHA/ACC/HRS 2019 I B-R) (EHRA NOAC 2021).
Cardioversion during the last 4 weeks when AF duration of ≥24 hours (ESC 2020 AF IIa B), or ≥ 48 hours (AHA/ACC/HRS 2019 I B-R), or regardless of duration (AHA/ACC/ACCP/HRS AF 2023, 1 B-NR)."""),
    IDTitleModel(6, """Ablation
Catheter ablation during the last 3 months. (AHA/ACC/ACCP/HRS AF 2023, 1 B-NR)
Surgical ablation during the last 3 months. (AHA/ACC/ACCP/HRS AF 2023, 2a B-NR)
Catheter ablation during the last 2 months.(ESC 2020 AF I C)
Planning for catheter ablation in the next 3 weeks without imaging. (ESC 2020 AF I C)"""),
    IDTitleModel(7, "No"),
  ];

  //Question 3
  String q3Title =
      "CHA2DS2-VASc Calculator(AHA/ACC/ACCP/HRS AF 2023, 1 B-NR)(AHA/ACC/HRS AF 2019 1 B)";
  int qa3Answer = 0;
}
