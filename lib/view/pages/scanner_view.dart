import 'package:epicurea/comp/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class Scanner extends StatelessWidget {
  Scanner({super.key});

  final cameraController = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Scanner'),
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: cameraController,
            onDetect: (capture) async {
              final Barcode barcode = capture.barcodes.first;
              var product = await ProductService.getProduct(barcode);

              if (context.mounted) {
                Navigator.pop(context, product);
              }

              debugPrint('Barcode found! ${barcode.rawValue}');
              debugPrint(product.product?.productName ?? 'Not found');
            },
          ),
          _cameraOverlay()
        ],
      ),
    );
  }

  Column _cameraOverlay() {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white, width: 5.0)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _torch(),
              _turnCamera(),
            ],
          ),
        ),
      ],
    );
  }

  IconButton _turnCamera() {
    return IconButton(
      color: Colors.white,
      icon: const Icon(Icons.cameraswitch),
      iconSize: 32.0,
      onPressed: () => cameraController.switchCamera(),
    );
  }

  IconButton _torch() {
    return IconButton(
      color: Colors.white,
      icon: ValueListenableBuilder(
        valueListenable: cameraController.torchState,
        builder: (context, state, child) {
          switch (state) {
            case TorchState.off:
              return const Icon(Icons.flashlight_off_rounded,
                  color: Colors.white);
            case TorchState.on:
              return const Icon(Icons.flashlight_on, color: Colors.white);
          }
        },
      ),
      iconSize: 32.0,
      onPressed: () => cameraController.toggleTorch(),
    );
  }
}
