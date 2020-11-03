import 'package:bbrecon/app_colors.dart';
import 'package:bbrecon/common/empty_widget.dart';
import 'package:bbrecon/models/domains/domains_data_model.dart';
import 'package:bbrecon/notifiers/domains/domains_notifier.dart';
import 'package:bbrecon/pages/domains/widgets/domain_item_widget.dart';
import 'package:bbrecon/pages/domains/widgets/domains_filters_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

final domainsProvider = StateNotifierProvider<DomainsNotifier>((ref) {
  return DomainsNotifier();
});

final domainsFilterProvider = StateNotifierProvider((ref) {
  return DomainsFiltersMap();
});

class DomainsHomePage extends StatefulHookWidget {
  @override
  _DomainsHomePageState createState() => _DomainsHomePageState();
}

class _DomainsHomePageState extends State<DomainsHomePage> {
  ScrollController _scrollController;
  final _searchEditController = TextEditingController();

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (context.read(domainsProvider.state).nextPage != null) {
        final filters = context.read(domainsFilterProvider).toFilters();
        context.read(domainsProvider).loadMore(filters);
      }
    }
  }

  void _reloadDomains() {
    final filters = context.read(domainsFilterProvider).toFilters();
    context.read(domainsProvider).reload(filters);
  }

  dynamic _showFiltersBottom() {
    return showBottomSheet<dynamic>(
      context: context,
      builder: (context) {
        return DomainsFiltersWidget(
          onFilter: (isDirty) {
            if (isDirty) {
              _reloadDomains();
            }
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      _scrollController.addListener(_scrollListener);
    });
  }

  @override
  Widget build(BuildContext context) {
    _scrollController = useScrollController();
    final domainsNotify = useProvider(domainsProvider.state);

    return Stack(
      children: [
        Positioned.fill(
          child: Column(
            children: [
              if (!domainsNotify.loading)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchEditController,
                          onChanged: (value) {
                            context
                                .read(domainsFilterProvider)
                                .addSearchProgram(value);
                          },
                          onSubmitted: (value) {
                            _reloadDomains();
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 8),
                            hintText: "Search Program",
                            labelText: "Program",
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _reloadDomains();
                        },
                        tooltip: "Search",
                        icon: const Icon(Icons.search_rounded),
                        color: AppColors.primaryColor,
                      )
                    ],
                  ),
                ),
              Expanded(child: _buildBody(domainsNotify)),
            ],
          ),
        ),
        if (!domainsNotify.loading)
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton.extended(
              label: const Text("Filter"),
              icon: const Icon(Icons.filter_list_rounded),
              onPressed: () {
                _showFiltersBottom();
              },
            ),
          )
      ],
    );
  }

  Widget _buildBody(DomainsDataModel domainsNotify) {
    if (domainsNotify.success == false && domainsNotify.error.isNotEmpty) {
      return Center(
        child: Text(domainsNotify.error),
      );
    }
    if (domainsNotify.loading) {
      return Container(
        color: Colors.white,
        child: const Center(child: CircularProgressIndicator()),
      );
    }
    if (domainsNotify.domains == null) {
      return const Center(
        child: EmptyWidget(msg: "No Results"),
      );
    }
    if (domainsNotify.domains.isEmpty) {
      return const Center(
        child: EmptyWidget(msg: "No Results"),
      );
    }
    final domains = domainsNotify.domains;
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8, bottom: 32),
      controller: _scrollController,
      itemCount:
          domainsNotify.nextPage != null ? domains.length + 1 : domains.length,
      itemBuilder: (context, index) {
        if (index == domains.length) {
          return const Padding(
            padding: EdgeInsets.all(8),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        final domain = domains[index];
        return DomainItemWidget(domain: domain);
      },
    );
  }
}
