import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/tools/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PTTCalcScreen extends StatelessWidget {
  PTTCalcScreen({super.key});
  final TestController _controller = Get.find();
  final TextEditingController _pttController = TextEditingController();
  final TextEditingController _xaActivityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _pttController.text = _controller.model.aptt.toCurrency;
    _xaActivityController.text = _controller.model.xaActivity.toCurrency;

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        textField(
          label: "aPTT",
          hint: "... (seconds)",
          controller: _pttController,
          formatter: [NumericalRangeFormatter(min: 0)],
          type: TextInputType.number,
          onChanged: (s) {
            _xaActivityController.text = "";
          },
        ),
        const SizedBox(height: 10),
        textField(
          label: "Anti factor Xa activity",
          hint: "... (IU/ml)",
          controller: _pttController,
          formatter: [DecimalTextInputFormatter(decimalRange: 2)],
          type: TextInputType.number,
          onChanged: (s) {
            _xaActivityController.text = "";
          },
        ),
        const SizedBox(height: 10),
        const Text("(6 hours after initiation or change in dose.)"),
      ],
    );
  }
}
