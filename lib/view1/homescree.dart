import 'package:api_using_bloc/users/users_bloc.dart';
import 'package:api_using_bloc/users/users_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomeScreen1 extends StatelessWidget {
  const HomeScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        title: const Text("Home_Screen1",style: TextStyle(
          color: Colors.black,
          fontSize: 27,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            BlocBuilder<UsersBloc,UsersState>(builder: (context,state){
              if(state is UserLoadingState){
                return const Center(
                  child: CircularProgressIndicator(color: Colors.black),
                );
              }
              else if( state is UserLoadedState){
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.userModel.length,
                      itemBuilder: (context,index){
                        return Card(
                          child: ListTile(
                            leading: Text(state.userModel[index].address!.city.toString()),
                            title: Text(state.userModel[index].username.toString()),
                            subtitle: Text(state.userModel[index].name.toString()),
                            trailing: Text(state.userModel[index].email.toString()),
                          )
                        );
                      }
                  ),
                );
              }
              else if(state is UserErrorState){
                return const Center(child: Text("Loading Failed"),);
              }
              return const SizedBox();
            })
          ],
        ),
      )
    );
  }
}
