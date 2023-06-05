import 'package:flutter/cupertino.dart';

@immutable
abstract class UserEvent  {
  const UserEvent();
}

class LoadUserEvent extends UserEvent {

}


class AddId extends UserEvent {
final int id;
const AddId(this.id);

  // AddId copyWith({
  //   int? id,
  // }) {
  //   return AddId(
  //     id ?? this.id,
  //   );
  // }
}
