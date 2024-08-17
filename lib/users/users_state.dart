import 'package:equatable/equatable.dart';

import '../modal1/usermodel.dart';

 class UsersState extends Equatable{
  const UsersState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class UserInitialState extends UsersState{}
class UserLoadingState extends UsersState{}
class UserLoadedState extends UsersState{
   final List<UsersModel> userModel;
   const UserLoadedState(this.userModel);
   @override
   // TODO: implement props
   List<Object?> get props => [userModel];
}
class UserErrorState extends UsersState{
   final String errorMessage;
   const UserErrorState(this.errorMessage);
   @override
   // TODO: implement props
   List<Object?> get props =>[errorMessage];

}