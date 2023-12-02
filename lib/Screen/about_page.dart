import 'package:flutter/material.dart';
import 'package:gamview/Service/auth_service.dart';
import 'package:gamview/Widget/Navigation.dart';
//membuat halaman aboutnya
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationWid(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("GamView"),
      ),
      body:Padding(
        padding: EdgeInsets.all(15),
      child: Center(
      child:Column(children: [
        Text("About Me", style: Theme.of(context).textTheme.bodyLarge!),
        SizedBox(height: 50),
        Container(
          width: 500,
          height: 450,
          decoration: BoxDecoration(  borderRadius: BorderRadius.all(Radius.circular(30)),
            color: Theme.of(context).cardTheme.color,
          ),
            child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  AvatarCircle(),
                  SizedBox(height: 20,),
                  
                  Text(
                    "Abdullah Mustaqim",
                    style: Theme.of(context).textTheme.bodyLarge!,
                    ),
                    Text(
                    "2109106134",
                    style: Theme.of(context).textTheme.bodyLarge!
                    ),
                    Text(
                    "Informatika C'21",
                    style: Theme.of(context).textTheme.bodyLarge!,
                    ),
                ])
                ) 
      ],
      )
      
      ),
      ),
    );
  }
}
//untuk membuat avatar 
class AvatarCircle extends StatelessWidget {
  const AvatarCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: CircleAvatar(
        backgroundColor : Colors.amber,
        // backgroundImage: AssetImage('./assets/logo.png'),

      ),
    );
  }
}
//untuk membuat section Textnya
class sectText extends StatelessWidget {
  const sectText({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 350,
        height: 200,
        decoration: BoxDecoration(  borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        ),
      ),
    );
  }
}