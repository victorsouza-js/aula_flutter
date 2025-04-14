import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
  Widget build(BuildContext context) {
    void _addTarefa() {
      if (_formKey.currentState!.validate()) ;
      setState(() {
        _tarefas.add(_controller.text);
        _controller.clear();
      });
    }

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
