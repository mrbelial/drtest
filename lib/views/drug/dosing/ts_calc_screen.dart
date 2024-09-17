import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/models/question/drug_dosing_data.dart';
import 'package:drtest/tools/core.dart';
import 'package:drtest/ui/test/test_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TsScoreScreen extends StatelessWidget {
  TsScoreScreen({super.key, required this.item});
  final TestController _controller = Get.find();
  final DrugDosingParams item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Obx(() {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _controller.model.tsScore.length,
              itemBuilder: (c, i) {
                var item = _controller.model.tsScore[i];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      color: AppColors.blue,
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        item.title,
                        style: AppTextStyles.text1,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    for (var r in item.radios)
                      radioButton(
                          title: r.title,
                          value: r.id,
                          groupValue: item.selectedID,
                          onChanged: (v) {
                            _controller.tsAnswer(i, r.id, r.point);
                          }),
                  ],
                );
              });
        }),
        Obx(() {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: testBadge(text: _controller.calcTS().title),
          );
        }),
        testButton("Done", () {
          if (_controller.model.tsPoint < 4) {
            testMessage("""● HIT extremely unlikely.
● Do not order HIT antibody testing.
●Evaluate for other causes of thrombocytopenia.
● Continue to assess HIT probability.
● Can restart/ continue  heparin if clinically indicated.""", () {
              _controller.closeDosing();
            });
          } else {
            testMessage("""●Stop all Heparin.
●Hold or reverse warfarin if given.
● Start a non-heparin anticoagulant.
 (including argatroban, bivalirudin, danaparoid, fondaparinux., dabigatran, apixaban, rivaroxaban, edoxaban).
● Order HIT antibody testing.""", () {
              Get.toNamed("/drug_dosing",
                  arguments: item.params.first, preventDuplicates: false);
            });
          }
        }),
      ],
    );
  }
}
