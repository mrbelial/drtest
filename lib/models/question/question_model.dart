import 'package:drtest/models/public/checkbox_model.dart';
import 'package:drtest/models/public/idtitle_model.dart';

class TestModel {
  int id = 0;

  bool isFemale = false;
  int age = 0;

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

  //Test Page Model
  TestPageModel pages = TestPageModel(
      title: "Any of the following situations present?",
      value: "",
      type: TestPageTyoeEnum.page,
      pages: [
        TestPageModel(
          title: "",
          value: "CKD",
          page: "/ckd",
          type: TestPageTyoeEnum.toPage,
        ),
        TestPageModel(
            title: "",
            value: "Liver disease",
            page: "/ld",
            type: TestPageTyoeEnum.page,
            pages: []),
        TestPageModel(
          title: "",
          value: "BMI",
          page: "/bmi",
          type: TestPageTyoeEnum.toPage,
        ),
        TestPageModel(
          title: "",
          value: "Thrombocytopenia",
          page: "/Thrombocytopenia",
          type: TestPageTyoeEnum.toPage,
        ),
        TestPageModel(
          title: "",
          value: "Lactation",
          type: TestPageTyoeEnum.drug,
          drugs: [
            TestDrugPageModel("""All NOACs are secreted into the breast milk.
NOACs should not be used in breastfeeding women, and LMWH should be used 
instead. (ESC 2020 AF)""", [2, 3])
          ],
        ),
        TestPageModel(
          title: "",
          value: "AKI",
          type: TestPageTyoeEnum.drug,
          drugs: [
            TestDrugPageModel(
                """NOACs need to be stopped and switched to unfractionated heparin before resumption after stabilization.
      (AHA/ACC/ACCP/HRS AF 2023, 2a B-NR)""", [2])
          ],
        ),
        TestPageModel(
          title: "",
          value: "Cancer",
          type: TestPageTyoeEnum.drug,
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
          type: TestPageTyoeEnum.drug,
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
          type: TestPageTyoeEnum.drug,
          drugs: [
            TestDrugPageModel(
                "Warfarin may be reasonable to choose over DOACs for stroke risk reduction in view of concerns about DOAC drug absorption.\n(AHA/ACC/ACCP/HRS AF 2023, 2b  C-LD)",
                [1, 2, 3, 4, 5, 6, 7])
          ],
        ),
        TestPageModel(
          title: "",
          value: "History of PCI",
          type: TestPageTyoeEnum.drug,
          drugs: [
            TestDrugPageModel(
                "DOACs are preferred over VKAs.\n(AHA/ACC/ACCP/HRS AF 2023, 1 A)",
                [1, 2, 3, 4, 5, 6, 7])
          ],
        ),
        TestPageModel(
            title: "",
            value: "AF + Valve Disease",
            type: TestPageTyoeEnum.page,
            pages: [
              TestPageModel(
                  title: "",
                  value:
                      "Native valve heart (Including aortic stenosis, aortic regurgitation, mitral regurgitation)",
                  type: TestPageTyoeEnum.drug,
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
                  type: TestPageTyoeEnum.drug,
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
                  type: TestPageTyoeEnum.drug,
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
                        page: "/targetINR",
                        type: TestPageTyoeEnum.toPage,
                      ),
                    ),
                  ]),
              TestPageModel(
                  title: "",
                  value: "Surgical valve repair",
                  type: TestPageTyoeEnum.drug,
                  drugs: [
                    TestDrugPageModel(
                        """OAC with VKA should be considered during the
first 3 months after mitral and tricuspid repair.
(ESC VHD 2021 IIa C)""", [1, 2, 3]),
                  ]),
              TestPageModel(
                  title: "Bioprosthetic valve",
                  value: "Bioprosthetic valve",
                  type: TestPageTyoeEnum.page,
                  pages: [
                    TestPageModel(
                        title: "",
                        value: ">3 months",
                        type: TestPageTyoeEnum.drug,
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
                        type: TestPageTyoeEnum.drug,
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
                                type: TestPageTyoeEnum.drug,
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
            type: TestPageTyoeEnum.page,
            pages: [
              TestPageModel(
                  title: "Warfarin dose >5 mg/day?",
                  value: "More than one week to delivery?",
                  type: TestPageTyoeEnum.page,
                  pages: [
                    TestPageModel(
                        title:
                            "Dose adjusted LMWH with monitoring of Xa levels avaiable?",
                        value: "Yes",
                        type: TestPageTyoeEnum.page,
                        pages: [
                          TestPageModel(
                              title: "",
                              value: "Yes",
                              type: TestPageTyoeEnum.drug,
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
                              type: TestPageTyoeEnum.drug,
                              drugs: [
                                TestDrugPageModel(
                                    "Continuous dose adjusted UFH for the 1st trimester followed by warfarin for the 2th and 3th trimesters.\n(ACC/AHA VHD 2020 2a B-NR)",
                                    [1, 2, 3]),
                              ])
                        ]),
                    TestPageModel(
                        title: "",
                        value: "No",
                        type: TestPageTyoeEnum.drug,
                        drugs: [
                          TestDrugPageModel(
                              "Continue warfarin for all trimesters.\n(ACC/AHA VHD 2020 2a B-NR)",
                              [1, 2, 3])
                        ]),
                  ]),
              TestPageModel(
                  title: "",
                  value: "At least One week before delivery?",
                  type: TestPageTyoeEnum.drug,
                  drugs: [
                    TestDrugPageModel(
                        "Discontinue warfarin, switch to IV UFH or dose-adjusted LMWH.\n(ACC/AHA VHD 2020 1 C-LD)",
                        [2, 3])
                  ]),
              TestPageModel(
                  title: "",
                  value: "At least 36 hr. before delivery?",
                  type: TestPageTyoeEnum.drug,
                  drugs: [
                    TestDrugPageModel(
                        "Switch to continuous IV UFH (with an aPTT 2 times control)\n(ACC/AHA VHD 2020 1 C-LD)",
                        [2])
                  ]),
              TestPageModel(
                title: "Stop IV UFH.\n(ACC/AHA VHD 2020 1 C-LD)",
                value: "4-6 hr. before planned delivery?",
                type: TestPageTyoeEnum.message,
              ),
            ]),
        TestPageModel(
          title: "",
          value: "Undergoing Cardioversion",
          type: TestPageTyoeEnum.drug,
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
          type: TestPageTyoeEnum.page,
          pages: [
            TestPageModel(
              title: "",
              value: "Yes",
              type: TestPageTyoeEnum.drug,
              drugs: [
                TestDrugPageModel("", [1, 2, 3])
              ],
            ),
            TestPageModel(
              title: "",
              value: "No",
              type: TestPageTyoeEnum.drug,
              drugs: [
                TestDrugPageModel("", [1, 2, 3, 4, 5, 6, 7])
              ],
            ),
            TestPageModel(
              title: "",
              value: "Consider drug list",
              type: TestPageTyoeEnum.link,
            ),
          ],
        ),
      ]);
}

enum TestPageTyoeEnum { toPage, page, drug, message, link }

class TestPageModel {
  TestPageModel({
    required this.title,
    required this.value,
    required this.type,
    this.page = "",
    this.drugs = const [],
    this.pages = const [],
  });
  String title;
  String value;
  String page;
  TestPageTyoeEnum type;
  List<TestDrugPageModel> drugs;
  List<TestPageModel> pages;
}

class TestDrugModel {
  TestDrugModel(this.id, this.name);
  int id;
  String name;
  List<int> druginteractions = [];
}

class TestDrugPageModel {
  TestDrugPageModel(this.title, this.drugIds, [this.page]);
  TestPageModel? page;
  String title;
  List<int> drugIds;
  List<TestDrugModel> drugs = [];
}
