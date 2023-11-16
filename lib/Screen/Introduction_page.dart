import 'package:flutter/material.dart';
import 'package:gamview/Screen/home_page.dart';
import 'package:introduction_screen/introduction_screen.dart';

//bagian widget page
class Introduction_page extends StatelessWidget {
  const Introduction_page({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:   IntroductionScreen(
        next: Text("Selanjutnya"),
        done: Text("Selesai"),
        onDone: () {
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return Homepage();
                },
            ),
          );
        },
        // bagian page slidernya
        pages: [
          PageViewModel(
            title: "Selamat Datang Di GamView",
            body: "Temukan review terkini, ulasan eksklusif, dan berbagai cerita seru tentang game favoritmu di sini",
            image: Image.network("https://img.freepik.com/premium-photo/happy-man-gaming-flat-vector-illustration_974613-1193.jpg?size=626&ext=jpg&ga=GA1.1.838669766.1698771334&semt=ais"),
          ),
          PageViewModel(
            title: "Sambutlah dunia game dengan tangan terbuka!",
            body: "Inilah tempatnya para gamer sejati, tempat di mana pengalaman game menjadi lebih hidup.",
            image: Image.network("https://img.freepik.com/free-vector/gamers-using-different-devices-playing-mobile-phone-tablet-laptop-console-cartoon-illustration_74855-14380.jpg?size=626&ext=jpg&ga=GA1.1.838669766.1698771334&semt=ais"),
          ),
          PageViewModel(
            title: "Ayo, gamer!",
            body: " Ini saatnya merayakan kegilaan game. Temukan review game terbaik dan nikmati setiap momen di dunia game.",
            image: Image.network("https://img.freepik.com/premium-vector/metaverse-illustration-concept-flat-illustration-isolated-white-background_701961-3639.jpg?size=626&ext=jpg&ga=GA1.1.838669766.1698771334&semt=ais"),
            ),
        ],
      ),
    );
  }
}