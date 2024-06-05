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

  //Edoxaban
  list.add(
    DrugDosingModel(
        drugId: 5,
        drugName: "Edoxaban",
        param: DrugDosingParams(params: [
          DrugDosingParams(
            page: "/edoxaban_dosing",
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

// //Ex
//   list.add(
//     DrugDosingModel(
//       drugId: 5,
//       drugName: "Edoxaban",
//       param: DrugDosingParams(params: [
//         DrugDosingParams(
//           page: "/edoxaban_dosing",
//           params: [],
//         ),
//       ]),
//     ),
//   );
  return list;
}
