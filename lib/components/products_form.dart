import 'package:flutter/material.dart';

class ProductsForm extends StatefulWidget {
  const ProductsForm({super.key});

  @override
  State<ProductsForm> createState() => _ProductsFormState();
}

class _ProductsFormState extends State<ProductsForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        // child: Column(children: [
        //   Form(
        //       child: Scaffold(
        //     body: Center(
        //         child: Column(
        //       children: [
        //         TextFormField(
        //           validator: (String? value) {
        //             if (value != null && value.isEmpty) {
        //               return 'Insira o nome do produto.';
        //             }
        //             return null;
        //           },
        //           controller: nameController,
        //           textAlign: TextAlign.center,
        //         ),
        //       ],
        //     )),
        //   ))
        // ]),
        );
  }
}
