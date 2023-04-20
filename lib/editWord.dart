import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/repositorio.dart';

class EditWord extends StatefulWidget {
  WordPair pair;
  Repositorio repositorio;
  EditWord({required this.pair, required this.repositorio, Key? key})
      : super(key: key);

  @override
  State<EditWord> createState() => _EditWordState();
}

class _EditWordState extends State<EditWord> {
  late TextEditingController _firstController;
  late TextEditingController _secondController;

  @override
  void initState() {
    super.initState();
    _firstController = TextEditingController(text: widget.pair.first);
    _secondController = TextEditingController(text: widget.pair.second);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Word')),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _firstController,
              decoration: InputDecoration(labelText: 'First word'),
            ),
            TextFormField(
              controller: _secondController,
              decoration: InputDecoration(labelText: 'Second word'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final newPair =
              WordPair(_firstController.text, _secondController.text);
          final index =
              widget.repositorio.randomWordsPairs.indexOf(widget.pair);
          widget.repositorio.randomWordsPairs[index] = newPair;
          widget.pair = WordPair(_firstController.text, _secondController.text);
          Navigator.pushNamed(context, '/');
        },
        child: Icon(Icons.save),
      ),
    );
  }
}