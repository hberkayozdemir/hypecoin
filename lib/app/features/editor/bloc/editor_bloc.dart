import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hypecoin/app/core/constants/network_path.dart';
import 'package:hypecoin/app/core/features/toast/toast_message.dart';
import 'package:hypecoin/app/core/models/user_model.dart';
import 'package:hypecoin/app/core/services/client/client_service.dart';
import 'package:hypecoin/app/features/editor/models/news.dart';
import 'package:hypecoin/localization/localization.dart';
import 'package:load/load.dart';

part 'editor_event.dart';

part 'editor_state.dart';

class EditorBloc extends Bloc<EditorEvent, EditorState> {
  final _manager = ClientService.instance.manager;

  EditorBloc() : super(EditorInitial()) {
    on<PostNewsEvent>(_addNews);
    on<GetNewsEvent>(_getNews);
    on<DeleteNewsEvent>(_deleteNews);
  }

  Future<void> _addNews(PostNewsEvent event, Emitter<EditorState> emit) async {
    try {
      await showLoadingDialog();
      final response = await _manager.postRequest<User, User>(
        NetworkPath.addNews,
        parseModel: User(),
        body: {
          'title': event.title,
          'image': event.image,
          'content': event.content,
          'hashtags': event.hashtags,
        },
      );
      if (response.error?.statusCode == 201) {
        toastMessage(
          "News Added",
          type: ToasType.success,
        );
      } else {
        toastMessage(
          response.error?.statusCode != null
              ? response.error!.statusCode.toString()
              : 'Error',
          type: ToasType.error,
        );
      }
    } catch (e) {
      toastMessage(
        e.toString(),
        type: ToasType.error,
      );
    } finally {
      hideLoadingDialog();
    }
  }

  Future<void> _getNews(GetNewsEvent event, Emitter<EditorState> emit) async {
    try {
      emit(EditorLoading());
      final response = await _manager.getRequest<News, List<News>>(
        NetworkPath.getNews,
        parseModel: News(),
      );
      if (response.data != null) {
        emit(EditorLoaded(response.data!));
      } else {
        emit(EditorError(response.error?.message ?? 'Liste Getirelemedi!'));
      }
    } catch (e) {
      emit(EditorError(e.toString()));
    }
  }

  Future<void> _deleteNews(DeleteNewsEvent event,
      Emitter<EditorState> emit) async {
    try {
      final response = await _manager.getRequest<News, News>(
        NetworkPath.deleteNews(event.newsID),
        parseModel: News(),
      );
      if (response.error?.statusCode == 200) {
        toastMessage(
          event.context.localization.login_success,
          type: ToasType.success,
        );

      }

      else {
        toastMessage(
          response.error?.statusCode != null ? response.error!.statusCode
              .toString() : 'Successesfully deleted ${event.newsID}',
          type: ToasType.success
        );
      }
    }

    catch (e) {
      emit(EditorError(e.toString()));
    }
  }

}