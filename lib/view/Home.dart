import 'dart:io';

import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector ;

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
   late ArCoreController arCoreController ;
  _onArCoreViewController (ArCoreController _arCoreController){
    arCoreController = _arCoreController;
    _addSphere(_arCoreController);
  }




  _addSphere(ArCoreController _arCoreController)async{
    final ByteData bytes = await rootBundle.load('assets/image.jpg');
    final Uint8List list = bytes.buffer.asUint8List();
     final material = ArCoreMaterial(color: Colors.green);
     // final sphere = ArCoreSphere(materials: [material], radius: 0.2);
     final image = ArCoreImage(width: 100, height: 100, bytes:list );
     final node = ArCoreNode(image: image, position: vector.Vector3(
         0,
         0,
         -1)
     );
     _arCoreController.addArCoreNode(node);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    arCoreController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArCoreView(
        onArCoreViewCreated: (ArCoreController controller) {  },),
    );
  }
}
