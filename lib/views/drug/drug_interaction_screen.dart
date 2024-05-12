import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/tools/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrugInteractionScreen extends StatelessWidget {
  DrugInteractionScreen({super.key});
//List<dynamic> drugsJson = jsonDecode(await rootBundle.loadString('assets/data/drug_interaction.json'));
  // final TestController _controller = Get.find();
  final _controller = Get.put(TestController());

  void init() async {
    await _controller.initDrugInteraction();
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drug Interactions"),
        elevation: 0,
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: textField(
                    maxLength: 100,
                    onChanged: _controller.filterDrugsInteraction,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(
        () {
          return ListView.builder(
            itemCount: _controller.filteredDrugs.length,
            itemBuilder: (context, index) {
              var drug = _controller.filteredDrugs[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    title: Text(drug.drugName),
                    trailing: Checkbox(
                      value: drug.isChecked,
                      onChanged: (value) {
                        _controller.toggleDrugInteraction(index);
                      },
                    ),
                  ),
                  Column(
                    children: drug.drugInteractionIds.map((interaction) {
                      return ListTile(
                        title: Text(interaction.type.toString()),
                        subtitle: Text(interaction.desc),
                      );
                    }).toList(),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
