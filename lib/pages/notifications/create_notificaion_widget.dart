import 'package:bbrecon/app_colors.dart';
import 'package:bbrecon/networks/base_network_response.dart';
import 'package:bbrecon/networks/notifications/notifications_manager.dart';
import 'package:bbrecon/pages/notifications/notifications_home.dart';
import 'package:bbrecon/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

final createNotificationProvider = StateNotifierProvider((ref) {
  return CreateNotificationNotifier();
});

class CreateNotificationWidget extends HookWidget {
  CreateNotificationWidget({this.onAdded});

  final Function() onAdded;

  final _webHookController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loading = useProvider(createNotificationProvider.state);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Notification will be created for ALL programs",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            autocorrect: false,
            controller: _webHookController,
            decoration: const InputDecoration(
              hintText: "Discord / Slack WebHook",
              labelText: "WebHook",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          if (loading)
            const Center(child: CircularProgressIndicator())
          else
            Center(
              child: RaisedButton(
                onPressed: () async {
                  final webHook = _webHookController.text;
                  final reg = RegExp(r"^(https?|chrome):\/\/[^\s$.?#].[^\s]*$");
                  if (!reg.hasMatch(webHook)) {
                    DialogUtils.showErrorDialog(context,
                        title: "Error", content: "Please enter a valid url");
                    return;
                  }
                  final data = await context
                      .read(createNotificationProvider)
                      .createNotification(webHook);
                  if (data.status == ResponseStatus.FAILED) {
                    DialogUtils.showErrorDialog(
                      context,
                      content: data.message,
                      title: "Error",
                    );
                  } else {
                    onAdded?.call();
                    Navigator.of(context).pop();
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: AppColors.primaryColor,
                textColor: Colors.white,
                child: const Text("Create Notification"),
              ),
            )
        ],
      ),
    );
  }
}

class CreateNotificationNotifier extends StateNotifier<bool> {
  CreateNotificationNotifier() : super(false);

  Future<ResponseData> createNotification(String webHook) async {
    state = true;
    final response = await notificationsManager.createNotification(webHook);
    state = false;
    return response;
  }
}
