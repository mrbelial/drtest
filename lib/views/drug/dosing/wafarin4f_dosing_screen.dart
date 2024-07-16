import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/ui/test/test_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Wafarin4fDosingScreen extends StatelessWidget {
  Wafarin4fDosingScreen({super.key});
  final TestController _controller = Get.find();
  final TextEditingController _inrController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        textField(
          label: "INR",
          hint: "INR",
          controller: _inrController,
          formatter: [NumericalRangeFormatter(min: 0)],
          type: TextInputType.number,
          onChanged: (s) {
            var v = int.tryParse(s) ?? 0;
            _controller.f4INR = v;
          },
        ),
        const SizedBox(height: 10),
        testButton("Ok", () {
          if (_inrController.text.isEmpty) {
            ShowMSG.error("خطا", "Enter INR");
            return;
          }
          testMessage(_controller.f4DosingDesc(), () {});
        }),
      ],
    );
  }
}
