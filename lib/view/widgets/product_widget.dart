import 'package:epicurea/comp/localized.dart';
import 'package:epicurea/comp/model/product_wrapper.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.context,
    required this.p,
  });

  final BuildContext context;
  final ProductWrapper p;

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
          height: 150,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.pink.withOpacity(0.3)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(p.product.imageFrontUrl ?? ''),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Localized.get(p.product.productNameInLanguages),
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.justify,
                    softWrap: true,
                  ),
                  Text(
                    p.product.brands ?? 'No Brand',
                    style: Theme.of(context).textTheme.labelMedium,
                    textAlign: TextAlign.justify,
                    softWrap: true,
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 5,),
        Container(
          height: 75,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.pink.withOpacity(0.3)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Nutriscore:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(width: 40,),
              Text(
                  p.product.nutriscore?.toUpperCase() ?? 'Not Provided',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
        const SizedBox(height: 5,),
        Container(
          height: 75,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.pink.withOpacity(0.3)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'NOVA:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(width: 40,),
              Text(
                p.product.novaGroup?.toString() ?? 'Not Provided',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
        const SizedBox(height: 5,),
        Container(
          height: 75,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.pink.withOpacity(0.3)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ECO-Score:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(width: 40,),
              Text(
                p.product.ecoscoreGrade?.toString() ?? 'Not Provided',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        )
      ],
    );
  }
}
