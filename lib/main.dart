import 'package:api_using_bloc/comments/comment_bloc.dart';
import 'package:api_using_bloc/comments/comment_event.dart';
import 'package:api_using_bloc/products/products_bloc.dart';
import 'package:api_using_bloc/products/products_event.dart';
import 'package:api_using_bloc/users/users_bloc.dart';
import 'package:api_using_bloc/users/users_event.dart';
import 'package:api_using_bloc/users/users_state.dart';
import 'package:api_using_bloc/view/homescreen.dart';
import 'package:api_using_bloc/view1/homescree.dart';
import 'package:api_using_bloc/view2/homescreen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_)=>ProductsBloc()..add(ProductsLoadedData()) ,),
      BlocProvider(create: (context)=> UsersBloc()..add(UsersLoaderDataEvent())),
      BlocProvider(create: (_)=> CommentBloc()..add(CommentsLoadedData()))
    ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(

              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            //home: const HomeScreen(),
          //home: const HomeScreen1(),
          home:  const HomePage2(),
          ),
        );
    }

    // return BlocProvider(
    //   create: (context) => ProductsBloc()..add(ProductsLoadedData()),
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //
    //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //       useMaterial3: true,
    //     ),
    //     home: const HomeScreen(),
    //   ),
    // );
  }


