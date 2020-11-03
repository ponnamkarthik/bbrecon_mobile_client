import 'package:bbrecon/models/domains/domains_model.dart';
import 'package:bbrecon/utils/constants.dart';
import 'package:bbrecon/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class DomainItemWidget extends StatelessWidget {
  const DomainItemWidget({this.domain});

  final DomainItem domain;

  void _copyToClipBoard(String scope) {
    Clipboard.setData(ClipboardData(
      text: scope,
    ));
    Utils.showToast("Url copied to clipboard");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text.rich(
                  TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: domain.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                DateUtils.dateTimeAgo(domain.createdAt),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () async {
              if (await canLaunch(domain.name)) {
                await launch(domain.name);
              } else {
                _copyToClipBoard(domain.name);
              }
            },
            child: Text(
              toBeginningOfSentenceCase(domain.program),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
