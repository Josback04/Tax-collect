part of 'history_bloc.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();
}

class InitHistory extends HistoryEvent {
  const InitHistory();

  @override
  List<Object?> get props => [];
}
