// import 'package:drtest/controllers/test_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../tools/core.dart';
// import '../../ui/test/test_widget.dart';

// class TestResultScreen extends StatelessWidget {
//   TestResultScreen({super.key});
//   final TestController _controller = Get.find();
//   Te

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Drugs"),
//       ),
//       body: ListView.builder(
//         padding: AppConst.defaultPadding,
//         itemCount: drugs.length,
//         itemBuilder: (context, index) {
//           var item = drugs[index];
//           item.drugs = _controller.getDrugsByIDs(item.drugIds);
//           return Column(
//             children: [
//               testTitle(item.title),
//               ...item.drugs.map((e) => testDrug(e)),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
