import 'package:aa2_desenvolvimento_movel/components/products_list.dart';
import 'package:aa2_desenvolvimento_movel/models/product.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ProStockApp());
}

class ProStockApp extends StatelessWidget {
  const ProStockApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      home: const MyHomePage(),
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.purple[500],
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
  final List<Product> _products = [
    Product(
      id: '1',
      title: 'Ração',
      description: '1kg',
      amount: 10,
    ),
    Product(
      id: '2',
      title: 'Shampoo',
      description: '50ml',
      amount: 7,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    print(_products);
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
          ProductsList(_products),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
