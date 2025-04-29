import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool clicar = false;

  void alterar() {
    setState(() {
      clicar = !clicar;
      print(clicar);
    });
  }

  final TextEditingController _controller = TextEditingController();
  final List<String> _tarefas = [];
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _carregarTarefas();
  }

  void _addTarefa() {
    if (_formKey.currentState!.validate()) ;
    setState(() {
      _tarefas.add(_controller.text);
      _controller.clear();
      _salvarTarefas();
    });
  }

  void _salvarTarefas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String tarefaJson = json.encode(_tarefas);
    await prefs.setString('tarefas', tarefaJson);
  }

  void _removerTarefa(int index) {
    setState(() {
      _tarefas.removeAt(index);
      _salvarTarefas();
    });
  }

  void _carregarTarefas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tarefaJson = prefs.getString('tarefas');

    if (tarefaJson != null) {
      setState(() {
        _tarefas.addAll(List<String>.from(jsonDecode(tarefaJson)));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'AppBar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),

      drawer: Drawer(),
      body: Column(
        children: [
          SizedBox(height: 40),

          Center(child: Icon(Icons.account_circle, size: 60)),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  labelText: 'Adcionar tarefa',
                  labelStyle: TextStyle(color: Colors.black),
                ),

                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Preencha corretamente';
                  }
                  return null;
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 30,
            color: const Color.fromARGB(255, 0, 0, 0),
            child: Center(
              child: Text(
                'Tarefas',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 5,
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: EdgeInsets.all(14),
            ),

            onPressed: _addTarefa,
            child: Text('Adcionar'),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: _tarefas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.beenhere),
                  title: Text(
                    _tarefas[index],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Mais Informações'),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add_circle),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
