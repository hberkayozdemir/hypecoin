part of 'editor_bloc.dart';

abstract class EditorEvent extends Equatable {
  const EditorEvent();

  @override
  List<Object> get props => [];
}
class GetNewsEvent extends EditorEvent{}
class DeleteNewsEvent extends EditorEvent{
  final BuildContext context;
  final String newsID;
  DeleteNewsEvent(this.context,{required this.newsID});
}

class PostNewsEvent extends EditorEvent {
  final BuildContext context;
  final String? title;
  final String? image;
  final String? content;
  final List<String>? hashtags;

  PostNewsEvent(
      this.context, {
        required this.title,
        required this.image,
        required this.content,
        required this.hashtags,

      });
}

