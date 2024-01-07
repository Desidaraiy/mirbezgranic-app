import 'package:mirbezgranic/models/message.dart';
import 'package:mirbezgranic/repository/messagesRepository.dart';
import 'package:mobx/mobx.dart';

part 'messagesController.g.dart';

class MessagesController = $MessagesController with _$MessagesController;

abstract class $MessagesController with Store {
  LocalMessagesRepository localMessagesRepository = LocalMessagesRepository();

  @observable
  ObservableList<MessageModel> messages = ObservableList<MessageModel>();

  @computed
  bool get isMessagesEmpty => messages.isEmpty;

  @observable
  bool isDownloading = false;

  @observable
  bool isSearching = false;

  @action
  Future<void> downloadNotes() async {
    messages.clear();
    isDownloading = true;
    List<MessageModel> _notes = await localMessagesRepository.getMessages();
    messages.addAll(_notes);
    isDownloading = false;
  }
}
