import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:aa2_desenvolvimento_movel/models/product.dart';

class ProductsList extends StatelessWidget {
  final List<Product> products;

  const ProductsList(this.products, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: products.isEmpty
          ? Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Nenhum Produto Cadastrado',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            )
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: ((context, index) {
                final product = products[index];
                return Container(
                  height: 100,
                  child: Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 4,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          child: Image.asset('assets/images/generic_image.png'),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text(product.description),
                                RichText(
                                  text: TextSpan(
                                    text: 'Quantidade: ',
                                    style: TextStyle(color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text: (product.amount).toString(),
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontSize: 18, // Text color
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.edit),
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            IconButton(
                              onPressed: () {
                                http
                                    .delete(Uri.parse(
                                        'http://192.168.18.219:5000/products/${product.id}'))
                                    .then((response) {
                                  if (response.statusCode == 200) {
                                    Text('deletou');
                                  } else {
                                    Text('não deletou');
                                  }
                                }).catchError((error) {});
                              },
                              icon: const Icon(Icons.delete),
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
    );
  }
}
