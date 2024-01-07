import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:mirbezgranic/components/button_with_icon.dart';
import 'package:mirbezgranic/utils/app_colors.dart';

class PanicDialog extends StatefulWidget {
  final Function() closeClicked;
  final Function(String) sendMessage;

  const PanicDialog({
    super.key,
    required this.closeClicked,
    required this.sendMessage,
  });

  @override
  State<PanicDialog> createState() => _PanicDialogState();
}

class _PanicDialogState extends State<PanicDialog> {
  bool? yesChecked = false;
  bool? noChecked = false;
  TextEditingController controller = TextEditingController();
  callNumber() async {
    const number = '112'; //set the number here
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: widget.closeClicked,
            child: const Icon(
              Icons.close,
              color: AppColors.darkBlue2,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 50.0),
          child: Text(
            'ТРЕВОЖНАЯ КНОПКА',
            style: TextStyle(
                color: AppColors.smokyBlack,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          'ВАШЕЙ ЖИЗНИ ЧТО-ТО угрожает?'.toUpperCase(),
          style: const TextStyle(fontSize: 14, color: AppColors.smokyBlack),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  activeColor: AppColors.darkBlue2,
                  value: yesChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      yesChecked = newValue!;
                      noChecked = !yesChecked!;
                      if (yesChecked!) {
                        callNumber();
                      }
                    });
                  },
                ),
                const Text(
                  'ДА',
                  style: TextStyle(fontSize: 14, color: AppColors.smokyBlack),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                    activeColor: AppColors.darkBlue2,
                    value: noChecked,
                    onChanged: (bool? newValue) {
                      setState(() {
                        noChecked = newValue!;
                        yesChecked = !noChecked!;
                      });
                    }),
                const Text(
                  'НЕТ',
                  style: TextStyle(fontSize: 14, color: AppColors.smokyBlack),
                ),
                const SizedBox(
                  width: 30,
                )
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Visibility(
          visible: noChecked!,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  'Опишите свою проблему и мы решим ее в ближайшее время'
                      .toUpperCase(),
                  style: TextStyle(fontSize: 14, color: AppColors.smokyBlack),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  minLines: 4,
                  controller: controller,
                  style: const TextStyle(
                      fontSize: 10, color: AppColors.smokyBlack),
                  decoration: InputDecoration(
                    hintText: 'Я потерял пасспорт',
                    hintStyle:
                        const TextStyle(fontSize: 10, color: AppColors.gray),
                    filled: true,
                    // to get the fill color
                    fillColor: Colors.white,
                    // background color of the text field
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      // rounded corners
                      borderSide: BorderSide.none, // no border
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10.0), // to match the padding in the image
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: ButtonWithIcon(
                    onPressed: () {
                      widget.sendMessage(controller.text);
                    },
                    label: 'ОТПРАВИТЬ обращение'.toUpperCase()),
              )
            ],
          ),
        ),
      ],
    );
  }
}
