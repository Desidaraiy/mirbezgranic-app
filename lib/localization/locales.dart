import 'package:flutter_localization/flutter_localization.dart';

const List<MapLocale> LOCALES = [
  MapLocale("en", LocaleData.en),
  MapLocale("ru", LocaleData.ru)
];

mixin LocaleData {
  static const String startTitle = 'start_title';
  static const String chooseLang = 'choose_lang';
  static const String authorization = 'authorization';
  static const String close = 'close';
  static const String enter_phone = 'enter_phone';
  static const String for_register = 'for_register';
  static const String continuee = 'continue';
  static const String enter_sms_code = 'sms_code';
  static const String we_sent_to_number = 'we_send';
  static const String error_code = 'error_code';
  static const String personal_data = 'personal_data';
  static const String surname = 'surname';
  static const String last_name = 'last_name';
  static const String name = 'name';
  static const String paternical = 'paternical';
  static const String date_of_birth = 'date_of_birth';
  static const String e_mail = 'e_mail';
  static const String your_country = 'your_country';
  static const String floor = 'floor';
  static const String male = 'male';
  static const String female = 'female';
  static const String education = 'education';
  static const String year_of_admission = 'year_of_admission';
  static const String course_of_study = 'course_of_study';
  static const String study_division = 'training_division';
  static const String direction = 'direction';
  static const String institutes = 'institute';
  static const String contact_person = 'contact_person';
  static const String phone_number = 'phone_number';
  static const String who_contact_person = 'who_contact_person';
  static const String documentation = 'documentation';
  static const String date_of_entry = 'date_of_entry';
  static const String passport_expiration = 'passport_expiration';
  static const String visa_expired_date = 'visa_expired';
  static const String agree_terms_yandex = 'terms_yandex';
  static const String agree_terms_yandex2 = 'terms_yandex2';
  static const String agree_personal_data = 'agree_personal';
  static const String agree_personal_data2 = 'agree_personal2';
  static const String register = 'register';
  static const String fill_all = 'fill_all';
  static const String proof_agree_yamaps = 'proof_agree_yamaps';
  static const String proof_agree_personal_data = 'proof_agree_personal_data';
  static const String error_phone = 'error_phone';
  static const String invalid_phone = 'invalid_phone';
  static const String alarm_btn = 'alarm_btn';
  static const String adaptation_course = 'adaptation_course';
  static const String language = 'language';
  static const String russian_language = "russian_language";
  static const String english_language = "english_language";
  static const String french_language = "french_language";

  static const String acclimatisation_course_head =
      'acclimatisation_course_head';
  static const String acclimatisation_course_desc =
      'acclimatisation_course_desc';
  static const String acclimatisation_course_desc_button =
      'acclimatisation_course_desc_button';
  static const String acclimatisation_course_desc_post =
      'acclimatisation_course_desc_post';

  static const String more_button = 'more_button';

  static const String days_left_until_passport_expiry =
      'days_left_until_passport_expiry';
  static const String days_left_until_visa_expiry =
      'days_left_until_visa_expiry';
  static const String days_left_to_get_fingerprinted =
      'days_left_to_get_fingerprinted';
  static const String registration_and_renewal_of_registration =
      'registration_and_renewal_of_registration';

  static const String important_information = 'important_information';

  static const String interesting_events = 'interesting_events';
  static const String interesting_events_desc = 'interesting_events_desc';
  static const String interesting_events_desc2 = 'interesting_events_desc2';

  static const String yandex_afisha = 'yandex_afisha';
  static const String yandex_afisha_desc = 'yandex_afisha_desc';
  static const String yandex_afisha_button = 'yandex_afisha_button';

  static const String philarmonic_hall = 'philarmonic_hall';
  static const String philarmonic_hall_desc = 'philarmonic_hall_desc';
  static const String philarmonic_hall_button = 'philarmonic_hall_button';

  static const String cecos = 'cecos';
  static const String cecos_desc = 'cecos_desc';
  static const String cecos_button = 'cecos_button';

  static const String student_council_groups = 'student_council_groups';
  static const String student_council_groups_desc =
      'student_council_groups_desc';

  static const String mirage_cinema = 'mirage_cinema';
  static const String mirage_cinema_desc = 'mirage_cinema_desc';
  static const String mirage_cinema_button = 'mirage_cinema_button';

  static const String cinema_russia = 'cinema_russia';
  static const String cinema_russia_desc = 'cinema_russia_desc';
  static const String cinema_russia_button = 'cinema_russia_button';

  static const String documents = 'documents';
  static const String documents_desc = 'documents_desc';

  static const String dmrvr_desc = 'dmrvr_desc';
  static const String dmrvr_address = 'dmrvr_address';
  static const String dmrvr_hours = 'dmrvr_hours';

  static const String registration_certificate = 'registration_certificate';
  static const String registration_certificate_desc =
      'registration_certificate_desc';
  static const String registration_certificate_desc2 =
      'registration_certificate_desc2';
  static const String registration_certificate_desc3 =
      'registration_certificate_desc3';
  static const String registration_certificate_button =
      'registration_certificate_button';

  static const String registration_certificate_modal_title =
      'registration_certificate_modal_title';
  static const String registration_certificate_modal_desc =
      'registration_certificate_modal_desc';
  static const String registration_certificate_modal_desc2 =
      'registration_certificate_modal_desc2';

  static const String trpe_certificate = 'trpe_certificate';
  static const String trpe_certificate_desc = 'trpe_certificate_desc';
  static const String trpe_certificate_desc2 = 'trpe_certificate_desc2';
  static const String trpe_certificate_button = 'trpe_certificate_button';

  static const String trpe_certificate_modal_title =
      'trpe_certificate_modal_title';
  static const String trpe_certificate_modal_desc_three =
      'trpe_certificate_modal_desc';
  static const String trpe_certificate_modal_desc_seven =
      'trpe_certificate_modal_desc2';

  static const String drws_department = 'drws_department';
  static const String drws_department_address = 'drws_department_address';
  static const String drws_department_hours = 'drws_department_hours';

  static const String study_certificate = 'study_certificate';
  static const String study_certificate_desc = 'study_certificate_desc';
  static const String study_certificate_desc2 = 'study_certificate_desc2';
  static const String study_certificate_button = 'study_certificate_button';

  static const String study_certificate_modal_desc =
      'study_certificate_modal_desc';

  static const String academic_certificate = 'academic_certificate';
  static const String academic_certificate_desc = 'academic_certificate_desc';
  static const String academic_certificate_desc2 = 'academic_certificate_desc2';

  static const String academic_certificate_modal_desc =
      'academic_certificate_modal_desc';

  static const String certificate_form_citizenship =
      'certificate_form_citizenship';
  static const String certificate_form_passport_number =
      'certificate_form_passport_number';
  static const String certificate_form_birthday = 'certificate_form_birthday';
  static const String certificate_form_name_visa_ru =
      'certificate_form_name_visa_ru';
  static const String certificate_form_name_visa_eng =
      'certificate_form_name_visa_eng';
  static const String certificate_form_study_year =
      'certificate_form_study_year';
  static const String certificate_form_study_speciality =
      'certificate_form_study_speciality';
  static const String certificate_form_email = 'certificate_form_email';
  static const String certificate_form_language = 'certificate_form_language';
  static const String certificate_form_group_number =
      'certificate_form_group_number';
  static const String certificate_form_school_year =
      'certificate_form_school_year';

  static const String adaptation_course_5module_test_title =
      'adaptation_course_5module_test_title';

  static const String adaptation_course_course_button =
      'adaptation_course_course_button';
  static const String adaptation_course_test_button =
      'adaptation_course_test_button';
  static const String adaptation_course_test_button2 =
      'adaptation_course_test_button2';
  static const String adaptation_course_video_button =
      'adaptation_course_video_button';

  static const String adaptation_course_1module_title =
      'adaptation_course_1module_title';
  static const String adaptation_course_2module_title =
      'adaptation_course_2module_title';
  static const String adaptation_course_3module_title =
      'adaptation_course_3module_title';
  static const String adaptation_course_4module_title =
      'adaptation_course_4module_title';
  static const String adaptation_course_5module_title =
      'adaptation_course_5module_title';

  static const String adaptation_course_5module_lesson51_title =
      'adaptation_course_5module_lesson51_title';

  static const String adaptation_course_5module_lesson51_video_title =
      'adaptation_course_5module_lesson51_video_title';

  static const String test_passed_title = "test_passed_title";
  static const String test_not_passed_title = "test_not_passed_title";

  static const String test_passed_desc = "test_passed_desc";
  static const String test_not_passed_desc = "test_not_passed_desc";

  static const String notifications_not_found = "notifications_not_found";

  static const Map<String, dynamic> en = {
    startTitle: 'Welcome to the World Without Borders',
    chooseLang: 'Choose your language',
    authorization: 'Authorization',
    close: 'Close',
    enter_phone: 'Enter \nphone number',
    for_register: 'To login or \nregister',
    continuee: 'CONTINUE',
    enter_sms_code: 'Enter \nsms code',
    we_sent_to_number: 'We sent an SMS code \nto number %a',
    error_code: 'Incorrect code',
    personal_data: 'PERSONAL DATA',
    surname: 'SURNAME',
    last_name: 'NAME',
    name: 'Name',
    paternical: 'PATERNICAL (IF AVAILABLE)',
    date_of_birth: 'DATE OF BIRTH',
    e_mail: 'E-MAIL',
    your_country: 'YOUR COUNTRY',
    floor: 'FLOOR',
    male: 'Man',
    female: 'Woman',
    education: 'EDUCATION',
    year_of_admission: 'YEAR OF ADMISSION TO THE UNIVERSITY',
    course_of_study: 'COURSE OF STUDY',
    study_division: 'STUDY DIVISION',
    direction: 'DIRECTION',
    institutes: 'INSTITUTES',
    contact_person: 'THE CONTACT PERSON',
    phone_number: 'PHONE NUMBER',
    who_contact_person: 'WHO IS YOUR CONTACT PERSON',
    documentation: 'DOCUMENTATION',
    date_of_entry: 'Date of entry into the territory of the RF',
    visa_expired_date: 'Visa expiration date',
    passport_expiration: 'Passport expiration date',
    agree_terms_yandex: 'I agree to the ',
    agree_terms_yandex2: 'terms of use of Yandex.Maps',
    agree_personal_data: 'I give voluntary consent to the  ',
    agree_personal_data2: ' processing of personal data',
    register: 'REGISTER',
    fill_all: 'Fill all necessary fields',
    proof_agree_yamaps:
        'Please confirm that you agree with the terms of use of Yandex.Maps',
    proof_agree_personal_data:
        'Please confirm your consent to the processing of personal data.',
    error_phone: 'Enter your phone number',
    invalid_phone:
        'Invalid phone number format. The phone number must start with +',
    language: 'LANGUAGE',
    adaptation_course: "Adaptation course",
    adaptation_course_5module_test_title:
        "Test for the migration record module",
    acclimatisation_course_head: "Adaptation course",
    acclimatisation_course_desc:
        "Learn about the rules of behaviour, ethics and characteristics of the country in which you will be studying",
    acclimatisation_course_desc_button: "To the course",
    acclimatisation_course_desc_post:
        "* To get full access to the application, you need to complete the course",
    more_button: "learn more",
    days_left_until_passport_expiry: "Days left until \npassport expiry",
    days_left_until_visa_expiry: "Days left until \nvisa expiry",
    days_left_to_get_fingerprinted: "Days left to get \nfingerprinted",
    registration_and_renewal_of_registration:
        "Registration and \nrenewal of registration",
    important_information: "important information",
    interesting_events: "Interesting events",
    interesting_events_desc:
        "A selection of activities that will not let you get bored",
    interesting_events_desc2:
        "Yandex.Afisha, Philharmonic Hall, NovSU Event and Creative Support Center, student councils, cinema",
    yandex_afisha: "YANDEX.AFISHA",
    yandex_afisha_desc:
        "Yandex Afisha is a Russian-language service that sells tickets for entertainment events: theaters, concerts, movies, musicals, shows, and other Yandex events.",
    yandex_afisha_button: "EVENTS POSTER",
    philarmonic_hall: "PHILHARMONIC HALL",
    philarmonic_hall_desc:
        "You can attend concerts, festivals, performances, master classes, special events and celebrations at the Philharmonic Hall.",
    philarmonic_hall_button: "PHILHARMONIC HALL POSTER",
    cecos: "CECOS",
    cecos_desc: "The Center of Event and Creativity Organization and Support",
    cecos_button: "LEARN MORE about the CECOS",
    student_council_groups: "STUDENT COUNCIL GROUPS",
    student_council_groups_desc:
        "An enormous number of various events that NovSU students conduct",
    mirage_cinema: "MIRAGE CINEMA",
    mirage_cinema_desc:
        "Mirage Cinema is a modern cinema with its own pizzeria and sushi bar. You will find a large selection of popcorn for every taste and cozy halls.",
    mirage_cinema_button: "MOVIES POSTER",
    cinema_russia: "CINEMA “RUSSIA”",
    cinema_russia_desc:
        "Watch a movie on the largest hovering «silver» screen in the region.",
    cinema_russia_button: "MOVIES POSTER",
    documents: "DOCUMENTS",
    documents_desc:
        "Send a request for important documents such as the certificate of study, academic certificate, certificate for TRPE, and certificate of registration ",
    dmrvr_desc:
        "DMRVR - DEPARTMENT OF MIGRATION RECORDS, VISAS AND REGISTRATIONS",
    dmrvr_address: "41 Bolshaya St. Peterburgskaya St., office 2202",
    dmrvr_hours: "Mon-Fri",
    registration_certificate: "certificate of registration ",
    registration_certificate_desc:
        "A document certifying the registration of a foreign citizen at the place of residence. ",
    registration_certificate_desc2:
        "In order to file, you must come in person to the department with the following documents: your passport, migration card, previous registration (if there is one), and a referral from the department of dormitories.",
    registration_certificate_desc3:
        "The completed registration will be sent to your email address immediately after we receive it from the migration service. The estimated period is 7 days.",
    registration_certificate_button: "NOTIFY ABOUT THE NECESSITY",
    trpe_certificate: "CERTIFICATE FOR TRPE",
    trpe_certificate_desc:
        "Temporary residence permit for educational purposes.",
    trpe_certificate_desc2:
        "A document confirming that the student is studying at the university on a budget. After the request, the certificate will be ready within 3 business days. You can only pick it up in person at our department. ",
    trpe_certificate_button: "FILE A REQUEST",
    drws_department:
        "DRWIS - Department of recruitment and work with international students",
    study_certificate: "CERTIFICATE OF STUDY",
    study_certificate_desc:
        "A document confirming that the student is actually currently studying at Yaroslav the Wise Novgorod State University.",
    study_certificate_desc2:
        "The certificate will be ready within 3 business days ",
    study_certificate_button: "УВЕДОМИТЬ О НЕОБХОДИМОСТИ",
    academic_certificate: "The Academic Certificate",
    academic_certificate_desc:
        "A document in Russian that lists subjects and grades, as well as a certificate of the academic performance.",
    academic_certificate_desc2:
        "The certificate will be ready within 7 business days.",
    registration_certificate_modal_title: "A NOTIFICATION HAS BEEN SENT",
    registration_certificate_modal_desc:
        "A NOTIFICATION WAS SENT TO THE DEPARTMENT'S E-MAIL ABOUT THE NEED TO OBTAIN A CERTIFICATE OF REGISTRATION. \n \n",
    registration_certificate_modal_desc2:
        "PLEASE SUBMIT THE NECESSARY DOCUMENTS TO THE MIGRATION RECORDS DEPARTMENT \n",
    trpe_certificate_modal_title: "THE CERTIFICATE IS BEING PREPARED",
    trpe_certificate_modal_desc_three:
        "WE WILL BE WAITING FOR YOU AT THE MIGRATION RECORDS, VISA AND REGISTRATION DEPARTMENT IN 3 BUSINESS DAYS.",
    trpe_certificate_modal_desc_seven:
        "WE WILL BE WAITING FOR YOU AT THE MIGRATION RECORDS, VISA AND REGISTRATION DEPARTMENT IN 7 BUSINESS DAYS.",
    study_certificate_modal_desc:
        "TO REQUEST A CERTIFICATE OF STUDY, YOU MUST PROVIDE THE FOLLOWING INFORMATION: \n",
    academic_certificate_modal_desc:
        "TO REQUEST AN ACADEMIC CERTIFICATE, YOU MUST PROVIDE THE FOLLOWING INFORMATION:\n",
    certificate_form_citizenship: "CITIZENSHIP",
    certificate_form_passport_number: "PASSPORT NUMBER",
    certificate_form_birthday: "DATE OF BIRTH",
    certificate_form_name_visa_ru:
        "FULL NAME IN RUSSIAN (AS WRITTEN IN THE VISA)",
    certificate_form_name_visa_eng:
        "FULL NAME IN ENGLISH (AS WRITTEN IN THE VISA)",
    certificate_form_study_year: "YEAR OF STUDY",
    certificate_form_study_speciality: "SPECIALTY",
    certificate_form_email: "E-MAIL (TO RECEIVE THE CERTIFICATE)",
    certificate_form_language: "IN WHICH LANGUAGE IS THE CERTIFICATE REQUIRED",
    certificate_form_group_number: "GROUP NUMBER",
    certificate_form_school_year:
        "THE YEAR OF GRADUATING HIGH SCHOOL IN YOUR HOME COUNTRY",
    russian_language: "Russian",
    english_language: "English",
    french_language: "French",
    adaptation_course_course_button: "TO THE TRAINING",
    adaptation_course_test_button: "TEST",
    adaptation_course_test_button2: "COMPLETED",
    adaptation_course_video_button: "WATCH THE VIDEO",
    adaptation_course_1module_title:
        "MODULE 1: GETTING TO KNOW THE UNIVERISTY AND REGION",
    adaptation_course_2module_title:
        "MODULE 2: THE ADAPTATION TO THE STUDIES ENVIRONMENT",
    adaptation_course_3module_title: "MODULE 3: CULTURE AND VALUES",
    adaptation_course_4module_title: "MODULE 4: SOCIAL INTEGRATION ",
    adaptation_course_5module_title: "MODULE 5: MIGRATION RECORDS ",
    adaptation_course_5module_lesson51_title: "5.1. DEADLINES AND DOCUMENTS",
    adaptation_course_5module_lesson51_video_title:
        "GETTING TO KNOW THE CAMPUS",
    test_passed_title: "CONGRATULATIONS ",
    test_not_passed_title: "TAKE THE TEST AGAIN ",
    test_passed_desc: "YOU HAVE SUCCESSFULLY COMPLETED THE MODULE",
    test_not_passed_desc: "YOU DIDN'T GET THE REQUIRED NUMBER OF POINTS",
    notifications_not_found: "No notifications",
  };

  static const Map<String, dynamic> ru = {
    startTitle: 'Добро пожаловать в мир без границ',
    chooseLang: 'Выберите ваш язык',
    authorization: 'Авторизация',
    close: 'Закрыть',
    enter_phone: 'Введите \nномер телефона',
    for_register: 'Чтобы войти или \nзарегистрироваться',
    continuee: 'ПРОДОЛЖИТЬ',
    enter_sms_code: 'Введите \nсмс код',
    we_sent_to_number: 'Мы отправили смс код \nна номер %a',
    error_code: 'Неверный код',
    personal_data: 'ЛИЧНЫЕ ДАННЫЕ',
    surname: 'ФАМИЛИЯ',
    last_name: 'ИМЯ',
    name: 'Название',
    paternical: 'ОТЧЕСТВО (ПРИ НАЛИЧИИ)',
    date_of_birth: 'ДАТА РОЖДЕНИЯ',
    e_mail: 'E-MAIL',
    your_country: 'ВАША СТРАНА',
    floor: 'ПОЛ',
    male: 'Мужской',
    female: 'Женский',
    education: 'ОБРАЗОВАНИЕ',
    year_of_admission: 'ГОД ПОСТУПЛЕНИЯ В УНИВЕРСИТЕТ',
    course_of_study: 'КУРС ОБУЧЕНИЯ',
    study_division: 'УЧЕБНОЕ ПОДРАЗДЕЛЕНИЕ',
    direction: 'НАПРАВЛЕНИЕ',
    institutes: 'ИНСТИТУТЫ',
    contact_person: 'КОНТАКТНОЕ ЛИЦО',
    phone_number: 'НОМЕР ТЕЛЕФОНА',
    who_contact_person: 'КЕМ ВАМ ЯВЛЯЕТСЯ КОНТАКТНОЕ ЛИЦО',
    documentation: 'ДОКУМЕНТЫ',
    date_of_entry: 'Дата въезда на территорию РФ',
    visa_expired_date: 'Дата окончания визы',
    passport_expiration: 'Дата окончания действия паспорта',
    agree_terms_yandex: 'Соглашаюсь с',
    agree_terms_yandex2: 'условиями использования Яндекс.Карт',
    agree_personal_data: 'Даю добровольное согласие на  ',
    agree_personal_data2: ' обработку персональных данных',
    register: 'ЗАРЕГЕСТИРОВАТЬСЯ',
    fill_all: 'Заполните все необходимые поля',
    proof_agree_yamaps:
        'Пожалуйста, подтвердите согласие с условиями использования Яндекс.Карт',
    proof_agree_personal_data:
        'Пожалуйста, подтвердите свое согласие на обработку персональных данных',
    error_phone: 'Введите номер телефона!',
    invalid_phone:
        'Неверный формат номера телефона. Номер телефона должен начинаться с +',
    language: 'ЯЗЫК',
    adaptation_course: "АДАПТАЦИОННЫЙ КУРС",
    adaptation_course_5module_test_title: "ТЕСТ К МОДУЛЮ «МИГРАЦИОННЫЙ УЧЕТ»",
    acclimatisation_course_head: "Курс по адаптации студента",
    acclimatisation_course_desc:
        "узнайте о правилах поведения, этике и особенностях страны, в которой вам предстоит обучаться",
    acclimatisation_course_desc_button: "К курсу",
    acclimatisation_course_desc_post:
        "* изучение курса необходимо для получения полного доступа к функционалу приложения",
    more_button: "ПОДРОБНЕЕ",
    days_left_until_passport_expiry: "Дней до окончания \nдействия паспорта",
    days_left_until_visa_expiry: "Дней до окончания \nсрока визы",
    days_left_to_get_fingerprinted: "Дней до прохождения \nобследования",
    registration_and_renewal_of_registration:
        "Постановка на регистрацию \nи продление регистрации",
    important_information: "очень важная информация",
    interesting_events: "ИНТЕРЕСНЫЕ СОБЫТИЯ",
    interesting_events_desc:
        "Подборка мероприятий, которые не дадут вам заскучать.",
    interesting_events_desc2:
        "Яндекс.Афиша, филармония, центр организации и сопровождения событий и творчества НовГу, студсоветы, кино.",
    yandex_afisha: "ЯНДЕКС АФИША",
    yandex_afisha_desc:
        "русскоязычный сервис по продаже билетов на развлекательные мероприятия: театры, концерты, кино, мюзиклы, шоу и другие события компании Яндекс",
    yandex_afisha_button: "АФИША СОБЫТИЙ",
    philarmonic_hall: "ФИЛАРМОНИЯ",
    philarmonic_hall_desc:
        "Вы всегда можете посетить концерты, фестивали, спектакли, мастер-классы, торжественные мероприятия и праздники в филармонии",
    philarmonic_hall_button: "АФИША ФИЛАРМОНИИ",
    cecos: "ЦОССТ НОВГУ",
    cecos_desc: "Центр организации и сопровождения событий и творчества",
    cecos_button: "ПОДРОБНЕЕ О ЦОССТ",
    student_council_groups: "ГРУППЫ СТУДСОВЕТОВ",
    student_council_groups_desc:
        "Огромное количество разнообразных мероприятий, которые проводят студенты НовГУ",
    mirage_cinema: "МИРАЖ СИНЕМА",
    mirage_cinema_desc:
        "это современный кинотеатр со своей пиццерией и суши-баром. Вас ждет большой выбор попкорна на любой вкус и уютные залы.",
    mirage_cinema_button: "АФИША КИНО",
    cinema_russia: "КИНОТЕАТР РОССИЯ",
    cinema_russia_desc:
        "Посмотри кино на самом большом, в регионе, парящем «серебрянном» экраном",
    cinema_russia_button: "АФИША КИНО",
    documents: "ДОКУМЕНТЫ",
    documents_desc:
        "Подайте заявку на получение важных документов – справка об обучении, академическая справка, справка для РВПО, справка о регистрации. ",
    dmrvr_desc: "ОМУВР – ОТДЕЛ МИГРАЦИОННОГО УЧЕТА, ВИЗ И РЕГИСТРАЦИЙ",
    dmrvr_address: "ул. Большая Санкт-Петербургская 41, кабинет 2202",
    dmrvr_hours: "ПН-ПТ",
    registration_certificate: "СПРАВКА О РЕГИСТРАЦИИ ",
    registration_certificate_desc:
        "Документ, свидетельствующий о постановке иностранного гражданина по месту жительства. ",
    registration_certificate_desc2:
        "Для оформления необходимо подойти лично в отдел со следующими документами: паспорт, миграционная карта, предыдущая регистрация (если есть), направление из отдела общежитий. ",
    registration_certificate_desc3:
        "Готовая регистрация будет отправлена вам на электронную почту сразу после получения её нами из миграционной службы. Ориентировочный срок – 7 дней. ",
    registration_certificate_button: "УВЕДОМИТЬ О НЕОБХОДИМОСТИ ",
    trpe_certificate: "СПРАВКА ДЛЯ РВПО ",
    trpe_certificate_desc:
        "Разрешение на временное проживание в целях получения образования.",
    trpe_certificate_desc2:
        "Документ о том, что студент обучается в университете на бюджете. После запроса справка будет готова в течение 3 рабочих дней. Забрать её можно только лично в нашем отделе. ",
    trpe_certificate_button: "ЗАКАЗАТЬ СПРАВКУ",
    drws_department: "ОТДЕЛ РЕКРУТИНГА И РАБОТЫ С ИНОСТРАННЫМИ СТУДЕНТАМИ ",
    study_certificate: "СПРАВКА ОБ ОБУЧЕНИИ ",
    study_certificate_desc:
        "Документ подтверждающий, что студент действительно на данный момент обучается в Новгородском государственном университете имени Ярослава Мудрого. ",
    study_certificate_desc2: "Справка будет готова в течение 3 рабочих дней. ",
    study_certificate_button: "УВЕДОМИТЬ О НЕОБХОДИМОСТИ",
    academic_certificate: "Академическая справка ",
    academic_certificate_desc:
        "Документ на русском языке, в котором перечислены предметы и отметки, справка об успеваемости. ",
    academic_certificate_desc2:
        "Справка будет готова в течение 7 рабочих дней. ",
    registration_certificate_modal_title: "УВЕДОМЛЕНИЕ ОТПРАВЛЕНО ",
    registration_certificate_modal_desc:
        "НА ПОЧТУ ОТДЕЛА ОТПРАВЛЕНО УВЕДОМЛЕНИЕ О НЕОБХОДИМОСТИ В ПОЛУЧЕНИИ СПРАВКИ О РЕГИСТРАЦИИ \n \n",
    registration_certificate_modal_desc2:
        "ПОЖАЛУЙСТА ДОНЕСИТЕ НЕОБХОДИМЫЕ ДОКУМЕНТЫ В ОТДЕЛ МИГРАЦИОННОГО УЧЁТА  \n",
    trpe_certificate_modal_title: "СПРАВКА ГОТОВИТСЯ",
    trpe_certificate_modal_desc_three:
        "ЖДЕМ ВАС В ОТДЕЛЕ МИГРАЦИОННОГО УЧЁТА, ВИЗ И РЕГИСТРАЦИЙ ЧЕРЕЗ 3 РАБОЧИХ ДНЕЙ ",
    trpe_certificate_modal_desc_seven:
        "ЖДЕМ ВАС В ОТДЕЛЕ МИГРАЦИОННОГО УЧЁТА, ВИЗ И РЕГИСТРАЦИЙ ЧЕРЕЗ 7 РАБОЧИХ ДНЕЙ",
    study_certificate_modal_desc:
        "ДЛЯ ТОГО, ЧТОБЫ ЗАКАЗАТЬ СПРАВКУ ОБ ОБУЧЕНИИ НЕОБХОДИМО ПРЕДОСТАВИТЬ СЛЕДУЮЩИЕ ДАННЫЕ: \n",
    academic_certificate_modal_desc:
        "ДЛЯ ТОГО, ЧТОБЫ ЗАКАЗАТЬ АКАДЕМИЧЕСКУЮ СПРАВКУ НЕОБХОДИМО ПРЕДОСТАВИТЬ СЛЕДУЮЩИЕ ДАННЫЕ:\n",
    certificate_form_citizenship: "ГРАЖДАНСТВО ",
    certificate_form_passport_number: "НОМЕР ПАСОПРТА ",
    certificate_form_birthday: "ДАТА РОЖДЕНИЯ ",
    certificate_form_name_visa_ru: "ИМЯ ПОЛНОСТЬЮ НА РУССКОМ (КАК В ВИЗЕ) ",
    certificate_form_name_visa_eng:
        "ИМЯ ПОЛНОСТЬЮ НА АНГЛИЙСКОМ (КАК В ВИЗЕ) ",
    certificate_form_study_year: "КУРС ",
    certificate_form_study_speciality: "СПЕЦИАЛЬНОСТЬ ",
    certificate_form_email: "E-MAIL (ДЛЯ ПОЛУЧЕНИЯ СПРАВКИ )",
    certificate_form_language: "НА КАКОМ ЯЗЫКЕ НЕОБХОДИМА СПРАВКА ",
    certificate_form_group_number: "НОМЕР ГРУППЫ ",
    certificate_form_school_year: "ГОД ОКОНЧАНИЯ ШКОЛЫ В РОДНОЙ СТРАНЕ",
    russian_language: "Русский",
    english_language: "Английский",
    french_language: "Французский",
    adaptation_course_course_button: "К ОБУЧЕНИЮ",
    adaptation_course_test_button: "ТЕСТ К МОДУЛЮ",
    adaptation_course_test_button2: "ТЕСТ ПРОЙДЕН",
    adaptation_course_video_button: "СМОТРЕТЬ ВИДЕО",
    adaptation_course_1module_title:
        "МОДУЛЬ 1: ЗНАКОМСТВО С УНИВЕРСИТЕТОМ И РЕГИОНОМ ",
    adaptation_course_2module_title: "МОДУЛЬ 2: АДАПТАЦИЯ К УЧЕБНОЙ СРЕДЕ ",
    adaptation_course_3module_title: "МОДУЛЬ 3: КУЛЬТУРА И ЦЕННОСТИ ",
    adaptation_course_4module_title: "МОДУЛЬ 4: СОЦИАЛЬНАЯ ИНТЕГРАЦИЯ  ",
    adaptation_course_5module_title: "МОДУЛЬ 5: МИГРАЦИОННЫЙ УЧЕТ ",
    adaptation_course_5module_lesson51_title: "5.1. СРОКИ И ДОКУМЕНТЫ",
    adaptation_course_5module_lesson51_video_title: "ЗНАКОМСТВО С КАМПУСОМ",
    test_passed_title: "ПОЗДРАВЛЯЕМ ",
    test_not_passed_title: "ПРОЙДИТЕ ЕЩЕ РАЗ ",
    test_passed_desc: "ВЫ УСПЕШНО ЗАВЕРШИЛИ МОДУЛЬ ",
    test_not_passed_desc: "ВЫ НЕ НАБРАЛИ НЕОБХОДИМОЕ КОЛИЧЕСТВО БАЛЛОВ ",
    notifications_not_found: "Уведомлений нет",
  };
}
