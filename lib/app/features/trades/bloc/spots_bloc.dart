import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_managers/flutter_managers.dart';
import 'package:hypecoin/app/core/constants/network_path.dart';
import 'package:hypecoin/app/core/features/toast/toast_message.dart';
import 'package:hypecoin/app/core/models/user_model.dart';
import 'package:hypecoin/app/core/services/client/client_service.dart';
import 'package:hypecoin/app/features/trades/data/spots_model.dart';
import 'package:load/load.dart';

part 'spots_event.dart';
part 'spots_state.dart';

class SpotsBloc extends Bloc<SpotsEvent, SpotsState> {
  final _manager = ClientService.instance.manager;
  SpotsBloc() : super(SpotsInitial()) {

    on<GetSpotsEvent>(_getSpots);
    on<PostSpotsEvent>(_addToFavList);
    on<GetFavlistEvent>(_getFavList);
    on<GetTrendsEvent>(_getTrends);
  }



  Future<void> _getSpots(GetSpotsEvent event, Emitter<SpotsState> emit) async {
    try {
      emit(SpotsLoading());
      final response = await _manager.getRequest<SpotsModel, List<SpotsModel>>(
        NetworkPath.getSpots,
        parseModel: SpotsModel(),
      );
      if (response.data != null) {
        emit(SpotsLoaded(response.data!));
      } else {
        emit(SpotsError(response.error?.message ?? 'Liste Getirelemedi!'));
      }
    } catch (e) {
      emit(SpotsError(e.toString()));
    }
  }



  Future<void> _addToFavList(PostSpotsEvent event, Emitter<SpotsState> emit) async {
    try {
      await showLoadingDialog();
      final response = await _manager.postRequest<User, User>(
        NetworkPath.addNews,
        parseModel: User(),
        body: {
          'symbol': event.symbol,
          'current_price': event.current_price,
          'user_ID': CacheManager.getModel(User())!.iss!

        },
      );
      if (response.error?.statusCode == 201) {
        toastMessage(
          event.symbol+" Added to your list",
          type: ToasType.success,
        );
      } else {
        toastMessage(
          response.error?.statusCode != null
              ? event.symbol+" can not be added to your list"
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

  Future<void> _getFavList(GetFavlistEvent event, Emitter<SpotsState> emit) async {
    try {
      emit(FavListLoading());
      final response = await _manager.getRequest<FavlistModel, List<FavlistModel>>(
        NetworkPath.getFavList(CacheManager.getModel(User())!.iss!),
        parseModel: FavlistModel(),
      );
      if (response.data != null) {
        emit(FavListLoaded(response.data!));
      } else {
        emit(SpotsError(response.error?.message ?? 'Liste Getirelemedi!'));
      }
    } catch (e) {
      emit(SpotsError(e.toString()));
    }
  }




  Future<void> _getTrends(GetTrendsEvent event, Emitter<SpotsState> emit) async {
    try {
      emit(FavListLoading());
      final response = await _manager.getRequest<FavlistModel, List<FavlistModel>>(
        NetworkPath.getTrends,
        parseModel: FavlistModel(),
      );
      if (response.data != null) {
        emit(FavListLoaded(response.data!));
      } else {
        emit(SpotsError(response.error?.message ?? 'Liste Getirelemedi!'));
      }
    } catch (e) {
      emit(SpotsError(e.toString()));
    }
  }
}



