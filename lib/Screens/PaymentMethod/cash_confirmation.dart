import 'package:flutter/material.dart';
import 'package:login_q2g/components/input_confirmation.dart';
import 'package:provider/provider.dart';
import '../../components/button.dart';
import '../../components/constants.dart';
import '../../providers/venta_provider.dart';
import 'home_screen.dart';

class CashConfirmation extends StatelessWidget {
  const CashConfirmation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final idController = TextEditingController();
    final direcController = TextEditingController();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 200, left: 10, right: 10),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(left: 5, bottom: 5, top: 10),
                  child: Text(
                    'Coloca el id del pedido',
                    style: TextStyle(
                        fontSize: 15,
                        color: kValueColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: kPrimaryLightColor,
                    helperText: 'Id pedido',
                    helperStyle:
                        const TextStyle(color: kValueColor, fontSize: 13),
                    hintStyle:
                        const TextStyle(color: kValueColor, fontSize: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  controller: idController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 5, bottom: 5, top: 10),
                  child: Text(
                    'Coloca tu direcci??n',
                    style: TextStyle(
                        fontSize: 15,
                        color: kValueColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextFormField(
                  cursorColor: kPrimaryColor,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: kPrimaryLightColor,
                    helperText: 'Direcci??n',
                    helperStyle:
                        const TextStyle(color: kValueColor, fontSize: 13),
                    hintStyle:
                        const TextStyle(color: kValueColor, fontSize: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  controller: direcController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa un trabajo';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(320, 45),
                        backgroundColor: kPrimaryColor,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18))),
                    child: Text(
                      'CONTINUAR',
                      style: TextStyle(color: kWhiteColor),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<VentasProvider>().createVenta(
                            int.parse(idController.text),
                            direcController.text,
                            context);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
