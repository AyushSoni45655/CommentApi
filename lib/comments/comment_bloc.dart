import 'dart:convert';

import 'package:api_using_bloc/comments/comment_event.dart';
import 'package:api_using_bloc/comments/comment_state.dart';
import 'package:api_using_bloc/modal2/commentsmodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
class CommentBloc extends Bloc<CommentsLoadedData,CommentState>{
  CommentBloc():super(InitialState()){
    on<CommentsLoadedData>((event, emit) async{
      try{
        final responce = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
        //var data = jsonDecode(responce.body.toString());
        if(responce.statusCode== 200){
          emit(LoadedState(commentsModelFromJson(responce.body.toString())));
        }
        else{
          throw Exception(" Data loaded Failed");
        }
      }
      catch(e){
        emit(ErrorState(e.toString()));
      }
    });
  }

}