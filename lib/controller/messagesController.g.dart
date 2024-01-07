// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messagesController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MessagesController on $MessagesController, Store {
  Computed<bool>? _$isMessagesEmptyComputed;

  @override
  bool get isMessagesEmpty =>
      (_$isMessagesEmptyComputed ??= Computed<bool>(() => super.isMessagesEmpty,
              name: '$MessagesController.isMessagesEmpty'))
          .value;

  late final _$messagesAtom =
      Atom(name: '$MessagesController.messages', context: context);

  @override
  ObservableList<MessageModel> get messages {
    _$messagesAtom.reportRead();
    return super.messages;
  }

  @override
  set messages(ObservableList<MessageModel> value) {
    _$messagesAtom.reportWrite(value, super.messages, () {
      super.messages = value;
    });
  }

  late final _$isDownloadingAtom =
      Atom(name: '$MessagesController.isDownloading', context: context);

  @override
  bool get isDownloading {
    _$isDownloadingAtom.reportRead();
    return super.isDownloading;
  }

  @override
  set isDownloading(bool value) {
    _$isDownloadingAtom.reportWrite(value, super.isDownloading, () {
      super.isDownloading = value;
    });
  }

  late final _$isSearchingAtom =
      Atom(name: '$MessagesController.isSearching', context: context);

  @override
  bool get isSearching {
    _$isSearchingAtom.reportRead();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.reportWrite(value, super.isSearching, () {
      super.isSearching = value;
    });
  }

  late final _$downloadNotesAsyncAction =
      AsyncAction('$MessagesController.downloadNotes', context: context);

  @override
  Future<void> downloadNotes() {
    return _$downloadNotesAsyncAction.run(() => super.downloadNotes());
  }

  @override
  String toString() {
    return '''
messages: ${messages},
isDownloading: ${isDownloading},
isSearching: ${isSearching},
isMessagesEmpty: ${isMessagesEmpty}
    ''';
  }
}
