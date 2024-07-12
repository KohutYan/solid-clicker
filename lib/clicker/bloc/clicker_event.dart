part of 'clicker_bloc.dart';

sealed class ClickerEvent extends Equatable {
  const ClickerEvent();
}

class UserClicked extends ClickerEvent {
  @override
  List<Object?> get props => [];

  const UserClicked();
}

class UserLongClicked extends ClickerEvent {
  @override
  List<Object?> get props => [];

  const UserLongClicked();
}
