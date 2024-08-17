import 'package:api_using_bloc/view/productsscreen.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        title: const Text("Home_Screen",style: TextStyle(
          color: Colors.black,
          fontSize: 27,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductsScreen()));
          },
          child: Container(
            height: 40,
            width: 300,
            decoration: BoxDecoration(
              //color: Colors.blue.shade300,
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(width: 2,
              color: Colors.blue,
              )
            ),
            child: const Center(
              child: Text("Products",style: TextStyle(
                color: Colors.black,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                fontSize: 27,
              ),),
            ),
          ),
        ),
      ),
    );
  }
}
