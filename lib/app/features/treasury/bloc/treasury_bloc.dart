import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_managers/flutter_managers.dart';
import 'package:hypecoin/app/core/constants/network_path.dart';
import 'package:hypecoin/app/core/features/toast/toast_message.dart';
import 'package:hypecoin/app/core/services/client/client_service.dart';
import 'package:hypecoin/app/features/treasury/models/treasury_model.dart';
import 'package:hypecoin/localization/bloc/localization_bloc.dart';
import 'package:load/load.dart';

import '../../../core/models/user_model.dart';

part 'treasury_event.dart';
part 'treasury_state.dart';

class TreasuryBloc extends Bloc<TreasuryEvent, TreasuryState> {
  final manager = ClientService.instance.manager;
  TreasuryBloc() : super(TreasuryInitial()) {
    on<PostTreasuryEvent>(_addTransaction);
    on<GetTreasuryEvent>(_getTreasury);
  }
  Future<void> _getTreasury(GetTreasuryEvent event, Emitter<TreasuryState> emit) async {
    try {
      emit(TreasuryLoading());
      final response = await manager.getRequest<TreasuryModel, List<TreasuryModel>>(
        NetworkPath.getTransactionByID(CacheManager.getModel(User())!.iss!),
        parseModel: TreasuryModel(),
      );
      if (response.data != null) {
        emit(TreasuryLoaded(response.data!));
      } else {
        emit(TreasuryError(response.error?.message ?? 'Liste Getirelemedi!'));
      }
    } catch (e) {
      emit(TreasuryError(e.toString()));
    }
  }


  Future<void> _addTransaction(PostTreasuryEvent event, Emitter<TreasuryState> emit) async {
    try {
      await showLoadingDialog();
      final response = await manager.postRequest<User, User>(
        NetworkPath.addNews,
        parseModel: User(),
        body: {
          'transaction_type': event.transaction_type,
          'symbol': event.symbol,
          'amount': event.amount,
          'buying_price': event.buying_price,
          'user_id': CacheManager.getModel(User())!.iss!
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
}
