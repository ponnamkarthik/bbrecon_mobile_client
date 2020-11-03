import 'package:bbrecon/app_colors.dart';
import 'package:bbrecon/common/empty_widget.dart';
import 'package:bbrecon/notifiers/programs/programs_notifier.dart';
import 'package:bbrecon/pages/programs/widgets/program_item_widget.dart';
import 'package:bbrecon/pages/programs/widgets/programs_filters_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final programsProvider = StateNotifierProvider<ProgramsNotifier>((ref) {
  return ProgramsNotifier();
});

final programsFilterProvider = StateNotifierProvider((ref) {
  return FiltersMap();
});

class ProgramsHomePage extends StatefulHookWidget {
  @override
  _ProgramsHomePageState createState() => _ProgramsHomePageState();
}

class _ProgramsHomePageState extends State<ProgramsHomePage> {
  ScrollController _scrollController;
  final _searchEditController = TextEditingController();

  dynamic _showFiltersBottom() {
    return showBottomSheet<dynamic>(
      context: context,
      builder: (context) {
        return ProgramsFiltersWidget(
          onFilter: (isDirty) {
            if (isDirty) {
              _reloadPrograms();
            }
          },
        );
      },
    );
  }

  void _reloadPrograms() {
    final filters = context.read(programsFilterProvider).toFilters();
    context.read(programsProvider).reload(filters);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (context.read(programsProvider.state).nextPage != null) {
        final filters = context.read(programsFilterProvider).toFilters();
        context.read(programsProvider).loadMore(filters);
      }
    }
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

    final porgramsNotify = useProvider(programsProvider.state);

    return Stack(
      children: [
        Positioned.fill(
          child: Column(
            children: [
              if (porgramsNotify.error.isEmpty)
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
                                .read(programsFilterProvider)
                                .addSearchProgram(value);
                          },
                          onSubmitted: (value) {
                            _reloadPrograms();
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
                          _reloadPrograms();
                        },
                        tooltip: "Search",
                        icon: const Icon(Icons.search_rounded),
                        color: AppColors.primaryColor,
                      )
                    ],
                  ),
                ),
              Expanded(child: _buildBody()),
            ],
          ),
        ),
        if (porgramsNotify.error.isEmpty)
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

  Widget _buildBody() {
    final porgramsNotify = useProvider(programsProvider.state);

    if (porgramsNotify.success == false && porgramsNotify.error.isNotEmpty) {
      return Center(
        child: Text(porgramsNotify.error),
      );
    }
    if (porgramsNotify.programs == null) {
      return Container(
        color: Colors.white,
        child: const Center(child: CircularProgressIndicator()),
      );
    }
    if (porgramsNotify.programs.isEmpty) {
      return const Center(
        child: EmptyWidget(msg: "No Results"),
      );
    }
    final programs = porgramsNotify.programs;
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8, bottom: 32),
      controller: _scrollController,
      itemCount: porgramsNotify.nextPage != null
          ? programs.length + 1
          : programs.length,
      itemBuilder: (context, index) {
        if (index == programs.length) {
          return const Padding(
            padding: EdgeInsets.all(8),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        final program = programs[index];
        return ProgramItemWidget(program: program);
      },
    );
  }
}
