import 'package:drtest/models/models.dart';

class TestDataModel {
  int id;
  bool isFemale;
  int age;
  int weight;
  int height;
  double serumCreatinine;
  int uL;
  double bMI;
  int aPTT;
  double xAActivity;
  bool q1Answer;
  int q2Answer;
  int q3Point;
  List<bool> q3Answer;
  int hBPoint;
  List<bool> hBAnswer;
  double cGAnswer;
  int tSPoint;
  List<int> tSAnswer;
  int cPPoint;
  List<int> cPAnswer;

  // q3Answer: json['q3Answer'] ?? '',
  // hBAnswer: json['hBAnswer'] ?? '',
  // tSAnswer: json['tSAnswer'] ?? '',
  TestDataModel({
    required this.id,
    required this.isFemale,
    required this.age,
    required this.weight,
    required this.height,
    required this.serumCreatinine,
    required this.uL,
    required this.bMI,
    required this.aPTT,
    required this.xAActivity,
    required this.q1Answer,
    required this.q2Answer,
    required this.q3Point,
    required this.q3Answer,
    required this.hBPoint,
    required this.hBAnswer,
    required this.cGAnswer,
    required this.tSPoint,
    required this.tSAnswer,
    required this.cPPoint,
    required this.cPAnswer,
  });

  TestModel toTestModel() {
    var model = TestModel();
    model.id = id;
    model.isFemale = isFemale;
    model.age = age;
    model.weight = weight;
    model.height = height;
    model.serumCreatinine = serumCreatinine;
    model.ul = uL;
    model.bmi = bMI;
    model.aptt = aPTT;
    model.xaActivity = xAActivity;
    model.q1Answer = q1Answer;
    model.q2Answer = q2Answer;

    model.q3Point = q3Point;
    for (var i = 0; i < model.q3Answer.length; i++) {
      model.q3Answer[i].checked = q3Answer[i];
    }

    model.hbPoint = hBPoint;
    for (var i = 0; i < model.hbAnswer.length; i++) {
      model.hbAnswer[i].checked = hBAnswer[i];
    }
    model.cgAnswer = cGAnswer;

    model.tsPoint = tSPoint;
    for (var i = 0; i < model.tsScore.length; i++) {
      model.tsScore[i].selectedID = tSAnswer[i];
    }

    model.cpPoint = cPPoint;
    for (var i = 0; i < model.cpQuestions.length; i++) {
      model.cpQuestions[i].selectedID = cPAnswer[i];
    }
    return model;
  }

  factory TestDataModel.fromTestModel(TestModel model) {
    return TestDataModel(
      id: model.id,
      isFemale: model.isFemale,
      age: model.age,
      weight: model.weight,
      height: model.height,
      serumCreatinine: model.serumCreatinine,
      uL: model.ul ?? 0,
      bMI: model.bmi,
      aPTT: model.aptt,
      xAActivity: model.xaActivity,
      q1Answer: model.q1Answer,
      q2Answer: model.q2Answer,
      q3Point: model.q3Point,
      hBPoint: model.hbPoint,
      cGAnswer: model.cgAnswer,
      tSPoint: model.tsPoint,
      cPPoint: model.cpPoint,
      cPAnswer: model.cpQuestions.map((x) => x.selectedID).toList(),
      tSAnswer: model.tsScore.map((x) => x.selectedID).toList(),
      q3Answer: model.q3Answer.map((x) => x.checked).toList(),
      hBAnswer: model.hbAnswer.map((x) => x.checked).toList(),
    );
  }

  factory TestDataModel.fromJson(Map<String, dynamic> json) {
    return TestDataModel(
      id: json['id'],
      isFemale: json['isFemale'],
      age: json['age'],
      weight: json['weight'],
      height: json['height'],
      serumCreatinine: json['serumCreatinine'],
      uL: json['uL'],
      bMI: json['bMI'],
      aPTT: json['aPTT'],
      xAActivity: json['xAActivity'],
      q1Answer: json['q1Answer'],
      q2Answer: json['q2Answer'],
      q3Point: json['q3Point'],
      hBPoint: json['hBPoint'],
      cGAnswer: json['cGAnswer'],
      tSPoint: json['tSPoint'],
      cPPoint: json['cPPoint'],
      cPAnswer: json['cPAnswer'] != null
          ? json['cPAnswer']
              .toString()
              .split(',')
              .map((e) => int.parse(e))
              .toList()
          : [],
      tSAnswer: json['tSAnswer'] != null
          ? json['tSAnswer']
              .toString()
              .split(',')
              .map((e) => int.parse(e))
              .toList()
          : [],
      q3Answer: json['q3Answer'] != null
          ? json['q3Answer']
              .toString()
              .split(',')
              .map((e) => e.toLowerCase() == 'true')
              .toList()
          : [],
      hBAnswer: json['hBAnswer'] != null
          ? json['hBAnswer']
              .toString()
              .split(',')
              .map((e) => e.toLowerCase() == 'true')
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IsFemale': isFemale,
      'Age': age,
      'Weight': weight,
      'Height': height,
      'SerumCreatinine': serumCreatinine,
      'UL': uL,
      'BMI': bMI,
      'APTT': aPTT,
      'XAActivity': xAActivity,
      'Q1Answer': q1Answer,
      'Q2Answer': q2Answer,
      'Q3Point': q3Point,
      // 'Q3Answer': q3Answer,
      'HBPoint': hBPoint,
      // 'HBAnswer': hBAnswer,
      'CGAnswer': cGAnswer,
      'TSPoint': tSPoint,
      // 'TSAnswer': tSAnswer,
      'CPPoint': cPPoint,
      // 'CPAnswer': cPAnswer,
      'CPAnswer': cPAnswer.join(','),
      'TSAnswer': tSAnswer.join(','),
      'Q3Answer': q3Answer.map((e) => e ? 'true' : 'false').join(','),
      'HBAnswer': hBAnswer.map((e) => e ? 'true' : 'false').join(','),
    };
  }
}

class TestResponse extends BaseModel<List<TestDataModel>> {
  TestResponse() {
    isLoading = true;
  }

  TestResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    statusCode = json['statusCode'];
    if (json['data'] != null) {
      content = List.from(json['data'])
          .map((e) => TestDataModel.fromJson(e))
          .toList();
    }
  }
}
