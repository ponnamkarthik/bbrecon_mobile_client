import 'package:bbrecon/models/programs/programs_data_model.dart';
import 'package:bbrecon/models/programs_model.dart';
import 'package:bbrecon/networks/base_network_response.dart';
import 'package:bbrecon/networks/programs/programs_manager.dart';
import 'package:hooks_riverpod/all.dart';

class ProgramsNotifier extends StateNotifier<ProgramsDataModel> {
  ProgramsNotifier() : super(ProgramsDataModel()) {
    _init();
  }

  Future<void> _init([List<String> params]) async {
    state = state.copyWith(
      nextPage: 0,
      error: "",
      success: true,
      programs: null,
    );
    final responseData = await programsManager.fetchPrograms(
        queryParams: params?.join("&") ?? "");
    if (responseData.status == ResponseStatus.SUCCESS) {
      final latestModel = responseData.data as ProgramsModel;
      state = state.copyWith(
        nextPage: latestModel.nextPage,
        error: "",
        success: true,
        programs: [...latestModel.data],
      );
    } else {
      state = state.copyWith(
        error: responseData.message,
        success: false,
      );
    }
  }

  void reload([List<String> params]) {
    _init(params);
  }

  Future<void> loadMore([List<String> params]) async {
    final p = params ?? [];
    p.add("page=${state.nextPage}");
    final responseData =
        await programsManager.fetchPrograms(queryParams: p?.join("&") ?? "");
    if (responseData.status == ResponseStatus.SUCCESS) {
      final latestModel = responseData.data as ProgramsModel;
      final programs = state.programs ?? [];
      if (latestModel.nextPage == state.nextPage) {
        return;
      }
      state = state.copyWith(
        nextPage: latestModel.nextPage,
        error: "",
        success: true,
        programs: [...programs, ...latestModel.data],
      );
    } else {
      state = state.copyWith(
        error: responseData.message,
        success: false,
      );
    }
  }
}
