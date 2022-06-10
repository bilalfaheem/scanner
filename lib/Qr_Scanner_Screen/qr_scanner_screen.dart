
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Qr_Scanner_Screen extends StatefulWidget {
  const Qr_Scanner_Screen({Key? key}) : super(key: key);

  @override
  State<Qr_Scanner_Screen> createState() => _Qr_Scanner_ScreenState();
}

class _Qr_Scanner_ScreenState extends State<Qr_Scanner_Screen> {

  final qrKey = GlobalKey(debugLabel: "Qr");
  Barcode? barcode;
  QRViewController? controller;

  @override
  void dispose(){
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble()async{
    super.reassemble();
    if(Platform.isAndroid){
      await controller!.pauseCamera();

    }
    controller!.resumeCamera();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Qr Scanner Screen"),
      ),
      body: Stack(alignment: Alignment.center,
      children:<Widget> [

        BuildQrView(context),
        Positioned(bottom: 40, child: build_Qr_result())
        

      ],),
    );
    
  }

  Widget build_Qr_result()=>
    Container(
              padding:EdgeInsets.all(10),
              

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white24
      ),
      child: Text(
        barcode != null? "Result : ${barcode!.code}" :
        "Scan A Code", maxLines: 3,style: TextStyle(color: Colors.white),),
    );
  

Widget BuildQrView(BuildContext context) => QRView(key: qrKey,
 onQRViewCreated: onQRViewCreated,
 overlay: QrScannerOverlayShape(
   borderColor: Colors.teal,
   borderRadius: 13,
   borderLength: 20,
   borderWidth: 10,
   cutOutSize: MediaQuery.of(context).size.width*0.8,
 ),);

 void onQRViewCreated(QRViewController controller){
   setState(() {
     this.controller = controller;
    
   });

    controller.scannedDataStream.listen((barcode)=>setState(()=> this.barcode = barcode));
 }

}