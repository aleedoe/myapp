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


## `login.dart`
```dart
import 'package:flutter/material.dart';
import 'package:myapp/pages/register.dart';
import 'package:myapp/pages/home.dart'; // Halaman Home
import 'package:myapp/components/background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: size.height * 0.33),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const Text(
                "LOGIN",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 104, 104, 104),
                    fontSize: 36),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: "Username"),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: const Text(
                "Forgot password?",
                style: TextStyle(fontSize: 16, color: Color(0XFF2661FA)),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  // Ambil username dari TextField dan pindahkan ke halaman Home
                  String username = _usernameController.text;

                  // Periksa apakah username dan password diisi
                  if (username.isNotEmpty && _passwordController.text.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(userName: username), // Kirim username ke halaman Home
                      ),
                    );
                  } else {
                    // Tampilkan pesan jika username atau password kosong
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter both username and password'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                  padding: const EdgeInsets.all(0),
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80.0),
                    gradient: const LinearGradient(colors: [
                      Color.fromARGB(255, 255, 136, 34),
                      Color.fromARGB(255, 255, 177, 41),
                    ]),
                  ),
                  padding: const EdgeInsets.all(0),
                  child: const Text(
                    "LOGIN",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const Text(
                "or",
                style: TextStyle(
                    color: Color.fromARGB(255, 104, 104, 104),
                    fontSize: 18),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const RegisterScreen()))
                },
                child: const Text(
                  "Register",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF2661FA)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
```

Kode ini merupakan bagian dari aplikasi Flutter yang menampilkan halaman login dengan dua input, yaitu username dan password, serta tombol untuk melakukan login dan navigasi ke halaman registrasi. Berikut penjelasan setiap bagian:


### 1. Import Libraries:
```dart
import 'package:flutter/material.dart';
import 'package:myapp/pages/register.dart';
import 'package:myapp/pages/home.dart'; // Halaman Home
import 'package:myapp/components/background.dart';
```

- flutter/material.dart: Library utama Flutter yang menyediakan widget dan fitur desain Material.
- register.dart dan home.dart: File ini mengimpor halaman RegisterScreen (untuk registrasi) dan HomeScreen (untuk halaman setelah login).
- background.dart: Berisi komponen kustom Background yang menampilkan tata letak latar belakang di halaman login.


### 2. Kelas LoginScreen:
```dart
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
```

- LoginScreen adalah widget berbasis StatefulWidget, yang memungkinkan perubahan tampilan berdasarkan interaksi pengguna.
- Widget ini memerlukan State, yang dikelola dalam kelas _LoginScreenState.


### 3. Kelas _LoginScreenState:
```dart
class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
```

- Kelas ini menyimpan state dari LoginScreen, mengontrol dua TextField untuk username dan password menggunakan TextEditingController.
- TextEditingController digunakan untuk mengambil dan memanipulasi teks yang dimasukkan di field.


### 4. Method build():
```dart
@override
Widget build(BuildContext context) {
```

- build() adalah method yang menghasilkan tampilan antarmuka aplikasi. Di dalamnya terdapat struktur tampilan login yang diatur menggunakan widget Material.


### 5. Widget Scaffold dan Background:
```dart
return Scaffold(
  body: Background(
```

- Scaffold adalah kerangka dasar dari halaman yang berisi struktur elemen UI, seperti body, appBar, dll.
- Background adalah widget kustom yang menampilkan latar belakang untuk halaman login.


### 6. Struktur Layout Kolom:
```dart
Column(
  mainAxisAlignment: MainAxisAlignment.start,
  children: <Widget>[
    SizedBox(height: size.height * 0.33),
```

- Menggunakan widget Column untuk menata elemen-elemen secara vertikal dengan properti mainAxisAlignment yang mengatur posisinya.
- SizedBox digunakan untuk memberikan jarak antara elemen, seperti di sini yang memberikan jarak dari atas sebesar sepertiga tinggi layar.


### 7. Judul "LOGIN":
```dart
Container(
  alignment: Alignment.centerLeft,
  padding: const EdgeInsets.symmetric(horizontal: 40),
  child: const Text(
    "LOGIN",
    style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 104, 104, 104),
        fontSize: 36),
```

- Text ini menampilkan judul halaman dengan gaya tebal dan ukuran font 36, serta warna abu-abu.


### 8. TextField untuk Username dan Password:
```dart
Container(
  alignment: Alignment.center,
  margin: const EdgeInsets.symmetric(horizontal: 40),
  child: TextField(
    controller: _usernameController,
    decoration: const InputDecoration(labelText: "Username"),
  ),
),
```

- TextField digunakan untuk menerima input dari pengguna. Controller yang sudah didefinisikan (_usernameController dan _passwordController) terhubung untuk mengelola teks yang dimasukkan.
- Field password menggunakan properti obscureText: true agar teks yang dimasukkan disembunyikan.


### 9. Tombol "LOGIN":
```dart
ElevatedButton(
  onPressed: () {
    String username = _usernameController.text;
    if (username.isNotEmpty && _passwordController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(userName: username),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter both username and password'),
        ),
      );
    }
  },
```

- Tombol login dikemas menggunakan ElevatedButton.
- Di dalam event onPressed, dilakukan pengecekan apakah username dan password diisi. Jika keduanya tidak kosong, halaman akan berpindah ke HomeScreen dengan mengirimkan username yang diinput.
- Jika salah satu kosong, akan muncul pesan menggunakan SnackBar.


### 10. Navigasi ke Halaman Register:
```dart
GestureDetector(
  onTap: () => {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const RegisterScreen()))
  },
  child: const Text(
    "Register",
    style: TextStyle(fontSize: 18, color: Color(0xFF2661FA)),
  ),
)
```

- GestureDetector membungkus teks "Register" yang memungkinkan teks ini menjadi interaktif. Ketika teks ditekan, pengguna akan diarahkan ke halaman RegisterScreen menggunakan Navigator.push().


## `home.dart`
```dart
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String userName;

  const HomeScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/avatar.png"), // Avatar user
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hallo, $userName", // Menampilkan nama user
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Selamat Pagi.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                "assets/images/banner.png", // Gambar makanan
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Image.asset(
                      "assets/images/noodle.png", // Gambar icon noodle berwarna
                      width: 50,
                      height: 50,
                    ),
                    title: const Text('Noodle'),
                    subtitle: const Text('Rp23.000'),
                  ),
                  ListTile(
                    leading: Image.asset(
                      "assets/images/chicken.png", // Gambar icon chicken berwarna
                      width: 50,
                      height: 50,
                    ),
                    title: const Text('Chicken'),
                    subtitle: const Text('Rp15.000'),
                  ),
                  ListTile(
                    leading: Image.asset(
                      "assets/images/french_fries.png", // Gambar icon french fries berwarna
                      width: 50,
                      height: 50,
                    ),
                    title: const Text('French Fries'),
                    subtitle: const Text('Rp11.000'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

Kode ini menampilkan halaman HomeScreen yang menerima userName dari halaman sebelumnya (seperti LoginScreen). Halaman ini terdiri dari sebuah greeting (sapaan) kepada pengguna, gambar banner, serta daftar menu makanan yang ditampilkan secara visual dengan gambar dan deskripsi. Berikut adalah penjelasan lebih detail dari setiap bagian:


### 1. Deklarasi Kelas HomeScreen:
```dart
class HomeScreen extends StatelessWidget {
  final String userName;

  const HomeScreen({super.key, required this.userName});
```

- HomeScreen adalah widget StatelessWidget, yang berarti widget ini tidak memiliki state yang berubah-ubah selama siklus hidupnya.
- userName adalah parameter yang diterima dari halaman sebelumnya, dan akan ditampilkan di halaman ini.


### 2. Method build():
```dart
@override
Widget build(BuildContext context) {
```

- Method ini membangun UI halaman dengan struktur widget yang akan ditampilkan kepada pengguna. Halaman menggunakan Scaffold untuk menyediakan struktur dasar, seperti body.


### 3. Padding dan Column:
```dart
return Scaffold(
  body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
```

- Padding digunakan untuk memberikan jarak di sekitar semua elemen di dalam body dengan jarak 16 pixel di setiap sisi.
- Column digunakan untuk menyusun widget secara vertikal, dengan properti crossAxisAlignment diatur ke CrossAxisAlignment.start sehingga semua elemen di dalamnya diratakan ke kiri.


### 4. Avatar dan Sapaan Pengguna:
```dart
Row(
  children: [
    const CircleAvatar(
      radius: 30,
      backgroundImage: AssetImage("assets/images/avatar.png"), // Avatar user
    ),
    const SizedBox(width: 10),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hallo, $userName", // Menampilkan nama user
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          "Selamat Pagi.",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    ),
  ],
),
```

- Row digunakan untuk menyusun avatar dan sapaan pengguna secara horizontal.
CircleAvatar menampilkan gambar avatar dengan radius 30 pixel, mengambil gambar dari assets/images/avatar.png.
- Text pertama menampilkan sapaan personal dengan username yang diterima dari halaman sebelumnya, sedangkan Text kedua menampilkan pesan "Selamat Pagi."


### 5. Gambar Banner:
```dart
ClipRRect(
  borderRadius: BorderRadius.circular(15.0),
  child: Image.asset(
    "assets/images/banner.png", // Gambar makanan
    fit: BoxFit.cover,
    width: double.infinity,
    height: 200,
  ),
),
```

- ClipRRect digunakan untuk membuat gambar dengan sudut yang melengkung (border radius 15 pixel).
- Image.asset menampilkan gambar yang diambil dari direktori assets/images/banner.png dengan properti BoxFit.cover, yang berarti gambar akan menyesuaikan ukuran wadahnya dengan memotong jika diperlukan.
- width: double.infinity memastikan gambar melebar penuh di layar.


### 6. Daftar Menu Makanan dengan ListView:
```dart
Expanded(
  child: ListView(
    children: <Widget>[
      ListTile(
        leading: Image.asset(
          "assets/images/noodle.png", // Gambar icon noodle berwarna
          width: 50,
          height: 50,
        ),
        title: const Text('Noodle'),
        subtitle: const Text('Rp23.000'),
      ),
      ListTile(
        leading: Image.asset(
          "assets/images/chicken.png", // Gambar icon chicken berwarna
          width: 50,
          height: 50,
        ),
        title: const Text('Chicken'),
        subtitle: const Text('Rp15.000'),
      ),
      ListTile(
        leading: Image.asset(
          "assets/images/french_fries.png", // Gambar icon french fries berwarna
          width: 50,
          height: 50,
        ),
        title: const Text('French Fries'),
        subtitle: const Text('Rp11.000'),
      ),
    ],
  ),
),
```

- Expanded memastikan bahwa ListView menempati seluruh sisa ruang vertikal di dalam kolom.
- ListView digunakan untuk membuat daftar yang dapat di-scroll secara vertikal, berisi item-item ListTile.
- Setiap ListTile menampilkan gambar makanan di sebelah kiri (leading), diambil dari assets/images/, diikuti oleh judul (nama makanan) dan subtitle (harga makanan).


### 7. Tata Letak Keseluruhan:
Tata letak dari halaman ini berfokus pada menampilkan avatar pengguna di bagian atas, diikuti oleh sapaan, gambar banner, dan kemudian daftar menu makanan. Setiap bagian diatur dengan jarak yang proporsional menggunakan SizedBox.