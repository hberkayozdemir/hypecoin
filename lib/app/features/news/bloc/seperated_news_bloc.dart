import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hypecoin/app/core/constants/network_path.dart';
import 'package:hypecoin/app/core/services/client/client_service.dart';
import 'package:hypecoin/app/features/editor/models/news.dart';

part 'seperated_news_event.dart';
part 'seperated_news_state.dart';

class SeperatedNewsBloc extends Bloc<SeperatedNewsEvent, SeperatedNewsState> {
  final _manager = ClientService.instance.manager;
  SeperatedNewsBloc() : super(SeperatedNewsInitial()) {
on<GetNewsEvent>(_getNews);
  }

  Future<void> _getNews(GetNewsEvent event, Emitter<SeperatedNewsState> emit) async {
    try {
      emit(SeperatedNewsLoading());
      final response = await _manager.getRequest<News, List<News>>(
        NetworkPath.getNews,
        parseModel: News(),
      );
      if (response.data != null) {



        emit(SeperatedNewsLoaded(response.data!));
      } else {
        emit(SeperatedNewsError(response.error?.message ?? 'Liste Getirelemedi!'));
      }
    } catch (e) {
      emit(SeperatedNewsError(e.toString()));
    }
  }
}


