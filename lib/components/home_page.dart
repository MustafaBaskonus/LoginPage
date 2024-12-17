import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String username; // Kullanıcı adı
  final String email; // Kullanıcı e-posta adresi

  const HomePage({super.key, required this.username, required this.email});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ana Sayfa'),
        backgroundColor: const Color(0xff233743),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Hoş Geldin!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff233743),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Kullanıcı Adı: $username',
                style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xff748288),
                ),
              ),
              Text(
                'E-posta: $email',
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xff748288),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: size.width * 0.8,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff233743),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                  ),
                  onPressed: () {
                    // Burada başka bir işlem yapılabilir
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Hoş Geldin butonuna tıkladınız!')),
                    );
                  },
                  child: const Text(
                    'Hoş Geldin Butonuna Tıkla',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
