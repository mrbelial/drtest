import 'package:drtest/models/models.dart';

class TestDataModel {
  int id;
  bool isFemale;
  int age;
  int weight;
  int height;
  double serumCreatinine;
  int ul;
  double bmi;
  int aptt;
  double xaActivity;
  bool q1Answer;
  int q2Answer;
  int q3Point;
  List<bool> q3Answer;
  int hbPoint;
  List<bool> hbAnswer;
  double cgAnswer;
  int tsPoint;
  List<int> tsAnswer;
  int cpPoint;
  List<int> cpAnswer;

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
    required this.ul,
    required this.bmi,
    required this.aptt,
    required this.xaActivity,
    required this.q1Answer,
    required this.q2Answer,
    required this.q3Point,
    required this.q3Answer,
    required this.hbPoint,
    required this.hbAnswer,
    required this.cgAnswer,
    required this.tsPoint,
    required this.tsAnswer,
    required this.cpPoint,
    required this.cpAnswer,
  });

  TestModel toTestModel() {
    var model = TestModel();
    model.id = id;
    model.isFemale = isFemale;
    model.age = age;
    model.weight = weight;
    model.height = height;
    model.serumCreatinine = serumCreatinine;
    model.ul = ul;
    model.bmi = bmi;
    model.aptt = aptt;
    model.xaActivity = xaActivity;
    model.q1Answer = q1Answer;
    model.q2Answer = q2Answer;

    model.q3Point = q3Point;
    for (var i = 0; i < model.q3Answer.length; i++) {
      model.q3Answer[i].checked = q3Answer[i];
    }

    model.hbPoint = hbPoint;
    for (var i = 0; i < model.hbAnswer.length; i++) {
      model.hbAnswer[i].checked = hbAnswer[i];
    }
    model.cgAnswer = cgAnswer;

    model.tsPoint = tsPoint;
    for (var i = 0; i < model.tsScore.length; i++) {
      model.tsScore[i].selectedID = tsAnswer[i];
      if (tsAnswer[i] > 0) {
        model.tsScore[i].point = model.tsScore[i].radios
            .firstWhere((c) => c.id == tsAnswer[i])
            .point;
      } else {
        model.tsScore[i].point = 0;
      }
    }

    model.cpPoint = cpPoint;
    for (var i = 0; i < model.cpQuestions.length; i++) {
      model.cpQuestions[i].selectedID = cpAnswer[i];
      if (cpAnswer[i] > 0) {
        model.cpQuestions[i].point = model.cpQuestions[i].radios
            .firstWhere((c) => c.id == cpAnswer[i])
            .point;
      } else {
        model.cpQuestions[i].point = 0;
      }
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
      ul: model.ul ?? 0,
      bmi: model.bmi,
      aptt: model.aptt,
      xaActivity: model.xaActivity,
      q1Answer: model.q1Answer,
      q2Answer: model.q2Answer,
      q3Point: model.q3Point,
      hbPoint: model.hbPoint,
      cgAnswer: model.cgAnswer,
      tsPoint: model.tsPoint,
      cpPoint: model.cpPoint,
      cpAnswer: model.cpQuestions.map((x) => x.selectedID).toList(),
      tsAnswer: model.tsScore.map((x) => x.selectedID).toList(),
      q3Answer: model.q3Answer.map((x) => x.checked).toList(),
      hbAnswer: model.hbAnswer.map((x) => x.checked).toList(),
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
      ul: json['ul'],
      bmi: json['bmi'],
      aptt: json['aptt'],
      xaActivity: json['xaActivity'],
      q1Answer: json['q1Answer'],
      q2Answer: json['q2Answer'],
      q3Point: json['q3Point'],
      hbPoint: json['hbPoint'],
      cgAnswer: json['cgAnswer'],
      tsPoint: json['tsPoint'],
      cpPoint: json['cpPoint'],
      cpAnswer: List<int>.from(json['cpAnswer']),
      tsAnswer: List<int>.from(json['tsAnswer']),
      q3Answer: List<bool>.from(json['q3Answer']),
      hbAnswer: List<bool>.from(json['hbAnswer']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'IsFemale': isFemale,
      'Age': age,
      'Weight': weight,
      'Height': height,
      'SerumCreatinine': serumCreatinine,
      'UL': ul,
      'BMI': bmi,
      'APTT': aptt,
      'XAActivity': xaActivity,
      'Q1Answer': q1Answer,
      'Q2Answer': q2Answer,
      'Q3Point': q3Point,
      // 'Q3Answer': q3Answer,
      'HBPoint': hbPoint,
      // 'HBAnswer': hBAnswer,
      'CGAnswer': cgAnswer,
      'TSPoint': tsPoint,
      // 'TSAnswer': tSAnswer,
      'CPPoint': cpPoint,
      // 'CPAnswer': cPAnswer,
      'CPAnswer': cpAnswer,
      'TSAnswer': tsAnswer,
      'Q3Answer': q3Answer,
      'HBAnswer': hbAnswer,
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

class TestUpdateResponse extends BaseModel<TestDataModel> {
  TestUpdateResponse();

  TestUpdateResponse.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    statusCode = json['statusCode'];
    if (json['data'] != null) {
      content = TestDataModel.fromJson(json['data']);
    }
  }
}
