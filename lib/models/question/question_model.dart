import 'package:drtest/models/public/checkbox_model.dart';
import 'package:drtest/models/public/idtitle_model.dart';
import 'package:drtest/models/public/radiobox_model.dart';
import 'package:drtest/models/question/drug_interaction_model.dart';

class TestModel {
  int id = 0;

  bool isFemale = false;
  int age = 0;
  int weight = 0;
  int height = 0;
  double serumCreatinine = 0;
  int? ul;
  int get ulValue => ul ?? 0;
  double bmi = 0;

  List<TestDrugModel> drugs = [
    TestDrugModel(1, "Warfarin"),
    TestDrugModel(2, "UFH"),
    TestDrugModel(3, "LMWH"),
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
  String q2Title = "Any of the following indication for OACs present?";
  int q2Answer = 0;
  List<IDTitleModel> qa2 = [
    IDTitleModel(
        0,
        "Moderate to severe mitral stenosis(AHA/ACC/ACCP/HRS AF 2023, 1 B-R)",
        "● In patients with mitral stenosis of moderate or greater severity and history of AF, long-term anticoagulation with warfarin is recommended over DOACs, independent of the CHA2DS2- VASc score to prevent cardiovascular events, including stroke or death. (AHA/ACC/ACCP/HRS AF 2023, 1 B-R)"),
    IDTitleModel(
        1,
        "Mechanical heart valve implementation (ESC VHD 2021) (1A ESC VHD 2020)",
        "● OAC using a VKA is recommended lifelong for all patients with an MHV prosthesis. \n(ESC VHD 2021  I B)\n● In patients with a mechanical prosthetic valve, anticoagulation with a VKA is recommended.\n(1A ESC VHD 2020)"),
    IDTitleModel(
        2,
        "Hypertrophic Cardiomyopathy (AHA/ACC/ACCP/HRS AF 2023),(EHRA AF 2021)",
        "● In hypertrophic cardiomyopathy, the risk of stroke is high enough independent of risk score to indicate anticoagulation.\n● Hypertrophic cardiomyopathy  have roughly an equivalent risk to a CHADsVASc of 3.\n(AHA/ACC/ACCP/HRS AF 2023)\n● In both obstructive and non-obstructive hypertrophic cardiomyopathy, AF is associated with a high rate of thromboembolism.\n(EHRA AF 2021)"),
    IDTitleModel(
        3,
        "First 3 months after bioprosthetic heart valve implementation (ESC VHD 2021) (ACC/AHA VHD 2020)",
        "● For patients with new-onset AF ≤3 months after surgical or transcatheter bioprosthetic valve replacement, anticoagulation with a VKA is reasonable.\n(ACC/AHA VHD 2020 2a B-NR)\n● OAC using a VKA should be considered for the first 3 months after surgical implantation of a bio prosthesis in the mitral or tricuspid position.\n(ESC VHD 2021 IIa B)"),
    IDTitleModel(4, """Congenital heart disease
Moderate or severe forms of congenital heart disease including: 
low-flow states such as Fontan circulation, blind-ending cardiac chambers, and cyanosis. (AHA/ACC/ACCP/HRS AF 2023, 2b C-LD)
Intracardiac repair, cyanosis, Fontan palliation, or systemic right ventricle and a history of AF, AFL, or intra-atrial re-entrant tachycardia. (ESC 2020 AF IIa C)""",
        """● It may be reasonable to treat with anticoagulation independent of conventional risk score to reduce risk of thromboembolic events.
(AHA/ACC/ACCP/HRS AF 2023, 2b C-LD)
● Oral anticoagulation should be considered in
all adult patients with intracardiac repair, cyanosis, Fontan palliation, or systemic right ventricle and a history of AF, AFL, or intra-atrial
re-entrant tachycardia.
(ESC 2020 AF IIa C)"""),
    IDTitleModel(5, """Cardioversion
3 weeks before elective cardioversion when AF duration is ≥ 48 hours or unknown without imaging evaluation. (AHA/ACC/ACCP/HRS AF 2023, 1 B-R) (AHA/ACC/HRS 2019 I B-R) (EHRA NOAC 2021).
Cardioversion during the last 4 weeks when AF duration of ≥24 hours (ESC 2020 AF IIa B), or ≥ 48 hours (AHA/ACC/HRS 2019 I B-R), or regardless of duration (AHA/ACC/ACCP/HRS AF 2023, 1 B-NR).""",
        """● In patients with AFL who undergo successful cardioversion or ablation resulting in restoration of sinus
rhythm, anticoagulation should be continued for at least 4 weeks post-procedure.
(AHA/ACC/ACCP/HRS AF 2023, 1 C-LD)
● In patients with AF duration of ‡48 hours, a 3-week duration of uninterrupted therapeutic anticoagulation
or imaging evaluation to exclude intracardiac thrombus is recommended before elective cardioversion.
(AHA/ACC/ACCP/HRS AF 2023, 1 B-R) 
● In patients with AF undergoing cardioversion, therapeutic anticoagulation should be established before
cardioversion and continued for at least 4 weeks afterwards without interruption to prevent thromboembolism.
(AHA/ACC/ACCP/HRS AF 2023, 1 B-NR)
● For patients with AF or atrial flutter of 48 
hours’ duration or longer, or when the 
duration of AF is unknown, anticoagulation 
with warfarin (INR 2.0 to 3.0), a factor Xa 
inhibitor, or direct thrombin inhibitor is 
recommended for at least 3 weeks before 
and at least 4 weeks after cardioversion, 
regardless of the
 CHA2DS2-VASc score or the 
method (electrical or pharmacological) used 
to restore sinus rhythm.
(AHA/ACC/HRS 2019 I B-R)
●  For patients with AF or atrial flutter 
of more than 48 hours’ duration or 
unknown duration that requires immediate 
cardioversion for hemodynamic instability, 
anticoagulation should be initiated as 
soon as possible and continued for at 
least 4 weeks after cardioversion unless 
contraindicated.
(AHA/ACC/HRS 2019 I C)
● In patients with AF of >48 h (or unknown) duration undergoing electrical or pharmacological cardioversion, effective oral anticoagulation needs to be established for 
at least 3 weeks prior to cardioversion or a pre-cardioversion transesophageal echocardiography 
 needs to rule out left atrial thrombi, irrespective of CHA2DS2-VASc score.
(EHRA NOAC 2021).
● In patients with AF duration of >24 h undergoing cardioversion, therapeutic anticoagulation should be continued for at least 4 weeks even after successful cardioversion to sinus rhythm.
(ESC 2020 AF IIa B)"""),
    IDTitleModel(6, """Ablation
Catheter ablation during the last 3 months. (AHA/ACC/ACCP/HRS AF 2023, 1 B-NR)
Surgical ablation during the last 3 months. (AHA/ACC/ACCP/HRS AF 2023, 2a B-NR)
Catheter ablation during the last 2 months.(ESC 2020 AF I C)
Planning for catheter ablation in the next 3 weeks without imaging. (ESC 2020 AF I C)""",
        """ In patients who have undergone catheter ablation of AF, oral anticoagulation should be continued for at
least 3 months after the procedure with a longer duration determined by underlying risk.
(AHA/ACC/ACCP/HRS AF 2023, 1 B-NR)
In patients undergoing surgical ablation, anticoagulation therapy is reasonable for at least 3 months after
the procedure to reduce the risk of stroke or systemic embolism.
(AHA/ACC/ACCP/HRS AF 2023, 2a B-NR)
In AF patients with stroke risk factors not taking OAC before ablation, it is recommended that pre-procedural management of stroke risk includes initiation of anticoagulation and preferably, therapeutic OAC for at least 3 weeks before ablation (I C), or alternatively, the use of TOE to exclude LA thrombus before ablation ( IIa C).
(ESC 2020 AF )"""),
    IDTitleModel(7, "CHA2DS2-VASc Score of ≥ 2 in men and ≥ 3 in women",
        """Anticoagulation is recommended to prevent stroke and systemic thromboembolism.
(AHA/ACC/ACCP/HRS AF 2023, 1 A)
(ESC 2020 AF 1A)
(AHA/ACC/HRS AF 2019 1 A)"""),
    IDTitleModel(
        8,
        "CHA2DS2-VASc of 1 point in male or 2 points in female (2a A 2023) (2a B)esc 2020/ 2B C-LD",
        """Anticoagulation is reasonable to prevent stroke and systemic thromboembolism.
(AHA/ACC/ACCP/HRS AF 2023, 2a  A), (ESC 2020 AF IIa B)
Prescribing an oral anticoagulant to reduce thromboembolic stroke risk may be considered. (AHA/ACC/HRS AF 2019 IIb C-LD)"""),
    IDTitleModel(9, "Don’t know the CHA2DS2-VASc Score?"),
  ];

  //Question 3
  String q3Title =
      "CHA2DS2-VASc Calculator(AHA/ACC/ACCP/HRS AF 2023, 1 B-NR)(AHA/ACC/HRS AF 2019 1 B)";
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
      """Is there contraindication for long term OACs due to irreversible cause including any of the following?
(AHA/ACC/ACCP/HRS AF 2023)
(ESC AF 2020)
1- Severe bleeding due to a nonreversible cause involving the
gastrointestinal, pulmonary, or genitourinary systems? 
2- Spontaneous intracranial/intraspinal bleeding due to a nonreversible cause? 
3- Serious bleeding related to recurrent falls when cause of falls is not felt to be treatable? 
4- High risk of major bleeding on oral
anticoagulation and patient preference? 
5-Severe thrombocytopenia <50 platelets/µL, or
severe anemia under investigation?""";

  String q4Yes = """Percutaneous LAAO is reasonable.
(AHA/ACC/ACCP/HRS AF 2023, 2a  B-NR)
LAA occlusion may be considered.
(ESC 2020 AF IIb B)
Percutaneous LAA occlusion may be considered.
(AHA/ACC/HRS AF 2019)""";

  String q4No =
      """In the absence of history of moderate to severe rheumatic mitral stenosis or a
mechanical heart valve, DOACs are recommended over Warfarin.
(AHA/ACC/ACCP/HRS AF 2023, 1 A)
(ESC 2020 1A)
(AHA/ACC/HRS AF 2019 1 A)""";

  //Has_Bled
  int hbPoint = 0;
  List<CheckBoxModel> hbAnswer = [
    CheckBoxModel(
        "Uncontrolled hypertension (SBP >160 mmHg) [1 point]", 1, false),
    CheckBoxModel(
        "Abnormal renal function (Dialysis, transplant, serum creatinine >200 mmol/L) [1 point]",
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

  //Child Pugh
  int cpPoint = 0;
  String cpAnswer() {
    if (cpPoint < 5) {
      return "point: $cpPoint";
    }
    if (cpPoint < 7) {
      return "5 to 6 points: Child class A";
    }
    if (cpPoint < 10) {
      return "7 to 9 points: Child class B";
    }
    return "10 to 15 points: Child class C";
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
  initPages() {
    tempPages = TestPageModel(
        title: "Any of the following situations present?",
        value: "",
        type: TestPageTypeEnum.page,
        pages: [
          TestPageModel(
            title: "",
            value: "CKD",
            page: "/ckd",
            id: 1,
            type: TestPageTypeEnum.page,
            pages: [
              TestPageModel(
                  title: "",
                  value: "Stage 3 (CrCl 30-59 mL/min)",
                  type: TestPageTypeEnum.drug,
                  isMarked: cgAnswer >= 30 && cgAnswer <= 59,
                  drugs: [
                    TestDrugPageModel("""Treatment with warfarin or, preferably,
evidence-based doses of direct thrombin or factor Xa inhibitors is recommended.
(AHA/ACC/ACCP/HRS AF 2023, 1 B-R)""", [1, 2, 3, 4, 5, 6, 7]),
                  ]),
              TestPageModel(
                  title: "",
                  value: "Stage 4 (CrCl 15-29 mL/min)",
                  type: TestPageTypeEnum.drug,
                  isMarked: cgAnswer >= 15 && cgAnswer <= 29,
                  drugs: [
                    TestDrugPageModel(
                        """Treatment with warfarin or labeled doses
of DOACs is reasonable to reduce the risk of stroke. 
(AHA/ACC/ACCP/HRS AF 2023, 2a B-NR)""", [1, 2, 3, 4, 5, 6, 7]),
                  ]),
              TestPageModel(
                  title: "",
                  value: "End-stage CKD (CrCl <15 mL/min) or on dialysis",
                  type: TestPageTypeEnum.drug,
                  isMarked: cgAnswer < 15,
                  drugs: [
                    TestDrugPageModel(
                        """It might be reasonable to prescribe warfarin (INR 2.0-3.0) or an evidence-based dose of apixaban for oral anticoagulation to reduce the risk of stroke.(AHA/ACC/ACCP/HRS AF 2023, 2b B-NR),(AHA/ACC/HRS AF 2019 IIb B-NR).
 NOACs have not been approved in Europe for patients with CrCl <_15 mL/min or on dialysis. (ESC 2020 AF)
Dabigatran, rivaroxaban or edoxaban are not recommended because of the lack of evidence from clinical trials that benefit exceeds risk.
(AHA/ACC/HRS AF 2019 No Benefit C-EO)""", [1, 2, 3]),
                  ]),
            ],
          ),
          TestPageModel(
              title: "",
              value: "Liver disease",
              page: "/ld",
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
                          """It is reasonable to prescribe any DOACs over warfarin.
(AHA/ACC/ACCP/HRS AF 2023, 2a B-NR)""", [1, 2, 3, 4, 5, 6, 7]),
                    ]),
                TestPageModel(
                    title: "",
                    value: "Child B",
                    type: TestPageTypeEnum.drug,
                    isMarked: cpPoint >= 7 && cpPoint <= 9,
                    drugs: [
                      TestDrugPageModel(
                          """It is reasonable to prescribe DOACs (apixaban, dabigatran, or edoxaban) over warfarin.(AHA/ACC/ACCP/HRS AF 2023, 2a  B-NR)
Rivaroxaban is contraindicated due to the potentially increased risk of bleeding.(AHA/ACC/ACCP/HRS AF 2023, Harm C-LD)(ESC 2020 AF)""",
                          [1, 2, 3, 4, 5, 6]),
                    ]),
                TestPageModel(
                    title: "",
                    value: "Child C",
                    type: TestPageTypeEnum.drug,
                    isMarked: cpPoint >= 10 && cpPoint <= 15,
                    drugs: [
                      TestDrugPageModel(
                          """All DOACs are contraindicated.\n(ESC 2020 AF)""",
                          [1, 2, 3]),
                    ]),
              ]),
          TestPageModel(
              title: "",
              value: "BMI",
              page: "/bmi",
              type: TestPageTypeEnum.page,
              id: 3,
              pages: [
                TestPageModel(
                    title: "",
                    value: "BMI≥ 40",
                    type: TestPageTypeEnum.drug,
                    isMarked: bmi >= 40,
                    drugs: [
                      TestDrugPageModel(
                          """Use NOACs with caution, consider NOAC plasma level measurements, or consider VKA. (EHRA NOAC AF 2021)
In patients with AF and class III obesity (BMI ± 40 kg/m2), DOACs are reasonable to choose over warfarin for stroke risk reduction.(AHA/ACC/ACCP/HRS AF 2023, 2a B-NR)""",
                          [1, 2, 3, 4, 5, 6, 7]),
                    ]),
                TestPageModel(
                    title: "",
                    value: "BMI 17.5-40",
                    isMarked: bmi >= 17.5 && bmi <= 40,
                    type: TestPageTypeEnum.drug,
                    drugs: [
                      TestDrugPageModel(
                          """NOACs standard dose is recommended.\n(EHRA NOAC AF 2021)""",
                          [1, 2, 3, 4, 5, 6, 7]),
                    ]),
                TestPageModel(
                    title: "",
                    value: "BMI<17.5",
                    type: TestPageTypeEnum.drug,
                    isMarked: bmi <= 17.5,
                    drugs: [
                      TestDrugPageModel(
                          """Consider Apixaban or edoxaban (with dedicated dose-reduction criteria) can be used.(EHRA NOAC AF 2021)
Consider dabigatran / rivaroxaban with plasma level measurement.(EHRA NOAC AF 2021)
Consider VKA (EHRA NOAC AF 2021)""", [1, 2, 3, 4, 5, 6, 7]),
                    ]),
              ]),
          TestPageModel(
              title: "",
              value: "Thrombocytopenia",
              page: "/Thrombocytopenia",
              type: TestPageTypeEnum.page,
              id: 4,
              pages: [
                TestPageModel(
                  title:
                      "Avoid anticoagulation therapy due to high risk of spontaneous Bleeding.\n(EHRA NOAC AF 2021)",
                  value: "< 25'000 / µl",
                  type: TestPageTypeEnum.message,
                  isMarked: ulValue < 25000,
                ),
                TestPageModel(
                    title: "",
                    value: "25'000-50'000 / µl",
                    type: TestPageTypeEnum.drug,
                    isMarked: ulValue >= 25000 && ulValue <= 50000,
                    drugs: [
                      TestDrugPageModel(
                          """Consider half-dose NOAC.\nConsider half-dose LMWH.\n(EHRA NOAC AF 2021)""",
                          [2, 3, 4, 5, 6, 7]),
                    ]),
              ]),
          TestPageModel(
            title: "",
            value: "Lactation",
            type: TestPageTypeEnum.drug,
            id: 5,
            drugs: [
              TestDrugPageModel("""All NOACs are secreted into the breast milk.
NOACs should not be used in breastfeeding women, and LMWH should be used 
instead. (ESC 2020 AF)""", [2, 3])
            ],
          ),
          TestPageModel(
            title: "",
            value: "AKI",
            type: TestPageTypeEnum.drug,
            id: 6,
            drugs: [
              TestDrugPageModel(
                  """NOACs need to be stopped and switched to unfractionated heparin before resumption after stabilization.
      (AHA/ACC/ACCP/HRS AF 2023, 2a B-NR)""", [2])
            ],
          ),
          TestPageModel(
            title: "",
            value: "Cancer",
            type: TestPageTypeEnum.drug,
            id: 7,
            drugs: [
              TestDrugPageModel(
                  """In most patients with AF and cancer (remote history or receiving active cancer treatment),
      DOACs are reasonable to choose over VKAs for stroke risk reduction.
      (AHA/ACC/ACCP/HRS AF 2023, 2a B-NR)""", [1, 2, 3, 4, 5, 6, 7])
            ],
          ),
          TestPageModel(
            title: "",
            value: "History of GI bleeding",
            type: TestPageTypeEnum.drug,
            id: 8,
            drugs: [
              TestDrugPageModel(
                  """After correction of the bleeding source, OAC should be restarted.
The risk of bleeding In patients treated with apixaban or
dabigatran 110 mg the risk is similar to warfarin. 
(ESC AF 2020)""", [1, 2, 3, 4, 6])
            ],
          ),
          TestPageModel(
            title: "",
            value: "Bariatric surgery",
            type: TestPageTypeEnum.drug,
            id: 9,
            drugs: [
              TestDrugPageModel(
                  "Warfarin may be reasonable to choose over DOACs for stroke risk reduction in view of concerns about DOAC drug absorption.\n(AHA/ACC/ACCP/HRS AF 2023, 2b  C-LD)",
                  [1, 2, 3, 4, 5, 6, 7])
            ],
          ),
          TestPageModel(
            title: "",
            value: "History of PCI",
            type: TestPageTypeEnum.drug,
            id: 10,
            drugs: [
              TestDrugPageModel(
                  "DOACs are preferred over VKAs.\n(AHA/ACC/ACCP/HRS AF 2023, 1 A)",
                  [1, 2, 3, 4, 5, 6, 7])
            ],
          ),
          TestPageModel(
              title: "",
              value: "AF + Valve Disease",
              type: TestPageTypeEnum.page,
              id: 11,
              pages: [
                TestPageModel(
                    title: "",
                    value:
                        "Native valve heart (Including aortic stenosis, aortic regurgitation, mitral regurgitation)",
                    type: TestPageTypeEnum.drug,
                    drugs: [
                      TestDrugPageModel(
                          """NOAC is an effective alternative to VKA anticoagulation and should be administered on the basis of the patient’s CHA2DS2VASc score. (ACC/AHA VHD 2020 1 A)
In patients with  aortic stenosis, aortic regurgitation, mitral regurgitation NOACs are recommended in preference to VKAs in patients eligible for anticoagulant. (ESC VHD 2021 I A)
In patients with AF and valve disease other than moderate or greater mitral stenosis or a mechanical heart valve, DOACs are recommended over VKAs. (AHA/ACC/ACCP/HRS AF 2023, 1 B-NR)""",
                          [1, 2, 3, 4, 5, 6, 7]),
                    ]),
                TestPageModel(
                    title: "",
                    value: "Rheumatic Mitral Stenosis",
                    type: TestPageTypeEnum.drug,
                    drugs: [
                      TestDrugPageModel(
                          """For patients with AF and rheumatic MS, long-term VKA oral anticoagulation is recommended. (ACC/AHA VHD 2020 1 C-EO)
NOACs are not recommended. (ACC/AHA VHD 2020 Harm B-R)
Use of NOACs is not recommended in patients with AF and moderate-to-severe mitral stenosis. (ESC 2020 AF III C) 
In patients with rheumatic mitral stenosis or mitral stenosis of moderate or greater severity and history of AF, long-term anticoagulation with warfarin is recommended over DOACs, independent of the CHA2DS2-VASc score to prevent cardiovascular events, including stroke or death. (AHA/ACC/ACCP/HRS AF 2023, 1 B-R)""",
                          [1, 2, 3]),
                    ]),
                TestPageModel(
                    title: "",
                    value: "Mechanical Heart Valves",
                    type: TestPageTypeEnum.drug,
                    drugs: [
                      TestDrugPageModel(
                        """OAC using a VKA is recommended lifelong for all patients with an MHV prosthesis. (ESC VHD 2021  I B)
Warfarin is recommended. (AHA/ACC/HRS AF 2019 1 B)
Dabigatran should not be used. (AHA/ACC/HRS 2019 Harm B-R)
NOACs are not recommended in patients with a mechanical valve prosthesis. (ESC VHD 2021 III B)
NOACs are not recommended in patients with a mechanical valve prosthesis. (ACC/AHA VHD 2020 III B)
NOACs are contraindicated in patients with a prosthetic mechanical valve.(ESC 2020 AF III B) 
Life long anticoagulation with a VKA is recommended. (ACC/AHA VHD 2020 1 A)
In patients with a mechanical prosthetic valve, anticoagulation with a VKA is recommended. (1A ESC VHD 2020)
 Anticoagulation with the direct thrombin inhibitor, dabigatran, is contraindicated.(ACC/AHA VHD 2020 Harm B-R)
Use of anti-Xa direct oral anticoagulants has not been assessed and is not recommended.(ACC/AHA VHD 2020 Harm B-R)
In patients with rheumatic mitral stenosis or mitral stenosis of moderate or greater severity and history of AF, long-term anticoagulation with warfarin is recommended over DOACs, independent of the CHA2DS2- VASc score to prevent cardiovascular events, including stroke or death. (AHA/ACC/ACCP/HRS AF 2023, 1 B-R)""",
                        [1, 2, 3],
                        TestPageModel(
                          title: "",
                          value: "What is the target INR?",
                          type: TestPageTypeEnum.page,
                          pages: [
                            TestPageModel(
                              title: "",
                              value: "ACC/AHA VHD 2020",
                              type: TestPageTypeEnum.page,
                              pages: [
                                TestPageModel(
                                  title:
                                      "Anticoagulation with a VKA is indicated to achieve an INR of 3.0.1 B-NR",
                                  value:
                                      "Mechanical aortic valve replacement  + AF ?",
                                  type: TestPageTypeEnum.message,
                                ),
                                TestPageModel(
                                  title:
                                      "Anticoagulation with a VKA is indicated to achieve an INR of 3.0.1 B-NR",
                                  value: "Mechanical mitral valve Replacement?",
                                  type: TestPageTypeEnum.message,
                                ),
                                TestPageModel(
                                  title:
                                      "Anticoagulation with a VKA is indicated to achieve an INR of 3.0.1 B-NR",
                                  value:
                                      "Mechanical bileaflet or current-generation single-tilting disk aortic valve replacement?",
                                  type: TestPageTypeEnum.message,
                                ),
                              ],
                            ),
                            TestPageModel(
                              title: "",
                              value: "(ESC VHD 2021)",
                              type: TestPageTypeEnum.page,
                              pages: [
                                TestPageModel(
                                  title: "Target INR is 3.",
                                  value:
                                      "Carbomedics, Medtronic Hall, ATS, Medtronic Open-Pivot, St Jude Medical,Sorin BicarboN?",
                                  type: TestPageTypeEnum.message,
                                ),
                                TestPageModel(
                                  title: "Target INR is 4.",
                                  value:
                                      "Lillehei-Kaster, Omniscience, Starr-Edwards (ball-cage), Bjork-Shiley and other tilting-disc valves?",
                                  type: TestPageTypeEnum.message,
                                ),
                                TestPageModel(
                                  title: "Target INR is 3.5.",
                                  value:
                                      "Other bileaflet valves with insufficient data?",
                                  type: TestPageTypeEnum.message,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
                TestPageModel(
                    title: "",
                    value: "Surgical valve repair",
                    type: TestPageTypeEnum.drug,
                    drugs: [
                      TestDrugPageModel(
                          """OAC with VKA should be considered during the
first 3 months after mitral and tricuspid repair.
(ESC VHD 2021 IIa C)""", [1, 2, 3]),
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
                                """NOAC is an effective alternative to VKA. (ACC/AHA VHD 2020)
Anticoagulation and should be administered on the basis of the patient’s CHA2DS2-VASc score. (ACC/AHA VHD 2020 1 A)
NOACs should be considered over VKA after 3 months following surgical implantation of a BHV, in patients with AF. (ESC VHD 2021 IIa B)
NOACs are recommended in preference to VKAs in patients with aortic stenosis, aortic and mitral regurgitation, or aortic bio prostheses >3 months after Implantation. (ACC/AHA VHD 2020 I A)""",
                                [1, 2, 3, 4, 5, 6, 7]),
                          ]),
                      TestPageModel(
                          title: "",
                          value: "≤3 months",
                          type: TestPageTypeEnum.drug,
                          drugs: [
                            TestDrugPageModel(
                              """For patients with new-onset AF ≤3 months after surgical or transcatheter bioprosthetic valve replacement, anticoagulation with a VKA 
is reasonable. (ACC/AHA VHD 2020 2a B-NR)
OAC using a VKA should be considered for the first 3 months after surgical implantation of a bio prosthesis in the mitral or tricuspid position.
(ESC VHD 2021 IIa B)""",
                              [1, 2, 3],
                              TestPageModel(
                                  title: "",
                                  value:
                                      "Case of surgical implantation of a BHV in mitral position in patient with AF?",
                                  type: TestPageTypeEnum.drug,
                                  drugs: [
                                    TestDrugPageModel(
                                      """NOACs may be considered over VKA within 3\nmonths following surgical implantation of a BHV in mitral position in patients with AF.\n(ESC VHD 2021 IIb C)""",
                                      [1, 2, 3, 4, 5, 6, 7],
                                    ),
                                  ]),
                            ),
                          ]),
                    ]),
              ]),
          TestPageModel(
              title: "",
              value: "Pregnancy",
              type: TestPageTypeEnum.page,
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
                                      "Dose adjusted LMWH for 1st  trimester followed by warfarin for 2th and 3th trimesters.\n(ACC/AHA VHD 2020 2a B-NR)",
                                      [1, 2, 3]),
                                  TestDrugPageModel(
                                      "Dose adjusted LMWH for all 3 trimesters.\n(ACC/AHA VHD 2020 2b B-NR)",
                                      [2, 3]),
                                ]),
                            TestPageModel(
                                title: "",
                                value: "No",
                                type: TestPageTypeEnum.drug,
                                drugs: [
                                  TestDrugPageModel(
                                      "Continuous dose adjusted UFH for the 1st trimester followed by warfarin for the 2th and 3th trimesters.\n(ACC/AHA VHD 2020 2a B-NR)",
                                      [1, 2, 3]),
                                ])
                          ]),
                      TestPageModel(
                          title: "",
                          value: "No",
                          type: TestPageTypeEnum.drug,
                          drugs: [
                            TestDrugPageModel(
                                "Continue warfarin for all trimesters.\n(ACC/AHA VHD 2020 2a B-NR)",
                                [1, 2, 3])
                          ]),
                    ]),
                TestPageModel(
                    title: "",
                    value: "At least One week before delivery?",
                    type: TestPageTypeEnum.drug,
                    drugs: [
                      TestDrugPageModel(
                          "Discontinue warfarin, switch to IV UFH or dose-adjusted LMWH.\n(ACC/AHA VHD 2020 1 C-LD)",
                          [2, 3])
                    ]),
                TestPageModel(
                    title: "",
                    value: "At least 36 hr. before delivery?",
                    type: TestPageTypeEnum.drug,
                    drugs: [
                      TestDrugPageModel(
                          "Switch to continuous IV UFH (with an aPTT 2 times control)\n(ACC/AHA VHD 2020 1 C-LD)",
                          [2])
                    ]),
                TestPageModel(
                  title: "Stop IV UFH.\n(ACC/AHA VHD 2020 1 C-LD)",
                  value: "4-6 hr. before planned delivery?",
                  type: TestPageTypeEnum.message,
                ),
              ]),
          TestPageModel(
            title: "",
            value: "Undergoing Cardioversion",
            type: TestPageTypeEnum.drug,
            id: 13,
            drugs: [
              TestDrugPageModel(
                  "NOACs are recommended with at least similar efficacy and safety as warfarin.\n(ESC 2020 AF I A)",
                  [1, 2, 3, 4, 5, 6, 7])
            ],
          ),
          TestPageModel(
            title: "",
            value:
                "Is there contraindication for DOAC due to drug-drug interactions?",
            type: TestPageTypeEnum.page,
            id: 14,
            pages: [
              TestPageModel(
                title: "",
                value: "Yes",
                type: TestPageTypeEnum.drug,
                drugs: [
                  TestDrugPageModel("", [1, 2, 3])
                ],
              ),
              TestPageModel(
                title: "",
                value: "No",
                type: TestPageTypeEnum.drug,
                drugs: [
                  TestDrugPageModel("", [1, 2, 3, 4, 5, 6, 7])
                ],
              ),
              TestPageModel(
                title: "",
                value: "Consider drug list",
                type: TestPageTypeEnum.page,
                pages: [],
              ),
            ],
          ),
          TestPageModel(
            title: "",
            value: "Hypertrophic Cardiomyopathy",
            type: TestPageTypeEnum.drug,
            id: 15,
            drugs: [
              TestDrugPageModel(
                  """● In hypertrophic cardiomyopathy, the risk of stroke is high enough independent of risk score to indicate anticoagulation.
● Hypertrophic cardiomyopathy  have roughly an equivalent risk to a CHADsVASc of 3.
(AHA/ACC/ACCP/HRS AF 2023)
● In both obstructive and non-obstructive hypertrophic cardiomyopathy, AF is associated with a high rate of thromboembolism.
(EHRA AF 2021)""", [1, 2, 3, 4, 5, 6, 7])
            ],
          ),
          TestPageModel(
            title: "",
            value: "Congenital heart disease",
            type: TestPageTypeEnum.drug,
            id: 16,
            drugs: [
              TestDrugPageModel(
                  """● It may be reasonable to treat with anticoagulation independent of conventional risk score to reduce risk of thromboembolic events.
(AHA/ACC/ACCP/HRS AF 2023, 2b C-LD)
● Oral anticoagulation should be considered in
all adult patients with intracardiac repair, cyanosis, Fontan palliation, or systemic right ventricle and a history of AF, AFL, or intra-atrial
re-entrant tachycardia.
(ESC 2020 AF IIa C)""", [1, 2, 3, 4, 5, 6, 7])
            ],
          ),
          TestPageModel(
            title: "",
            value: "Ablation",
            type: TestPageTypeEnum.drug,
            id: 17,
            drugs: [
              TestDrugPageModel(
                  """In patients who have undergone catheter ablation of AF, oral anticoagulation should be continued for at
least 3 months after the procedure with a longer duration determined by underlying risk.
(AHA/ACC/ACCP/HRS AF 2023, 1 B-NR)
In patients undergoing surgical ablation, anticoagulation therapy is reasonable for at least 3 months after
the procedure to reduce the risk of stroke or systemic embolism.
(AHA/ACC/ACCP/HRS AF 2023, 2a B-NR)
In AF patients with stroke risk factors not taking OAC before ablation, it is recommended that pre-procedural management of stroke risk includes initiation of anticoagulation and preferably, therapeutic OAC for at least 3 weeks before ablation (I C), or alternatively, the use of TOE to exclude LA thrombus before ablation ( IIa C).
(ESC 2020 AF )""", [1, 2, 3, 4, 5, 6, 7])
            ],
          ),
        ]);
  }

  DrugInteractionModel? drugInteractions;
}

enum TestPageTypeEnum { page, drug, message, result }

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
  });

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
