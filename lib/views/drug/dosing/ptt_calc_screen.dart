import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/models/question/drug_dosing_data.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/ui/test/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PTTCalcScreen extends StatelessWidget {
  PTTCalcScreen({super.key, required this.item});
  final TestController _controller = Get.find();
  final TextEditingController _pttController = TextEditingController();
  final TextEditingController _xaActivityController = TextEditingController();
  final DrugDosingParams item;

  @override
  Widget build(BuildContext context) {
    _pttController.text = _controller.model.aptt.toCurrency;
    _xaActivityController.text = _controller.model.xaActivity.toCurrency;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        textField(
          label: "aPTT",
          hint: "... (seconds)",
          controller: _pttController,
          formatter: [NumericalRangeFormatter(min: 0)],
          type: TextInputType.number,
          onChanged: (s) {
            _xaActivityController.text = "";
            _controller.xaActivity = 0;

            var v = int.tryParse(s) ?? 0;
            _controller.aptt = v;
          },
        ),
        const SizedBox(height: 10),
        textField(
          label: "Anti factor Xa activity",
          hint: "... (IU/ml)",
          controller: _xaActivityController,
          type: TextInputType.numberWithOptions(decimal: true),
          formatter: [DecimalTextInputFormatter(decimalRange: 2)],
          onChanged: (s) {
            _pttController.text = "";
            _controller.aptt = 0;

            var v = double.tryParse(s) ?? 0;
            _controller.xaActivity = v;
          },
        ),
        const SizedBox(height: 10),
        const Text("(6 hours after initiation or change in dose.)"),
        const SizedBox(height: 10),
        Obx(() => Text(_controller.apttDesc())),
        const SizedBox(height: 10),
        testButton("Ok", () {
          if (_pttController.text.isEmpty &&
              _xaActivityController.text.isEmpty) {
            ShowMSG.error("خطا", "یکی از مفادیر را وارد کنید.");
            return;
          }

          if (_controller.model.aptt == 0 &&
              _controller.model.xaActivity == 0) {
            ShowMSG.error("خطا", "یکی از مفادیر را وارد کنید.");
            return;
          }
          Get.toNamed("/drug_dosing",
              arguments: item.params.first, preventDuplicates: false);
        }),
      ],
    );
  }
}
