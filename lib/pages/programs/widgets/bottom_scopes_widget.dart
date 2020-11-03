import 'package:bbrecon/models/programs_model.dart';
import 'package:bbrecon/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomScopesWidget extends StatelessWidget {
  const BottomScopesWidget({
    Key key,
    @required this.program,
  }) : super(key: key);

  final ProgramItem program;

  void _copyToClipBoard(String scope) {
    Clipboard.setData(ClipboardData(
      text: scope,
    ));
    Utils.showToast("Url copied to clipboard");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    program.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    program.platform,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () async {
                  if (await canLaunch(program.url)) {
                    await launch(program.url);
                  } else {
                    _copyToClipBoard(program.url);
                  }
                },
                icon: const Icon(
                  Icons.language,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: program.inScope.length,
              separatorBuilder: (context, index) => const Divider(),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final scope = program.inScope[index];
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        scope.type,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            if (scope.value.startsWith("http")) {
                              if (await canLaunch(scope.value)) {
                                await launch(scope.value);
                              } else {
                                _copyToClipBoard(scope.value);
                              }
                            } else {
                              _copyToClipBoard(scope.value);
                            }
                          },
                          child: Text(
                            scope.value,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
