import 'package:drtest/models/question/question_model.dart';

TestPageModel part3Data(TestModel model) {
  var f4Dosing = TestPageModel(
    title: "",
    value: "4 factor PCC dosing",
    type: TestPageTypeEnum.toPage,
    page: "/f4Dosing",
    id: 8,
  );

  var fPPDosing = TestPageModel(
    title: "",
    value: "FFP dosing",
    type: TestPageTypeEnum.toPage,
    page: "/fPPDosing",
    id: 12,
  );

  var activatedPCCDosing = TestPageModel(
    title: "",
    value: "Activated PCC dosing",
    type: TestPageTypeEnum.toPage,
    page: "/activatedPCCDosing",
    id: 9,
  );

  var idarucizumabDosing = TestPageModel(
    title: "",
    value: "Idarucizumab dosing",
    type: TestPageTypeEnum.toPage,
    page: "/idarucizumabDosing",
    id: 10,
  );

  var andexanetAlfa = TestPageModel(
    title: "",
    value: "Andexanet alfa",
    type: TestPageTypeEnum.toPage,
    page: "/andexanetAlfa",
    id: 11,
  );

  var inrExtra = TestPageModel(
    title:
        "● VKAs must be resumed once the INR achieves the therapeutic range or is slightly elevated.(ESC/VHD 2021)",
    value: "When to resume Warfarin?",
    type: TestPageTypeEnum.end,
  );

  var inr = TestPageModel(
    title: "Is there sign/symptom(s) of active bleeding?",
    value: "Management of supratherapeutic INR",
    type: TestPageTypeEnum.page,
    pages: [
      TestPageModel(
        title: "Which of the following scenarios present?",
        value: "No",
        type: TestPageTypeEnum.page,
        pages: [
          TestPageModel(
            title:
                """For patients with a mechanical prosthetic valve and supratherapeutic INR (>5.0) who are not actively bleeding, the benefit of individualized treatment with oral vitamin K, in addition to temporary withdrawal of the VKA, is uncertain. (ACC/AHA/VHD 2020, 2b C-LD)""",
            value:
                """Patient with supratherapeutic INR + Mechanical heart valve?""",
            type: TestPageTypeEnum.page,
            pages: [inrExtra],
          ),
          TestPageModel(
            title:
                """● In asymptomatic patients with INR >10, the VKA must be stopped and oral vitamin K (2.5-5 mg) prescribed, while the INR must be monitored on a daily base for 2 weeks (ESC/VHD 2021)
● The findings suggested that patients on VKA therapy who have an INR between 4.5 and 10.0 and are not bleeding are not likely to benefit from routine vitamin K administration in addition to temporary VKA cessation. (ACC/AHA/VHD 2020)
● In the absence of bleeding, the use of PCC and/or FFP therapy is not recommended and the decision to start vitamin K should be individualized. (ESC/VHD 2021)""",
            value: """INR > 10""",
            type: TestPageTypeEnum.page,
            pages: [inrExtra],
          ),
          TestPageModel(
            title:
                """● Multiple RCTs in patients with INR between 4.5 and 10 suggest no difference in bleeding events with vitamin K vs. placebo.
● In such patients, warfarin should be stopped temporarily, and a small dose of oral vitamin K (1-2 mg) can be considered on an individual basis balancing between the risks. (ESC/VHD 2021)
● The findings suggested that patients on VKA therapy who have an INR between 4.5 and 10.0 and are not bleeding are not likely to benefit from routine vitamin K administration in addition to temporary VKA cessation. (ACC/AHA/VHD 2020)
● In the absence of bleeding, the use of PCC and/or FFP therapy is not recommended and the decision to start vitamin K should be individualized. (ESC/VHD 2021)""",
            value: """INR between 4.5 and 10""",
            type: TestPageTypeEnum.page,
            pages: [inrExtra],
          ),
          TestPageModel(
            title:
                """● Asymptomatic patients with INR< 4.5 require careful down-titration and/or skipping one or more doses. (ESC/VHD 2021)
● The findings suggested that patients on VKA therapy who have an INR between 4.5 and 10.0 and are not bleeding are not likely to benefit from routine vitamin K administration in addition to temporary VKA cessation. (ACC/AHA/VHD 2020)
● In the absence of bleeding, the use of PCC and/or FFP therapy is not recommended and the decision to start vitamin K should be individualized. (ESC/VHD 2021)""",
            value: """INR< 4.5""",
            type: TestPageTypeEnum.page,
            pages: [inrExtra],
          ),
        ],
      ),
      TestPageModel(
        title: "",
        value: "Yes",
        type: TestPageTypeEnum.page,
        pages: [
          TestPageModel(
              title:
                  """Management of Minor/ Non-life -threatening bleeding while on anticoagulant
        
● Supportive measure. (EHRA/NOAC AF 2021)
● Hold an anticoagulant until hemostasis is achieved. (EHRA/NOAC AF 2021)
● Consider hemodialysis (Dabigatran). (EHRA/NOAC AF 2021)
● Mechanical compression. (EHRA/NOAC AF 2021)
● Delay or discontinue next dose. (EHRA/NOAC AF 2021)
● Reconsider concomitant medication. (EHRA/NOAC AF 2021)""",
              value:
                  "Management of Minor/ Non-life -threatening bleeding while on anticoagulant",
              appbarTitle: "Management of Minor Bleeding while on Warfarin",
              helpDesc:
                  """Minor bleeding: (e.g., epistaxis, bruising, slow gastrointestinal bleeding) can be managed conservatively using local hemostatic measures (e.g., mechanical pressure, and without anticoagulant reversal). Decisions to temporarily discontinue the anticoagulant must balance bleeding and thrombotic risks for each patient on a case-by-case basis.""",
              type: TestPageTypeEnum.page,
              pages: [
                TestPageModel(
                  title:
                      """● In most cases of nuisance or minor bleeding anticoagulation can be re-started, sometimes simply by delaying or skipping a single dose. (EHRA/NOAC AF 2021)
● When bleeding is due to a secondary cause (e.g., bleeding post-trauma, genitourinary bleeding due to cancer, etc.) anticoagulation can be resumed once the cause of the bleeding has been eliminated. (EHRA/NOAC AF 2021)""",
                  value: "When to resume anticoagulant?",
                  type: TestPageTypeEnum.end,
                ),
              ]),
          TestPageModel(
            title:
                """● Consider fluid replacement, and blood transfusion, platelet replacement when indicated. (AF/ESC 2020)
● In patients with AF receiving warfarin who develop life-threatening bleeding, treatment with 4-factor prothrombin complex concentrate (if available) in addition to intravenous vitamin K is recommended to rapidly achieve INR correction over fresh frozen plasma and intravenous vitamin K treatment. (AHA/ACC/ACCP/HRS 2023, 1 A)
● Activated charcoal may be administered up to 6 to 8 hours after the last dose. (AHA/ACC/ACCP/HRS 2023)
● For patients with mechanical valves and uncontrollable bleeding who require immediate reversal of anticoagulation, administration of 4-factor prothrombin complex (or its activated form) is reasonable. (ACC/AHA/VHD 2020, 2a C-LD)
● For patients with mechanical valves and uncontrollable bleeding who have received  4-factor prothrombin concentrate complex,  adjunctive use of intravenous vitamin K is  reasonable if resumption of VKA therapy is not anticipated for 7 days. (ACC/AHA/VHD 2020, 2a C-LD)
● A 10-mg intravenous dose is recommended for life-threatening bleeding when there is no concern for restarting the VKA within the next week. (ACC/AHA/VHD 2020)
● Warfarin should be discontinued and 10 mg vitamin K should be administrated by slow i.v. infusion and repeated every 12 h if needed. Until the anticoagulation effect is reversed, administration of prothrombin complex concentration (PCC) and/or fresh frozen plasma (FFP) therapy should be initiated. (ESC/VHD 2021)
● Prothrombin complex concentrates should be considered in AF patients on VKAs who develop a life-threatening bleed, or bleed into a critical site, to reverse the antithrombotic effect. (ESC EACTS AF 2024)
● Four-factor prothrombin complex concentrates should be considered in AF patients on VKA who develop a severe bleeding complication. (ESC/AF 2020, IIa C)
● Consider FFP. (ESC/AF 2020)""",
            value:
                "● Management of Major/life -threatening bleeding\nOR\n●  Need to undergo urgent surgery",
            appbarTitle: "Management of Major Bleeding while on Warfarin",
            helpDesc:
                "Major bleeding: We define serious/major bleeding as bleeding that is associated with a risk of blood transfusion or bleeding into a critical closed space (eg, intracranial bleeding, compartment syndrome). Major bleeding may also include bleeding requiring intervention for management (e.g., surgery, interventional radiology procedures, endoscopic treatments). Major bleeding has a significant risk of immediate morbidity, regardless of the cause. Some major bleeding may be life-threatening and patients with major bleeding events are at high risk of death during the hospitalization prompted by that bleeding.",
            type: TestPageTypeEnum.page,
            pages: [
              f4Dosing,
              fPPDosing,
              TestPageModel(
                title:
                    """● In patients with AF who develop major gastrointestinal bleeding, resumption of oral anticoagulation therapy may be reasonable after correction of reversible causes of bleeding and reassessment of its long term benefits and risks with a multidisciplinary team approach during SDM with patients. (AHA/ACC/ACCP/HRS 2023, 2b B-NR)
● VKAs must be resumed once the INR achieves the therapeutic range or is slightly elevated. (ESC/VHD 2021)""",
                value:
                    "When to reassume oral anticoagulant following major bleeding?",
                type: TestPageTypeEnum.end,
              ),
            ],
          ),
        ],
      ),
    ],
  );

  var doac = TestPageModel(
      title: "",
      value: "Management of Active bleeding while on DOAC",
      type: TestPageTypeEnum.page,
      pages: [
        TestPageModel(
          title: """● Supportive measure. (EHRA/NOAC AF 2021)
● Hold an anticoagulant until hemostasis is achieved. (EHRA/NOAC AF 2021)
● Consider hemodialysis (Dabigatran). (EHRA/NOAC AF 2021)
● Mechanical compression. (EHRA/NOAC AF 2021)
● Interrupting anticoagulation and performing diagnostic or treatment interventions is recommended in AF patients with active bleeding until the cause of bleeding is identified and resolved. (ESC/EACTS/AF 2024 I C)
● Specific antidotes should be considered in AF patients on a DOAC who develop a life-threatening bleed or bleed into a critical site, to reverse the antithrombotic effect. (ESC EACTS AF 2024 IIa B)
● Delay or discontinue next dose. (EHRA/NOAC AF 2021)
● Reconsider concomitant medication. (EHRA/NOAC AF 2021)""",
          value:
              "Management of Minor/ Non-life -threatening bleeding while on anticoagulant",
          appbarTitle: "Management of Minor Bleeding while on DOAC",
          helpDesc:
              "Minor bleeding: (e.g., epistaxis, bruising, slow gastrointestinal bleeding) can be managed conservatively using local hemostatic measures (e.g., mechanical pressure, and without anticoagulant reversal). Decisions to temporarily discontinue the anticoagulant must balance bleeding and thrombotic risks for each patient on a case-by-case basis.",
          type: TestPageTypeEnum.page,
          pages: [
            TestPageModel(
              title:
                  """● In most cases of nuisance or minor bleeding anticoagulation can be re-started, sometimes simply by delaying or skipping a single dose. (EHRA/NOAC AF 2021)
● When bleeding is due to a secondary cause (e.g., bleeding post-trauma, genitourinary bleeding due to cancer, etc.) anticoagulation can be resumed once the cause of the bleeding has been eliminated. (EHRA/NOAC AF 2021)""",
              value: "When to resume anticoagulant?",
              type: TestPageTypeEnum.end,
            ),
          ],
        ),
        TestPageModel(
            title: "",
            value: """● Management of Major/life -threatening bleeding
OR
●  Need to undergo urgent surgery""",
            appbarTitle: "Management of Major Bleeding while on DOAC",
            helpDesc:
                "Major bleeding: We define serious/major bleeding as bleeding that is associated with a risk of blood transfusion or bleeding into a critical closed space (eg, intracranial bleeding, compartment syndrome). Major bleeding may also include bleeding requiring intervention for management (e.g., surgery, interventional radiology procedures, endoscopic treatments). Major bleeding has a significant risk of immediate morbidity, regardless of the cause. Some major bleeding may be life-threatening and patients with major bleeding events are at high risk of death during the hospitalization prompted by that bleeding.",
            type: TestPageTypeEnum.page,
            pages: [
              TestPageModel(
                title:
                    """● Consider fluid replacement, blood transfusion, platelet replacement when indicated. (ESC/AF 2020)
● In patients with AF receiving dabigatran who develop life-threatening bleeding, treatment with idarucizumab is recommended to rapidly reverse dabigatran’s anticoagulation effect. (AHA/ ACC/ACCP/HRS 2023, 1 B-NR)
● Specific antidotes should be considered in AF patients on a DOAC who develop a life-threatening bleed or bleed into a critical site, to reverse the antithrombotic effect. (ESC EACTS AF 2024 IIa B)
● In patients with AF receiving dabigatran who develop life-threatening bleeding, treatment with activated prothrombin complex concentrate (PCC) is reasonable to reverse dabigatran’s anticoagulation effect if idarucizumab is unavailable. (AHA/ACC/ACCP/HRS 2023, 2a C-LD)
● Activated charcoal may be administered up to 6 to 8 hours after the last dose of an OAC. (AHA/ACC/ACCP/HRS 2023)
● Hemodialysis may be also considered to eliminate dabigatran but may be challenging and impractical due to coagulopathy and hemodynamic instability. (AHA/ACC/ACCP/HRS 2023)
● For patients with bioprosthetic valves or annuloplasty rings who are receiving a direct oral anticoagulant and who require immediate reversal of anticoagulation because of uncontrollable bleeding, treatment with Idarucizumab (for dabigatran) or Andexanet alfa (for anti-Xa agents) is reasonable. (ACC/AHA/VHD 2020, 2a B-NR)
● Idarucizumab is recommended for the reversal of dabigatran in the event of life-threatening bleeding or an urgent procedure. (AHA/ACC/HRS 2019, I B-NR)
● If Idarucizumab is not available, dialysis may be used to partially eliminate dabigatran from the circulation. (EHRA/NOAC AF 2021)
● Fresh frozen plasma (FFP) is no longer considered a useful reversal strategy. In the case of recent acute ingestion of an overdose (especially when ≤2 h ago), the use of activated charcoal to reduce absorption may be considered for any NOAC (with a standard dosing scheme for adults of 30 – 50 g). (EHRA/NOAC AF 2021)""",
                value: "Dabigatran",
                type: TestPageTypeEnum.page,
                pages: [activatedPCCDosing, idarucizumabDosing],
              ),
              TestPageModel(
                title:
                    """● Consider fluid replacement, and blood transfusion, platelet replacement when indicated. (AF/ESC 2020)
● In patients with AF receiving factor Xa inhibitors who develop life-threatening bleeding, treatment with either andexanet alfa (apixaban or rivaroxaban (1 B-NR), edoxaban (1 C-LD) or 4-factor prothrombin complex concentrate is recommended to rapidly reverse factor Xa inhibitor’s anticoagulation effect. (AHA/ACC/ACCP/HRS 2023)
● Activated charcoal may be administered up to 6 to 8 hours after the last dose of an OAC. (AHA/ACC/ACCP/HRS 2023)
● For patients with bioprosthetic valves or annuloplasty rings who are receiving a direct oral anticoagulant and who require immediate reversal of anticoagulation because of uncontrollable bleeding, treatment with idarucizumab (for dabigatran) or andexanet alfa (for anti-Xa agents) is reasonable. (ACC/AHA/VHD 2020, 2a B-NR)
● Andexanet alfa can be useful for the reversal of rivaroxaban and apixaban in the event of life-threatening or uncontrolled bleeding. (AHA/ACC/HRS 2019, IIa B-NR)
● Fresh frozen plasma (FFP) is no longer considered a useful reversal strategy. (EHRA/NOAC AF 2021)
● In the case of recent acute ingestion of an overdose (especially when ≤2 h ago), the use of activated charcoal to reduce absorption may be considered for any NOAC (with a standard dosing scheme for adults of 30 – 50 g). (EHRA/NOAC AF 2021)
● If Idarucizumab or Andexanet alpha is unavailable consider PCC 50 U/kg; +25 U/kg if indicated Or aPCC 50 U/kg; max 200 U/kg/day. (EHRA/NOAC AF 2021)""",
                value: "Apixaban, Rivaroxaban, Edoxaban",
                type: TestPageTypeEnum.page,
                pages: [f4Dosing, andexanetAlfa],
              ),
            ])
      ]);

  var aFICH = TestPageModel(
    title: "When to reassume oral anticoagulant following ICH?",
    value: "AF + ICH",
    type: TestPageTypeEnum.page,
    pages: [
      TestPageModel(
        appbarTitle: "Very high risk of thromboembolic events",
        title:
            """●  In patients with AF and conditions associated with very high risk of thromboembolic events (>5%/year), early (1-2 weeks) resumption of anticoagulation after ICH is reasonable to reduce the risk of thromboembolic events. (AHA/ACC/ACCP/HRS 2023, 2a C-LD)
● LAA occlusion is a potential alternative strategy to long-term anticoagulation in this setting. (EHRA/NOAC AF 2021)""",
        value:
            """Is the patient at very high risk of thromboembolic events (>5%/year), or any of the following present?
● Mechanical heart valve
● Rheumatic valve disease
● Previous history of stroke/Thromboembolism
● High CHA2DS2-VASc score (>5)
● Hypercoagulable state (e.g., active malignancy, genetic thrombophilia)""",
        type: TestPageTypeEnum.end,
      ),
      TestPageModel(
        appbarTitle: "High risk of recurrent ICH",
        title:
            """●  In patients with AF and conditions associated with high risk of recurrent ICH (e.g., cerebral amyloid angiopathy) anticoagulation-sparing strategies (e.g., LAAO) may be considered to reduce the risk of recurrent hemorrhage. (AHA/ACC/ACCP/HRS 2023, 2b B-NR)
● LAA occlusion is a potential alternative strategy to long-term anticoagulation in this setting. (EHRA/NOAC AF 2021)
● All DOAC groups showed significantly lower risks of intracranial hemorrhage (ICH) compared with warfarin. (AHA/ACC/ACCP/HRS 2023)""",
        value:
            """Is the patient at high risk of recurrent ICH or any of the following present?
● Suspected cerebral amyloid angiopathy
● Lobar IPH
● Older age
● >10 cerebral microbleeds on MRI
● Disseminated cortical superficial siderosis on MRI
● Poorly controlled hypertension
● Previous history of spontaneous ICH
● Genetic/acquired coagulopathy
● Untreated symptomatic vascular malformation or aneurysm""",
        type: TestPageTypeEnum.end,
      ),
      TestPageModel(
        title:
            """● In patients with AF and ICH, delayed (4-8 weeks) resumption of anticoagulation may be considered to balance the risks of thromboembolic and hemorrhagic complications after careful risk benefit assessment. (AHA/ACC/ACCP/HRS 2023, 2b C-LD)
● “NOACs should preferentially be used over VKA in this setting” ESO guideline concludes that “restarting oral anticoagulation can be considered after careful weighing of risks and benefits.
● NOACs may be re-started 4-8 weeks after ICB, if the individual risk of cardio-embolic stroke is high and the risk of recurrent ICB is estimated to be lower. (EHRA/NOAC AF 2021)
● LAA occlusion is a potential alternative strategy to long-term anticoagulation in this setting. (EHRA/NOAC AF 2021)
● Consider (re-)initiation of (N)OAC after 4-8 weeks after multidisciplinary team assessment. (EHRA/NOAC AF 2021)
● All DOAC groups showed significantly lower risks of intracranial hemorrhage (ICH) compared with warfarin. (AHA/ACC/ACCP/HRS 2023)""",
        value: """None of the obove.""",
        type: TestPageTypeEnum.end,
      ),
    ],
  );

  var postOperativeAF = TestPageModel(
    title: """What is the duration of anticoagulant therapy?
● In patients who develop postoperative AF after cardiac surgery, it is reasonable to administer anticoagulation when deemed safe in regard to surgical bleeding for 60 days after surgery unless complications develop and to reevaluate the need for longer term anticoagulation. (AHA/ACC/ACCP/HRS 2023 2a, B-NR)
● Long-term OAC therapy to prevent thromboembolic events should be considered in patients at risk for stroke with postoperative AF after non-cardiac surgery, considering the anticipated net clinical benefit of OAC therapy and informed patient preferences. (ESC AF 2020, IIa B)
Long-term oral anticoagulation should be considered in patients with post-operative AF after cardiac and non-cardiac surgery at elevated thromboembolic risk, to prevent ischaemic stroke and 
thromboembolism. (ESC/EACTS/AF 2024 IIa B)
● Long-term OAC therapy to prevent thromboembolic events may be considered in patients at risk for stroke with postoperative AF after cardiac surgery, considering the anticipated net clinical benefit of OAC therapy and informed patient preferences. (ESC AF 2020, IIb B)""",
    value: "Post-operative AF",
    type: TestPageTypeEnum.end,
  );

  var aFduetoHyperthyroidism = TestPageModel(
    title: """What is the duration of anticoagulant therapy?
● In patients with hyperthyroidism and AF who have an elevated risk of stroke based on a standard clinical risk score, anticoagulation is recommended until thyroid function has returned to normal and sinus rhythm can be maintained. (AHA/ACC/ACCP/HRS 2023 1, B-NR)
● In AF patients with hyperthyroidism, spontaneous conversion of AF often occurs once a euthyroid state is achieved. (ESC AF 2020)""",
    value: "AF due to Hyperthyroidism",
    type: TestPageTypeEnum.end,
  );

  var aFInfectiveEndocarditis = TestPageModel(
    title:
        """What is the therapeutic plan for AF patient receiving anticoagulant therapy with concurrent Infective Endocarditis?
● In patients with IE and with evidence of cerebral embolism or stroke, regardless of the other indications for anticoagulation, it is reasonable to temporarily discontinue anticoagulation.(ACC/AHA/VHD 2020, 2a B-NR)
● In patients receiving VKA anticoagulation at the time of IE diagnosis, temporary discontinuation of VKA anticoagulation may be considered. (ACC/AHA/VHD 2020, 2b B-NR)
● In patients on anticoagulant therapy for AF or a mechanical heart valve, continued anticoagulation is associated with a higher risk of intracranial bleeding, particularly after an embolic event. (ACC/AHA/VHD 2020)""",
    value: "AF + Infective Endocarditis",
    type: TestPageTypeEnum.end,
  );

  var aFCABG = TestPageModel(
    title: """What is the antithrombotic plan in AF patients undergoing CABG?
● In patients with concomitant AF, the combination of a single antiplatelet agent (aspiring or clopidogrel) with a NOAC appears reasonable. (EHRA/NOAC/AF 2021)
● One year post-CABG, NOACs may be continued as monotherapy. (EHRA/NOAC/AF 2021)""",
    value: "AF + CABG",
    type: TestPageTypeEnum.end,
  );

  var aFSubarachnoidHemorrhage = TestPageModel(
    title:
        """When to resume anticoagulant following Subarachnoid hemorrhage in patients with AF?
● When SAH  occurs in AF patients taking a NOAC in the absence of a remediable etiology it seems prudent not to re-initiate OAC treatment. (EHRA/NOAC/AF 2021)
● LAA closure may be considered (no RCT data available), ideally in the framework of a randomized trial. (EHRA/NOAC/AF 2021)
● Treatment of any underlying aneurysm or arteriovenous malformation is recommended before resuming OAC. (EHRA/NOAC/AF 2021)""",
    value: "AF + Subarachnoid Hemorrhage",
    type: TestPageTypeEnum.end,
  );

  var aFEpiduralSubduralHematoma = TestPageModel(
    title:
        """When to resume anticoagulant following Epidural/Subdural hematoma in patients with AF?
● It appears to be safe to start or reinitiate OAC about 4 weeks after (surgical removal of) traumatic epidural or subdural hematoma, particularly in the absence of drug / alcohol abuse or a substantial risk of falling. (EHRA/NOAC/AF 2021)
● According to clinical presentation and hematoma extension, brain imaging (using CT or MRI) is recommended before (re-) starting OAC. However, adequately dosed NOAC or no anticoagulation at the time of non-traumatic epidural or subdural hematoma does not support (re-) initiation of oral anticoagulation despite the fact that the risk of ischemic stroke is increased within 4 weeks after nontraumatic SDH according to a retrospective US cohort study. (EHRA/NOAC/AF 2021)""",
    value: "AF + Epidural/Subdural Hematoma",
    type: TestPageTypeEnum.end,
  );

  var dOACDosingErrorInAFPatients = TestPageModel(
    title: "",
    value: "DOAC dosing error in AF patients",
    type: TestPageTypeEnum.page,
    pages: [
      TestPageModel(
        title:
            "How to manage a patient who has forgotten to take a dose of the DOAC?",
        value: "Missed dose",
        type: TestPageTypeEnum.page,
        pages: [
          TestPageModel(
            title:
                """● A forgotten dose may be taken until half of the dosing interval has passed. (EHRA/NOAC/AF 2021)
● For NOACs with a twice-daily (BID) dosing regimen (i.e. every 12 h), a forgotten full dose can be taken up until 6 h after the scheduled intake. (EHRA/NOAC/AF 2021)
● After these time points, the dose should be skipped, and the next scheduled dose should be taken. (EHRA/NOAC/AF 2021)""",
            value: "The patient receiving twice daily dosing DOAC.",
            type: TestPageTypeEnum.end,
          ),
          TestPageModel(
            title:
                """● A forgotten dose may be taken until half of the dosing interval has passed. (EHRA/NOAC/AF 2021)
● For NOACs with a once-daily (QD) dosing regimen, a forgotten dose can be taken up until 12 h after the scheduled intake. (EHRA/NOAC/AF 2021)
● After these time points, the dose should be skipped, and the next scheduled dose should be taken. (EHRA/NOAC/AF 2021)""",
            value: "The patient receiving once daily dosing DOAC.",
            type: TestPageTypeEnum.end,
          ),
        ],
      ),
      TestPageModel(
        title:
            "How to manage a patient who has received double dose of the DOAC?",
        value: "Double dose",
        type: TestPageTypeEnum.page,
        pages: [
          TestPageModel(
            title:
                """● For NOACs with a BID dosing regimen, the next planned dose (i.e. after 12 h) may be skipped, with the regular BID dosing regimen restarted 24 h after the double dose intake. (EHRA/NOAC/AF 2021)""",
            value: "The patient receiving twice daily dosing DOAC.",
            type: TestPageTypeEnum.end,
          ),
          TestPageModel(
            title:
                """● For NOACs with a QD dosing regimen, the patient should continue the normal dosing regimen, i.e. without skipping the next daily dose. (EHRA/NOAC/AF 2021)""",
            value: "The patient receiving once daily dosing DOAC.",
            type: TestPageTypeEnum.end,
          ),
        ],
      ),
      TestPageModel(
        title:
            "What to do if the patient is uncertain about taking the last dose of the DOAC?",
        value: "Uncertainly about dose intake",
        type: TestPageTypeEnum.page,
        pages: [
          TestPageModel(
            title:
                """● For NOACs with a BID dosing regimen, it is generally advisable to not take another tablet / capsule, but to continue with the regular dose regimen, i.e. starting with the next dose at the 12 h interval. (EHRA/NOAC/AF 2021)""",
            value: "The patient receiving twice daily dosing DOAC.",
            type: TestPageTypeEnum.end,
          ),
          TestPageModel(
            title: "",
            value: "The patient receiving once daily dosing DOAC.",
            type: TestPageTypeEnum.page,
            pages: [
              TestPageModel(
                title:
                    """● For NOACs with a QD dosing regimen, when thromboembolic risk is high (CHA2DS2-VASc ≥3), it may generally be advisable to take another tablet 6-8 hours after the original (uncertain) intake and then continue the planned dose regimen. (EHRA/NOAC/AF 2021)""",
                value: "Is the CHA2DS2-VASc score ≥3?",
                type: TestPageTypeEnum.end,
                isMarked: model.q3Point >= 3,
              ),
              TestPageModel(
                title:
                    """● In case the thromboembolic risk is low (CHA2DS2-VASc ≤2) we advise to wait until the next scheduled dose. (EHRA/NOAC/AF 2021)""",
                value: "Is the CHA2DS2-VASc score ≤ 2?",
                type: TestPageTypeEnum.end,
                isMarked: model.q3Point <= 2,
              ),
            ],
          ),
        ],
      ),
    ],
  );

  var administrationOfDOACInCrushedForm = TestPageModel(
    title:
        "Is it possible to crush DOAC in order to administer through a nasogastric tube?",
    value: "Administration of DOAC in crushed form",
    type: TestPageTypeEnum.page,
    pages: [
      TestPageModel(
        title:
            """Administration in crushed form, e.g., via a nasogastric tube, does not alter the bioavailability for apixaban, rivaroxaban and edoxaban. (EHRA/NOAC/AF 2021)""",
        value: "Apixaban Rivaroxaban Edoxaban",
        type: TestPageTypeEnum.end,
      ),
      TestPageModel(
        title:
            """Dabigatran capsules must not be opened as this results in a substantial increase in drug bioavailability (+75% per SmPC). (EHRA/NOAC/AF 2021)""",
        value: "Dabigatran",
        type: TestPageTypeEnum.end,
      ),
    ],
  );

  var switchingBetweenAnticoagulants = TestPageModel(
    title: "",
    value: "Switching between Anticoagulants",
    type: TestPageTypeEnum.page,
    pages: [
      TestPageModel(
        title: "Stop Warfarin and check INR  daily. (EHRA/NOAC/AF 2021)",
        value: "Warfarin to DOAC",
        type: TestPageTypeEnum.page,
        pages: [
          TestPageModel(
            title: "Postpone NOAC Check INR daily. (EHRA/NOAC/AF 2021)",
            value: "INR ≥ 3",
            type: TestPageTypeEnum.end,
          ),
          TestPageModel(
            title: "start NOAC immediately. (EHRA/NOAC/AF 2021)",
            value: "INR ≤ 2",
            type: TestPageTypeEnum.end,
          ),
          TestPageModel(
            title: "start NOAC immediately or next day. (EHRA/NOAC/AF 2021)",
            value: "INR 2-2.5",
            type: TestPageTypeEnum.end,
          ),
          TestPageModel(
            title: "Re-check INR in 1-3 days",
            value: "INR 2.5-3.0",
            type: TestPageTypeEnum.end,
          ),
        ],
      ),
      TestPageModel(
        title: """● Continue NOAC  (half dose for edoxaban). (EHRA/NOAC/AF 2021)
● Start Warfarin. (EHRA/NOAC/AF 2021)
● Measure INR after 3-5 days (before NOAC intake). (EHRA/NOAC/AF 2021)""",
        value: "DOAC to Warfarin",
        type: TestPageTypeEnum.page,
        pages: [
          TestPageModel(
            title:
                """● Continue NOAC (half dose for edoxaban). (EHRA/NOAC/AF 2021)
● Continue Warfarin. (EHRA/NOAC/AF 2021)
● Repeat INR after 1-3 days (before NOAC intake). (EHRA/NOAC/AF 2021)""",
            value: "INR < 2",
            type: TestPageTypeEnum.end,
          ),
          TestPageModel(
            title: """● Stop DOAC. (EHRA/NOAC/AF 2021)
● Continue Warfarin. (EHRA/NOAC/AF 2021)
● Repeat INR 1 day after stopping DOAC. (EHRA/NOAC/AF 2021)""",
            value: "INR ≥ 2",
            type: TestPageTypeEnum.end,
          ),
        ],
      ),
      TestPageModel(
        title:
            """Start NOAC (2-) 4 hours after stopping UFH. (EHRA/NOAC/AF 2021)""",
        value: "UFH to NOAC",
        type: TestPageTypeEnum.end,
      ),
      TestPageModel(
        title:
            """Start UFH 12 (BID NOAC) - 24 (QD NOAC) hours after last NOAC intake. (EHRA/NOAC/AF 2021)""",
        value: "NOAC to UFH",
        type: TestPageTypeEnum.end,
      ),
      TestPageModel(
        title:
            "Substitue QD NOAC at the time of the next dose. (EHRA/NOAC/AF 2021)",
        value: "From BID NOAC to QD NOAC",
        type: TestPageTypeEnum.end,
      ),
      TestPageModel(
        title:
            "substitute BID NOAC at the time of the next dose. (EHRA/NOAC/AF 2021)",
        value: "From QD NOAC to BID NOAC",
        type: TestPageTypeEnum.end,
      ),
      TestPageModel(
        title:
            "substitute LMWH at the time of the next dose. (EHRA/NOAC/AF 2021)",
        value: "BID NOAC to LMWH",
        type: TestPageTypeEnum.end,
      ),
      TestPageModel(
        title:
            "substitute LMWH at the time of the next dose. (EHRA/NOAC/AF 2021)",
        value: "QD NOAC to LMWH",
        type: TestPageTypeEnum.end,
      ),

      //New
      TestPageModel(
        title:
            "UFH infusion should generally be initiated once the INR is < 2.",
        value: "Warfarin to UFH",
        type: TestPageTypeEnum.end,
      ),

      TestPageModel(
        title:
            "When it is important to overlap a heparin product with a VKA, a general rule to follow is to co-administer the two anticoagulants until the effect of the VKA is established. For warfarin, this generally entails four to five days of overlap and at least 24 hours of a therapeutic international normalized ratio (INR).",
        value: "UFH to a Warfarin",
        type: TestPageTypeEnum.end,
      ),
      TestPageModel(
        title:
            "Start warfarin and stop LMWH once INR is in therapeutic range for 2 consecutive days.",
        value: "Enoxaparin to Warfarin",
        type: TestPageTypeEnum.end,
      ),
      TestPageModel(
        title: "Stop warfarin and start treatment dose LMWH when INR",
        value: "Warfarin to Enoxaparin",
        type: TestPageTypeEnum.end,
      ),
      TestPageModel(
        title:
            "Stop heparin infusion and start LMWH injection within 2 hours of stopping.",
        value: "UFH to Enoxaparin",
        type: TestPageTypeEnum.end,
      ),
      TestPageModel(
        title:
            "Stop LMWH and start heparin infusion at the time that the next scheduled dose of LMWH would be due.",
        value: "Enoxaparin to UFH",
        type: TestPageTypeEnum.end,
      ),
    ],
  );

  var modifiableRiskFactorsInAFPatients = TestPageModel(
    title: """Which modifiable risk factors should be considered in AF patients?
● Patients at increased risk of AF should receive comprehensive guideline-directed LRFM for AF, targeting obesity, physical inactivity, unhealthy alcohol consumption, smoking, diabetes, and hypertension. (AHA/ACC/ACCP/HRS 2023 I B-NR)""",
    value: "Modifiable risk factors in AF patients",
    type: TestPageTypeEnum.page,
    pages: [
      TestPageModel(
        title:
            """● In patients with AF who are overweight or obese (with body mass index [BMI] >27 kg/m2), weight loss is recommended, with an ideal target of at least 10% weight loss to reduce AF symptoms, burden, recurrence, and progression to persistent. (AHA/ACC/ACCP/HRS 2023 I B-R)
● Bariatric surgery may be considered in conjunction with lifestyle changes and medical management in individuals with AF and body mass index ≥40 kg/m2 c where a rhythm control strategy is planned, to reduce the recurrence and progression of AF. (ESC/EACTS/AF 2024 IIb C)
● Maintaining normal weight (BMI 20–25 kg/m2) is recommended for the general population to prevent AF. (ESC/EACTS/AF 2024 I B)
● Weight reduction should be considered in obese individuals to prevent AF. (ESC/EACTS/AF 2024 IIa B)
● Weight loss is recommended as part of comprehensive risk factor management in overweight and obese individuals with AF to reduce symptoms and AF burden, with a target of 10% or more reduction in body weight. (ESC/EACTS/AF 2024 I B)
""",
        value:
            "What is the recommendation for overweight or obese patients with AF?",
        appbarTitle: "Recommendations for Obesity",
        type: TestPageTypeEnum.end,
        isMarked: model.bmi > 27,
      ),
      TestPageModel(
        title:
            """● In individuals with AF, moderate-to-vigorous exercise training to a target of 210 minutes per week is recommended to reduce AF symptoms and burden, increase maintenance of sinus rhythm, increase functional capacity, and improve QOL. (AHA/ACC/ACCP/HRS 2023 I B-R)
● Maintaining an active lifestyle is recommended to prevent AF, with the equivalent of 150–300 min per week of moderate intensity or 75–150 min per week of vigorous intensity aerobic physical activity. (ECS/EACTS/AF 2024 I B)
● A tailored exercise programme is recommended in individuals with paroxysmal or persistent AF to improve cardiorespiratory fitness and reduce AF recurrence. (ESC/EACTS/AF 2024 I B)""",
        value:
            "What is the recommendation regarding exercise in patients with AF?",
        appbarTitle: "Recommendations for Exercise",
        type: TestPageTypeEnum.end,
      ),
      TestPageModel(
        title:
            """● Patients with a history of AF who smoke cigarettes should be strongly advised to quit smoking and should receive GDMT for tobacco cessation to mitigate increased risks of AF-related cardiovascular complications and other adverse outcomes. (AHA/ACC/ACCP/HRS 2023 I B-NR)
● Cigarette smoking was associated with less time in therapeutic range for patients on warfarin.""",
        value:
            "What is the recommendation regarding smoking cession in patients with AF?",
        appbarTitle: "Recommendations for Smoking cession",
        type: TestPageTypeEnum.end,
      ),
      TestPageModel(
        title:
            """● Patients with AF seeking a rhythm-control strategy should minimize or eliminate alcohol consumption to reduce AF recurrence and burden. (AHA/ACC/ACCP/HRS 2023 I B-R)
● Avoidance of binge drinking and alcohol excess is recommended in the general population to prevent AF. (ESC/EACTS/AF 2024 I B)
● Reducing alcohol consumption to ≤3 standard drinks (≤30 grams of alcohol) per week is recommended as part of comprehensive risk factor management to reduce AF recurrence. (ESC/EACTS/AF 2024 I B)
""",
        value:
            "What is the recommendation regarding alcohol consumption in patients with AF?",
        appbarTitle: "Recommendations for Alcohol consumption",
        type: TestPageTypeEnum.end,
      ),
      TestPageModel(
        title:
            """● For patients with AF, recommending caffeine abstention to prevent AF episodes is of no benefit, although it may reduce symptoms in patients who report caffeine triggers or worsens AF symptoms. (AHA/ACC/ACCP/HRS 2023 No Benefit B-NR)""",
        value:
            "What is the recommendation regarding caffeine consumption in patients with AF?",
        appbarTitle: "Recommendations for Caffeine consumption",
        type: TestPageTypeEnum.end,
      ),
      TestPageModel(
        title:
            """● For patients with AF and hypertension, optimal BP control is recommended to reduce AF recurrence and AF-related cardiovascular events. (AHA/ACC/ACCP/HRS 2023 I B-NR)
● Blood pressure lowering treatment is recommended in patients with AF and hypertension to reduce recurrence and progression of AF and prevent adverse cardiovascular events. (ESC/EACTS/AF 2024 I B)""",
        value:
            "What is the recommendation regarding the management of hypertension in patients with AF?",
        appbarTitle: "Recommendations for Hypertension management",
        type: TestPageTypeEnum.end,
      ),
      TestPageModel(
        title:
            """● Among patients with AF, it may be reasonable to screen for obstructive sleep apnea, given its high prevalence in patients with AF, although the role of treatment of sleep-disordered breathing (SDB) to maintain sinus rhythm is uncertain. (AHA/ACC/ACCP/HRS 2023 2b B-NR)
● Management of obstructive sleep apnea may be considered as part of a comprehensive management of risk factors in individuals with AF to reduce recurrence and progression. (ESC/EACTS/AF 2024 IIb B)
● When screening for obstructive sleep apnea in individuals with AF, using only symptom-based questionnaires is not recommended. (ESC/EACTS/AF 2024 III B)
""",
        value:
            "What is the recommendation regarding the obstructive sleep apnea  in patients with AF?",
        appbarTitle: "Recommendations for OSA",
        type: TestPageTypeEnum.end,
      ),
    ],
  );

  var aFMonitoring = TestPageModel(
    title:
        """Which parameters should be evaluated in a newly diagnosed AF patient?
● In patients with newly diagnosed AF, a transthoracic echocardiogram to assess cardiac structure, laboratory testing to include a complete blood count, metabolic panel, and thyroid function, and when clinical suspicion exists, targeted testing to assess for other medical conditions associated with AF are recommended to determine stroke and bleeding risk factors, as well as underlying conditions that will guide further management. (AHA/ACC/ACCP/HRS 2023 I B-NR)
● In patients with newly diagnosed AF, protocolized testing for ischemia, acute coronary syndrome (ACS),and pulmonary embolism (PE) should not routinely be performed to assess the etiology of AF unless there are additional signs or symptoms to indicate those disorders. (AHA/ACC/ACCP/HRS 2023 No benefit B-R)""",
    value: "AF Monitoring",
    type: TestPageTypeEnum.page,
    pages: [
      TestPageModel(
        title:
            """● Typically, periodic assessment should be performed once a year but might need to be performed more frequently in the context of changes in clinical status, such as reduction in renal function or development of additional risk factors. (AHA/ACC/ACCP/HRS 2023)""",
        value:
            "What is the minimum interval for Stroke risk assessment in patients with AF?",
        type: TestPageTypeEnum.end,
      ),
      TestPageModel(
        title: "",
        value:
            "What is the minimum interval for evaluating bleeding risk using HAS-BLED score in patients with AF?",
        type: TestPageTypeEnum.page,
        pages: [
          TestPageModel(
            title:
                """● Consider bleeding risk assessment every 6 months. (AHA/ACC/ACCP/HRS 2023)""",
            value: "HAS-BLED score: 0-2",
            type: TestPageTypeEnum.end,
            isMarked: model.hbPoint <= 2,
          ),
          TestPageModel(
            title:
                """● Consider bleeding risk assessment every 3 months. (AHA/ACC/ACCP/HRS 2023)""",
            value: "HAS-BLED score ≥ 3",
            type: TestPageTypeEnum.end,
            isMarked: model.hbPoint >= 3,
          ),
        ],
      ),
      TestPageModel(
        title: "",
        value:
            "What is the minimum interval for evaluating renal function in patients with AF?",
        type: TestPageTypeEnum.page,
        pages: [
          TestPageModel(
            title:
                """● Consider renal function assessment every 6 months. (AHA/ACC/ACCP/HRS 2023)""",
            value: "CrCl > 60",
            type: TestPageTypeEnum.end,
            isMarked: model.cgAnswer >= 60,
          ),
          TestPageModel(
            title:
                """● Consider renal function assessment every 3 months. (AHA/ACC/ACCP/HRS 2023)""",
            value: "CrCl: 30-59",
            type: TestPageTypeEnum.end,
            isMarked: model.cgAnswer >= 30 && model.cgAnswer <= 59,
          ),
          TestPageModel(
            title:
                """● Consider renal function assessment every 1-2 months.(AHA/ACC/ACCP/HRS 2023)""",
            value: "CrCl < 30",
            type: TestPageTypeEnum.end,
            isMarked: model.cgAnswer < 30,
          ),
        ],
      ),
      TestPageModel(
        title: "What is the Child-Pugh score?",
        value:
            "What is the minimum interval for evaluating liver function in patients with AF?",
        type: TestPageTypeEnum.page,
        pages: [
          TestPageModel(
            title:
                """● Consider renal function assessment every 1-2 months. (AHA/ACC/ACCP/HRS 2023)""",
            value: "Child-Pugh: A",
            type: TestPageTypeEnum.end,
            isMarked: model.cpPoint >= 5 && model.cpPoint <= 6,
          ),
          TestPageModel(
            title:
                """● Consider liver function assessment every 3 months. (AHA/ACC/ACCP/HRS 2023)""",
            value: "Child-Pugh: B",
            type: TestPageTypeEnum.end,
            isMarked: model.cpPoint >= 7 && model.cpPoint <= 9,
          ),
          TestPageModel(
            title:
                """● Consider liver function assessment every 6 months. (AHA/ACC/ACCP/HRS 2023)""",
            value: "Child-Pugh: C",
            type: TestPageTypeEnum.end,
            isMarked: model.cpPoint >= 10 && model.cpPoint <= 15,
          ),
          TestPageModel(
            title:
                """● Consider liver function assessment every 12 months. (AHA/ACC/ACCP/HRS 2023)""",
            value: "No liver disease.",
            type: TestPageTypeEnum.end,
            isMarked: model.cpPoint < 7 || model.cpPoint > 15,
          ),
        ],
      ),
    ],
  );

  var antithromboticTherapyInAFPatientsWithConcurrentPAD = TestPageModel(
    title:
        """What is the antithrombotic plan in AF patients with concurrent PAD?
● In patients with AF and concomitant stable PAD, monotherapy oral anticoagulation is reasonable over dual therapy (anticoagulation plus aspirin or P2Y12 inhibitors) to reduce the risk of bleeding. (AHA/ACC/ACCP/HRS 2023 2a, B-NR)""",
    value: "AF + PAD",
    type: TestPageTypeEnum.end,
  );

  var aFCCS = TestPageModel(
    title:
        """What is the antithrombotic plan in AF patient with an indication for anticoagulant with concurrent CCS?
● In patients with CCD who have undergone elective PCI and who require oral anticoagulant therapy, DAPT for 1 to 4 weeks followed by clopidogrel alone for 6 months should be administered in addition to DOAC. (AHA/ACC/ACCP/ASPC/NLA/PCNA CCD 2023 I B-R)
● Antiplatelet therapy beyond 12 months is not recommended in stable patients with chronic coronary or vascular disease treated with oral anticoagulation, due to lack of efficacy and to avoid major bleeding. (ESC/EACTS/AF 2024 III B)
● In patients with CCD who have undergone PCI and who require oral anticoagulant therapy, continuing aspirin in addition to clopidogrel for up to 1 month is reasonable if the patient has a high thrombotic risk (Complex lesions, previous MI, extensive CVD, cardiovascular risk factors) and low bleeding risk. (AHA/ACC/ACCP/ASPC/NLA/PCNA CCD 2023 2a B-R)
● In patients with CCD who require oral anticoagulation and have a low atherothrombotic risk, discontinuation of aspirin therapy with continuation of DOAC alone may be considered 1 year after PCI to reduce bleeding risk. (AHA/ACC/ACCP/ASPC/NLA/PCNA CCD 2023 2b B-R)
● In patients with CCD who require oral anticoagulation, DOAC monotherapy may be considered if there is no acute indication for concomitant antiplatelet therapy. (AHA/ACC/ACCP/ASPC/NLA/PCNA CCD 2023 2b C-LD)
● In patients with AF and CCD (beyond 1 year after revascularization or CAD not requiring coronary revascularization) without history of stent thrombosis, oral anticoagulation monotherapy is recommended over the combination therapy of OAC and single APT (aspirin or P2Y12 inhibitor) to decrease the risk of major bleeding. (AHA/ACC/ACCP/HRS 2023 1, B-R)""",
    value: "AF + CCS",
    type: TestPageTypeEnum.end,
  );

  var aFACS = TestPageModel(
    title: "",
    value: "AF + ACS",
    type: TestPageTypeEnum.page,
    pages: [
      TestPageModel(
        title:
            """● After up to 1 week of triple antithrombotic therapy following the ACS event, dual antithrombotic therapy using a NOAC at the recommended dose for stroke prevention and a single oral antiplatelet agent (preferably clopidogrel) for up to 12 months is recommended. (ESC/ACS 2023 I A)
● Early cessation (≤1 week) of aspirin and continuation of an oral anticoagulant (preferably DOAC) with a P2Y12 inhibitor (preferably clopidogrel) for up to 12 months is recommended in AF patients with ACS undergoing an uncomplicated PCI to avoid major bleeding, if the risk of thrombosis is low or bleeding risk is high. (ESC/EACTS/AF 2024 I A)
● Triple therapy with aspirin, clopidogrel, and oral anticoagulation for longer than 1 week after an ACS should be considered in patients with AF when ischaemic risk outweighs the bleeding risk, with the total duration (≤1 month) decided according to assessment of these risks and clear documentation of the discharge treatment plan. (ESC/EACTS/AF 2024 IIa C)
● In patients treated with an OAC, aspirin plus clopidogrel for longer than 1 week and up to 1 month should be considered in those with high ischemic risk or with other anatomical/procedural characteristics that are judged to outweigh the bleeding risk. (ESC/ACS 2023 II C)
● In patients requiring OAC, withdrawing antiplatelet therapy at 6 months while continuing OAC may be considered. (ESC/ACS 2023 IIb B)
● In patients requiring anticoagulation and treated medically, a single antiplatelet agent in addition to an OAC should be considered for up to 1 year. (ESC/ACS 2023 IIa B)
● In most patients with AF who take oral anticoagulation and undergo PCI, early discontinuation of aspirin(1-4 wk) and continuation of dual antithrombotic therapy with OAC and a P2Y12 inhibitor is preferred over triple therapy (OAC, P2Y12 inhibitor, and aspirin) to reduce the risk of clinically relevant bleeding. (AHA/ACC/ACCP/HRS 2023 1, A)""",
        value:
            "What is the chronic antithrombotic plan in AF patient with an indication for anticoagulant presenting with ACS?",
        appbarTitle: "Chronic Antithrombotic therapy for AF + ACS",
        type: TestPageTypeEnum.page,
        pages: [
          TestPageModel(
            title:
                """Risk criteria for extended antithrombotic therapy:(ESC/ACS 2023)
● Complex CAD 
● Diabetes mellitus requiring medication 
● History of recurrent MI 
● Any multivessel CAD 
● Premature (<45 years) or accelerated (new lesion within a 2-year timeframe) CAD 
● Concomitant systemic inflammatory disease (e.g. human immunodeficiency virus, systemic lupus erythematosus, chronic arthritis) 
● Poly-vascular disease (CAD plus PAD) 
● CKD with eGFR 15–59 mL/min/1.73 m2
● At least three stents implanted 
● At least three lesions treated 
● Total stent length >60 mm 
● History of complex revascularization (left main, bifurcation stenting with ≥2 stents implanted, chronic total occlusion, stenting of last patent vessel) 
● History of stent thrombosis on antiplatelet treatment""",
            value:
                "Which factors favors long term Dual antiplatelet therapy (12 months) or Triple therapy (1 month)?",
            appbarTitle: "Long term DAPT",
            type: TestPageTypeEnum.end,
          ),
          TestPageModel(
            title:
                """Presence of one major criteria or two minor criteria favors short term Dual antiplatelet therapy or Triple therapy.

Major criteria: (ESC ACS 2023)
● Anticipated use of long-term oral anticoagulation
● Severe or end-stage CKD (eGFR <30 mL/min)
● Hemoglobin <11 g/dL
● Spontaneous bleeding requiring hospitalization or transfusion in the past 6 months or at any time, if recurrent
● Moderate or severe baseline thrombocytopenia (platelet count <100 × 109/L)
● Chronic bleeding diathesis
● Liver cirrhosis with portal hypertension
● Active malignancy (excluding non-melanoma skin cancer) within the past 12 months
● Previous spontaneous ICH (at any time)
● Previous traumatic ICH within the past 12 months
● Presence of a brain arteriovenous malformation
● Moderate or severe ischemic stroked within the past 6 months
● Non-deferrable major surgery on dual antiplatelet therapy
● Recent major surgery or major trauma within 30 days before percutaneous coronary intervention

Minor criteria: (ESC ACS 2023)
● Age >75 years
● Moderate CKD (eGFR 30–59 mL/ min)
● Hemoglobin 11–12.9 g/dL for men and 11–11.9 g/dL for women.
● Spontaneous bleeding requiring hospitalization or transfusion within the past 12 months not meeting the major criterion.
● Long-term use of oral non-steroidal anti-inflammatory drugs or steroids.
● Any ischemic stroke at any time not meeting the major criterion.""",
            value:
                "Which factors favors short term Dual antiplatelet therapy (6 months) or Triple therapy (1 week)?",
            appbarTitle: "Short term DAPT",
            type: TestPageTypeEnum.end,
          ),
        ],
      ),
      TestPageModel(
        title:
            """During PCI, a UFH bolus is recommended in any of the following circumstances: 
● If the patient is on a NOAC. (ESC/ACS 2023 I C)
● If the INR is <2.5 in VKA-treated patients. (ESC/ACS 2023 I C)

● Enoxaparin should be considered as an alternative to UFH in patients with STEMI undergoing PPCI. (ESC/ACS 2023 IIa A)
● No parenteral anticoagulation is needed if the INR is >2.5. (ESC/ACS 2023)
● Perform PCI without interruption of VKAs or NOACs. (ESC/ACS 2023)""",
        value:
            "What is the antithrombotic plan during PCI in AF patient presenting with ACS?",
        appbarTitle: "Antithrombotic during PCI",
        type: TestPageTypeEnum.page,
        pages: [
          TestPageModel(
            title:
                """During PCI: 70–100 U/kg i.v. bolus or according to activated clotting time in case of UFH pre-treatment. (ESC/ACS 2023)""",
            value: "What is the UFH dosing during PCI?",
            type: TestPageTypeEnum.end,
          ),
          TestPageModel(
            title: "Patient previously on Enoxaparin?",
            value: "What is the Enoxaparin dosing during PCI?",
            type: TestPageTypeEnum.page,
            pages: [
              TestPageModel(
                title:
                    "Last dose of enoxaparin was given less than 8 h before balloon inflation?",
                value: "Yes",
                type: TestPageTypeEnum.page,
                pages: [
                  TestPageModel(
                    title:
                        """No additional dosing is needed.\n(ESC ACS 2023)""",
                    value: "Yes",
                    type: TestPageTypeEnum.end,
                  ),
                  TestPageModel(
                    title:
                        """If the last SC administration was given more than 8 h before balloon inflation, an i.v. bolus of 0.3 mg/kg enoxaparin sodium should be administered. (ESC/ACS 2023)""",
                    value: "No",
                    type: TestPageTypeEnum.end,
                  ),
                ],
              ),
              TestPageModel(
                title:
                    """I.v. bolus of 0.3 mg/kg enoxaparin sodium should be administered. (ESC/ACS 2023)""",
                value: "No",
                type: TestPageTypeEnum.end,
              ),
            ],
          ),
        ],
      ),
      TestPageModel(
        title:
            """● Perform PCI without interruption of VKAs or NOACs. (ESC/ACS 2023)
● Observational studies indicate that PCI on uninterrupted VKAs is generally safe compared with OAC interruption and heparin-bridging therapy.
● Studies on NOACs are conflicting, predominantly discouraging a PCI on fully uninterrupted NOAC therapy. (EHRA/NOAC AF 2021)""",
        value: "Is there a need for holding DOAC or VKA while undergoing PCI?",
        type: TestPageTypeEnum.end,
      ),
      TestPageModel(
        title: """● Consider Clopidogrel.
● The use of ticagrelor or prasugrel as part of triple antithrombotic therapy is not recommended. (ESC/ACS 2023 III C)""",
        value: "Which P2Y12 inhibitor should be used during triple therapy?",
        type: TestPageTypeEnum.end,
      ),
    ],
  );

  var aFAblation = TestPageModel(
    title: "",
    value: "AF Ablation",
    type: TestPageTypeEnum.page,
    pages: [
      TestPageModel(
        title: "",
        value: "Catheter ablation",
        type: TestPageTypeEnum.page,
        pages: [
          TestPageModel(
            title:
                """● During the ablation, intravenous heparin should be administered to achieve an activated clotting time (ACT) of 300 – 350 seconds. (EHRA/NOAC/AF 2021)
● All patients undergoing catheter ablation require intraprocedural intravenous anticoagulation with heparin or direct thrombin inhibitors in those with heparin allergies. (AHA/ACC/ACCP/HRS 2023)
● Uninterrupted oral anticoagulation is recommended in patients undergoing AF catheter ablation to prevent peri-procedural ischemic stroke and thromboembolism. (ESC/EACTS/AF 2024 I A)""",
            value: "What is the antithrombotic plan during ablation?",
            type: TestPageTypeEnum.end,
          ),
          TestPageModel(
            title: "",
            value:
                "Is there a need for anticoagulant interruption before catheter ablation?",
            appbarTitle: "Anticoagulant interruption before Ablation",
            type: TestPageTypeEnum.page,
            pages: [
              TestPageModel(
                title:
                    """● In patients on warfarin who are undergoing catheter ablation of AF, catheter ablation should be performed on uninterrupted therapeutic anticoagulation with a goal INR of 2.0 to 3.0. (AHA/ACC/ACCP/HRS 2023 1, B-NR)
● For patients undergoing AF catheter ablation who have been therapeutically anticoagulated with warfarin, dabigatran, rivaroxaban, apixaban, or edoxaban, performance of the ablation procedure without OAC interruption is recommended. (ESC/AF 2020, I A)
● Performing left atrial catheter ablation under uninterrupted anticoagulant treatment with VKA (target INR 2.0-2.5 if on VKAs) and uninterrupted NOAC therapy can be considered safe and effective in AF ablation and should likely be the preferred mode of anticoagulation for patients undergoing this procedure. (EHRA/NOAC/AF 2021)""",
                value: "Warfarin",
                type: TestPageTypeEnum.end,
              ),
              TestPageModel(
                title:
                    """● In patients on a DOAC who are undergoing catheter ablation of AF, catheter ablation should be performed with either continuous or minimally interrupted oral anticoagulation. (AHA/ACC/ACCP/HRS 2023 1 A)
● There is no reason to recommend omitting one or two NOAC doses before ablation. (ESC/AF 2020)
After the procedure, administration of the first dose the evening after ablation or the next morning appears to be safe. (ESC/AF 2020)
● For patients undergoing AF catheter ablation who have been therapeutically anticoagulated with warfarin, dabigatran, rivaroxaban, apixaban, or edoxaban, performance of the ablation procedure without OAC interruption is recommended. (ESC/AF 2020, I A)
● Continuation of oral anticoagulation is recommended in patients with AF at elevated thromboembolic risk after concomitant, endoscopic, or hybrid AF ablation, independent of rhythm outcome or LAA exclusion, to prevent ischemic stroke and thromboembolism. (ESC/EACTS/AF 2024 I A)
● Performing left atrial catheter ablation under uninterrupted anticoagulant treatment with VKA (target INR 2.0-2.5 if on VKAs) and uninterrupted NOAC therapy can be considered safe and effective in AF ablation and should likely be the preferred mode of anticoagulation for patients undergoing this procedure. (EHRA/NOAC/AF 2021)
● NOAC interruption might be considered 12 hours before ablation. (Shorter interruption period may be considered if High CHA2DS2VASc Score≥ 4). (EHRA/NOAC/AF 2021)
● The last dose of once-daily based NOACs were recommended (rivaroxaban) or mandated (edoxaban) to be administered in the evening before the procedure whereas twice-daily dosed NOACs(apixaban, dabigatran) were administered in the morning of the procedure. (EHRA/NOAC/AF 2021)""",
                value: "DOAC",
                type: TestPageTypeEnum.page,
                pages: [
                  TestPageModel(
                    title:
                        "● NOAC intake can be resumed 3 - 5 hours after sheath removal if adequate hemostasis is established and pericardial effusion has been ruled out. (EHRA/NOAC/AF 2021)",
                    value: "When to reinitiate DOAC following ablation?",
                    type: TestPageTypeEnum.end,
                  ),
                ],
              ),
            ],
          ),
          TestPageModel(
            title: "",
            value:
                "What is the duration of anticoagulant therapy post catheter ablation?",
            appbarTitle: "Anticoagulant post Ablation",
            type: TestPageTypeEnum.page,
            pages: [
              TestPageModel(
                title:
                    """●  In patients who have undergone catheter ablation of AF, oral anticoagulation should be continued for at least 3 months after the procedure with a longer duration determined by underlying risk. (AHA/ACC/ACCP/HRS 2023 1, B-NR)
● Initiation of oral anticoagulation is recommended at least 3 weeks prior to catheter-based ablation in AF patients at elevated thromboembolic risk, to prevent peri-procedural ischaemic stroke and thromboembolism. (ESC/EACTS/AF 2024 I C)
● In AF patients with stroke risk factors not taking OAC before ablation, it is recommended that pre-procedural management of stroke risk includes initiation of anticoagulation and preferably, therapeutic OAC for at least 3 weeks before ablation (I C), or alternatively, the use of TOE to exclude LA thrombus before ablation (II C). (AF/ESC 2020)""",
                value: "During the first 3 months",
                type: TestPageTypeEnum.end,
              ),
              TestPageModel(
                title:
                    """● In patients who have undergone catheter ablation of AF, continuation of longer-term oral anticoagulation should be dictated according to the patients’ stroke risk (eg, CHA2DS2-VAScscore ≥ 2). (AHA/ACC/ACCP/HRS 2023 1, B-NR)
● Continuation of oral anticoagulation is recommended for at least 2 months after AF ablation in all patients, irrespective of rhythm outcome or CHA2DS2-VA score, to reduce the risk of peri-procedural ischaemic stroke and thromboembolism.(ESC/EACTS/AF 2024 I C)
● Continuation of oral anticoagulation is recommended after AF ablation according to the patient’s CHA2DS2-VA score, and not the perceived success of the ablation procedure, to prevent ischaemic stroke and thromboembolism. (ESC/EACTS/AF 2024 I C)
● Systemic anticoagulation with warfarin or a NOAC is continued for at least 2 (AF ESC 2020, I C) or 3 months (AHA ACC ACCP HRS 2023 1, B-NR) post ablation, and Long-term continuation of systemic anticoagulation beyond 2 months post ablation is based on the patient’s stroke risk profile and not on the apparent success or failure of the ablation procedure. (AF/ESC 2020, I C), (AHA/ACC/ACCP/HRS 2023 1, B-NR)""",
                value: "After the first 3 months",
                type: TestPageTypeEnum.end,
              ),
            ],
          ),
        ],
      ),
      TestPageModel(
        title:
            "What is the duration of anticoagulant therapy post surgical ablation?",
        value: "Surgical ablation",
        type: TestPageTypeEnum.page,
        pages: [
          TestPageModel(
            title:
                """In patients undergoing surgical ablation, anticoagulation therapy is reasonable for at least 3 months after the procedure to reduce the risk of stroke or systemic embolism. (AHA/ACC/ACCP/HRS 2023 2a, B-NR)""",
            value: "During the first 3 months",
            type: TestPageTypeEnum.end,
          ),
          TestPageModel(
            title: """Consider CHA2DS2-VASc score. (AHA/ACC/ACCP/HRS 2023)""",
            value: "After the first 3 months",
            type: TestPageTypeEnum.end,
          ),
        ],
      ),
    ],
  );

  var aFCardioversion = TestPageModel(
    title: "",
    value: "AF Cardioversion",
    type: TestPageTypeEnum.page,
    pages: [
      TestPageModel(
        title:
            """● 3 weeks before elective cardioversion when AF duration is ≥ 48 hours or unknown without imaging evaluation. (AHA/ACC/ACCP/HRS AF 2023, 1 B-R), (AHA/ACC/HRS 2019 I B-R), (EHRA NOAC 2021).

● For patients with AF or atrial flutter of less than 48 hours’ duration with a CHA2DS2-VASc score of 2 or greater in men and 3 or greater in women, administration of heparin, a factor Xa inhibitor, or a direct thrombin inhibitor is reasonable as soon as possible before cardioversion, followed by long-term anticoagulation therapy. (AHA/ACC/HRS 2019, IIa B-NR)""",
        value:
            "What is the duration of anticoagulant therapy pre-cardioversion?",
        type: TestPageTypeEnum.end,
      ),
      TestPageModel(
        title:
            """● 4 weeks after cardioversion when AF duration of ≥24 hours (ESC AF 2020 IIa B), or ≥ 48 hours (AHA/ACC/HRS 2019 I B-R), or regardless of duration (AHA/ACC/ACCP/HRS AF 2023, 1 B-NR).""",
        value:
            "What is the duration of anticoagulant therapy post-cardioversion?",
        type: TestPageTypeEnum.end,
      ),
      TestPageModel(
        title:
            """● In patients with AF in whom cardioversion is deferred due to LAA thrombus detected on precardioversion imaging, therapeutic anticoagulation should be instituted for at least 3 to 6 weeks, after which imaging should be repeated before cardioversion. (AHA/ACC/ACCP/HRS 2023 1, C-LD)""",
        value:
            "What is the antithrombotic plan when LAA thrombus detected on pre-cardioversion imaging?",
        appbarTitle: "LAA thrombosis on imaging",
        type: TestPageTypeEnum.end,
      ),
    ],
  );

  var aFIschemicStrokeOrTIA = TestPageModel(
    title: "",
    value: "AF + Ischemic stroke or TIA",
    type: TestPageTypeEnum.page,
    pages: [
      TestPageModel(
        title:
            """● In AF patients with an ischemic stroke or TIA, long-term secondary prevention of stroke using OAC is recommended if there is nostrict contraindication to OAC use, with a preference for NOACs over VKAs in NOAC-eligible patients. (ESC AF 2020 I A)""",
        value:
            "What is the antithrombotic plan in patients with AF following Ischemic stroke or TIA?",
        appbarTitle: "Antithrombotic plan",
        type: TestPageTypeEnum.end,
      ),
      TestPageModel(
        title:
            """● In AF patients presenting with acute ischemic stroke, very early anticoagulation (<48 h) using UFH, LMWH, or VKAs is not recommended. (ESC AF 2020 III B)""",
        value:
            "When to reinitiate anticoagulant in patients with AF receiving UFH, LMWH or VKA following Ischemic stroke or TIA?",
        appbarTitle: "Anticoagulant re-initiation",
        type: TestPageTypeEnum.end,
      ),
      TestPageModel(
        title: "",
        value:
            "When to reinitiate anticoagulant in patients with AF receiving DOAC following Ischemic stroke or TIA?",
        appbarTitle: "DOAC re-initiation",
        type: TestPageTypeEnum.page,
        pages: [
          TestPageModel(
            title: """If Improvement observed with no clinical worsening:
● Document significant reduction of hemorrhagic transformation by brain CT or MRI ≤ 1 day before (re-)starting a NOAC.
● Consider (re-) starting NOAC therapy after >3-28 days.
● Consider ASA until initiation of NOAC. (EHRA/NOAC/AF 2021)""",
            value: "Hemorrhagic transformation",
            type: TestPageTypeEnum.end,
          ),
          TestPageModel(
            title: "",
            value: "No hemorrhagic transformation",
            type: TestPageTypeEnum.page,
            pages: [
              TestPageModel(
                title: """If no clinical worsening observed:
● Consider (re-) starting NOAC therapy after 1 day. (EHRA/NOAC/AF 2021)""",
                value: "TIA without acute ischemic lesion on brain imaging",
                type: TestPageTypeEnum.end,
              ),
              TestPageModel(
                title: """If no clinical worsening observed:
● Consider (re-) starting NOAC therapy after 1-3 days.
● Consider ASA until initiation of NOAC. (EHRA/NOAC/AF 2021)""",
                value: "TIA with acute ischemic lesion on brain imaging",
                type: TestPageTypeEnum.end,
              ),
              TestPageModel(
                title: """If Improvement observed with no clinical worsening:
● Consider (re-) starting NOAC therapy after >3 days.
● Consider ASA until initiation of NOAC. (EHRA/NOAC/AF 2021)""",
                value: "Persisting mild neurological deficit",
                type: TestPageTypeEnum.end,
              ),
              TestPageModel(
                title:
                    """If hemorrhagic transformation excluded by brain CT or MRI  ≤ 1 day before (re-)starting a NOAC:
● Consider (re-) starting NOAC therapy after >6-8 days.
● Consider ASA until initiation of NOAC. (EHRA/NOAC/AF 2021)""",
                value: "Persisting moderate neurological deficit",
                type: TestPageTypeEnum.end,
              ),
              TestPageModel(
                title:
                    """If hemorrhagic transformation excluded by brain CT or MRI  ≤ 1 day before (re-)starting a NOAC:
● Consider (re-) starting NOAC therapy after >12-14 days.
● Consider ASA until initiation of NOAC. (EHRA/NOAC/AF 2021)""",
                value: "Persisting severe neurological deficit",
                type: TestPageTypeEnum.end,
              ),
            ],
          ),
        ],
      ),
    ],
  );

  var lowToModerateBleedRisk = TestPageModel(
    title:
        """Low-to-moderate-bleed-risk surgery/procedures (30-d risk of major bleed 0%-2%):
● Arthroscopy
● Cutaneous/lymph node biopsies
● Foot/hand surgery
● Coronary angiography
● GI endoscopy ± biopsy
● Colonoscopy ± biopsy
● Abdominal hysterectomy
● Laparoscopic cholecystectomy
● Abdominal hernia repair
● Hemorrhoidal surgery
● Bronchoscopy ± biopsy""",
    value:
        """See the complete list of Low-to-moderate-bleed-risk surgery/procedure""",
    type: TestPageTypeEnum.end,
  );

  var highToModerateBleedRisk = TestPageModel(
    title: """High-bleed-risk surgery/procedures (30-d risk of major bleed≥ 2%):
● Major surgery with extensive tissue injury
● Cancer surgery, especially solid tumor resection (lung, esophagus, gastric, colon, hepatobiliary, pancreatic)
● Major orthopedic surgery, including shoulder replacement surgery
● Reconstructive plastic surgery
● Major thoracic surgery
● Urologic or GI surgery, especially anastomosis surgery
● Transurethral prostate resection, bladder resection, or tumor ablation
● Nephrectomy, kidney biopsy
● Colonic polyp resection
● Bowel resection
● Percutaneous endoscopic gastrostomy placement, endoscopic
● Retrograde cholangiopancreatography
● Surgery in highly vascular organs (kidneys, liver, spleen)
● Cardiac, intracranial, or spinal surgery
● Any major operation (procedure duration > 45 min)
● Neuraxial anesthesia (Includes spinal and epidural anesthesia or any other neuraxial e.g., pain management intervention)
● Epidural injections""",
    value: """See the complete list of high-bleed-risk surgery/procedure""",
    type: TestPageTypeEnum.end,
  );
  var prePostOperativeManagementOfOACs = TestPageModel(
    title: "",
    value: "Pre/ post operative management of OACs.",
    type: TestPageTypeEnum.page,
    pages: [
      TestPageModel(
        title: "",
        value: "Warfarin",
        type: TestPageTypeEnum.page,
        pages: [
          TestPageModel(
            title: "",
            value: "Is there a need for warfarin interruption?",
            type: TestPageTypeEnum.page,
            pages: [
              TestPageModel(
                title: """● Consider Holding Warfarin. (CHEST 2022)

High-bleed-risk surgery/procedures (30-d risk of major bleed≥ 2%):
● Major surgery with extensive tissue injury
● Cancer surgery, especially solid tumor resection (lung, esophagus, gastric, colon, hepatobiliary, pancreatic)
● Major orthopedic surgery, including shoulder replacement surgery
● Reconstructive plastic surgery
● Major thoracic surgery
● Urologic or GI surgery, especially anastomosis surgery
● Transurethral prostate resection, bladder resection, or tumor ablation
● Nephrectomy, kidney biopsy
● Colonic polyp resection
● Bowel resection
● Percutaneous endoscopic gastrostomy placement, endoscopic
● Retrograde cholangiopancreatography
● Surgery in highly vascular organs (kidneys, liver, spleen)
● Cardiac, intracranial, or spinal surgery
● Any major operation (procedure duration > 45 min)
● Neuraxial anesthesia (Includes spinal and epidural anesthesia or any other neuraxial e.g., pain management intervention)
● Epidural injections""",
                value: "High-bleed-risk?",
                type: TestPageTypeEnum.end,
              ),
              highToModerateBleedRisk,
              TestPageModel(
                title: """Consider Holding Warfarin. (CHEST 2022)

Low-to-moderate-bleed-risk surgery/procedures (30-d risk of major bleed 0%-2%):
● Arthroscopy
● Cutaneous/lymph node biopsies
● Foot/hand surgery
● Coronary angiography
● GI endoscopy ±  biopsy
● Colonoscopy ±  biopsy
● Abdominal hysterectomy
● Laparoscopic cholecystectomy
● Abdominal hernia repair
● Hemorrhoidal surgery
● Bronchoscopy ±  biopsy""",
                value: "Low-to-moderate-bleed-risk?",
                type: TestPageTypeEnum.end,
              ),
              lowToModerateBleedRisk,
              TestPageModel(
                title:
                    """Minimal-bleed-risk surgery/procedures (30-d risk of major bleed approximately 0%):
● Minor dermatologic procedures (excision of basal and squamous cell skin cancers, actinic keratoses, and premalignant or cancerous skin nevi)
● Ophthalmologic (cataract) procedures
● Minor dental procedures (dental extractions, restorations, prosthetics, endodontics), dental cleanings, fillings
● Pacemaker or cardioverter-defibrillator device implantation""",
                value:
                    "Minor/Minimal Procedures?\nSee the complete list of minor procedures",
                type: TestPageTypeEnum.page,
                pages: [
                  TestPageModel(
                    title:
                        """● In patients receiving VKA therapy who need a dental procedure, we suggest continuation of VKA over VKA interruption. (CHEST 2022, Conditional Recommendation,
Low Certainty of Evidence)
● Minor procedures including surgery on the skin, dental cleaning, or simple treatment for dental caries, eye surgery, particularly for cataracts or glaucoma, is usually associated with very little bleeding risk is frequently performed without alteration of anticoagulation. (ACC/AHA/VHD 2020)
● For minor surgical procedures (e.g. dental, cataract, skin incision) in which blood loss is usually small and easily controlled, it is recommended that OAC is not interrupted. (ESC/VHD 2021)""",
                    value: "Minor dental procedure",
                    type: TestPageTypeEnum.end,
                  ),
                  TestPageModel(
                    title:
                        """● In patients receiving VKA therapy who require a minor dermatologic procedure, we suggest continuation of VKA over VKA interruption. (CHEST 2022, Conditional Recommendation, Very Low Certainty of Evidence)
● Minor procedures including surgery on the skin, dental cleaning, or simple treatment for dental caries, eye surgery, particularly for cataracts or glaucoma, is usually associated with very little bleeding risk is frequently performed without alteration of anticoagulation. (ACC/AHA/VHD 2020)
● For minor surgical procedures (e.g. dental, cataract, skin incision) in which blood loss is usually small and easily controlled, it is recommended that OAC is not interrupted. (ESC/VHD 2021)""",
                    value: "Minor dermatologic procedure",
                    type: TestPageTypeEnum.end,
                  ),
                  TestPageModel(
                    title:
                        """● In patients receiving VKA therapy who require a minor ophthalmologic procedure, we suggest continuation of VKA over VKA interruption. (CHEST 2022, Conditional Recommendation, Very Low Certainty of Evidence)
● Minor procedures including surgery on the skin, dental cleaning, or simple treatment for dental caries, eye surgery, particularly for cataracts or glaucoma, is usually associated with very little bleeding risk is frequently performed without alteration of anticoagulation. (ACC/AHA/VHD 2020)
● For minor surgical procedures (e.g. dental, cataract, skin incision) in which blood loss is usually small and easily controlled, it is recommended that OAC is not interrupted. (ESC/VHD 2021)""",
                    value: "Minor ophthalmologic procedure",
                    type: TestPageTypeEnum.end,
                  ),
                  TestPageModel(
                    title:
                        """● In patients receiving VKA therapy who require a pacemaker or ICD implantation, we recommend continuation of VKA over VKA interruption and heparin bridging.  (CHEST 2022, Strong Recommendation, Moderate Certainty of Evidence)
●  In patients with AF on warfarin anticoagulation and an annual predicted risk of thromboembolism of ≥ 5% undergoing pacemaker or defibrillator implantation or generator change, continued anticoagulation is recommended in preference to interruption of warfarin and bridging anticoagulation with heparin to reduce the risk of pocket hematoma. (AHA/ACC/ACCP/HRS 2023 1, A)""",
                    value: """Pacemaker or ICD implantation?
OR
Annual predicted risk of thromboembolism of ≥ 5% + 
undergoing pacemaker or defibrillator implantation or generator change?""",
                    type: TestPageTypeEnum.end,
                  ),
                ],
              ),
            ],
          ),
          TestPageModel(
            title: "",
            value: "Elective surgery/procedure",
            type: TestPageTypeEnum.page,
            pages: [
              TestPageModel(
                title:
                    """●  In patients requiring VKA (warfarin) interruption for an elective surgery/procedure, we suggest stopping VKAs (warfarin) ≥  5 days over an interruption of < 5 days before an elective surgery/procedure. (CHEST 2022, Conditional Recommendation, Low Certainty of Evidence).
● It is recommended that VKAs are timely discontinued (<_5 days for warfarin) prior to elective surgery to aim for an INR <1.5. (ESC/VHD 2021, I C)""",
                value:
                    "When to interrupt Warfarin pre elective procedure?\n(Low-to-moderate-bleed-risk, and High-bleed-risk)",
                type: TestPageTypeEnum.page,
                pages: [
                  TestPageModel(
                    title:
                        """● Hold anticoagulant 5 days preprocedural for a target INR<1.5.
                                                    OR
● Hold anticoagulant 2-3 days preprocedural for a target INR<2. (AHA/ACC/ACCP/HRS 2023)

● It is recommended that VKAs are timely discontinued prior to elective surgery to aim for an INR <1.5. (ESC/VHD 2021, I C)""",
                    value: """Low/ Moderate Bleeding Risk Procedure?
(including: Endoscopic, dental extraction, many ophthalmologic procedures, and percutaneous vascular access, such as cardiac catheterization.)""",
                    type: TestPageTypeEnum.end,
                  ),
                  lowToModerateBleedRisk,
                  TestPageModel(
                    title: """● Hold anticoagulant two days preprocedural.
● For patients on DOAC with creatinine clearance lower than the values in the table, few clinical data exist. Consider holding for an additional 1 to 3 days, especially for high
bleeding risk procedures.
● It is recommended that VKAs are timely discontinued prior to elective surgery to aim for an INR <1.5. (ESC/VHD 2021, I C)""",
                    value: """High Bleeding Risk Procedure?
(including: Intra-abdominal, pelvic, orthopedic, neurosurgical, cardiac, and transvenous lead extraction procedures neuraxial anesthesia, and spinal surgery)""",
                    type: TestPageTypeEnum.end,
                  ),
                  highToModerateBleedRisk,
                ],
              ),
              TestPageModel(
                title:
                    """In patients requiring VKA interruption for an elective surgery/procedure who have an elevated INR (ie, > 1.5) 1 to 2 days before the surgery/procedure, we
suggest against routine use of pre-operative vitamin K. (CHEST 2022, Conditional Recommendation, Very Low Certainty of Evidence).""",
                value:
                    "Is there a role for vitamin K if the INR≥ 1.5 1-2 days before elective procedure?",
                type: TestPageTypeEnum.end,
              ),
              TestPageModel(
                title:
                    """● In patients requiring VKA (warfarin) interruption for an elective surgery/procedure, we suggest resuming VKA (warfarin) within 24 hours over a delay to > 24 hours after an elective surgery/procedure. (CHEST 2022, Conditional Recommendation, Low Certainty of Evidence).
● Warfarin can be resumed on the evening of procedure (D0) for most patients, or the day after procedure. (CHEST 2022)
● Warfarin, which takes several days (usually 3-5) to become therapeutic, can often be restarted the evening of the procedure. Postoperative bridging anticoagulation has not been shown to be generally beneficial. (AHA/ACC/ACCP/HRS 2023)""",
                value:
                    "When to resume Warfarin after interruption pre elective procedure?",
                type: TestPageTypeEnum.end,
              ),
              TestPageModel(
                title:
                    """In patients requiring VKA (warfarin) interruption for an elective surgery/procedure, we suggest resuming the first post-operative VKA dose at the patient’s usual dose over resuming VKA with double the usual dose. (CHEST 2022, Conditional Recommendation, Very Low Certainty of Evidence)""",
                value:
                    "What is the warfarin post operative dose after elective procedure?",
                type: TestPageTypeEnum.end,
              ),
              TestPageModel(
                title: "",
                value:
                    "Is there a need for bridging when planning to interrupt Warfarin pre elective surgery?",
                type: TestPageTypeEnum.page,
                pages: [
                  TestPageModel(
                    appbarTitle:
                        "Is the patient receiving VKA therapy for a mechanical heart valve?",
                    title:
                        """● In patients receiving VKA therapy for a mechanical heart valve who require VKA interruption for an elective surgery/procedure, we suggest against heparin Bridging. (CHEST 2022, Conditional Recommendation, Very Low Certainty of Evidence).
● Patients with mechanical valves, and recent stroke/TIA, or other high-risk markers, were not included in most studies and may still benefit from bridging anticoagulation: in these scenarios, management should be individualized.
● In patients with AF on warfarin anticoagulation, who are undergoing surgeries or procedures for which they are holding warfarin, except in patients with mechanical valve or recent stroke or TIA, bridging anticoagulation with low-molecular-weight heparin should not be administered. (AHA/ACC/ACCP/HRS 2023 Harm, B-R)
● For patients who are undergoing invasive procedures and have 1) a mechanical AVR and any thromboembolic risk factor, 2) an older-generation mechanical AVR, or 3) a mechanical mitral valve replacement, bridging anticoagulation therapy during the preoperative time interval when the INR is subtherapeutic is reasonable on an individualized basis, with the risks of bleeding weighed against the benefits of thromboembolism prevention. (ACC/AHA/VHD 2020, 2a C-LD)""",
                    value:
                        "Is the patient receiving VKA therapy for a mechanical heart valve?",
                    type: TestPageTypeEnum.page,
                    pages: [
                      TestPageModel(
                        title:
                            "For patients with a mechanical valve prosthesis receiving VKA therapy who require immediate/emergency noncardiac surgery or an invasive procedure, administration of 4-factor prothrombin complex concentrate (or its activated form) is reasonable. (ACC/AHA/VHD 2020, 2a C-LD)",
                        value:
                            "What is the therapeutic plan if patient with a mechanical valve prosthesis receiving VKA require immediate/ emergency noncardiac surgery or an invasive procedure?",
                        type: TestPageTypeEnum.end,
                      ),
                    ],
                  ),
                  TestPageModel(
                    title:
                        """● In patients receiving VKA therapy for atrial fibrillation who require VKA interruption for an elective surgery/procedure, we recommend against
heparin bridging. (CHEST 2022, Strong Recommendation, Moderate Certainty of Evidence).
● Bridging of OAC is recommended when CHA2DS2-VASc score >_3 for women or 2 for men. (ESC/VHD 2021, I C)""",
                    value:
                        "Is the patient receiving VKA therapy for atrial fibrillation?",
                    type: TestPageTypeEnum.end,
                  ),
                  TestPageModel(
                    title:
                        """In patients receiving VKA therapy for VTE as the sole clinical indication who require VKA interruption for an elective surgery/procedure, we suggest against
heparin bridging. (CHEST 2022, Conditional Recommendation, Very Low Certainty of Evidence).""",
                    value: "Is the patient receiving VKA therapy for VTE?",
                    type: TestPageTypeEnum.end,
                  ),
                  TestPageModel(
                    title:
                        """● In patients receiving VKA therapy who are classified as high risk for thromboembolism and who require VKA interruption for an elective surgery/ procedure, we suggest heparin bridging over no heparin bridging. (CHEST 2022, Conditional Recommendation, Very Low Certainty of Evidence).
● Patients with mechanical valves, and recent stroke/TIA, or other high-risk markers, were not included in most studies and may still benefit from bridging anticoagulation: in these scenarios, management should be individualized.
● In patients with AF on warfarin anticoagulation, who are undergoing surgeries or procedures for which they are holding warfarin, except in patients with mechanical valve or recent stroke or TIA, bridging anticoagulation with low-molecular-weight heparin should not be administered. (AHA/ACC/ACCP/HRS 2023 Harm, B-R)
● For patients who are undergoing invasive procedures and have 1) a mechanical AVR and any thromboembolic risk factor, 2) an older-generation mechanical AVR, or 3) a mechanical mitral valve replacement, bridging anticoagulation therapy during the preoperative time interval when the INR is subtherapeutic is reasonable on an individualized basis, with the risks of bleeding weighed against the benefits of thromboembolism prevention. (ACC/AHA/VHD 2020, 2a C-LD)
● Bridging of OAC, when interruption is needed, is recommended in patients with any of the following indications:
• Mechanical prosthetic heart valve.
• AF with significant mitral stenosis.
• AF with a CHA2DS2-VASc score >_3 for women or 2 for men.
• Acute thrombotic event within the previous 4 weeks.
• High acute thromboembolic risk including: (LV apex thrombus, antithrombin 3 deficit and proteins C and/or S deficit) (ESC/VHD 2021, I C)""",
                    value:
                        """Is the patient classified as classified as high risk for thromboembolism or any of the following scenarios present?
● CHA2DS2VASc score ≥  7 (CHEST 2022)
● History of stroke or TIA or PE during the last 3 months (CHEST 2022)
● History of stroke or TIA or PE during the last 4 weeks (ESC/VHD 2021)
● History of LV apex thrombus, antithrombin 3 deficasy, proteins C and/or S deficasy. (ESC/VHD 2021)
● Rheumatic valvular heart disease (CHEST 2022)
● AF with significant mitral stenosis (ESC/VHD 2021)""",
                    type: TestPageTypeEnum.end,
                  ),
                  TestPageModel(
                    title:
                        """In patients receiving VKA therapy who are classified as low-to-moderate-risk for thromboembolism and who require VKA interruption for an elective surgery/
procedure, we suggest against heparin bridging. (CHEST 2022, Conditional Recommendation, Very Low Certainty of Evidence)""",
                    value:
                        "Is the patient classified as classified as low-to-moderate-risk for thromboembolism or CHA2DS2VASc score between 1-6?",
                    type: TestPageTypeEnum.end,
                  ),
                  TestPageModel(
                    title:
                        """In patients receiving VKA therapy who require VKA interruption for a colonoscopy with anticipated polypectomy, we suggest against heparin bridging
during the period of VKA interruption. (CHEST 2022, Conditional Recommendation, Very Low Certainty of Evidence)""",
                    value:
                        "Patient undergoing a colonoscopy with anticipated Polypectomy?",
                    type: TestPageTypeEnum.end,
                  ),
                  TestPageModel(
                    title:
                        """In patients with AF (excluding those with recent stroke or TIA, or a mechanical valve) and on oral anticoagulation with either warfarin (1 B-R) or DOAC (1 B-NR) who are scheduled to undergo an invasive procedure or surgery, temporary cessation of oral anticoagulation without bridging anticoagulation is recommended. (AHA/ACC/ACCP/HRS 2023)""",
                    value: "None of the above.",
                    type: TestPageTypeEnum.end,
                  ),
                ],
              ),
              TestPageModel(
                title:
                    """● Therapeutic doses of either UFH or subcutaneous LMWH are recommended for bridging. (ESC/VHD 2021, I B)
● Bridging therapy with unfractionated heparin or low-molecular-weight heparin is recommended for patients with AF and a mechanical heart valve undergoing procedures that require interruption of warfarin. (AHA/ACC/HRS 2019, I C)""",
                value: "Which anticoagulants can be considered for bridging?",
                type: TestPageTypeEnum.page,
                pages: [
                  TestPageModel(
                    title: "",
                    value: "Bridging with UFH",
                    type: TestPageTypeEnum.page,
                    pages: [
                      TestPageModel(
                        title:
                            """In patients receiving therapeutic-dose IV UFH bridging for an elective surgery/procedure, we suggest stopping UFH ≥ 4 hours before a surgery/procedure
over stopping IV UFH < 4 hours before a surgery/Procedure. (CHEST 2022, Conditional Recommendation, Very Low Certainty of Evidence)""",
                        value: "When to stop UFH before a surgery/procedure?",
                        type: TestPageTypeEnum.end,
                      ),
                      TestPageModel(
                        title:
                            """ In patients receiving therapeutic-dose IV UFH bridging for an elective surgery/procedure, we suggest resuming UFH ≥ 24 hours after a surgery/procedure
over resuming UFH within 24 hours after a surgery/Procedure. (CHEST 2022, Conditional Recommendation, Very Low Certainty of Evidence)""",
                        value: "When to resume UFH after a surgery/procedure?",
                        type: TestPageTypeEnum.end,
                      ),
                    ],
                  ),
                  TestPageModel(
                    title: "",
                    value: "Bridging with LMWH",
                    type: TestPageTypeEnum.page,
                    pages: [
                      TestPageModel(
                        title:
                            """● In patients receiving LMWH bridging for an elective surgery/procedure, we suggest administering the last pre-operative LMWH bridging dose at approximately 24 hours over administering the last dose 10 to 12 hours before a surgery/procedure. (CHEST 2022, Conditional Recommendation, Very Low Certainty of Evidence).
● The last dose given the AM of the day prior to the procedure at half the total daily dose. (CHEST 2022)""",
                        value:
                            "When to administer the last pre-operative dose of LMWH?",
                        type: TestPageTypeEnum.end,
                      ),
                      TestPageModel(
                        title:
                            """In patients receiving LMWH bridging for an elective surgery/procedure, we suggest administering half the total daily dose of LMWH the day prior to the
surgery/procedure over administering the full dose of LMWH the day prior. (CHEST 2022, Conditional Recommendation, Very Low Certainty of Evidence).""",
                        value:
                            "What is the optimum dose of LMWH the day before the surgery/procedure?",
                        type: TestPageTypeEnum.end,
                      ),
                      TestPageModel(
                        title:
                            """● In patients receiving LMWH bridging for an elective surgery/procedure, we suggest administering the first post-operative LMWH bridging dose at least 24 hours after a surgery/procedure over administering it less than 24 hours after a surgery/Procedure.  (CHEST 2022, Conditional Recommendation, Very Low Certainty of Evidence).
● For high-bleed-risk surgery/procedure: Consider Low-dose LMWH (e.g., enoxaparin, 40 mg daily)  for VTE prophylaxis for first 24-72 hours post-procedure, with full dose LMWH resumed 2-3 days post-procedure. (EHRA/NOAC AF 2021)""",
                        value: "When to resume LMWH after a surgery/procedure?",
                        type: TestPageTypeEnum.end,
                      ),
                      TestPageModel(
                        title: """Consider 1 mg/kg bid.\n(CHEST 2022)""",
                        value: "What is the dose of Enoxaparin for bridging?",
                        type: TestPageTypeEnum.end,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      TestPageModel(
        title: "Elective surgery/procedure",
        value: "DOACs",
        type: TestPageTypeEnum.page,
        pages: [
          TestPageModel(
            title:
                "Is there a need for holding Apixaban before elective surgery/procedure?",
            value: "Apixaban",
            type: TestPageTypeEnum.page,
            pages: [
              TestPageModel(
                title:
                    """In patients receiving apixaban who require an elective surgery/procedure, we suggest stopping apixaban for 1 to 2 days before the surgery/procedure
over apixaban continuation. (CHEST 2022, Conditional Recommendation, Very Low Certainty of Evidence).
 
 When to interrupt Apixaban preprocedural?""",
                value: "Yes",
                type: TestPageTypeEnum.page,
                pages: [
                  TestPageModel(
                    title:
                        """● Consider 1 day off before low-to-moderate-bleed-risk surgery/procedure.
● For patients on DOAC with creatinine clearance lower than the values in the table, few clinical data exist. Consider holding for an additional 1 to 3 days, especially for high bleeding risk procedures. (CHEST 2022, AHA/ACC/ACCP/HRS 2023)""",
                    value:
                        """Is the surgery/procedure low-to-moderate-bleed-risk?
+ (CrCl >25 mL/min)""",
                    type: TestPageTypeEnum.end,
                  ),
                  lowToModerateBleedRisk,
                  TestPageModel(
                    title:
                        """● Consider 2 days off before low-to-moderate-bleed-risk surgery/procedure.
● For patients on DOAC with creatinine clearance lower than the values in the table, few clinical data exist. Consider holding for an additional 1 to 3 days, especially for high bleeding risk procedures. (CHEST 2022, AHA/ACC/ACCP/HRS 2023)""",
                    value:
                        """Is the surgery/procedure high-bleed-risk? + (CrCl >25 mL/min)""",
                    type: TestPageTypeEnum.end,
                  ),
                  highToModerateBleedRisk,
                ],
              ),
            ],
          ),
          TestPageModel(
            title:
                "Is there a need for holding Dabigatran before elective surgery/procedure?",
            value: "Dabigatran",
            type: TestPageTypeEnum.page,
            pages: [
              TestPageModel(
                title:
                    """In patients receiving dabigatran who require an elective surgery/procedure, we suggest stopping dabigatran for 1 to 4 days before the surgery/procedure over dabigatran continuation. (CHEST 2022, Conditional Recommendation, Very Low Certainty of Evidence).
 
When to interrupt Dabigatran preprocedural?""",
                value: "Yes",
                type: TestPageTypeEnum.page,
                pages: [
                  TestPageModel(
                    title: "",
                    value: "CrCl ≥ 50 mL/min",
                    type: TestPageTypeEnum.page,
                    isMarked: model.cgAnswer >= 50,
                    pages: [
                      TestPageModel(
                        title:
                            """Consider 1 day off. (CHEST 2022, AHA/ACC/ACCP/HRS 2023)""",
                        value: "Low-to-moderate-bleed-risk surgery/procedure",
                        type: TestPageTypeEnum.end,
                      ),
                      lowToModerateBleedRisk,
                      TestPageModel(
                        title:
                            """Consider 2 days off. (CHEST 2022, AHA/ACC/ACCP/HRS 2023)""",
                        value: "High-bleed-risk surgery/procedure?",
                        type: TestPageTypeEnum.end,
                      ),
                      highToModerateBleedRisk,
                    ],
                  ),
                  TestPageModel(
                    title: "",
                    value: "CrCl 30-50 mL/min ",
                    type: TestPageTypeEnum.page,
                    isMarked: model.cgAnswer >= 30 && model.cgAnswer <= 50,
                    pages: [
                      TestPageModel(
                        title: """● Consider 2 days off.
● For patients on DOAC with creatinine clearance lower than the values in the table, fewclinical data exist. Consider holding for an additional 1 to 3 days, especially for high bleeding risk procedures. (CHEST 2022, AHA/ACC/ACCP/HRS 2023)""",
                        value: "Low-to-moderate-bleed-risk surgery/procedure?",
                        type: TestPageTypeEnum.end,
                      ),
                      lowToModerateBleedRisk,
                      TestPageModel(
                        title: """● Consider 4 days off.
● For patients on DOAC with creatinine clearance lower than the values in the table, few clinical data exist. Consider holding for an additional 1 to 3 days, especially for high bleeding risk procedures.(CHEST 2022, AHA/ACC/ACCP/HRS 2023)""",
                        value: "High-bleed-risk surgery/procedure?",
                        type: TestPageTypeEnum.end,
                      ),
                      highToModerateBleedRisk,
                    ],
                  ),
                ],
              ),
            ],
          ),
          TestPageModel(
            title:
                "Is there a need for holding Edoxaban before elective surgery/procedure?",
            value: "Edoxaban",
            type: TestPageTypeEnum.page,
            pages: [
              TestPageModel(
                title:
                    """In patients receiving edoxaban who require an elective surgery/procedure, we suggest stopping edoxaban for 1 to 2 days before the surgery/procedure
over edoxaban continuation. (CHEST 2022, Conditional Recommendation, Very Low Certainty of Evidence).
 
When to interrupt Edoxaban preprocedural?""",
                value: "Yes",
                type: TestPageTypeEnum.page,
                pages: [
                  TestPageModel(
                    title: """● Consider 1 day off.
● For patients on DOAC with creatinine clearance lower than the values in the table, few clinical data exist. Consider holding for an additional 1 to 3 days, especially for high bleeding risk procedures. (CHEST 2022, AHA/ACC/ACCP/HRS 2023)""",
                    value:
                        "Low-to-moderate-bleed-risk surgery/procedure? + (CrCl >15 mL/min)",
                    type: TestPageTypeEnum.end,
                  ),
                  lowToModerateBleedRisk,
                  TestPageModel(
                    title: """● Consider 2 days off.
● For patients on DOAC with creatinine clearance lower than the values in the table, few clinical data exist. Consider holding for an additional 1 to 3 days, especially for high bleeding risk procedures. (CHEST 2022, AHA/ACC/ACCP/HRS 2023)""",
                    value:
                        "High-bleed-risk surgery/procedure? + (CrCl >15 mL/min)",
                    type: TestPageTypeEnum.end,
                  ),
                  highToModerateBleedRisk,
                ],
              ),
            ],
          ),
          TestPageModel(
            title:
                "Is there a need for holding Rivaroxaban before elective surgery/procedure?",
            value: "Rivaroxaban",
            type: TestPageTypeEnum.page,
            pages: [
              TestPageModel(
                title:
                    """In patients receiving rivaroxaban who require an elective surgery/procedure, we suggest stopping rivaroxaban for 1 to 2 days before the surgery/ procedure over rivaroxaban continuation.(CHEST 2022, Conditional Recommendation, Very Low Certainty of Evidence).
 
When to interrupt rivaroxaban preprocedural?""",
                value: "Yes",
                type: TestPageTypeEnum.page,
                pages: [
                  TestPageModel(
                    title: """● Consider 1 day off.
● For patients on DOAC with creatinine clearance lower than the values in the table, few clinical data exist. Consider holding for an additional 1 to 3 days, especially for high bleeding risk procedures. (CHEST 2022, AHA/ACC/ACCP/HRS 2023)""",
                    value:
                        "Low-to-moderate-bleed-risk surgery/procedure? + (CrCl > 30 mL/min)",
                    type: TestPageTypeEnum.end,
                  ),
                  lowToModerateBleedRisk,
                  TestPageModel(
                    title: """● Consider 2 days off.
● For patients on DOAC with creatinine clearance lower than the values in the table, few clinical data exist. Consider holding for an additional 1 to 3 days, especially for high bleeding risk procedures. (CHEST 2022, AHA/ACC/ACCP/HRS 2023)""",
                    value:
                        "High-bleed-risk surgery/procedure? + (CrCl > 30 mL/min)",
                    type: TestPageTypeEnum.end,
                  ),
                  highToModerateBleedRisk,
                ],
              ),
            ],
          ),
          TestPageModel(
            title:
                """● In patients who require DOAC interruption for an elective surgery/procedure, we suggest against perioperative heparin bridging. (CHEST 2022, Conditional Recommendation, Very Low Certainty of Evidence).
● Pre-operative bridging with low-molecular weight (LMWH) or unfractionated heparin (UFH) is not recommended in NOAC-treated patients. (EHRA/NOAC/AF 2021)""",
            value:
                "Is there a need  for heparin bridging in patients on DOACs before elective surgery/procedure?",
            type: TestPageTypeEnum.end,
          ),
          TestPageModel(
            title:
                """In patients who had DOAC interruption for an elective surgery/procedure, we suggest resuming DOACs > 24 hours after a surgery/procedure over
resuming DOACs within 24 hours. (CHEST 2022, Conditional Recommendation, Very Low Certainty of Evidence)""",
            value: "When to resume DOACs following elective surgery/procedure?",
            type: TestPageTypeEnum.page,
            pages: [
              TestPageModel(
                title:
                    """● Resume at least 24 hours after low-to-moderate-bleed-risk surgery/procedure. (CHEST 2022)
● Resumption of anticoagulation the day after low bleeding risk surgery is reasonable. (AHA/ACC/ACCP/HRS 2023)""",
                value: "Low-to-moderate-bleed-risk surgery/procedure?",
                type: TestPageTypeEnum.end,
                pages: [
                  TestPageModel(
                    title:
                        """●  In patients with AF on DOAC that has been interrupted for an invasive procedure or surgery, in general, resumption of anticoagulation the day after low bleeding risk surgery and between the evening of the second day and the evening of the third day after high bleeding risk surgery is reasonable, as long as hemostasis has been achieved and further bleeding is not anticipated. (AHA/ACC/ACCP/HRS 2023 2a, B-NR)""",
                    value: "See Detail",
                    type: TestPageTypeEnum.end,
                  ),
                ],
              ),
              lowToModerateBleedRisk,
              TestPageModel(
                title:
                    """● Resume at least 48-72 hours after low-to-moderate-bleed-risk surgery/procedure. (CHEST 2022)
● Resumption of anticoagulation between the evening of the second day and the evening of the third day is reasonable. (AHA/ACC/ACCP/HRS 2023)""",
                value: "High-bleed-risk surgery/procedure?",
                type: TestPageTypeEnum.end,
                pages: [
                  TestPageModel(
                    title:
                        """●  In patients with AF on DOAC that has been interrupted for an invasive procedure or surgery, in general, resumption of anticoagulation the day after low bleeding risk surgery and between the evening of the second day and the evening of the third day after high bleeding risk surgery is reasonable, as long as hemostasis has been achieved and further bleeding is not anticipated. (AHA/ACC/ACCP/HRS 2023 2a, B-NR)""",
                    value: "See Detail",
                    type: TestPageTypeEnum.end,
                  ),
                ],
              ),
              highToModerateBleedRisk,
            ],
          ),
        ],
      ),
    ],
  );

  var targetINRExtra =
      "Anticoagulation with a VKA is indicated to achieve an INR of 3.0. 1 B-NR";

  var targetINR = TestPageModel(
    title: "",
    value: "Target INR in patients with Mechanical Heart Valve",
    type: TestPageTypeEnum.page,
    pages: [
      TestPageModel(
        title: "",
        value: "ACC/AHA VHD 2020",
        type: TestPageTypeEnum.page,
        pages: [
          TestPageModel(
            title: targetINRExtra,
            value: "Mechanical aortic valve replacement  + AF ?",
            type: TestPageTypeEnum.end,
          ),
          TestPageModel(
            title: targetINRExtra,
            value: "Mechanical mitral valve Replacement?",
            type: TestPageTypeEnum.end,
          ),
          TestPageModel(
            title: targetINRExtra,
            value:
                "Mechanical bileaflet or current-generation single-tilting disk aortic valve replacement?",
            type: TestPageTypeEnum.end,
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
                "Carbomedics, Medtronic Hall, ATS, Medtronic Open-Pivot, St Jude Medical, Sorin BicarboN?",
            type: TestPageTypeEnum.end,
          ),
          TestPageModel(
            title: "Target INR is 4.",
            value:
                "Lillehei-Kaster, Omniscience, Starr-Edwards (ball-cage), Bjork-Shiley and other tilting-disc valves?",
            type: TestPageTypeEnum.end,
          ),
          TestPageModel(
            title: "Target INR is 3.5.",
            value: "Other bileaflet valves with insufficient data?",
            type: TestPageTypeEnum.end,
          ),
        ],
      )
    ],
  );

  // var tt = TestPageModel(
  //   title: "",
  //   value: "DOAC dosing error in AF patients",
  //   type: TestPageTypeEnum.page,
  //   pages: [],
  // );

  var list = TestPageModel(
    title: "",
    value: "Considerations",
    type: TestPageTypeEnum.page,
    pages: [
      inr,
      doac,
      aFICH,
      postOperativeAF,
      aFduetoHyperthyroidism,
      aFInfectiveEndocarditis,
      aFCABG,
      aFSubarachnoidHemorrhage,
      aFEpiduralSubduralHematoma,
      dOACDosingErrorInAFPatients,
      administrationOfDOACInCrushedForm,
      switchingBetweenAnticoagulants,
      modifiableRiskFactorsInAFPatients,
      aFMonitoring,
      antithromboticTherapyInAFPatientsWithConcurrentPAD,
      aFCCS,
      aFACS,
      aFAblation,
      aFCardioversion,
      aFIschemicStrokeOrTIA,
      prePostOperativeManagementOfOACs,
      targetINR,
    ],
  );

  for (var item in list.pages) {
    item.isMarked = true;
  }

  return list;
}
