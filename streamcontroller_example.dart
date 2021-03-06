import 'dart:async';

class Cake {}

class Order {
  String type;
  Order(this.type);
}

void main() {
  final controller = new StreamController();

  final order = new Order('afafd');

  final baker =
      new StreamTransformer.fromHandlers(handleData: (cakeType, sink) {
    if (cakeType == 'chocolate') {
      sink.add(new Cake());
    } else {
      sink.addError('I can\'t bak that type!!!');
    }
  });

  controller.sink.add(order);

  controller.stream.map((order) => order.type)
    .transform(baker)
    .listen(
      (cake) => print('Here\'s your cake $cake'),
      onError: (err) => print(err));
}
