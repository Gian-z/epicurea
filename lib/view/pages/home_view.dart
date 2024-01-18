import 'package:epicurea/view/pages/scanner_view.dart';
import 'package:flutter/material.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

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
  ProductResultV3? product;

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
          ProductResultV3 scan = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Scanner()),
          );

          setState(() {
            product = scan;
          });
        },
        tooltip: 'Scan Product',
        child: const Icon(Icons.qr_code_scanner),
      ),
    );
  }

  Widget _content() {
    if (product == null) {
      return _noProduct();
    }

    if (product!.errors?.isEmpty ?? false) {
      _errorPage(product!.errors!);
    }

    return _productInformation();
  }

  Widget _productInformation() {
    return const Placeholder();
  }

  Widget _noProduct() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(Icons.warning_amber_rounded),
          Text(
            'Scanne ein Produkt um dessen Eigenschaften zu sehen.',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }

  Widget _errorPage(List<ProductResultFieldAnswer> errors) {
    return ListView.separated(
      itemCount: errors.length,
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(
        height: 25,
      ),
      padding: const EdgeInsets.only(left: 20, right: 20),
      itemBuilder: (context, index) {
        var error = errors[index];
        return Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.warning_amber_rounded),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${error.message!.name}',
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
