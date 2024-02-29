import '../models/client/client_model.dart';
import 'core.dart';

enum ProgramValidateEnum { ok, title, age, goal, height, weight }

class Validation {
  static ProgramValidateEnum isClientProgramValid(ClientProgramModel model) {
    if (model.title.isEmpty) {
      ShowMSG.warning("هشدار", "عنوان را وارد کنید.");
      return ProgramValidateEnum.title;
    }

    if (model.age < 10 || model.age > 100) {
      ShowMSG.warning("هشدار", "سن را صحیح وارد کنید.");
      return ProgramValidateEnum.age;
    }

    if (model.goal.isEmpty) {
      ShowMSG.warning("هشدار", "هدف را وارد کنید.");
      return ProgramValidateEnum.goal;
    }

    if (model.height < 100 || model.height > 250) {
      ShowMSG.warning("هشدار", "قد را صحیح وارد کنید.");
      return ProgramValidateEnum.height;
    }

    if (model.weight < 30 || model.weight > 250) {
      ShowMSG.warning("هشدار", "وزن را صحیح وارد کنید.");
      return ProgramValidateEnum.weight;
    }

    return ProgramValidateEnum.ok;
  }
}
