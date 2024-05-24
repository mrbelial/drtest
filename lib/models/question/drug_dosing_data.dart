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

  return [
    DrugDosingModel(
      drugId: 2,
      drugName: "UFH",
      param: DrugDosingParams(
        params: [
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
        ],
      ),
    )
  ];
}
