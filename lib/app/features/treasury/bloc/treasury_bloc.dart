import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_managers/flutter_managers.dart';
import 'package:hypecoin/app/core/constants/network_path.dart';
import 'package:hypecoin/app/core/services/client/client_service.dart';
import 'package:hypecoin/app/features/treasury/models/treasury_model.dart';
import 'package:hypecoin/localization/bloc/localization_bloc.dart';

import '../../../core/models/user_model.dart';

part 'treasury_event.dart';
part 'treasury_state.dart';

class TreasuryBloc extends Bloc<TreasuryEvent, TreasuryState> {
  final manager = ClientService.instance.manager;
  TreasuryBloc() : super(TreasuryInitial()) {
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
}
