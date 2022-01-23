import 'package:flutter/widgets.dart';
import 'package:shop/ui/shared/widgets/shared/progress-indicator.widget.dart';

class Loader extends StatelessWidget {
  final object;
  final Function callback;

  const Loader({Key? key, required this.object, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (object == null) {
      return Center(
        child: GenericProgressIndicator(),
      );
    }
    if (object.length == 0) {
      //já carregou mas não tem nada
      return Center(
        child: Text("Nenhum item encontrado"),
      );
    }
    return callback(); //roda a função
  }
}
