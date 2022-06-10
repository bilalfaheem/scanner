import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scanner/Qr_Scanner_Screen/qr_scanner_screen.dart';

class Qr_Code_Screen extends StatefulWidget {
  const Qr_Code_Screen({Key? key}) : super(key: key);

  @override
  State<Qr_Code_Screen> createState() => _Qr_Code_ScreenState();
}

class _Qr_Code_ScreenState extends State<Qr_Code_Screen> {

TextEditingController qr_text = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(
        title: Text("Qr Code"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                   SizedBox(height: 30,),

              Center(child: QrImage(data: qr_text.text,size: 200,)),

              SizedBox(height: 30,),

              Qr_Text_Fieldd(context),

              SizedBox(height: 60,),

              TextButton(onPressed: (){
                 Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  Qr_Scanner_Screen()),
  );
              }, child: Text("Scanner Page"))


              
            ],
          ),
        ),
      ),
    );

// Widget buildTextField(){
//       return 
//     }
    
  }
  Widget Qr_Text_Fieldd(BuildContext context){
    return TextField(
      controller: qr_text,
      decoration: InputDecoration(
        hintText: "Qr Code text",
        suffixIcon: IconButton(onPressed: (){
          setState(() {
            
          });
        }, icon: Icon(Icons.done, size:30 ) )

      ),
      style: TextStyle(
        fontSize: 30,

      ),
    
    );
  }
}