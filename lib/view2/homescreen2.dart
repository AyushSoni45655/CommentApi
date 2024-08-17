import 'package:api_using_bloc/comments/comment_bloc.dart';
import 'package:api_using_bloc/comments/comment_state.dart';
import 'package:api_using_bloc/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home_Page_2",style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
          fontSize: 26,
        ),),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 2,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: BlocBuilder<CommentBloc,CommentState>(builder: (context,state){
          if(state is LoadingState){
            return const Center(child: CircularProgressIndicator(color: Colors.blue),);
          }
          else if(state is LoadedState){
            return  ListView.builder(
                itemCount: state.commentsModel.length,
                itemBuilder: (context,index){
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                         child: Center(child: Text(state.commentsModel[index].id.toString()),),
                      ),
                      title: Text(state.commentsModel[index].name.toString(),style: StyleClass.st,),
                      subtitle: Text(state.commentsModel[index].body.toString(),style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                      ),textAlign: TextAlign.center),
                    ),
                  );
                }
            );
          }
          else if(state is ErrorState){
            return const Center(child: Text("Data Not Found"),);
          }
          return const SizedBox();
        },)
      ),
    );
  }
}
