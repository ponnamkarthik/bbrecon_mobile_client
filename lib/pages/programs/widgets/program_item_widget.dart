import 'package:bbrecon/app_colors.dart';
import 'package:bbrecon/models/programs_model.dart';
import 'package:bbrecon/pages/programs/widgets/bottom_scopes_widget.dart';
import 'package:bbrecon/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProgramItemWidget extends StatelessWidget {
  const ProgramItemWidget({
    Key key,
    @required this.program,
  }) : super(key: key);

  final ProgramItem program;

  dynamic _showScopesBottom(BuildContext context) {
    return showBottomSheet<dynamic>(
      context: context,
      // enableDrag: true,
      // isScrollControlled: true,
      builder: (context) {
        return BottomScopesWidget(
          program: program,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showScopesBottom(context);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(.10),
              blurRadius: 25,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text.rich(
                          TextSpan(children: <TextSpan>[
                            TextSpan(
                              text: toBeginningOfSentenceCase(program.name),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: " (${program.platform})",
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ]),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // if (program.live)
                      //   Container(
                      //     margin: const EdgeInsets.symmetric(horizontal: 8),
                      //     padding: const EdgeInsets.symmetric(
                      //         horizontal: 8, vertical: 2),
                      //     decoration: BoxDecoration(
                      //       color: AppColors.liveChipColor,
                      //       borderRadius: BorderRadius.circular(25),
                      //     ),
                      //     child: const Text(
                      //       "Live",
                      //       style: TextStyle(
                      //         fontWeight: FontWeight.bold,
                      //         fontSize: 12,
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //   )
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  DateUtils.dateTimeAgo(program.bountyCreatedAt),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  program.rewards.join(', '),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  children: [
                    if (program.inScope != null)
                      Chip(
                        visualDensity: VisualDensity.compact,
                        backgroundColor: AppColors.scopeChipColor,
                        label: Text(program.inScope.length.toString()),
                        labelStyle: const TextStyle(color: Colors.white),
                      ),
                    const SizedBox(
                      width: 4,
                    ),
                    if (program.minimumBounty > 0 || program.maximumBounty > 0)
                      Chip(
                        visualDensity: VisualDensity.compact,
                        label: Row(
                          children: [
                            Text(
                              "\$${program.minimumBounty} - \$${program.maximumBounty}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                for (String t in program.types)
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Chip(
                      backgroundColor: AppColors.typeChipColor,
                      visualDensity: VisualDensity.compact,
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      label: Text(t),
                      labelStyle: const TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
