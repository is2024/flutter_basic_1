
import 'package:flutter/material.dart';
import 'package:flutter_basic/mahasiswa.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Hello Flutter Kelas A'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = true;

  List<Mahasiswa> listMahasiswa = [
    Mahasiswa(nim: 123, nama: 'rioman', address: 'paguyaman'),
    Mahasiswa(nim: 124, nama: 'maman', address: 'marisa'),
    Mahasiswa(nim: 125, nama: 'sinta', address: 'limboto'),
    Mahasiswa(nim: 126, nama: 'surin', address: 'buton'),
    Mahasiswa(nim: 127, nama: 'kikan', address: 'luwuk'),
  ];
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index){
          return InkWell(
            onTap: () {
            showDialog(
            context:context, 
            builder: (_) {
              return AlertDialog(
                title: const Text('Data Mahasiswa'),
                content: Column( 
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  Row(
                    mainAxisAlignment: 
                    MainAxisAlignment.spaceAround,
                    children: [
                      const Text('Name :'), 
                      Text(listMahasiswa[index].nama)
                      ],
                ),
              ]),  
              );
              });
            },
          
            child: ListTile(
              leading: CircleAvatar(backgroundColor: Color.fromARGB(255, 90, 157, 2), child: Text('${listMahasiswa[index].nim}'),
              ), 
              title: Text('${listMahasiswa[index].nama}'),
              // subtitle: Text('$index'),
              subtitle: Text('${listMahasiswa[index].address}'),
            )
        );

        },
         itemCount: listMahasiswa.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
