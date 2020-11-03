import 'package:bbrecon/models/domains/domains_data_model.dart';
import 'package:bbrecon/models/domains/domains_model.dart';
import 'package:bbrecon/networks/base_network_response.dart';
import 'package:bbrecon/networks/domains/domains_manager.dart';
import 'package:hooks_riverpod/all.dart';

class DomainsNotifier extends StateNotifier<DomainsDataModel> {
  DomainsNotifier() : super(DomainsDataModel()) {
    // _init();
  }

  Future<void> _init([List<String> params]) async {
    state = state.copyWith(
      nextPage: 0,
      error: "",
      loading: true,
      success: true,
      domains: null,
    );
    final responseData =
        await domainsManager.fetchDomains(queryParams: params?.join("&") ?? "");
    if (responseData.status == ResponseStatus.SUCCESS) {
      final latestModel = responseData.data as DomainsModel;
      state = state.copyWith(
        nextPage: latestModel.nextPage,
        error: "",
        loading: false,
        success: true,
        domains: [...latestModel.data],
      );
    } else {
      state = state.copyWith(
        loading: false,
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
    if (state.nextPage == null) {
      return;
    }
    state = state.copyWith(
      loading: true,
    );
    final responseData =
        await domainsManager.fetchDomains(queryParams: p?.join("&") ?? "");
    if (responseData.status == ResponseStatus.SUCCESS) {
      final latestModel = responseData.data as DomainsModel;
      final domains = state.domains ?? [];
      if (latestModel.nextPage == state.nextPage) {
        return;
      }
      state = state.copyWith(
        loading: false,
        nextPage: latestModel.nextPage,
        error: "",
        success: true,
        domains: [...domains, ...latestModel.data],
      );
    } else {
      state = state.copyWith(
        error: responseData.message,
        success: false,
      );
    }
  }
}
