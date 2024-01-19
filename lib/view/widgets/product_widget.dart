import 'package:flutter/material.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.context,
    required this.p,
  });

  final BuildContext context;
  final Product p;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 250,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.pink.withOpacity(0.3)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(p.imageFrontUrl ?? ''),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    p.productName ?? 'Name not provided.',
                    style: Theme.of(context).textTheme.headlineSmall,
                    softWrap: true,
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
