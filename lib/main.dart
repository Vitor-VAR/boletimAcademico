import 'package:boletim_academico/disciplina_scream.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Boletim academico',
    home: DisciplinaScreen(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      useMaterial3: true,
    ),
  ));
}
