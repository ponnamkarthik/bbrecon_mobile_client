import 'package:bbrecon/common/empty_widget.dart';
import 'package:bbrecon/models/notifications/notifications_model.dart';
import 'package:bbrecon/networks/base_network_response.dart';
import 'package:bbrecon/notifiers/notifications/notifications_notifier.dart';
import 'package:bbrecon/pages/notifications/create_notificaion_widget.dart';
import 'package:bbrecon/pages/notifications/widgets/notification_item_widget.dart';
import 'package:bbrecon/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

final notificationsProvider =
    StateNotifierProvider<NotificationsNotifier>((ref) {
  return NotificationsNotifier();
});

class NotificationsHomePage extends StatefulHookWidget {
  @override
  _NotificationsHomePageState createState() => _NotificationsHomePageState();
}

class _NotificationsHomePageState extends State<NotificationsHomePage> {
  ScrollController _scrollController;

  Future<void> _deleteNotification(NotificationItem notification) async {
    final res = await DialogUtils.showDeleteDialog(context,
        title: "Delete",
        content: "Are you sure you want to delete Webhook notification.");
    if (res) {
      final data = await context
          .read(notificationsProvider)
          .deleteNotification(notification.id);
      if (data.status == ResponseStatus.FAILED) {
        DialogUtils.showErrorDialog(context,
            title: "Error", content: data.message);
      } else {
        context.read(notificationsProvider).reload();
      }
    }
  }

  dynamic _showCreateNotificationBottom() {
    return showBottomSheet<dynamic>(
      context: context,
      builder: (context) {
        return CreateNotificationWidget(
          onAdded: () {
            context.read(notificationsProvider).reload();
          },
        );
      },
    );
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (context.read(notificationsProvider.state).nextPage != null) {
        context.read(notificationsProvider).loadMore();
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

    return Stack(
      children: [
        Positioned.fill(
          child: _buildBody(),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            color: Colors.white,
            child: const Center(
              child: Text("Long press to delete notification"),
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton.extended(
            label: const Text("Create"),
            icon: const Icon(Icons.add),
            onPressed: () {
              _showCreateNotificationBottom();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    final notificationsNotify = useProvider(notificationsProvider.state);

    if (notificationsNotify.success == false &&
        notificationsNotify.error.isNotEmpty) {
      return Center(
        child: Text(notificationsNotify.error),
      );
    }
    if (notificationsNotify.notifications == null) {
      return const Center(child: CircularProgressIndicator());
    }
    if (notificationsNotify.notifications.isEmpty) {
      return const Center(
        child: EmptyWidget(msg: "No Results"),
      );
    }
    final notifications = notificationsNotify.notifications;
    return ListView.builder(
      padding: const EdgeInsets.only(top: 32, bottom: 32),
      controller: _scrollController,
      itemCount: notificationsNotify.nextPage != null
          ? notifications.length + 1
          : notifications.length,
      itemBuilder: (context, index) {
        if (index == notifications.length) {
          return const Padding(
            padding: EdgeInsets.all(8),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        final notification = notifications[index];
        return NotificationItemWidget(
            notification: notification,
            onDelete: (notificaion) {
              _deleteNotification(notification);
            });
      },
    );
  }
}
