import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AsyncExamplePage(),
    );
  }
}

class AsyncExamplePage extends StatefulWidget {
  const AsyncExamplePage({super.key});

  @override
  State<AsyncExamplePage> createState() => _AsyncExamplePageState();
}

class _AsyncExamplePageState extends State<AsyncExamplePage> {
  // Переменная для хранения данных
  String? _data;
  bool _isLoading = false;

  // Метод для асинхронной загрузки данных
  Future<void> _loadData() async {
    setState(() {
      _isLoading = true; // Включаем индикатор загрузки
    });

    await Future.delayed(const Duration(seconds: 3)); // Эмуляция запроса

    setState(() {
      _data = 'Данные успешно загружены!'; // Устанавливаем данные
      _isLoading = false; // Отключаем индикатор загрузки
    });
  }

  // Метод для отображения интерфейса в зависимости от состояния
  Widget _buildBody() {
    if (_isLoading) {
      return const CircularProgressIndicator(); // Показать индикатор, если идет загрузка
    } else if (_data != null) {
      return Text(
        _data!,
        style: const TextStyle(fontSize: 20),
      ); // Показать текст, если данные загружены
    } else {
      return const Text(
        'Нажмите на кнопку для загрузки данных.',
        style: TextStyle(fontSize: 18),
      ); // Сообщение перед загрузкой
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Асинхронный пример'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildBody(), // Используем метод для отображения контента
            const SizedBox(height: 20), // Отступ между текстом и кнопкой
            ElevatedButton(
              onPressed: _loadData, // Запуск асинхронной задачи
              child: const Text('Загрузить данные'),
            ),
          ],
        ),
      ),
    );
  }
}
