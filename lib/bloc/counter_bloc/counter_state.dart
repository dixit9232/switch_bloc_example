import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  @override
  List<Object?> get props => [counter];
  final int counter;

  const CounterState({this.counter = 0});

  CounterState copyWith({int? counter}) {
    return CounterState(counter: counter ?? this.counter);
  }
}
