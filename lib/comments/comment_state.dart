import 'package:equatable/equatable.dart';

import '../modal2/commentsmodel.dart';

class CommentState extends Equatable{
  const CommentState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class InitialState extends CommentState{}
class LoadingState extends CommentState{}
class LoadedState extends CommentState{
  List<CommentsModel> commentsModel;
   LoadedState(this.commentsModel);
   @override
  List<Object> get props=> [commentsModel];
}
class ErrorState extends CommentState{
  final String errorMessage;
  const ErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}