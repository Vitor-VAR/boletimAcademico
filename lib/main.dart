import 'package:boletim_academico/ui/pages/disciplina_scream.dart';
import 'package:boletim_academico/ui/pages/nota_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Boletim academico',
    home: NotaScreen(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      useMaterial3: true,
    ),
  ));
}
