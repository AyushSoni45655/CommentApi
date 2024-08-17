import 'dart:convert';

import 'package:api_using_bloc/modal/productsmodal.dart';
import 'package:api_using_bloc/products/products_event.dart';
import 'package:api_using_bloc/products/products_state.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
class ProductsBloc extends Bloc<ProductsLoadedData, ProductsState>{
  ProductsBloc():super(InitialProducts()){
    on<ProductsLoadedData>((event, emit) async{
      try{
        emit(LoadingProducts());

        var responce = await http.get(Uri.parse("https://fakestoreapi.com/products"));
        //var data = jsonDecode(responce.body.toString());

        if(responce.statusCode == 200){
          emit(LoadedProducts(productsModelFromJson(responce.body)));
        }
        else{
          throw Exception("Failed to Load data");
        }
      }
      catch(e){
        emit(ErrorProducts(e.toString()));
      }
    });
  }
  
}