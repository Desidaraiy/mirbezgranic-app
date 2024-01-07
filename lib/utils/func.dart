import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:mirbezgranic/components/forma_list_dialog.dart';
import 'package:mirbezgranic/components/message_dialog.dart';
import 'package:mirbezgranic/localization/locales.dart';
import 'package:mirbezgranic/models/user.dart';
import 'package:mirbezgranic/repository/serverRepository.dart';
import 'package:mirbezgranic/repository/userRepository.dart';
import 'package:mirbezgranic/utils/appcontext.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/panic_dialog.dart';
import 'app_colors.dart';
import 'event.dart';

class Utils {
  static Future<void> launchURL(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}

void showPanicDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    backgroundColor: AppColors.lightGreen,
    surfaceTintColor: Colors.transparent,
    alignment: Alignment.center,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14.0),
    ),
    contentPadding: const EdgeInsets.only(left: 20, top: 10, right: 10),
    insetPadding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
    content: PanicDialog(
      closeClicked: () => Navigator.pop(context),
      sendMessage: (message) async {
        final UserModel _user = await LocalUserRepository.getUser();
        await ServerRepository.sendEmailSos(_user.id ?? 0, message);
        Navigator.pop(context);
        showMessageDialog(context, 'Ваша заявка принята',
            'Мы свяжемся с вами в ближайшее время',
            isSuccess: true);
      },
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return alert;
    },
  );
}

Future<Map<String, dynamic>> showFormListDialog(
  BuildContext context,
  String title,
  String desc,
  bool isStudy,
) async {
  int day = isStudy ? 3 : 7;
  String description = isStudy
      ? LocaleData.trpe_certificate_modal_desc_three.getString(context)
      : LocaleData.trpe_certificate_modal_desc_seven.getString(context);
  Map<String, dynamic> _data = {};
  AlertDialog alert = AlertDialog(
    backgroundColor: AppColors.lightGreen,
    surfaceTintColor: Colors.transparent,
    alignment: Alignment.center,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14.0),
    ),
    contentPadding:
        const EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 30),
    insetPadding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
    content: FormListDialog(
      title: title,
      desc: desc,
      isStudy: isStudy,
      closeClicked: () => Navigator.pop(context),
      sendMessage: (Map<String, dynamic> value) {
        Navigator.pop(context);
        _data = value;
        showMessageDialog(
            context,
            LocaleData.trpe_certificate_modal_title.getString(context),
            description);
      },
    ),
  );
  await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return alert;
    },
  );
  return _data;
}

void showMessageDialog(BuildContext context, String title, String desc,
    {bool isSuccess = false}) {
  AlertDialog alert = AlertDialog(
    backgroundColor: AppColors.lightGreen,
    surfaceTintColor: Colors.transparent,
    alignment: Alignment.center,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14.0),
    ),
    contentPadding:
        const EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
    content: MessageDialog(
      isSuccess: isSuccess,
      title: title,
      desc: desc,
      closeClicked: () => Navigator.pop(context),
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return alert;
    },
  );
}

List<EventModel> eventsTop = [
  EventModel(
      title: LocaleData.yandex_afisha.getString(AppContext.currentContext!),
      desc: LocaleData.yandex_afisha_desc.getString(AppContext.currentContext!),
      buttonText:
          LocaleData.yandex_afisha_button.getString(AppContext.currentContext!),
      link: 'https://afisha.yandex.ru/veliky-novgorod',
      imagePath: "assets/images/first.jpg"),
  EventModel(
      title: LocaleData.philarmonic_hall.getString(AppContext.currentContext!),
      desc: LocaleData.philarmonic_hall_desc
          .getString(AppContext.currentContext!),
      buttonText: LocaleData.philarmonic_hall_button
          .getString(AppContext.currentContext!),
      link: 'https://philnov.ru/event/',
      imagePath: 'assets/images/second.jpg'),
  EventModel(
      title: LocaleData.cecos.getString(AppContext.currentContext!),
      desc: LocaleData.cecos_button.getString(AppContext.currentContext!),
      buttonText: LocaleData.cecos_button.getString(AppContext.currentContext!),
      link: 'https://vk.com/novsu.event',
      imagePath: 'assets/images/third.jpg'),
];

List<EventModel> eventsBottom = [
  EventModel(
      title: 'Мираж Синема',
      desc:
          'Мираж Синема» — это современный кинотеатр со своей пиццерией и суши-баром. Вас ждет большой выбор попкорна на любой вкус и уютные залы.',
      buttonText: 'АФИША КИНО',
      link: 'https://www.mirage.ru/nov/',
      imagePath: 'assets/images/four.jpg'),
  EventModel(
      title: 'Кинотеатр Россия',
      desc:
          'Посмотри кино на самом большом, в регионе, парящем “серебрянном” экране.',
      buttonText: 'АФИША КИНО',
      link: 'https://kino53.ru/kinoafisha',
      imagePath: 'assets/images/five.jpg')
];

const String passportHtmlText = '''<!DOCTYPE html>
<html lang="ru-RU">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <title>
    </title>
    <style>
        @font-face {
            font-family: 'Karla, sans-serif';
        }
        body {
            line-height: 108%;
            font-family: Karla;
            font-size: 11pt
        }

        p {
            margin: 0pt 0pt 8pt
        }

        li {
            margin-top: 0pt;
            margin-bottom: 8pt
        }

        .BalloonText {
            margin-bottom: 0pt;
            line-height: normal;
            font-family: 'Segoe UI';
            font-size: 9pt
        }

        .ListParagraph {
            margin-left: 36pt;
            margin-bottom: 8pt;
            line-height: 108%;
            font-size: 11pt
        }

        .NormalWeb {
            margin-top: 5pt;
            margin-bottom: 5pt;
            line-height: normal;
            font-family: 'Times New Roman';
            font-size: 12pt
        }

        .selectable-text {
            margin-top: 5pt;
            margin-bottom: 5pt;
            line-height: normal;
            font-family: 'Times New Roman';
            font-size: 12pt
        }

        span.a {
            font-family: 'Segoe UI';
            font-size: 9pt
        }

        .awlist1 {
            list-style: none;
            counter-reset: awlistcounter4_0
        }

        .awlist1>li:before {
            content: counter(awlistcounter4_0) ')';
            counter-increment: awlistcounter4_0
        }

        .awlist2 {
            list-style: none;
            counter-reset: awlistcounter4_0 1
        }

        .awlist2>li:before {
            content: counter(awlistcounter4_0) ')';
            counter-increment: awlistcounter4_0
        }

        .awlist3 {
            list-style: none;
            counter-reset: awlistcounter4_0 2
        }

        .awlist3>li:before {
            content: counter(awlistcounter4_0) ')';
            counter-increment: awlistcounter4_0
        }

        .awlist4 {
            list-style: none;
            counter-reset: awlistcounter4_0 3
        }

        .awlist4>li:before {
            content: counter(awlistcounter4_0) ')';
            counter-increment: awlistcounter4_0
        }

        .awlist5 {
            list-style: none;
            counter-reset: awlistcounter5_0
        }

        .awlist5>li:before {
            content: counter(awlistcounter5_0) ')';
            counter-increment: awlistcounter5_0
        }
    </style>
</head>

<body>
    <p style="line-height:108%; font-size:14pt;"><span >Обратитесь в Посольство или Консульство Вашей страны, чтобы заказать новый паспорт.</span></p>
    <p style="line-height:108%; font-size:14pt;"><span >Сообщите в отдел МУВР, когда будет готов новый паспорт.</span></p>
    <p style="line-height:108%; font-size:14pt;"><span >При получении нового паспорта необходимо встать по нему на регистрацию в течение 3 дней. Сразу после получения обратитесь в отдел МУВР.</span></p>
</body>

</html> ''';

const String visaHtmlText = '''<!DOCTYPE html>
<html lang="ru-RU">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <title>
    </title>
    <style>
        @font-face {
          font-family: 'Karla, sans-serif';
        }
        body {
            line-height: 108%;
            font-family: Karla;
            font-size: 11pt
        }

        p {
            margin: 0pt 0pt 8pt
        }

        li {
            margin-top: 0pt;
            margin-bottom: 8pt
        }

        .BalloonText {
            margin-bottom: 0pt;
            line-height: normal;
            font-family: 'Segoe UI';
            font-size: 9pt
        }

        .ListParagraph {
            margin-bottom: 8pt;
            line-height: 108%;
            font-size: 11pt
        }

        .NormalWeb {
            margin-top: 5pt;
            margin-bottom: 5pt;
            line-height: normal;
            font-family: 'Times New Roman';
            font-size: 12pt
        }

        .selectable-text {
            margin-top: 5pt;
            margin-bottom: 5pt;
            line-height: normal;
            font-family: 'Times New Roman';
            font-size: 12pt
        }

        span.a {
            font-family: 'Segoe UI';
            font-size: 9pt
        }

        .awlist1 {
            list-style: none;
            counter-reset: awlistcounter4_0
        }

        .awlist1>li:before {
            content: counter(awlistcounter4_0) ')';
            counter-increment: awlistcounter4_0
        }

        .awlist2 {
            list-style: none;
            counter-reset: awlistcounter4_0 1
        }

        .awlist2>li:before {
            content: counter(awlistcounter4_0) ')';
            counter-increment: awlistcounter4_0
        }

        .awlist3 {
            list-style: none;
            counter-reset: awlistcounter4_0 2
        }

        .awlist3>li:before {
            content: counter(awlistcounter4_0) ')';
            counter-increment: awlistcounter4_0
        }

        .awlist4 {
            list-style: none;
            counter-reset: awlistcounter4_0 3
        }

        .awlist4>li:before {
            content: counter(awlistcounter4_0) ')';
            counter-increment: awlistcounter4_0
        }

        .awlist5 {
            list-style: none;
            counter-reset: awlistcounter5_0
        }

        .awlist5>li:before {
            content: counter(awlistcounter5_0) ')';
            counter-increment: awlistcounter5_0
        }
    </style>
</head>

<body>
    <p style="line-height:108%; font-size:14pt;"><span >Документы на визу подаются не ранее, чем за 40 дней, и не позднее, чем за </span><strong><em><u><span >20 </span></u></em></strong><em><u><span ></span></u></em><strong><em><u><span >рабочих </span></u></em></strong><strong><span ></span></strong><span >дней до окончания предыдущей визы (</span><strong><em><u><span >или 28 календарных дней</span></u></em></strong><span >). В случае опоздания в оформлении визы будет отказано!</span></p>
    <p style="line-height:108%; font-size:14pt;"><strong><span >Для оформления визы предоставьте в отдел МУВР следующие документы:</span></strong></p>
    <p style="line-height:108%; font-size:14pt;"><span >- паспорт, миграционная карта;</span></p>
    <p style="line-height:108%; font-size:14pt;"><span >- чек об оплате госпошлины за визу;</span><em><span >(можно сразу приложить банковские реквизиты)</span></em></p>
    <p style="line-height:108%; font-size:14pt;"><em><u><span >Проверяйте, чтобы в чеке были правильно указаны фамилия, все имена (как в предыдущей визе!) и номер паспорта.</span></u></em><span ></span></p>
    <p style="line-height:108%; font-size:14pt;"><span >- одна фотография;</span></p>
    <p style="line-height:108%; font-size:14pt;"><span >- полная копия паспорта (копия ВСЕХ страниц, даже пустых);</span></p>
    <p style="line-height:108%; font-size:14pt;"><em><span >-</span></em><span >для студентов, не проживающих в общежитии &ndash; регистрация по месту жительства.</span></p>
    <p style="line-height:108%; font-size:14pt;"><span ></span></p>
    <p style="line-height:108%; font-size:14pt;"><span >После предоставления Вами документов в отдел МУВР, Вам выдадут пакет документов, который Вы самостоятельно отнесете в Управление по вопросам миграции УМВД России по Новгородской области (адрес: ул. Людогоща, 5/68). Вам дадут памятку с адресом и точным временем приёма. Когда виза будет готова, сотрудники отдела позвонят Вам и запишут на получение визы. Полученную новую визу нужно сразу же предоставить в отдел МУВР для продления Вашей регистрации.</span></p>
    <p style="line-height:108%; font-size:14pt;"><span ></span></p>
    <p style="line-height:108%; font-size:14pt;"><strong><span >Ответы на часто задаваемые вопросы:</span></strong></p>
    <ol class="awlist1" style="margin:0pt; padding-left:0pt;">
        <li class="ListParagraph" style="margin-bottom:0pt; text-indent:-18pt; line-height:108%;  ; font-size:14pt;"><span style="width:6.34pt; font:7pt 'Times New Roman'; display:inline-block;"> </span><strong>Вопрос:</strong> Можно ли оплатить госпошлину онлайн?</li>
    </ol>
    <p class="ListParagraph" style="margin-bottom:0pt; line-height:108%; font-size:14pt;"><span >   </span><strong><span >Ответ:</span></strong><span >Да. Предоставьте распечатанный чек об оплате.</span></p>
    <p class="ListParagraph" style="margin-bottom:0pt; line-height:108%; font-size:14pt;"><span ></span></p>
    <ol start="2" class="awlist2" style="margin:0pt; padding-left:0pt;">
        <li class="ListParagraph" style="margin-bottom:0pt; text-indent:-18pt; line-height:108%;  ; font-size:14pt;"><span style="width:6.34pt; font:7pt 'Times New Roman'; display:inline-block;"> </span><strong>Вопрос:</strong> Зачем полная копия паспорта?</li>
    </ol>
    <p class="ListParagraph" style="margin-bottom:0pt; line-height:108%; font-size:14pt;"><strong><span >Ответ</span></strong><span >: Это требование миграционной службы. Мы просим студентов самостоятельно делать полную копию паспорта, это экономит нам время приёма и сокращает очереди.</span></p>
    <p class="ListParagraph" style="margin-bottom:0pt; line-height:108%; font-size:14pt;"><span ></span></p>
    <ol start="3" class="awlist3" style="margin:0pt; padding-left:0pt;">
        <li class="ListParagraph" style="margin-bottom:0pt; text-indent:-18pt; line-height:108%;  ; font-size:14pt;"><span style="width:6.34pt; font:7pt 'Times New Roman'; display:inline-block;"> </span><strong>Вопрос:</strong> На какой срок делать регистрацию, если я живу не в общежитии?</li>
    </ol>
    <p class="ListParagraph" style="margin-bottom:0pt; line-height:108%; font-size:14pt;"><strong><span >Ответ</span></strong><span >: Если Вы живёте на квартире, срок регистрации определяется по договоренности с хозяином жилья (максимально &ndash; на срок действия визы). Если регистрация в хостеле, то срок определяется индивидуально. Обратитесь в отдел МУВР с документами.</span></p>
    <p class="ListParagraph" style="margin-bottom:0pt; line-height:108%; font-size:14pt;"><span ></span></p>
    <ol start="4" class="awlist4" style="margin:0pt; padding-left:0pt;">
        <li class="ListParagraph" style="margin-bottom:0pt; text-indent:-18pt; line-height:108%;  ; font-size:14pt;"><span style="width:6.34pt; font:7pt 'Times New Roman'; display:inline-block;"> </span><strong>Вопрос:</strong> Можно ли подать на визу менее, чем за 20 рабочих дней?</li>
    </ol>
    <p class="ListParagraph" style="line-height:108%; font-size:14pt;"><strong><span >Ответ:</span></strong><span >Такие случаи решаются в индивидуальном порядке Управлением по вопросам миграции. Если у Вас есть уважительная причина (например, справки от врача о болезни), то документы могут принять.</span></p>
</body>

</html> ''';

const String examinationDaysHtmlText = '''<!DOCTYPE html>
<html lang="ru-RU">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <title>
    </title>
    <style>
            @font-face {
            font-family: 'Karla, sans-serif';
        }
        body {
            line-height: 108%;
            font-family: Karla;
            font-size: 11pt
        }

        p {
            margin: 0pt 0pt 8pt
        }

        li {
            margin-top: 0pt;
            margin-bottom: 8pt
        }

        .BalloonText {
            margin-bottom: 0pt;
            line-height: normal;
            font-family: 'Segoe UI';
            font-size: 9pt
        }

        .ListParagraph {
            margin-left: 36pt;
            margin-bottom: 8pt;
            line-height: 108%;
            font-size: 11pt
        }

        .NormalWeb {
            margin-top: 5pt;
            margin-bottom: 5pt;
            line-height: normal;
            font-family: 'Times New Roman';
            font-size: 12pt
        }

        .selectable-text {
            margin-top: 5pt;
            margin-bottom: 5pt;
            line-height: normal;
            font-family: 'Times New Roman';
            font-size: 12pt
        }

        span.a {
            font-family: 'Segoe UI';
            font-size: 9pt
        }

        .awlist1 {
            list-style: none;
            counter-reset: awlistcounter4_0
        }

        .awlist1>li:before {
            content: counter(awlistcounter4_0) ')';
            counter-increment: awlistcounter4_0
        }

        .awlist2 {
            list-style: none;
            counter-reset: awlistcounter4_0 1
        }

        .awlist2>li:before {
            content: counter(awlistcounter4_0) ')';
            counter-increment: awlistcounter4_0
        }

        .awlist3 {
            list-style: none;
            counter-reset: awlistcounter4_0 2
        }

        .awlist3>li:before {
            content: counter(awlistcounter4_0) ')';
            counter-increment: awlistcounter4_0
        }

        .awlist4 {
            list-style: none;
            counter-reset: awlistcounter4_0 3
        }

        .awlist4>li:before {
            content: counter(awlistcounter4_0) ')';
            counter-increment: awlistcounter4_0
        }

        .awlist5 {
            list-style: none;
            counter-reset: awlistcounter5_0
        }

        .awlist5>li:before {
            content: counter(awlistcounter5_0) ')';
            counter-increment: awlistcounter5_0
        }
    </style>
</head>

<body>
    <p style="line-height:108%; font-size:14pt;"><span style="font-family:'Karla';">Федеральный закон №115-ФЗ от 25.07.2022</span><em><span ></span></em></p>
    <p style="line-height:108%; font-size:14pt;"><strong><span >В течение 90 суток с даты въезда каждый иностранный гражданин обязан пройти медицинское освидетельствование и дактилоскопию.</span></strong><span >Для этого необходимо:</span></p>
    <p style="line-height:108%; font-size:14pt;"><span >- Сделать нотариальный перевод паспорта. Если Вы сделали перевод в своей стране, необходимо заверить его у любого нотариуса в России.</span></p>
    <p style="line-height:108%; font-size:14pt;"><span >- Сделать одно фото.</span></p>
    <p style="line-height:108%; font-size:14pt;"><span >- Пройти медицинское освидетельствование.</span></p>
    <p class="NormalWeb" style="margin-top:0pt; margin-bottom:0pt; text-indent:35.45pt; text-align:justify; font-size:14pt;">В Великом Новгороде:</p>
    <p class="NormalWeb" style="margin-top:0pt; margin-bottom:0pt; text-indent:35.45pt; text-align:left; font-size:14pt;">ГОБУЗ Центр &ldquo;Хелпер&rdquo;( ул. Посольская д. 2), Центр &ldquo;Катарсис&rdquo; (ул. Яковлева д. 18)</p>
    <p class="NormalWeb" style="margin-top:0pt; margin-bottom:0pt; text-indent:35.45pt; text-align:left; font-size:14pt;"></p>
    <p class="NormalWeb" style="margin-top:0pt; margin-bottom:0pt; text-indent:35.45pt; text-align:left; font-size:14pt;">- Пройти дактилоскопию</p>
    <p class="NormalWeb" style="margin-top:0pt; margin-bottom:0pt; text-indent:35.45pt; text-align:left; font-size:14pt;">Отдел по вопросам миграции УМВД РФ по городу Великий Новгород</p>
    <p class="NormalWeb" style="margin-top:0pt; margin-bottom:0pt; text-align:left; font-size:14pt;">Большая Московская ул., 116/2, кабинет 10.</p>
    <p class="NormalWeb" style="margin-top:0pt; margin-bottom:0pt; text-align:left; font-size:14pt;"></p>
    <p class="NormalWeb" style="margin-top:0pt; margin-bottom:0pt; text-indent:35.45pt; text-align:left; font-size:14pt;">Медицинское освидетельствование действительно один год. После этого нужно прийти его снова и показать справки в Отдел по вопросам миграции УМВД РФ по городу Великий Новгород (Большая Московская ул., 116/2, кабинет 10.)</p>
    <p class="NormalWeb" style="margin-top:0pt; margin-bottom:0pt; text-align:left; font-size:14pt;"></p>
    <p style="line-height:108%; font-size:14pt;"><span ></span></p>
    <p style="line-height:108%; font-size:14pt;"><strong><span >Ответы на часто задаваемые вопросы:</span></strong></p>
    <ol style="margin:0pt; padding-left:0pt;">
        <li class="ListParagraph" style=" margin-bottom:0pt; line-height:108%; padding-left:2.5pt;  ; font-size:14pt;"><strong>Вопрос</strong>: Надо ли мне проходить медицину, если мне нет 18 лет?</li>
    </ol>
    <p class="ListParagraph" style="margin-bottom:0pt; line-height:108%; font-size:14pt;"><strong><span >Ответ:</span></strong><span >Да. Студентам, не достигшим 18 лет, необходимо пройти только медицинское освидетельствование. Без него Вам не выдадут новую визу. После достижения 18 лет необходимо пройти дактилоскопию в течение 1 месяца!</span></p>
    <p class="ListParagraph" style="margin-bottom:0pt; line-height:108%; font-size:14pt;"><span ></span></p>
    <ol start="2" style="margin:0pt; padding-left:0pt;">
        <li class="ListParagraph" style=" margin-bottom:0pt; line-height:108%; padding-left:2.5pt;  ; font-size:14pt;"><strong>Вопрос</strong>: Можно ли продлить срок, если я не успел пройти дактилоскопию за 90 дней?</li>
    </ol>
    <p class="ListParagraph" style="margin-bottom:0pt; line-height:108%; font-size:14pt;"><strong><span >Ответ:</span></strong><span >Нет, срок не продлевается. Если Вы не успели, Ваша виза может быть аннулирована, Вам придется выехать из РФ. Рекомендуем начинать проходить медицину сразу после постановки на миграционный учёт.</span></p>
    <p class="ListParagraph" style="margin-bottom:0pt; line-height:108%; font-size:14pt;"><span ></span></p>
    <ol start="3" style="margin:0pt; padding-left:0pt;">
        <li class="ListParagraph" style=" margin-bottom:0pt; line-height:108%; padding-left:2.5pt;  ; font-size:14pt;"><strong>Вопрос</strong>: Можно ли пройти медицинское освидетельствование в другом городе России?</li>
    </ol>
    <p class="ListParagraph" style="margin-bottom:0pt; line-height:108%; font-size:14pt;"><strong><span >Ответ</span></strong><span >: Да, можно. Главное, чтобы Вы получили сертификаты установленного образца.</span></p>
    <p class="ListParagraph" style="margin-bottom:0pt; line-height:108%; font-size:14pt;"><span ></span></p>
    <ol start="4" style="margin:0pt; padding-left:0pt;">
        <li class="ListParagraph" style=" margin-bottom:0pt; line-height:108%; padding-left:2.5pt;  ; font-size:14pt;"><strong>Вопрос</strong>: У меня есть медкнижка, надо ли мне делать медицинское освидетельствование?</li>
    </ol>
    <p class="ListParagraph" style="margin-bottom:0pt; line-height:108%; font-size:14pt;"><strong><span >Ответ:</span></strong><span >Вы должны получить сертификаты установленного образца. Для этого предоставьте Вашу медицинскую книжку или справки в центр &laquo;Хелпер&raquo;. В некоторых случаях данные могут быть перенесены в сертификаты и Вам не придется заново проходить врачей.</span></p>
    <p class="ListParagraph" style="margin-bottom:0pt; line-height:108%; font-size:14pt;"><span ></span></p>
    <ol start="5" style="margin:0pt; padding-left:0pt;">
        <li class="ListParagraph" style=" margin-bottom:0pt; line-height:108%; padding-left:2.5pt;  ; font-size:14pt;"><strong>Вопрос:</strong> Если я поеду домой на каникулы, мне надо будет заново проходить медицину?</li>
    </ol>
    <p class="ListParagraph" style="line-height:108%; font-size:14pt;"><strong><span >Ответ</span></strong><span >: Медицину нужно проходить раз в год независимо от того, пересекали ли Вы границу.</span></p>
</body>

</html>''';
const String registrationHtmlText = '''<!DOCTYPE html>
<html lang="ru-RU">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <title>
    </title>
    <style>
            @font-face {
            font-family: 'Karla, sans-serif';
        }
        body {
            line-height: 108%;
            font-family: Calibri;
            font-size: 11pt
        }

        p {
            margin: 0pt 0pt 8pt
        }

        li {
            margin-top: 0pt;
            margin-bottom: 8pt
        }

        .BalloonText {
            margin-bottom: 0pt;
            line-height: normal;
            font-family: 'Segoe UI';
            font-size: 9pt
        }

        .ListParagraph {
            margin-left: 36pt;
            margin-bottom: 8pt;
            line-height: 108%;
            font-size: 11pt
        }

        .NormalWeb {
            margin-top: 5pt;
            margin-bottom: 5pt;
            line-height: normal;
            font-family: 'Times New Roman';
            font-size: 12pt
        }

        .selectable-text {
            margin-top: 5pt;
            margin-bottom: 5pt;
            line-height: normal;
            font-family: 'Times New Roman';
            font-size: 12pt
        }

        span.a {
            font-family: 'Segoe UI';
            font-size: 9pt
        }

        .awlist1 {
            list-style: none;
            counter-reset: awlistcounter4_0
        }

        .awlist1>li:before {
            content: counter(awlistcounter4_0) ')';
            counter-increment: awlistcounter4_0
        }

        .awlist2 {
            list-style: none;
            counter-reset: awlistcounter4_0 1
        }

        .awlist2>li:before {
            content: counter(awlistcounter4_0) ')';
            counter-increment: awlistcounter4_0
        }

        .awlist3 {
            list-style: none;
            counter-reset: awlistcounter4_0 2
        }

        .awlist3>li:before {
            content: counter(awlistcounter4_0) ')';
            counter-increment: awlistcounter4_0
        }

        .awlist4 {
            list-style: none;
            counter-reset: awlistcounter4_0 3
        }

        .awlist4>li:before {
            content: counter(awlistcounter4_0) ')';
            counter-increment: awlistcounter4_0
        }

        .awlist5 {
            list-style: none;
            counter-reset: awlistcounter5_0
        }

        .awlist5>li:before {
            content: counter(awlistcounter5_0) ')';
            counter-increment: awlistcounter5_0
        }
    </style>
</head>

<body>
    <p><strong><span >Для визовых стран</span></strong></p>
    <p style="line-height:108%; font-size:14pt;"><span >В течение </span><strong><em><u><span >7 рабочих дней</span></u></em></strong><span >необходимо встать на миграционный учёт (сделать регистрацию по месту жительства).</span></p>
    <p style="line-height:108%; font-size:14pt;"><span >Для этого студентам, живущим в общежитиях, необходимо</span><em><u><span >обратиться в отдел МУВР с паспортом, миграционной картой, направлением из отдела общежитий</span></u></em><span >. Пожалуйста, приходите как можно раньше, не в последний день! Мы не делаем регистрации сами, мы носим Ваши документы в миграционную службу.</span></p>
    <p style="line-height:108%; font-size:14pt;"><span >Регистрация делается на срок визы. После получения новой визы, регистрация и миграционная карта продлеваются на срок новой визы (для этого у Вас заберут миграционную карту, Вы получите её вместе с новой регистрацией).</span></p>
    <p class="selectable-text" style="margin-top:14pt; margin-bottom:14pt; font-size:14pt;"><span class="selectable-text1">Если Вы живёте на квартире, после пересечения границы обратитесь в МФЦ с хозяином квартиры. Для продления регистрации Вам нужно обратиться в отдел МУВР, чтобы получить необходимые документы &ndash; ходатайство и заверенный договор / справку об обучении на бюджете. Затем с хозяином жилья Вы обращаетесь в Отдел по вопросам миграции УМВД РФ по городу Великий Новгород</span> <span class="selectable-text1">(ул. Большая Московская ул., 116/2, кабинет 7.)</span> Полученную регистрацию предоставьте в отдел МУВР.</p>
    <p style="line-height:108%; font-size:14pt;"><span ></span></p>
    <p style="line-height:108%; font-size:14pt;"><strong><span >Для безвизовых стран</span></strong></p>
    <p style="line-height:108%; font-size:14pt;"><span >После пересечения границы Вам необходимо</span><em><u><span >встать на регистрацию в следующие сроки:</span></u></em></p>
    <p style="line-height:108%; font-size:14pt;"><span >Беларусь, Киргизия, Казахстан, Армения &ndash; 30 календарных дней;</span></p>
    <p style="line-height:108%; font-size:14pt;"><span >Таджикистан, Узбекистан &ndash; 15 календарных дней;</span></p>
    <p style="line-height:108%; font-size:14pt;"><span >Азербайджан, Молдова, Украина, Грузия &ndash; 7 рабочих дней.</span></p>
    <p style="line-height:108%; font-size:14pt;"><span >Для этого студентам, живущим в общежитиях, необходимо</span><em><u><span >обратиться в отдел МУВР с паспортом, миграционной картой, направлением из отдела общежитий.</span></u></em><span >Пожалуйста, приходите как можно раньше, не в последний день! Мы не делаем регистрации сами, мы носим Ваши документы в миграционную службу.</span></p>
    <p style="line-height:108%; font-size:14pt;"><span >После пересечения границы регистрация делается на 90 суток с даты въезда.</span><strong><em><span >Чтобы продлить её, необходимо:</span></em></strong></p>
    <ol class="awlist5" style="margin:0pt; padding-left:0pt;">
        <li class="ListParagraph" style="margin-bottom:0pt; text-indent:-18pt; line-height:108%;  ; font-size:14pt;"><span style="width:6.34pt; font:7pt 'Times New Roman'; display:inline-block;"> </span>Пройти медицинское освидетельствование и дактилоскопию (если она у Вас уже есть, проходить заново после каждого пересечения границы не нужно. Подробнее читайте в разделе: &hellip;) Без дактилоскопии Ваша регистрация не будет продлена.</li>
        <li class="ListParagraph" style="margin-bottom:0pt; text-indent:-18pt; line-height:108%;  ; font-size:14pt;   "><span style="width:6.34pt; font:7pt 'Times New Roman'; display:inline-block;"> </span><span style="font-style:normal;">Принести полную копию паспорта (копия ВСЕХ страниц, даже пустых) и миграционную карту не позднее окончания срока регистрации. Лучше всего прийти за 2 недели до окончания срока.</span></li>
    </ol>
    <p class="ListParagraph" style="margin-bottom:0pt; line-height:108%; font-size:14pt;"><span >Мы просим студентов самостоятельно делать полную копию паспорта, это экономит нам время приёма и сокращает очереди.</span></p>
    <p class="ListParagraph" style="line-height:108%; font-size:14pt;"><em><span ></span></em></p>
    <p class="selectable-text" style="margin-top:14pt; margin-bottom:14pt; font-size:14pt;"><span class="selectable-text1">Если Вы живёте на квартире, после пересечения границы обратитесь в МФЦ с хозяином квартиры. Для продления регистрации Вам нужно обратиться в отдел МУВР, чтобы получить необходимые документы &ndash; ходатайство и заверенный договор / справку об обучении на бюджете. Затем с хозяином жилья Вы обращаетесь в Отдел по вопросам миграции УМВД РФ по городу Великий Новгород</span> <span class="selectable-text1">(ул. Большая Московская ул., 116/2, кабинет 7.)</span> Полученную регистрацию предоставьте в отдел МУВР.</p>
    <p style="line-height:108%; font-size:14pt;"><span ></span></p>
    <p style="line-height:108%; font-size:14pt;"><strong><span >Ответы на часто задаваемые вопросы:</span></strong></p>
    <ol style="margin:0pt; padding-left:0pt;">
        <li class="ListParagraph" style=" margin-bottom:0pt; line-height:108%; padding-left:2.5pt;  ; font-size:14pt;"><strong>Вопрос</strong>: Как мне продлить регистрацию, если я живу загородом (не в пределах Великого Новгорода)?</li>
    </ol>
    <p class="ListParagraph" style="margin-bottom:0pt; line-height:108%; font-size:14pt;"><strong><span >Ответ</span></strong><span >: В этом случае Вы продлеваете регистрацию с хозяином жилья самостоятельно, мы не выдаем ходатайство.</span></p>
    <p class="ListParagraph" style="margin-bottom:0pt; line-height:108%; font-size:14pt;"><span ></span></p>
    <ol start="2" style="margin:0pt; padding-left:0pt;">
        <li class="ListParagraph" style=" margin-bottom:0pt; line-height:108%; padding-left:2.5pt;  ; font-size:14pt;"><strong>Вопрос:</strong> Что делать, если я пропущу срок постановки на регистрацию?</li>
    </ol>
    <p class="ListParagraph" style="margin-bottom:0pt; line-height:108%; font-size:14pt;"><strong><span >Ответ:</span></strong><span >В этом случае у Вас будет штраф. Чтобы этого избежать, можно сделать регистрацию на один день в хостеле или гостинице, и затем обратиться в отдел МУВР для смены адреса.</span></p>
</body>

</html> ''';
