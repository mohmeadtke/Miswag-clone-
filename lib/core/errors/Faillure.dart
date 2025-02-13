import 'package:freezed_annotation/freezed_annotation.dart';

part 'Faillure.freezed.dart';

@freezed
class Faillure with _$Faillure {
  const factory Faillure.serverError({required String message}) = _ServerError;
  const factory Faillure.offlineError() = _OfflineError;
  const factory Faillure.invalidData() = _InvalidData;
  const factory Faillure.wrongPassword({required String message}) =
      _WrongPassword;
}
