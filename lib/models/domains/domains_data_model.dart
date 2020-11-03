import 'package:bbrecon/models/domains/domains_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'domains_data_model.freezed.dart';

@freezed
abstract class DomainsDataModel with _$DomainsDataModel {
  const factory DomainsDataModel({
    @Default("") String error,
    List<DomainItem> domains,
    @Default(true) bool success,
    @Default(false) bool loading,
    @nullable @Default(0) int nextPage,
  }) = _DomainsDataModel;

  const DomainsDataModel._();
}
