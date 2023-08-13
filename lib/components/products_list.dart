import 'package:aa2_desenvolvimento_movel/models/product.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatelessWidget {
  final List<Product> products;

  const ProductsList(this.products, {super.key});

  @override
  Widget build(BuildContext context) {
    print(products);
    print('AAAAAAAAA');
    return Container(
      height: 400,
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
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 4,
                  ),
                  child: ListTile(
                    leading: Image.asset('assets/images/generic_image.png'),
                    title: Text(
                      product.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      product.description,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                );
              }),
            ),
    );
  }
}
