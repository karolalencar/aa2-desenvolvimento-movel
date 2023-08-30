import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

TextEditingController nameController = TextEditingController();
TextEditingController codeController = TextEditingController();
TextEditingController descriptionController = TextEditingController();
TextEditingController amountController = TextEditingController();

Future<void> createProduct() async {
  final url = Uri.parse('http://192.168.0.104:5000/products');

  final Map<String, dynamic> requestData = {
    'name': nameController.text,
    'code': codeController.text,
    'amount': amountController.text,
    'description': descriptionController.text,
  };

  final response = await http.put(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(requestData),
  );

  if (response.statusCode == 200) {
    print('Product added');
  } else {
    print('Error: ${response.statusCode}');
  }
}

class ProductsForm extends StatefulWidget {
  const ProductsForm({super.key});

  @override
  State<ProductsForm> createState() => _ProductsFormState();
}

class _ProductsFormState extends State<ProductsForm> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.green, // Plano de fundo verde
      key: _scaffoldKey,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 247, 249, 250),
              Color.fromARGB(255, 190, 250, 189)
            ], // Cores do gradiente
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add_shopping_cart_outlined, // Ícone centralizado
                size: 100,
                color: Color.fromARGB(255, 19, 131, 23),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.name,
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: codeController,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.code_F,
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.quant_F,
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.desc_F,
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  createProduct();

                  nameController.clear();
                  codeController.clear();
                  amountController.clear();
                  descriptionController.clear();

                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      'Product added successfully!',
                    ),
                    backgroundColor: Colors.blue,
                    duration: Duration(seconds: 2),
                  ));
                  Future.delayed(Duration(seconds: 2), () {
                    Navigator.pop(context);
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: Text(AppLocalizations.of(context)!.add_F),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
