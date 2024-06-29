import 'package:drtest/models/question/question_model.dart';

class DrugDosingModel {
  DrugDosingModel({
    this.drugId = 0,
    this.drugName = "",
    this.drugDose = "",
    required this.param,
  });
  int drugId;
  String drugName;

  String drugDose;
  DrugDosingParams param;
}

enum DrugParamTypeEnum { button, page }

class DrugDosingParams {
  DrugDosingParams({
    this.title = "",
    this.desc = "",
    this.footer = "",
    this.page = "",
    this.buttonTitle = "",
    this.msg = "",
    this.params = const [],
    this.type = DrugParamTypeEnum.button,
  });

  String title;
  String desc;
  String footer;
  String page;
  List<DrugDosingParams> params;
  DrugParamTypeEnum type;
  String buttonTitle;
  String msg;
}

List<DrugDosingModel> drugDosing(TestModel model) {
  var msg1 = """● HIT extremely unlikely.
●Evaluate for other causes of thrombocytopenia.
● Continue to assess HIT probability.
● Can restart/ continue  heparin if clinically indicated.""";

  var extra3 = DrugDosingParams(
      desc: "Is there a thrombosis? (arterial or venous}",
      params: [
        DrugDosingParams(
            buttonTitle: "Yes",
            msg: "Give non-heparin anticoagulant for at least 3 months."),
        DrugDosingParams(
            buttonTitle: "No",
            msg: "Give non-heparin anticoagulant for at least 4 weeks.")
      ]);

  var extra2 = DrugDosingParams(
    desc: "Is there a suspect for HIT?",
    params: [
      DrugDosingParams(
        buttonTitle: "Yes",
        params: [
          DrugDosingParams(
              desc: """4 Ts score Calculator
          (UpToDate)
          Calculator: 4 Ts score for calculating the pretest probability of heparin-induced thrombocytopenia (HIT)""",
              page: "/ts_dosing",
              params: [
                DrugDosingParams(
                  desc: "What is the ELISA result?",
                  params: [
                    DrugDosingParams(
                      buttonTitle:
                          "OD≥ 2 OR OD≥ 1.5 with high probability 4Ts score.",
                      msg: "HIT confirmed",
                      desc: extra3.desc,
                      params: extra3.params,
                    ),
                    DrugDosingParams(
                        buttonTitle:
                            "OD between 0.6 and 1.99 OR Between 0.6 and 1.49 with high probability 4Ts score.",
                        msg:
                            "● Intermediate result.\n● Order functional HIT assay. (e.g. SRA, or HIPA)",
                        desc: "What is the functional assay result?",
                        params: [
                          DrugDosingParams(
                            buttonTitle: "Positive",
                            msg: "HIT confirmed",
                            desc: extra3.desc,
                            params: extra3.params,
                          ),
                          DrugDosingParams(buttonTitle: "Negative", msg: msg1),
                        ]),
                    DrugDosingParams(buttonTitle: "OD < 0.6", msg: msg1),
                  ],
                ),
              ]),
        ],
      ),
      DrugDosingParams(buttonTitle: "No")
    ],
  );

  var extra4 = DrugDosingParams(
      desc: "Is the patient case of major surgery or major trauma ?",
      params: [
        DrugDosingParams(
          buttonTitle: "No",
          msg: "Suggest against platelet count monitoring.",
          desc: extra2.desc,
          params: extra2.params,
        ),
        DrugDosingParams(
          buttonTitle: "Yes",
          msg:
              """Consider Platelet count monitoring every 2 to 3 days from day 0 through day 14.
(Ref: Cuker A, Arepally GM, Chong BH, et al. American Society of Hematology 2018 guidelines for management of venous thromboembolism: heparin-induced thrombocytopenia. Blood Advances 2018; 2:3360.)""",
          desc: extra2.desc,
          params: extra2.params,
        ),
      ]);

  var extra1 = DrugDosingParams(
    desc: """Any of the following scenarios present?
● Medical or obstetric patients.
● Major surgery or major trauma patients.
● History of receiving UFH  in the past 100 days.""",
    params: [
      DrugDosingParams(
        msg:
            """Consider Platelet count monitoring every 2 to 3 days from day 0 through day 14.
(Ref: Cuker A, Arepally GM, Chong BH, et al. American Society of Hematology 2018 guidelines for management of venous thromboembolism: heparin-induced thrombocytopenia. Blood Advances 2018; 2:3360.)
انتخاب مورد/ موارد مشکی
Baseline platelet count and a repeat platelet count within 24 to 48 hours is recommended.
انتخاب مورد قرمز""",
        buttonTitle: "Yes",
        desc: extra2.desc,
        params: extra2.params,
      ),
      DrugDosingParams(
        msg: "Suggest against platelet count monitoring.\n(UpToDate)",
        buttonTitle: "No",
        desc: extra2.desc,
        params: extra2.params,
      )
    ],
  );
  var extra6 = DrugDosingParams(params: [
    DrugDosingParams(
        buttonTitle: "INR still not in range?",
        msg:
            """Assessment of medication adherence, intercurrent illness, new or recently adjusted medications, 
dietary changes, and alcohol intake.
 Education/counselling and more frequent INR checks is critical.(Iia B)
Switching to a NOAC but ensuring good adherence and persistence with therapy is another option. (I B)""")
  ]);

  var warfarinMaintenanceDosing = DrugDosingParams(
    desc: "What is the INR level?",
    params: [
      DrugDosingParams(
          buttonTitle: "< 1.5",
          msg:
              "Give extra one- time daily dose and increase weekly dose by 10-20 %.",
          params: extra6.params),
      DrugDosingParams(
          buttonTitle: "1.5-1.9",
          msg:
              "Increase weekly dose by 5- 15 %.\n(may give extra one -time daily dose)",
          params: extra6.params),
      DrugDosingParams(
          buttonTitle: "2.0-3.0",
          msg: "Maintain current dose.",
          params: extra6.params),
      DrugDosingParams(
          buttonTitle: "3.1-4.0",
          msg: "Hold up to one daily dose and decrease weekly dose by 5-20%.",
          params: extra6.params),
      DrugDosingParams(
          buttonTitle: "4.1-5",
          msg: "Hold up to two daily dose and decrease weekly dose by 10-20%.",
          params: extra6.params),
      DrugDosingParams(
          buttonTitle: "≥ 5",
          msg: "Hold until INR is 2-3, and decrease daily dose by 10-20%.",
          params: extra6.params),
    ],
  );

  var extra5 = DrugDosingParams(params: [
    DrugDosingParams(
      buttonTitle: "What is the maintenance dose?",
      desc: warfarinMaintenanceDosing.desc,
      params: warfarinMaintenanceDosing.params,
    ),
    DrugDosingParams(
        buttonTitle: "INR still not in range?",
        msg:
            """Assessment of medication adherence, intercurrent illness, new or recently adjusted medications, 
dietary changes, and alcohol intake.
 Education/counselling and more frequent INR checks is critical.(Iia B)
Switching to a NOAC but ensuring good adherence and persistence with therapy is another option. (I B)
(AF ESC 2020)"""),
  ]);

  List<DrugDosingModel> list = [];

  //UFH
  list.add(
    DrugDosingModel(
        drugId: 2,
        drugName: "UFH",
        param: DrugDosingParams(params: [
          DrugDosingParams(
            page: "/ufh_dosing",
            params: [
              DrugDosingParams(
                page: "/ptt_dosing",
                params: [
                  DrugDosingParams(
                    desc:
                        "More than 25 unit/kg/hour required while not reaching aPTT in range ?\nOr\n>35,000 units of heparin per 24 hours, excluding initial bolus doses?",
                    params: [
                      DrugDosingParams(
                        desc: "Is Anti Xa level between 0.35 - 0.67 IU/ml?",
                        buttonTitle: "Yes",
                        params: [
                          DrugDosingParams(
                            buttonTitle: "Yes",
                            msg: "Continue with current dose.",
                            desc: extra1.desc,
                            params: extra1.params,
                          ),
                          DrugDosingParams(
                            buttonTitle: "No",
                            msg: """● Investigate reason for UFH resistance.
● Antithrombin replacement therapy might be considered.
● Consider switching to a non-heparin anticoagulant.
(UpToDate)""",
                            desc: extra1.desc,
                            params: extra1.params,
                          ),
                        ],
                      ),
                      DrugDosingParams(
                        buttonTitle: "No",
                        desc: extra1.desc,
                        params: extra1.params,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ])),
  );

  //LMWH
  list.add(
    DrugDosingModel(
        drugId: 3,
        drugName: "LMWH",
        param: DrugDosingParams(params: [
          DrugDosingParams(
            page: "/lmwh_dosing",
            params: [
              DrugDosingParams(
                desc: """Any of the following scenarios present?
● Patients with BMI ≥40 kg/m2 who are unstable, experience unexpected thromboembolic or bleeding complications, or require prolonged VTE treatment.
● CrCl<30 ml/min.""",
                params: [
                  DrugDosingParams(
                    buttonTitle: "Yes",
                    msg:
                        "May consider checking anti-factor Xa activity 4 to 6 hours after dosing, following at least the third or fourth dose.",
                    params: [
                      DrugDosingParams(
                        buttonTitle: "Enoxaparin twice daily dosing?",
                        msg:
                            "The therapeutic ranges is generally 0.5 to 1 anti-factor Xa units/mL.",
                        desc: extra4.desc,
                        params: extra4.params,
                      ),
                      DrugDosingParams(
                        buttonTitle: "Enoxaparin Once Daily Dosing?",
                        msg:
                            "The therapeutic ranges is generally 1.0-2.0 anti-factor Xa units/mL.",
                        desc: extra4.desc,
                        params: extra4.params,
                      ),
                    ],
                  ),
                  DrugDosingParams(
                    buttonTitle: "No",
                    msg:
                        "Generally, anti-factor Xa monitoring is not recommended.",
                    desc: extra4.desc,
                    params: extra4.params,
                  )
                ],
              ),
            ],
          ),
        ])),
  );

  //Warfarin
  list.add(
    DrugDosingModel(
      drugId: 1,
      drugName: "Warfarin",
      param: DrugDosingParams(
        desc:
            """Is there high risk of thromboembolism including any of the following scenario?
● Prior cerebrovascular event
● Transient ischemic attack
●  History of thromboembolism 
● Current intracardiac thrombus
AND
concurrent with low risk of ICH?
(UpToDate)""",
        params: [
          DrugDosingParams(
            buttonTitle: "Yes",
            desc:
                """● Initiation of warfarin with a heparin bridging regimen may be reasonable in these clinical settings.
● Consider warfarin in combination with bridging therapy using UFH or LMWH until therapeutic INR is achieved.
● Bridging therapy should continue for at least 5 days and until therapeutic INR achieved.
● Similar safety and efficacy outcomes have been reported following bridging with either UFH or LMWH.
●  Once a stable therapeutic INR is reached
for >_24 h, bridging can be discontinued.
(ESC VHD 2021)""",
            params: [
              DrugDosingParams(page: "/wafarin_extra"),
            ],
          ),
          DrugDosingParams(
            buttonTitle: "No",
            desc:
                "It is reasonable to initiate warfarin without heparin bridging.\n(UpToDate)",
            params: [
              DrugDosingParams(
                  buttonTitle: "Warfarin initial dosing",
                  desc:
                      """Is the patient categorized as sensitive or any of the following present?
● Age ≥ 70
● Malnourish
● Liver or Kidney disease
● Heart failure
● Concurrent medication known to increase warfarin sensitivity (e.g. amiodarone)""",
                  params: [
                    DrugDosingParams(
                      msg:
                          "Start 5 mg daily for the first 2 days and check INR on the 3th day.",
                      desc: "What is the INR on the 3th day?",
                      buttonTitle: "No",
                      params: [
                        DrugDosingParams(
                            buttonTitle: "< 1.5",
                            msg:
                                "Increase dose to 7.5-10 mg daily.\nCheck INR in the next 2-3 days.",
                            params: extra5.params),
                        DrugDosingParams(
                            buttonTitle: "1.5-1.9",
                            msg:
                                "Continue with 5 mg daily.\nCheck INR in the next 2-3 days.",
                            params: extra5.params),
                        DrugDosingParams(
                            buttonTitle: "2.0-3.0",
                            msg:
                                "Decrease dose to 2.5 mg daily.\nCheck INR in the next 2-3 days.",
                            params: extra5.params),
                        DrugDosingParams(
                            buttonTitle: "3.1-4.0",
                            msg:
                                "Decrease dose to 1.25 mg daily.\nCheck INR in the next 2-3 days.",
                            params: extra5.params),
                        DrugDosingParams(
                            buttonTitle: "> 4.0",
                            msg: "Hold. Check INR in the next 2-3 days.",
                            params: extra5.params),
                      ],
                    ),
                    DrugDosingParams(
                      msg:
                          "Start 2.5 mg daily for the first 2 days and check the INR on the 3th day.",
                      desc: "What is the INR on the 3th day?",
                      buttonTitle: "Yes",
                      params: [
                        DrugDosingParams(
                            buttonTitle: "< 1.5",
                            msg:
                                "Increase dose to 5- 7.5 mg daily.\nCheck INR in the next 2-3 days.",
                            params: extra5.params),
                        DrugDosingParams(
                            buttonTitle: "1.5-1.9",
                            msg:
                                "Continue with 2.5 mg daily.\nCheck INR in the next 2-3 days.",
                            params: extra5.params),
                        DrugDosingParams(
                            buttonTitle: "2.0-3.0",
                            msg:
                                "Decrease dose to 1.25 mg daily.\nCheck INR in the next 2-3 days.",
                            params: extra5.params),
                        DrugDosingParams(
                            buttonTitle: "3.1-4.0",
                            msg:
                                "Decrease dose to 0.5 mg daily.\nCheck INR in the next 2-3 days.",
                            params: extra5.params),
                        DrugDosingParams(
                            buttonTitle: "> 4.0",
                            msg: "Hold. Check INR in the next 2-3 days.",
                            params: extra5.params),
                      ],
                    ),
                  ]),
              DrugDosingParams(
                  buttonTitle: "What is the INR level?",
                  desc: warfarinMaintenanceDosing.desc,
                  params: warfarinMaintenanceDosing.params),
            ],
          ),
        ],
      ),
    ),
  );

  //Edoxaban
  list.add(
    DrugDosingModel(
      drugId: 5,
      drugName: "Edoxaban",
      param: DrugDosingParams(params: [
        DrugDosingParams(page: "/edoxaban_dosing"),
      ]),
    ),
  );

  //Dabigatran
  list.add(
    DrugDosingModel(
      drugId: 6,
      drugName: "Dabigatran",
      param: DrugDosingParams(params: [
        DrugDosingParams(page: "/dabigatran_dosing"),
      ]),
    ),
  );

  //Apixaban
  list.add(
    DrugDosingModel(
      drugId: 4,
      drugName: "Apixaban",
      param: DrugDosingParams(params: [
        DrugDosingParams(page: "/apixaban_dosing"),
      ]),
    ),
  );

  //Rivaroxaban
  list.add(
    DrugDosingModel(
      drugId: 7,
      drugName: "Rivaroxaban",
      param: DrugDosingParams(params: [
        DrugDosingParams(page: "/rivaroxaban_dosing"),
      ]),
    ),
  );

  //4-Factor PCC dosing
  list.add(
    DrugDosingModel(
      drugId: 8,
      drugName: "4-Factor PCC dosing",
      param: DrugDosingParams(params: [
        DrugDosingParams(
            buttonTitle: "Warfarin overdose?", msg: """Enter INR: ….
بصورت عددی توسط کاربر وارد شود، سپس بصورت زیر تحلیل شود:
1. INR 2–<4: 25 units/kg (${model.perWeight(25)})
(up to 2500 units)

2. INR 4–6: 35 units/kg (${model.perWeight(35)})
(up to 3500 units)

3. INR >6: 50 units/kg (${model.perWeight(50)})
(up to 5000 units)


پیام مشترک برای همه:
Repeat INR
within 30 min after the
Administration.

(AHA ACC ACCP HRS 2023)"""),
        DrugDosingParams(
            buttonTitle: "Apixaban, Rivaroxaban, Edoxaban overdose?",
            msg:
                "2000 units once or 25 to 50 units/kg (${model.perWeight(25)} to ${model.perWeight(50)})\n(AHA ACC ACCP HRS 2023)"),
      ]),
    ),
  );

  //Activated PCC
  list.add(
    DrugDosingModel(
      drugId: 9,
      drugName: "Activated PCC",
      param: DrugDosingParams(desc: """Dabigatran-associated life-threatening
bleeding: 
50 units/kg once (${model.perWeight(50)})
(AHA ACC ACCP HRS 2023)"""),
    ),
  );

  //Idarucizumab dosing
  list.add(
    DrugDosingModel(
      drugId: 10,
      drugName: "Idarucizumab dosing",
      param: DrugDosingParams(
          desc:
              """● A total of 5 g idarucizumab is administered intravenously in two ready-to-use doses of 2.5 g i.v., administered as two consecutive infusions over 5 to 10 minutes each or as a bolus injection.

● Additional 5 g may be given if
reappearance of bleeding with
elevated coagulation parameters
have been observed or patients
require second emergency
surgery/procedure and elevated
coagulation parameters.

(AHA ACC ACCP HRS 2023)
(EHRA NOAC AF 2021)""",
          params: [
            DrugDosingParams(
                buttonTitle:
                    "Which monitoring should be considered after idarucizumab administration?",
                msg:
                    """After 24 hours, dabigatran can be re-started if clinically indicated and feasible, with normal kinetics. 
Other anticoagulants, including heparins, are not affected by idarucizumab.
(EHRA NOAC AF 2021)"""),
            DrugDosingParams(
                buttonTitle: "When to reinitiate dabigatran?",
                msg: """Consider monitoring including
coagulation parameters (aPTT,
diluted thrombin time, or ecarin
clotting time) between 12 and
24 h to assess redistribution of
dabigatran from peripheral to
Plasma
(EHRA NOAC AF 2021)"""),
          ]),
    ),
  );

  //Andexanet alfa
  list.add(
    DrugDosingModel(
      drugId: 11,
      drugName: "Andexanet alfa",
      param: DrugDosingParams(desc: """
Which of the following clinical scenario exist regarding the last dose of DOAC?

1- Apixaban ≤ 5 mg OR Rivaroxaban ≤ 10 mg OR Edoxaban ≤ 30 mg regardless of the timing of the last dose:
Low-dose regimen: 400-mg bolus at a
target rate of 30 mg/min followed
by 4 mg/min for up to 120 min


2- Apixaban > 5 mg  OR Rivaroxaban > 10 mg OR  Edoxaban > 30 mg and  last dose taken < 8 hours:
High-dose regimen: 800-mg bolus at a
target rate of 30 mg/min followed
by 8 mg/min for up to 120 min

3- Apixaban > 5 mg  OR Rivaroxaban > 10 mg OR  Edoxaban > 30 mg and  last dose taken ≥ 8 hours:
Low-dose regimen: 400-mg bolus at a
target rate of 30 mg/min followed
by 4 mg/min for up to 120 min
رفرنس مشترک برای همه:
(AHA ACC ACCP HRS 2023)
(EHRA NOAC AF 2021)""", params: [
        DrugDosingParams(
            buttonTitle:
                "Which monitoring should be considered after idarucizumab administration?",
            msg: """Current commercial anti-Xa activity
assays are unsuitable for measuring
factor Xa activities after
andexanet alfa use.
(EHRA NOAC AF 2021)"""),
        DrugDosingParams(
            buttonTitle: "When to reinitiate anti-Xa drugs?",
            msg:
                """Since anticoagulant activity may re-appear after cessation of the infusion it is currently less clear at what point in time and with which anticoagulant effect FXa  inhibitors or heparin can be (re-)administered following andexanet alpha administration.
(EHRA NOAC AF 2021)"""),
      ]),
    ),
  );

  //Vitamin K dosing
  list.add(
    DrugDosingModel(
      drugId: 12,
      drugName: "Vitamin K dosing",
      param: DrugDosingParams(desc: """Null"""),
    ),
  );
  return list;
}
