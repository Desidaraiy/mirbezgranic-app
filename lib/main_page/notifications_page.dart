import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mirbezgranic/components/notification_card.dart';
import 'package:mirbezgranic/controller/messagesController.dart';
import 'package:mirbezgranic/localization/locales.dart';
import 'package:mirbezgranic/utils/app_colors.dart';
import 'package:mirbezgranic/utils/app_icons.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  final ScrollController scrollController = ScrollController();
  late MessagesController _con;

  @override
  void initState() {
    super.initState();
    _con = Provider.of<MessagesController>(context, listen: false);
    initialize();
  }

  Future<void> initialize() async {
    await _con.downloadNotes();
    if (!_con.isMessagesEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    MessagesController store = Provider.of<MessagesController>(context);
    double c_height = MediaQuery.of(context).size.height * 0.7;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 14, right: 24, top: 50, bottom: 130),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      iconSize: 30.0,
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 24,
                      height: 24,
                      padding: const EdgeInsets.all(2),
                      child: SvgPicture.asset(
                        AppIcons.notification,
                      ),
                    ),
                  ),
                ],
              ),
              Observer(builder: (_) {
                if (store.isDownloading) {
                  return SizedBox(
                    height: c_height,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.darkBlue,
                      ),
                    ),
                  );
                } else if (store.isMessagesEmpty) {
                  return SizedBox(
                    height: c_height,
                    child: Center(
                      child: Text(
                        LocaleData.notifications_not_found.getString(context),
                      ),
                    ),
                  );
                } else {
                  return ListView.builder(
                    controller: scrollController,
                    itemCount: _con.messages.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return NotificationCard(
                        title: _con.messages[index].title!,
                        message: _con.messages[index].text!,
                      );
                    },
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
