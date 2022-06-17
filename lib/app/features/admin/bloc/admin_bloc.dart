import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hypecoin/app/core/constants/network_path.dart';
import 'package:hypecoin/app/core/services/client/client_service.dart';
import 'package:hypecoin/app/features/admin/models/admin_stats_model.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final manager = ClientService.instance.manager;
  AdminBloc() : super(AdminInitial()) {
    on<GetAdminStaticsEvent>(_getStaticals);
  }


  Future<void> _getStaticals(GetAdminStaticsEvent event, Emitter<AdminState> emit) async {
    try {
      emit(AdminLoading());
      final response = await manager.getRequest<AdminStatsModel, AdminStatsModel>(
        NetworkPath.adminStatics,
        parseModel: AdminStatsModel(),
      );
      if (response.data != null) {
        emit(AdminLoaded(response.data!));
      } else {
        emit(AdminError(response.error?.message ?? 'Liste Getirelemedi!'));
      }
    } catch (e) {
      emit(AdminError(e.toString()));
    }
  }
}
