import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hypecoin/localization/provider/localization_helper.dart';


part 'localization_event.dart';
part 'localization_state.dart';

/// Localization BLoC Class for listen events of Localization
class LocalizationsBloc extends Bloc<LocalizationsEvent, LocalizationsState> {
  LocalizationsBloc({
    required this.localizationHelper,
  }) : super(const LoadingState());

  final LocalizationHelper localizationHelper;


  /// This method is used to listen streams of events.
  /// [LocalizationsState] holds state of User data
  /// [LocalizationsEvent] holds list of User events
  @override
  Stream<LocalizationsState> mapEventToState(
      LocalizationsEvent event,
      ) async* {
   if (event is FetchLocaleFromSharedPref) {
      yield* _mapFetchLocaleFromSharedPrefEventToState(event, state);
    } else if (event is ChangeLocale) {
      yield* _mapChangeLocaleEventToState(event, state);
    }
  }



  Stream<LocalizationsState> _mapFetchLocaleFromSharedPrefEventToState(
      FetchLocaleFromSharedPref event,
      LocalizationsState state,
      ) async* {
    try {
      /// Fetch localization from [SharedPreferences]
      final initialLocale = await localizationHelper.locale;

      yield LocalizationSuccess(locale: initialLocale);
    } catch (e) {
      yield LocalizationError(errorMessage: e.toString());
    }
  }

  Stream<LocalizationsState> _mapChangeLocaleEventToState(
      ChangeLocale event,
      LocalizationsState state,
      ) async* {
    try {
      yield LocalizationSuccess(locale: event.locale);
      await localizationHelper.saveLocale(event.locale);
    } catch (e) {
      yield LocalizationError(errorMessage: e.toString());
    }
  }
}
