import 'package:drtest/tools/core.dart';
import 'package:flutter/material.dart';

class DrugInteractionDesc2Screen extends StatelessWidget {
  const DrugInteractionDesc2Screen({super.key});

  final String description =
      """● For patients with AF receiving DOACs, optimal management of drug interactions is recommended for those receiving concomitant therapy with interacting drugs, especially CYP3A4 and/or p-glycoprotein inhibitors or inducers. (AHA/ACC/ACCP/HRS AF 2023, 1 C-LD)
● Warfarin remains the preferred agent in patients with AF receiving CYP3A4/p-glycoprotein-inducing agents. (AHA/ACC/ACCP/HRS 2023)
""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Drug Interaction Desciption")),
      body: ListView(
        padding: AppConst.defaultPadding,
        children: [
          Text(description, style: AppTextStyles.text2),
          Text(
            """Red
Contraindicated / not advisable due to increased plasma levels or increase in the risk of bleeding.
OR
Contraindicated due to reduced NOAC plasma levels or an increase in the risk of thromboembolic events.
            """,
            style: AppTextStyles.text2.apply(color: AppColors.red),
          ),
          Text(
            """Yellow
Caution is required, especially in case of polypharmacy or in the presence of ≥2 yellow / bleeding risk factors.
OR
Caution is required, especially in case of polypharmacy or in the presence of ≥2 light blue interactions due to reduced NOAC plasma levels.
            """,
            style: AppTextStyles.text2.apply(color: AppColors.yellow),
          ),
          Text(
            """Purple
Lower dose is recommended.
            """,
            style: AppTextStyles.text2.apply(color: AppColors.purple),
          ),
          Text(
            """Green
No clinically remarkable interaction detected based on the EHRA 2021 and Lexi Comp.
            """,
            style: AppTextStyles.text2.apply(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
