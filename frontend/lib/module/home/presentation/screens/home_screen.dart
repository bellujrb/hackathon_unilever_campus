import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/core/extensions/build_context_utils.dart';
import 'package:frontend/core/styles/colors.dart';
import 'package:frontend/core/styles/text_styles.dart';
import 'package:frontend/module/home/presentation/widgets/cpf_input_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pick",
          style:
              GoogleFonts.poppins(textStyle: context.appTextStyles.smallBlack),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Cadastro Donatario",
              style: GoogleFonts.poppins(
                  textStyle: context.appTextStyles.smallBlack),
            ),
            Text(
              "Coloque o CPF do donatario para confirmar entrega.",
              style: context.appTextStyles.superSmallBlack,
            ),
            const SizedBox(
              height: 10,
            ),
            const CPFInputField(),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => Modular.to.navigate("scannerqr"),
              child: Container(
                alignment: Alignment.center,
                height: 56,
                width: context.mediaWidth * 1.0,
                decoration: BoxDecoration(color: AppColors.secondary),
                child: Text(
                  "Iniciar Pick",
                  style: GoogleFonts.poppins(
                      textStyle: context.appTextStyles.smallWhite),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
