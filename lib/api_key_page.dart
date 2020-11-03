import 'package:bbrecon/home_page.dart';
import 'package:bbrecon/misc/navigation_service.dart';
import 'package:bbrecon/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiKeyPage extends StatefulWidget {
  @override
  _ApiKeyPageState createState() => _ApiKeyPageState();
}

class _ApiKeyPageState extends State<ApiKeyPage> {
  final _keyController = TextEditingController();

  Future<void> _saveKey() async {
    final key = _keyController.text.trim();
    if (key.isEmpty) {
      DialogUtils.showErrorDialog(
        context,
        title: "Error",
        content: "Please fill the key",
      );
      return;
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("api", key);

    NavigationService().navigatePage(HomePage(), replaceAll: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
            ),
            const SizedBox(height: 48),
            TextField(
              autocorrect: false,
              controller: _keyController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Paste API Key",
                labelText: "API Key",
              ),
            ),
            const SizedBox(height: 32),
            RaisedButton(
              elevation: 0,
              focusElevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                _saveKey();
              },
              textTheme: ButtonTextTheme.primary,
              materialTapTargetSize: MaterialTapTargetSize.padded,
              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
