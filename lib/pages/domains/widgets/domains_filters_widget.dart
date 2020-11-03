import 'package:bbrecon/app_colors.dart';
import 'package:bbrecon/pages/domains/domains_home.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DomainsFiltersWidget extends StatefulHookWidget {
  const DomainsFiltersWidget({this.onFilter});

  final Function(bool) onFilter;
  @override
  _DomainsFiltersWidgetState createState() => _DomainsFiltersWidgetState();
}

class _DomainsFiltersWidgetState extends State<DomainsFiltersWidget> {
  final _dateController = TextEditingController();

  Future<void> _showDatePicker(BuildContext context, DomainsFiltersMap filter,
      DateTime initialDate) async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      initialDate: initialDate ?? now,
      lastDate: now,
    );

    if (date != null) {
      final formater = DateFormat.yMMMMd('en_US');
      _dateController.text = formater.format(date);
      filter.addCreatedFromDate(date);
    }
  }

  void _setInitailValues() {
    final filterState = context.read(domainsFilterProvider.state);
    if (filterState['createdSince'] != null) {
      Future.microtask(() {
        final formater = DateFormat.yMMMMd('en_US');
        _dateController.text =
            formater.format(DateTime.parse(filterState['createdSince']));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _setInitailValues();
  }

  @override
  Widget build(BuildContext context) {
    final filter = useProvider(domainsFilterProvider);
    final filterState = useProvider(domainsFilterProvider.state);

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Filters",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            readOnly: true,
            autocorrect: false,
            controller: _dateController,
            decoration: const InputDecoration(
              hintText: "Created Since",
              labelText: "Created Since",
              border: OutlineInputBorder(),
            ),
            onTap: () {
              final d = filterState['createdSince'] != null
                  ? DateTime.parse(filterState['createdSince'])
                  : DateTime.now();
              _showDatePicker(context, filter, d);
            },
          ),
          const SizedBox(height: 20),
          CheckboxListTile(
            value: filterState['private'] ?? false,
            selected: filterState['private'] ?? false,
            dense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 2),
            title: const Text(
              "Private Domains",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            onChanged: (value) {
              filter.addPrivateFilter(value);
            },
          ),
          const SizedBox(height: 20),
          Center(
            child: RaisedButton(
              onPressed: () {
                final bool isDirty = filterState['isDirty'] ?? false;
                filterState.remove("isDirty");
                widget.onFilter?.call(isDirty);
                Navigator.of(context).pop();
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              color: AppColors.primaryColor,
              textColor: Colors.white,
              child: const Text("Filter"),
            ),
          )
        ],
      ),
    );
  }
}

class DomainsFiltersMap extends StateNotifier<Map<String, dynamic>> {
  DomainsFiltersMap() : super(<String, dynamic>{});

  void isDirty(bool value) {
    state = <String, dynamic>{"isDirty": value, ...state};
  }

  void addCreatedFromDate(DateTime date) {
    isDirty(true);

    state = <String, dynamic>{
      ...state,
      "createdSince": date.toUtc().toIso8601String(),
    };
  }

  void addPrivateFilter(bool value) {
    isDirty(true);
    state = <String, dynamic>{...state, "private": value};
  }

  void addSearchProgram(String value) {
    state = <String, dynamic>{...state, "name": value};
  }

  List<String> toFilters() {
    final queryParams = <String, dynamic>{...state};
    final params = <String>[];
    if (queryParams['createdSince'] != null) {
      params.add("createdSince=${queryParams['createdSince']}");
    }
    if (queryParams['private'] != null) {
      params.add("private=${queryParams['private']}");
    }
    if (queryParams['name'] != null && queryParams['name'] != "") {
      params.add("programs=${queryParams['name']}");
    }

    return params;
  }
}
