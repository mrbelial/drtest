import 'package:drtest/controllers/test_controller.dart';
import 'package:drtest/models/question/drug_interaction_model.dart';
import 'package:drtest/tools/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrugInteractionScreen extends StatelessWidget {
  DrugInteractionScreen({super.key});
  final _controller = Get.put(TestController());
  final TextEditingController _filterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                      controller: _filterController,
                      maxLength: 100,
                      onChanged: _controller.filterDrugsInteraction,
                      hint: "Filter By Drug Name"),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(
        () {
          return Column(
            children: [
              ListTile(
                title: const Text("Only Selected Drugs"),
                trailing: Checkbox(
                  value: _controller.drugInteractionOnlySelected.value,
                  onChanged: (v) => _controller.drugInteractionOnlySelected
                      .value = !_controller.drugInteractionOnlySelected.value,
                ),
                onTap: () => _controller.drugInteractionOnlySelected.value =
                    !_controller.drugInteractionOnlySelected.value,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _controller.filteredDrugs.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var drug = _controller.filteredDrugs[index];
                    return ListTile(
                      title: Text(drug.drugName),
                      trailing: IconButton(
                          onPressed: () {
                            Get.defaultDialog(
                                content: SizedBox(
                                  height: Get.size.height * .7,
                                  width: Get.size.width * .8,
                                  child: Column(
                                    children: drug.drugInteractions
                                        .map(
                                          (e) => Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Text(
                                              "${_controller.getDrugById(e.drugId).name} ${e.desc}",
                                              style: AppTextStyles.headline2
                                                  .copyWith(
                                                      color: e.type.toColor()),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                actions: [
                                  textButton(onTap: Get.back, title: "Close"),
                                ]);
                          },
                          icon: const Icon(Icons.info_outline)),
                      leading: checkBox2(
                        id: index,
                        title: drug.drugName,
                        checked: drug.isChecked,
                        onChange: _controller.toggleDrugInteraction,
                      ),
                      onTap: () => _controller.toggleDrugInteraction(index, ""),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
