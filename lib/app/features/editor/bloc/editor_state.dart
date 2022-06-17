part of 'editor_bloc.dart';

 abstract class EditorState extends Equatable {
  @override
  List<Object> get props => [];
}



class EditorInitial extends EditorState {}
class EditorLoading extends EditorState {}
class EditorLoaded extends EditorState {
 final List<News> data;
 EditorLoaded(this.data);
}

class EditorError extends EditorState {
 final String error;
 EditorError(this.error);
}

