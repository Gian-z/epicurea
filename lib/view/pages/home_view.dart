import 'package:epicurea/comp/model/product_wrapper.dart';
import 'package:epicurea/view/pages/scanner_view.dart';
import 'package:flutter/material.dart';

import '../widgets/no_product_widget.dart';
import '../widgets/product_error_widget.dart';
import '../widgets/product_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProductProvider provider = ProductProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _content(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ProductProvider scan = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Scanner()),
          );

          setState(() {
            provider = scan;
          });
        },
        tooltip: 'Scan Product',
        child: const Icon(Icons.qr_code_scanner),
      ),
    );
  }

  Widget _content() {
    if (!provider.isPresent()) {
      return NoProductWidget(context: context);
    }

    if (provider.hasErrors()) {
      return ProductErrorWidget(errors: provider.errors);
    }

    if (!provider.canPopulate()) {
      return NoProductWidget(context: context);
    }

    var wrapper = provider.populate();
    return ProductWidget(context: context, p: wrapper);
  }
}
