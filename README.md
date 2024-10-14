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

### 1. Import Libraries
```dart
import 'package:flutter/material.dart';
import 'package:myapp/pages/login.dart';
```

Pada bagian ini, terdapat dua library yang diimpor:
- flutter/material.dart: Library ini merupakan bagian dari framework Flutter yang menyediakan widget dan fitur Material Design.
- myapp/pages/login.dart: File ini mengimpor file eksternal login.dart yang berada di folder pages. File ini akan berisi halaman login (LoginScreen) yang digunakan dalam aplikasi ini.


### 2. Fungsi main():
```dart
void main() {
  runApp(const MyApp());
}
```

- Fungsi main() adalah titik awal aplikasi. Di dalam fungsi ini, widget utama MyApp dijalankan menggunakan runApp().
- runApp() bertanggung jawab untuk menempatkan widget utama ke dalam pohon widget dan menampilkan aplikasi pada layar.


### 3. kelas MyApp:
```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});
```

- MyApp adalah kelas yang mewarisi dari StatelessWidget, yang berarti widget ini bersifat statis dan tidak akan berubah selama siklus hidupnya.
- const di sini digunakan untuk membuat widget menjadi immutable dan meningkatkan performa dengan membiarkan Dart melakukan optimisasi.


### 4. Method build():
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


## `background.dart`

```dart
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Align(
            alignment: const Alignment(0, -0.8),
            child: Image.asset(
              "assets/images/main2.png",
              width: size.width * 0.35,
            ),
          ),
          child  // Child yang lain tetap akan di-render di atas gambar
        ],
      ),
    );
  }
}
```

Kode ini mendefinisikan sebuah widget bernama Background yang merupakan StatelessWidget dan bertujuan untuk menyediakan latar belakang gambar dengan tata letak yang fleksibel. Background menerima satu parameter child, yang akan di-render di atas gambar latar belakang yang ditampilkan. Berikut adalah penjelasan lebih detail dari setiap bagian:


### 1. Deklarasi Kelas Background:
```dart
class Background extends StatelessWidget {
  final Widget child;

  const Background({
    super.key,
    required this.child,
  });
```

- Background adalah sebuah StatelessWidget, yang berarti widget ini tidak memiliki state dan hanya perlu dibangun sekali.
- Widget ini menerima satu parameter child, yang merupakan widget apapun yang akan ditampilkan di atas latar belakang gambar.


### 2. Method build():
```dart
@override
Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
```

- Method build digunakan untuk membangun UI halaman, di mana kita menggunakan MediaQuery untuk mendapatkan ukuran layar (lebar dan tinggi). Ini memungkinkan tata letak bersifat responsif, menyesuaikan dengan berbagai ukuran layar.
- size adalah variabel yang menyimpan informasi ukuran layar perangkat, dengan properti size.width dan size.height.


### 3. Widget SizedBox untuk Menentukan Ukuran:
```dart
return SizedBox(
  width: double.infinity,
  height: size.height,
  child: Stack(
    alignment: Alignment.center,
    children: <Widget>[
```

- SizedBox digunakan untuk menentukan ukuran dari Background widget. width: double.infinity memastikan widget ini akan mengisi seluruh lebar layar, sedangkan height: size.height membuat widget ini menempati seluruh tinggi layar.
- Stack digunakan untuk menumpuk widget satu di atas yang lain. Dalam hal ini, child yang diterima oleh Background akan ditempatkan di atas gambar latar belakang.


### 4. Menampilkan Gambar Latar Belakang dengan Align:
```dart
Align(
  alignment: const Alignment(0, -0.8),  // Ini akan menempatkan gambar di tengah
  child: Image.asset(
    "assets/images/main2.png",
    width: size.width * 0.35,
  ),
),
```

- Align digunakan untuk menempatkan gambar pada posisi tertentu di dalam Stack. Dalam kasus ini, gambar diatur dengan Alignment(0, -0.8), yang berarti gambar akan berada di tengah secara horizontal, dan sedikit di atas (80% ke arah atas) secara vertikal.
- Image.asset digunakan untuk menampilkan gambar yang diambil dari direktori assets/images/main2.png. Gambar ini diatur agar lebarnya adalah 35% dari lebar layar (size.width * 0.35), sehingga ukurannya akan responsif terhadap berbagai ukuran layar.


### 5. Menampilkan child di Atas Gambar:
```dart
child  // Child yang lain tetap akan di-render di atas gambar
```

- child adalah widget yang akan diterima oleh Background. Widget ini akan di-render di atas gambar latar belakang, karena ditambahkan setelah Image.asset di dalam Stack. Ini memungkinkan gambar latar tetap berada di bawah dan child (yang bisa berupa form, teks, tombol, atau lainnya) tetap berada di atas gambar.