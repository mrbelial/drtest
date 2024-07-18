import 'package:drtest/models/question/drug_interaction_model.dart';

List<DrugInteractionRowModel> drugInteractionData = [
  DrugInteractionRowModel(
    "Dronedarone",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.red,
          calcType: DrugInteractionCalcType.crcfLess, value: 30),
      DrugInteractionWithType(6, DrugInteractionEnum.yellow,
          calcType: DrugInteractionCalcType.crcfMore, value: 29),
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.red),
      DrugInteractionWithType(5, DrugInteractionEnum.yellow),
    ],
    id: 1,
  ),
  DrugInteractionRowModel(
    "HIV protease inhibitors (e.g., ritonavir)",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.red),
      DrugInteractionWithType(4, DrugInteractionEnum.red),
      DrugInteractionWithType(7, DrugInteractionEnum.red),
      DrugInteractionWithType(5, DrugInteractionEnum.red),
    ],
    id: 2,
  ),
  DrugInteractionRowModel(
    "Itraconazole",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.red),
      DrugInteractionWithType(4, DrugInteractionEnum.red,
          calcType: DrugInteractionCalcType.singleRed),
      DrugInteractionWithType(7, DrugInteractionEnum.red),
      DrugInteractionWithType(5, DrugInteractionEnum.purple, desc: "30 mg QD"),
    ],
    id: 3,
  ),
  DrugInteractionRowModel(
    "Ketoconazole (systemic)",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.red,
          calcType: DrugInteractionCalcType.crcfLess, value: 30),
      DrugInteractionWithType(6, DrugInteractionEnum.yellow,
          calcType: DrugInteractionCalcType.crcfMore, value: 29),
      DrugInteractionWithType(4, DrugInteractionEnum.red,
          calcType: DrugInteractionCalcType.singleRed),
      DrugInteractionWithType(7, DrugInteractionEnum.red),
    ],
    id: 4,
  ),
  DrugInteractionRowModel(
    "Imatinib, Crizotinib",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.red),
      DrugInteractionWithType(4, DrugInteractionEnum.red),
      DrugInteractionWithType(7, DrugInteractionEnum.red),
      DrugInteractionWithType(5, DrugInteractionEnum.red),
    ],
    id: 5,
  ),
  DrugInteractionRowModel(
    "Vandetanib, Sunitinib",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.red),
      DrugInteractionWithType(4, DrugInteractionEnum.red),
      DrugInteractionWithType(7, DrugInteractionEnum.red),
      DrugInteractionWithType(5, DrugInteractionEnum.red),
    ],
    id: 6,
  ),
  DrugInteractionRowModel(
    "Abiraterone",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.red),
      DrugInteractionWithType(4, DrugInteractionEnum.red),
      DrugInteractionWithType(7, DrugInteractionEnum.red),
      DrugInteractionWithType(5, DrugInteractionEnum.red),
    ],
    id: 7,
  ),
  DrugInteractionRowModel(
    "Enzalutamide",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.red),
      DrugInteractionWithType(4, DrugInteractionEnum.red),
      DrugInteractionWithType(7, DrugInteractionEnum.red),
      DrugInteractionWithType(5, DrugInteractionEnum.red),
    ],
    id: 8,
  ),
  DrugInteractionRowModel(
    "Cyclosporine",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.red),
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
      DrugInteractionWithType(5, DrugInteractionEnum.purple, desc: "30 mg QD"),
    ],
    id: 8,
  ),
  DrugInteractionRowModel(
    "Tacrolimus",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.red),
      DrugInteractionWithType(4, DrugInteractionEnum.red),
      DrugInteractionWithType(7, DrugInteractionEnum.red),
      DrugInteractionWithType(5, DrugInteractionEnum.red),
    ],
    id: 9,
  ),
  DrugInteractionRowModel(
    "Darunavir / Cobicistat",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.red),
      DrugInteractionWithType(4, DrugInteractionEnum.red),
      DrugInteractionWithType(7, DrugInteractionEnum.red),
      DrugInteractionWithType(5, DrugInteractionEnum.red),
    ],
  ),
  DrugInteractionRowModel(
    "Cobicistat",
    [
      DrugInteractionWithType(7, DrugInteractionEnum.red),
    ],
  ),
  DrugInteractionRowModel(
    "Lopinavir / Ritonavir",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.red),
      DrugInteractionWithType(4, DrugInteractionEnum.red,
          calcType: DrugInteractionCalcType.singleRed),
      DrugInteractionWithType(7, DrugInteractionEnum.red),
      DrugInteractionWithType(5, DrugInteractionEnum.red),
    ],
    id: 13,
  ),
  DrugInteractionRowModel(
    "Rifampicin",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.darkBlue),
      DrugInteractionWithType(4, DrugInteractionEnum.darkBlue),
      DrugInteractionWithType(7, DrugInteractionEnum.darkBlue),
      DrugInteractionWithType(5, DrugInteractionEnum.purple),
    ],
  ),
  DrugInteractionRowModel(
    "St. John’s wort",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.darkBlue),
      DrugInteractionWithType(4, DrugInteractionEnum.darkBlue),
      DrugInteractionWithType(7, DrugInteractionEnum.darkBlue),
      DrugInteractionWithType(5, DrugInteractionEnum.darkBlue),
    ],
  ),
  DrugInteractionRowModel(
    "Vinblastine",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.darkBlue),
      DrugInteractionWithType(4, DrugInteractionEnum.darkBlue),
      DrugInteractionWithType(7, DrugInteractionEnum.darkBlue),
      DrugInteractionWithType(5, DrugInteractionEnum.darkBlue),
    ],
  ),
  DrugInteractionRowModel(
    "Doxorubicin",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.darkBlue),
      DrugInteractionWithType(4, DrugInteractionEnum.darkBlue),
      DrugInteractionWithType(7, DrugInteractionEnum.darkBlue),
      DrugInteractionWithType(5, DrugInteractionEnum.darkBlue),
    ],
  ),
  DrugInteractionRowModel(
    "Carbamazepine",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.darkBlue),
      DrugInteractionWithType(4, DrugInteractionEnum.darkBlue),
      DrugInteractionWithType(7, DrugInteractionEnum.darkBlue),
      DrugInteractionWithType(5, DrugInteractionEnum.darkBlue),
    ],
  ),
  DrugInteractionRowModel(
    "Phenytoin",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.darkBlue),
      DrugInteractionWithType(4, DrugInteractionEnum.darkBlue),
      DrugInteractionWithType(7, DrugInteractionEnum.darkBlue),
      DrugInteractionWithType(5, DrugInteractionEnum.purple),
    ],
  ),
  DrugInteractionRowModel(
    "Valproic acid",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.darkBlue),
      DrugInteractionWithType(4, DrugInteractionEnum.darkBlue),
      DrugInteractionWithType(7, DrugInteractionEnum.darkBlue),
      DrugInteractionWithType(5, DrugInteractionEnum.darkBlue),
    ],
  ),
  DrugInteractionRowModel(
    "Carbamazepine",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.darkBlue),
    ],
  ),
  DrugInteractionRowModel(
    "Carbamazepine",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.darkBlue),
    ],
  ),
  DrugInteractionRowModel(
    "Amiodarone",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.yellow),
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
      DrugInteractionWithType(5, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Quinidine",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
      DrugInteractionWithType(5, DrugInteractionEnum.yellow),
    ],
    id: 11,
  ),
  DrugInteractionRowModel(
    "Ticagrelor",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.yellow),
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
      DrugInteractionWithType(5, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Clarithromycin",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.yellow),
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
      DrugInteractionWithType(5, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Erythromycin",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.yellow),
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
      DrugInteractionWithType(5, DrugInteractionEnum.purple, desc: "30 mg QD"),
    ],
    id: 12,
  ),
  DrugInteractionRowModel(
    "Posaconazole",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.yellow),
      DrugInteractionWithType(4, DrugInteractionEnum.red),
      DrugInteractionWithType(7, DrugInteractionEnum.red),
      DrugInteractionWithType(5, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Naproxen",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.yellow),
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
      DrugInteractionWithType(5, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "SSRIs; SNRIs",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.yellow),
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
      DrugInteractionWithType(5, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel("Age ≥ 75 years", [
    DrugInteractionWithType(
      6,
      DrugInteractionEnum.yellow,
      calcType: DrugInteractionCalcType.ageMore,
      value: 74,
    ),
    DrugInteractionWithType(
      4,
      DrugInteractionEnum.yellow,
      calcType: DrugInteractionCalcType.ageMore,
      value: 74,
    ),
    DrugInteractionWithType(
      7,
      DrugInteractionEnum.yellow,
      calcType: DrugInteractionCalcType.ageMore,
      value: 74,
    ),
    DrugInteractionWithType(
      5,
      DrugInteractionEnum.yellow,
      calcType: DrugInteractionCalcType.ageMore,
      value: 74,
    ),
  ]),
  DrugInteractionRowModel("Weight ≤ 60 kg", [
    DrugInteractionWithType(
      6,
      DrugInteractionEnum.yellow,
      calcType: DrugInteractionCalcType.weightLess,
      value: 61,
    ),
    DrugInteractionWithType(
      4,
      DrugInteractionEnum.yellow,
      calcType: DrugInteractionCalcType.weightLess,
      value: 61,
    ),
    DrugInteractionWithType(
      7,
      DrugInteractionEnum.yellow,
      calcType: DrugInteractionCalcType.weightLess,
      value: 61,
    ),
    DrugInteractionWithType(
      5,
      DrugInteractionEnum.purple,
      calcType: DrugInteractionCalcType.weightLess,
      value: 61,
    ),
  ]),
  DrugInteractionRowModel(
    "CKD",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.yellow),
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
      DrugInteractionWithType(5, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Antiplatelet drugs",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.yellow),
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
      DrugInteractionWithType(5, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "NSAID",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.yellow),
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
      DrugInteractionWithType(5, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Systemic steroid therapy",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.yellow),
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Nilotinib, Lapatinib",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.yellow),
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
      DrugInteractionWithType(5, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Tamoxifen",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.yellow),
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
      DrugInteractionWithType(5, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Azithromycin",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.yellow),
      DrugInteractionWithType(5, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Atazanavir",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.yellow),
      DrugInteractionWithType(4, DrugInteractionEnum.red),
      DrugInteractionWithType(7, DrugInteractionEnum.red),
      DrugInteractionWithType(5, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Curcumin",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.yellow),
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
      DrugInteractionWithType(5, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Echinacea purpurea",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.yellow),
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
      DrugInteractionWithType(5, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Garlic",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.yellow),
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
      DrugInteractionWithType(5, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Ginger",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.yellow),
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
      DrugInteractionWithType(5, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Ginkgo biloba",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.yellow),
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
      DrugInteractionWithType(5, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Ginseng",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.yellow),
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
      DrugInteractionWithType(5, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Valerian",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.yellow),
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
      DrugInteractionWithType(5, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Atazanavir",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel("Weight ≥ 120 kg", [
    DrugInteractionWithType(
      6,
      DrugInteractionEnum.lightBlue,
      calcType: DrugInteractionCalcType.weightMore,
      value: 120,
    ),
  ]),
  DrugInteractionRowModel(
    "Levetiracetam",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.lightBlue),
      DrugInteractionWithType(4, DrugInteractionEnum.lightBlue),
      DrugInteractionWithType(7, DrugInteractionEnum.lightBlue),
      DrugInteractionWithType(5, DrugInteractionEnum.purple),
    ],
  ),
  DrugInteractionRowModel(
    "Phenobarbital",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.lightBlue),
      DrugInteractionWithType(4, DrugInteractionEnum.lightBlue),
      DrugInteractionWithType(7, DrugInteractionEnum.darkBlue),
      DrugInteractionWithType(5, DrugInteractionEnum.purple),
    ],
  ),
  DrugInteractionRowModel(
    "Verapamil",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.purple,
          desc: "110 mg BID"),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
      DrugInteractionWithType(5, DrugInteractionEnum.yellow),
    ],
    id: 10,
  ),
  DrugInteractionRowModel(
    "Age ≥ 80 years",
    [
      DrugInteractionWithType(
        6,
        DrugInteractionEnum.purple,
        desc: "110 mg BID",
        calcType: DrugInteractionCalcType.ageMore,
        value: 79,
      ),
    ],
    id: 80,
  ),
  DrugInteractionRowModel(
    "Voriconazole",
    [
      DrugInteractionWithType(4, DrugInteractionEnum.red),
      DrugInteractionWithType(7, DrugInteractionEnum.red),
    ],
  ),
  DrugInteractionRowModel(
    "Docetaxel, Vincristine",
    [
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Vinorelbine",
    [
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Etoposide",
    [
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Idarubicin",
    [
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Ifosfamide",
    [
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Cyclophosphamide",
    [
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Lomustine",
    [
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Dasatinib",
    [
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Bicalutamide",
    [
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Anastrozole",
    [
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Temsirolimus, Sirolimus",
    [
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Dexamethasone",
    [
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Green Tea",
    [
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
      DrugInteractionWithType(5, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Horse chestnut",
    [
      DrugInteractionWithType(4, DrugInteractionEnum.yellow),
      DrugInteractionWithType(5, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Vemurafenib",
    [
      DrugInteractionWithType(4, DrugInteractionEnum.lightBlue),
      DrugInteractionWithType(7, DrugInteractionEnum.lightBlue),
    ],
  ),
  DrugInteractionRowModel(
    "Prednisone",
    [
      DrugInteractionWithType(4, DrugInteractionEnum.lightBlue),
      DrugInteractionWithType(7, DrugInteractionEnum.lightBlue),
    ],
  ),
  DrugInteractionRowModel(
    "Oxcarbazepine",
    [
      DrugInteractionWithType(4, DrugInteractionEnum.lightBlue),
      DrugInteractionWithType(7, DrugInteractionEnum.lightBlue),
    ],
  ),
  DrugInteractionRowModel(
    "Topiramate",
    [
      DrugInteractionWithType(4, DrugInteractionEnum.lightBlue),
      DrugInteractionWithType(7, DrugInteractionEnum.lightBlue),
    ],
  ),
  DrugInteractionRowModel(
    "Fluconazole",
    [
      DrugInteractionWithType(7, DrugInteractionEnum.yellow),
    ],
  ),
  DrugInteractionRowModel(
    "Vorapaxar",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.red),
      DrugInteractionWithType(4, DrugInteractionEnum.red),
      DrugInteractionWithType(7, DrugInteractionEnum.red),
    ],
  ),
  DrugInteractionRowModel(
    "Abciximab",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.red),
      DrugInteractionWithType(4, DrugInteractionEnum.red),
      DrugInteractionWithType(7, DrugInteractionEnum.red),
      DrugInteractionWithType(5, DrugInteractionEnum.red),
    ],
  ),
  DrugInteractionRowModel(
    "Alteplase",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.red),
      DrugInteractionWithType(4, DrugInteractionEnum.red),
      DrugInteractionWithType(7, DrugInteractionEnum.red),
      DrugInteractionWithType(5, DrugInteractionEnum.red),
    ],
  ),
  DrugInteractionRowModel(
    "Defibrotide",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.red),
      DrugInteractionWithType(4, DrugInteractionEnum.red),
      DrugInteractionWithType(7, DrugInteractionEnum.red),
      DrugInteractionWithType(5, DrugInteractionEnum.red),
    ],
  ),
  DrugInteractionRowModel(
    "Lasmiditan",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.red),
      DrugInteractionWithType(5, DrugInteractionEnum.red),
    ],
  ),
  DrugInteractionRowModel(
    "Mifepristone",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.red),
      DrugInteractionWithType(4, DrugInteractionEnum.red),
      DrugInteractionWithType(7, DrugInteractionEnum.red),
      DrugInteractionWithType(5, DrugInteractionEnum.red),
    ],
  ),
  DrugInteractionRowModel(
    "Pacritinib",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.red),
    ],
  ),
  DrugInteractionRowModel(
    "Sparsentan",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.red),
      DrugInteractionWithType(5, DrugInteractionEnum.red),
    ],
  ),
  DrugInteractionRowModel(
    "Streptokinase",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.red),
      DrugInteractionWithType(4, DrugInteractionEnum.red),
      DrugInteractionWithType(7, DrugInteractionEnum.red),
      DrugInteractionWithType(5, DrugInteractionEnum.red),
    ],
  ),
  DrugInteractionRowModel(
    "Taurursodiol",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.red),
      DrugInteractionWithType(5, DrugInteractionEnum.red),
    ],
  ),
  DrugInteractionRowModel(
    "Tenecteplase",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.red),
      DrugInteractionWithType(4, DrugInteractionEnum.red),
      DrugInteractionWithType(7, DrugInteractionEnum.red),
      DrugInteractionWithType(5, DrugInteractionEnum.red),
    ],
  ),
  DrugInteractionRowModel(
    "Hemin",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.red),
      DrugInteractionWithType(4, DrugInteractionEnum.red),
      DrugInteractionWithType(7, DrugInteractionEnum.red),
      DrugInteractionWithType(5, DrugInteractionEnum.red),
    ],
  ),
  DrugInteractionRowModel(
    "Apalutamide",
    [
      DrugInteractionWithType(6, DrugInteractionEnum.darkBlue),
      DrugInteractionWithType(4, DrugInteractionEnum.darkBlue),
      DrugInteractionWithType(7, DrugInteractionEnum.darkBlue),
    ],
  ),
  DrugInteractionRowModel(
    "Fosphenytoin",
    [
      DrugInteractionWithType(4, DrugInteractionEnum.darkBlue),
      DrugInteractionWithType(7, DrugInteractionEnum.darkBlue),
    ],
  ),
  DrugInteractionRowModel(
    "Adagrasib",
    [
      DrugInteractionWithType(7, DrugInteractionEnum.red),
    ],
  ),
  DrugInteractionRowModel(
    "Levoketoconazole",
    [
      DrugInteractionWithType(7, DrugInteractionEnum.red),
    ],
  ),
  DrugInteractionRowModel(
    "Ombitasvir",
    [
      DrugInteractionWithType(7, DrugInteractionEnum.red),
    ],
  ),
  DrugInteractionRowModel(
    "Nirmatrelvir",
    [
      DrugInteractionWithType(7, DrugInteractionEnum.red),
    ],
  ),
  DrugInteractionRowModel(
    "Paritaprevir",
    [
      DrugInteractionWithType(7, DrugInteractionEnum.red),
    ],
  ),
  DrugInteractionRowModel(
    "Tucatinib",
    [
      DrugInteractionWithType(7, DrugInteractionEnum.red),
    ],
  ),
  DrugInteractionRowModel(
    "Rifampin",
    [
      DrugInteractionWithType(5, DrugInteractionEnum.darkBlue),
    ],
  ),
];
