import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
  final void Function() onPressed;
  const ButtonPage({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text(
        'Próximo',
        style: TextStyle(fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).secondaryHeaderColor.withOpacity(0.9),
        minimumSize: const Size(200, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
