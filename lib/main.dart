import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:aa2_desenvolvimento_movel/components/products_form.dart';
import 'package:aa2_desenvolvimento_movel/components/products_list.dart';
import 'package:aa2_desenvolvimento_movel/models/product.dart';

Future<List<Product>> fetchProducts() async {
  final response =
      await http.get(Uri.parse('http://192.168.0.104:5000/products'));

  if (response.statusCode == 200) {
    List<dynamic> jsonData = jsonDecode(response.body);
    List<Product> products =
        jsonData.map((data) => Product.fromJson(data)).toList();
    return products;
  } else {
    throw Exception('Failed to load products');
  }
}

void main() {
  runApp(const ProStockApp());
}

class ProStockApp extends StatelessWidget {
  const ProStockApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const MyHomePage(),
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.blue[500],
          secondary: Colors.teal[200],
        ),
        textTheme: theme.textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyLarge: const TextStyle(
            fontFamily: 'Nunito',
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.black45,
          ),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Product>> futureProducts;

  List<Product> _products = [];

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    futureProducts = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ],
        title: const Text('Produtos'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          FutureBuilder(
            future: futureProducts,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                _products = snapshot.data!;
                return ProductsList(_products, _deleteProduct);
              } else {
                return const Text('No data available.');
              }
            },
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProductsForm(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
