import 'package:bbrecon/models/programs_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'programs_data_model.freezed.dart';

@freezed
abstract class ProgramsDataModel with _$ProgramsDataModel {
  const factory ProgramsDataModel({
    @Default("") String error,
    List<ProgramItem> programs,
    @Default(true) bool success,
    @nullable @Default(1) int nextPage,
  }) = _ProgramsDataModel;

  const ProgramsDataModel._();
}
