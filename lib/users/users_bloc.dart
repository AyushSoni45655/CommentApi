import 'dart:convert';

import 'package:api_using_bloc/modal1/usermodel.dart';
import 'package:api_using_bloc/users/users_event.dart';
import 'package:api_using_bloc/users/users_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart'as http;

class UsersBloc extends Bloc<UsersLoaderDataEvent,UsersState>{
  UsersBloc():super(UserInitialState()){
    on<UsersLoaderDataEvent>((event, emit)async {
      try{
        emit(UserLoadingState());
        final responce = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
        //var data = jsonDecode(responce.body.toString());
        if(responce.statusCode == 200){
          emit(UserLoadedState(usersModelFromJson(responce.body)));
          //throw Exception("Data Successfully Loaded");
        }
        else{
          throw Exception("Data not Loaded");
        }
      }
      catch(e){
        emit(UserErrorState(e.toString()));
      }
    });
  }
  
}