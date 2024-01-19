import 'package:flutter/material.dart';

class NoProductWidget extends StatelessWidget {
  const NoProductWidget({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.warning_amber_rounded,
            size: 100,
          ),
          Text(
            'Scanne ein Produkt um dessen Eigenschaften zu sehen.',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
