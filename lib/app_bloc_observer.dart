import 'package:bloc/bloc.dart';
import 'package:hypecoin/app/core/logger/hype_coin_logger.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    HypeAppLogger.log.i('onCreate(${bloc.runtimeType})');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    HypeAppLogger.log.i('onEvent(${bloc.runtimeType}, $event)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    HypeAppLogger.log.e(bloc.runtimeType, error, stackTrace);
  }
}
