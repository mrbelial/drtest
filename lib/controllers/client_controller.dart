import 'package:get/get.dart';
import '../models/client/client_model.dart';
import '../response/client/client_response.dart';
import '../tools/validation.dart';

class ClientController extends GetxController {
  final _clientObs = ClientResponse().obs;
  ClientResponse get clientResponse => _clientObs.value;

  List<ClientModel> get clients => clientResponse.content ?? [];

  bool get isloading => clientResponse.isLoading;
  set isloading(bool v) => _clientObs.update((val) => val!.isLoading = v);

  int get selectedClient => clientResponse.selectedClient;
  set selectedClient(int v) =>
      _clientObs.update((val) => val!.selectedClient = v);

  int get selectedProgram => clientResponse.selectedProgram;
  set selectedProgram(int v) =>
      _clientObs.update((val) => val!.selectedProgram = v);

  int get selectedDay => clientResponse.selectedDay;
  set selectedDay(int v) => _clientObs.update((val) => val!.selectedDay = v);

  ClientModel get currentClient => clients[selectedClient];

  ClientProgramModel get currentProgram =>
      currentClient.programs[selectedProgram];
  set currentProgram(ClientProgramModel v) => _clientObs.update(
      (val) => val!.content![selectedClient].programs[selectedProgram] = v);

  ProgramDayModel get currentDay => currentProgram.days[selectedDay];

  void addProgram(int index, ClientProgramModel model) {
    _clientObs.update((val) {
      val!.content![index].programs.add(model);
    });
  }

  @override
  void onInit() {
    super.onInit();
    clientResponse.content ??= [
      ClientModel(id: 1, name: "مهدی شجاعی"),
      ClientModel(id: 2, name: "منصور روشن"),
    ];
  }

  ProgramValidateEnum saveProgram(ClientProgramModel model) {
    var isValid = Validation.isClientProgramValid(model);

    if (isValid == ProgramValidateEnum.ok) {
      currentProgram = model;
    }
    return isValid;
  }

  //Day

  void addDay(ProgramDayModel v) => _clientObs.update((val) =>
      val!.content![selectedClient].programs[selectedProgram].days.add(v));

  //Movement

  void addMovement(MovementModel v) => _clientObs.update((val) => val!
      .content![selectedClient]
      .programs[selectedProgram]
      .days[selectedDay]
      .movements
      .add(v));
}
