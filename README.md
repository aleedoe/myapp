# Simple App

Tugas Widget Pertemuan 4

## `main.dart`

```dart
import 'package:flutter/material.dart';
import 'package:myapp/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
```

Kode di atas merupakan aplikasi Flutter sederhana yang menampilkan halaman login. Berikut adalah penjelasan rinci dari setiap bagian kode:

1. Import Libraries
```dart
import 'package:flutter/material.dart';
import 'package:myapp/pages/login.dart';
```

Pada bagian ini, terdapat dua library yang diimpor:
- flutter/material.dart: Library ini merupakan bagian dari framework Flutter yang menyediakan widget dan fitur Material Design.
- myapp/pages/login.dart: File ini mengimpor file eksternal login.dart yang berada di folder pages. File ini akan berisi halaman login (LoginScreen) yang digunakan dalam aplikasi ini.


2. Fungsi main():
```dart
void main() {
  runApp(const MyApp());
}
```

- Fungsi main() adalah titik awal aplikasi. Di dalam fungsi ini, widget utama MyApp dijalankan menggunakan runApp().
- runApp() bertanggung jawab untuk menempatkan widget utama ke dalam pohon widget dan menampilkan aplikasi pada layar.


3. kelas MyApp:
```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});
```

- MyApp adalah kelas yang mewarisi dari StatelessWidget, yang berarti widget ini bersifat statis dan tidak akan berubah selama siklus hidupnya.
- const di sini digunakan untuk membuat widget menjadi immutable dan meningkatkan performa dengan membiarkan Dart melakukan optimisasi.


4. Method build():
```dart
@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const LoginScreen(),
  );
}
```

- build() adalah method yang menghasilkan pohon widget yang akan ditampilkan di layar. Pada method ini, kita mengembalikan widget MaterialApp.
- MaterialApp: Ini adalah widget utama yang mengatur konfigurasi global aplikasi, seperti tema, title, dan halaman utama (home).
    - title: 'Flutter Demo': Menentukan judul aplikasi yang ditampilkan saat user melakukan multitasking di perangkat.
    - theme: ThemeData: Digunakan untuk mengatur tema aplikasi. Pada contoh ini, ColorScheme dihasilkan dari warna seed (Colors.deepPurple) dan menggunakan Material Design 3 (dengan useMaterial3: true).
    - home: const LoginScreen(): Menunjukkan bahwa halaman utama aplikasi adalah LoginScreen, yang diambil dari login.dart. LoginScreen merupakan widget yang menampilkan layar login di aplikasi.


