import 'package:bbrecon/app_colors.dart';
import 'package:bbrecon/pages/programs/programs_home.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProgramsFiltersWidget extends HookWidget {
  ProgramsFiltersWidget({this.onFilter});

  final Function(bool) onFilter;
  final _dateController = TextEditingController();
  final List<String> types = [
    "web",
    "ios",
    "android",
    "code",
    "desktop",
    "hardware",
    "other"
  ];
  final List<String> platforms = [
    "hackerone",
    "bugcrowd",
    "hackenproof",
    "yeswehack"
  ];

  final List<String> rewards = ["cash", "fame", "swag"];

  Future<void> _showDatePicker(
      BuildContext context, FiltersMap filter, DateTime initialDate) async {
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

  @override
  Widget build(BuildContext context) {
    final filter = useProvider(programsFilterProvider);
    final filterState = useProvider(programsFilterProvider.state);

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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Types",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Wrap(
                runSpacing: 8,
                spacing: 8,
                children: [
                  for (String type in types)
                    ChoiceChip(
                      selected: filterState['types']?.contains(type) ?? false,
                      label: Text(toBeginningOfSentenceCase(type)),
                      onSelected: (value) {
                        filter.addTypesFilter(type);
                      },
                    )
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Platforms",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Wrap(
                runSpacing: 8,
                spacing: 8,
                children: [
                  for (String platform in platforms)
                    ChoiceChip(
                      selected:
                          filterState['platforms']?.contains(platform) ?? false,
                      label: Text(toBeginningOfSentenceCase(platform)),
                      onSelected: (value) {
                        filter.addPlatformsFilter(platform);
                      },
                    )
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Rewards",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Wrap(
                runSpacing: 8,
                spacing: 8,
                children: [
                  for (String reward in rewards)
                    ChoiceChip(
                      selected:
                          filterState['rewards']?.contains(reward) ?? false,
                      label: Text(toBeginningOfSentenceCase(reward)),
                      onSelected: (value) {
                        filter.addRewardssFilter(reward);
                      },
                    )
                ],
              )
            ],
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
              "Private Programs",
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
                onFilter?.call(isDirty);
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

class FiltersMap extends StateNotifier<Map<String, dynamic>> {
  FiltersMap() : super(<String, dynamic>{});

  void isDirty(bool value) {
    state = <String, dynamic>{...state, "isDirty": value};
  }

  void addTypesFilter(String value) {
    final types = (state['types'] as List<String>) ?? <String>[];
    if (types.contains(value)) {
      types.remove(value);
    } else {
      types.add(value);
    }
    isDirty(true);
    state = <String, dynamic>{...state, "types": types};
  }

  void addPlatformsFilter(String value) {
    final platforms = (state['platforms'] as List<String>) ?? <String>[];
    if (platforms.contains(value)) {
      platforms.remove(value);
    } else {
      platforms.add(value);
    }
    isDirty(true);
    state = <String, dynamic>{...state, "platforms": platforms};
  }

  void addRewardssFilter(String value) {
    final rewards = (state['rewards'] as List<String>) ?? <String>[];
    if (rewards.contains(value)) {
      rewards.remove(value);
    } else {
      rewards.add(value);
    }
    isDirty(true);
    state = <String, dynamic>{...state, "rewards": rewards};
  }

  void addCreatedFromDate(DateTime date) {
    isDirty(true);
    state = <String, dynamic>{...state, "createdSince": date.toIso8601String()};
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
    if (queryParams['types'] != null) {
      if (queryParams['types'].length > 0) {
        for (String r in queryParams['types']) {
          params.add("types=$r");
        }
      }
    }
    if (queryParams['platforms'] != null) {
      if (queryParams['platforms'].length > 0) {
        for (String r in queryParams['platforms']) {
          params.add("platforms=$r");
        }
      }
    }
    if (queryParams['rewards'] != null) {
      if (queryParams['rewards'].length > 0) {
        for (String r in queryParams['rewards']) {
          params.add("rewards=$r");
        }
      }
    }
    if (queryParams['createdSince'] != null) {
      params.add("createdSince=${queryParams['createdSince']}");
    }
    if (queryParams['private'] != null) {
      params.add("private=${queryParams['private']}");
    }
    if (queryParams['name'] != null && queryParams['name'] != "") {
      params.add("name=${queryParams['name']}");
    }

    return params;
  }
}
