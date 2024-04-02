import 'package:drtest/models/public/response_model.dart';
import 'package:drtest/models/question/question_model.dart';

class QuestionResponse extends BaseModel<TestModel> {
  QuestionResponse() {
    content = TestModel();
  }
}
