import 'package:flutter/material.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class ProductErrorWidget extends StatelessWidget {
  const ProductErrorWidget({
    super.key,
    required this.Errors,
  });

  final List<ProductResultFieldAnswer> Errors;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: Errors.length,
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(
        height: 25,
      ),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      itemBuilder: (context, index) {
        var error = Errors[index];
        return Container(
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red.withOpacity(0.5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.warning_amber_rounded),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${error.message!.id}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 16),
                  ),
                  Text(
                    '${error.impact}',
                    style: const TextStyle(
                        color: Color(0xff7B6F72),
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
