import 'dart:async';

class controlbloc {

  final _streamControl = StreamController<int>();

  Sink<int> get sink => _streamControl.sink;
  Stream<int> get stream => _streamControl.stream;

  int _numero = 0;

  void crecer(){
    sink.add(++_numero);
  }

  dispose() => _streamControl.close();
}