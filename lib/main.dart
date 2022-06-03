import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String myProfilePic =
        "https://images.unsplash.com/photo-1544502062-f82887f03d1c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1918&q=80";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Facebook Like"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 200,
                  width: size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1500964757637-c85e8a162699?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1806&q=80")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 115),
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(blurRadius: 10)]),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 85,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(myProfilePic),
                    radius: 80,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 2),
              child: Text(
                "Hugo Mesnard",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                "Développeur stagiaire",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            Row(
              children: [
                Expanded(
                    flex: 3,
                    child: blueButton(const Text(
                      "Modifier le profil",
                      style: TextStyle(color: Colors.white),
                    ))),
                Expanded(
                    child: blueButton(
                        const Icon(Icons.create_rounded, color: Colors.white)))
              ],
            ),
            myDivider(),
            Container(
              padding: EdgeInsets.only(left: 2),
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "A propos",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  aboutRow(Icons.house, "Avenue Louise 535, 1000 Bruxelles"),
                  aboutRow(Icons.cases_rounded, "Twitter"),
                  aboutRow(Icons.map, "Français"),
                ],
              ),
            ),
            myDivider(),
            Container(
              padding: EdgeInsets.only(left: 2),
              width: size.width,
              child: const Text(
                "Amis",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                friend("Ben",
                    "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80"),
                friend("Sarah",
                    "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80"),
                friend("Charles",
                    "https://images.unsplash.com/photo-1518020382113-a7e8fc38eac9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1917&q=80"),
              ],
            ),
            myDivider(),
            post(
                myProfilePic,
                "Hugo Mesnard",
                3,
                "https://images.unsplash.com/photo-1494783367193-149034c05e8f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80",
                "Road trip sur la route 66 !",
                7,
                10),
            post(
                myProfilePic,
                "Hugo Mesnard",
                7,
                "https://images.unsplash.com/photo-1621847468516-1ed5d0df56fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80",
                "Un joli caillou :P",
                42,
                19),
            post(
                myProfilePic,
                "Hugo Mesnard",
                11,
                "https://images.unsplash.com/photo-1616055192765-47087ac542b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80",
                "Bizarre comme nom de bateau",
                9999999,
                0)
          ],
        ),
      ),
    );
  }

  Container blueButton(Widget child) {
    return Container(
      child: Center(child: child),
      height: 50,
      margin: const EdgeInsets.only(left: 5, right: 5),
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }

  Row aboutRow(IconData icon, String text) {
    return Row(
      children: [Icon(icon), Text(text)],
    );
  }

  Divider myDivider() {
    return const Divider(
      thickness: 2,
      indent: 10,
      endIndent: 10,
    );
  }

  Expanded friend(String name, String url) {
    return Expanded(
        child: Column(
      children: [
        Container(
          height: 150,
          margin: const EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
        ),
        Text(
          name,
          style: const TextStyle(
              fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
        )
      ],
    ));
  }

  Container post(String avatarUrl, String name, int time, String picUrl,
      String description, int likes, int comments) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(avatarUrl),
                radius: 25,
              ),
              Container(width: 3),
              Text(name),
              const Spacer(),
              Text("Il y a $time heures")
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(picUrl), fit: BoxFit.cover),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
          ),
          Text(description),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.heart_broken_rounded),
              Text("$likes likes"),
              const Icon(Icons.comment),
              Text("$comments comments")
            ],
          )
        ],
      ),
    );
  }
}
