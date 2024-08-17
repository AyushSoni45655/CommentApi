import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../products/products_bloc.dart';
import '../products/products_state.dart';
class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        title: const Text("ProductsScreen_Screen",style: TextStyle(
          color: Colors.black,
          fontSize: 27,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<ProductsBloc,ProductsState>(
        builder: (BuildContext context, state){
          if(state is LoadingProducts){
            return const Center(child: CircularProgressIndicator.adaptive(),);
          }
          else if(state is LoadedProducts){
            return ListView.builder(
              itemCount: state.productModel.length,
                itemBuilder: (context,index){
              return ListTile(
                title:  Card(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          width: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                state.productModel[index].image.toString()
                              )
                            )
                          ),
                        ),
                        Text(state.productModel[index].title.toString())
                      ],
                    ),
                  ),
                ),

              );
            });
          }
          else if(state is ErrorProducts){
            return Center(child: Text(state.errorMessage),);
          }
          return const SizedBox();
        },
      )
    );
  }
}