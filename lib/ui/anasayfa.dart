import 'package:flutter/material.dart';
import 'package:flutter_app_dort/ui/detay.dart';

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> with SingleTickerProviderStateMixin {
  TabController tabController;

  String resimBir = "assets/images/bir.png";

  String logo = "assets/images/logo.jpg";
  String fontAilesi = "Montserrat";

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: ListView(
        padding: EdgeInsets.only(top: 10),
        children: [
          ustTarafProfilListesi(),
          cardUstTasarim(context),
        ],
      ),
      bottomNavigationBar: altBar(),
    );
  }

  Material altBar() {
    return Material(
      child: TabBar(
        indicatorColor: Colors.blueGrey,
        controller: tabController,
        tabs: [
          Tab(
            icon: Icon(
              Icons.more,
              color: Colors.grey,
              size: 20,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.video_library,
              color: Colors.grey,
              size: 20,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.near_me,
              color: Colors.grey,
              size: 20,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.supervised_user_circle,
              color: Colors.grey,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Padding cardUstTasarim(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        // color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(20),
        elevation: 8,
        child: Container(
          height: 490,
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              fotoVeIsimTasarim(context),
              SizedBox(height: 10),
              cardYaziIcerigiTasarimi(),
              SizedBox(height: 10),
              resimlerYanYanaTasarim(context),
              SizedBox(height: 10),
              etiketlerTasarim(),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 5),
              altIconlar(),
            ],
          ),
        ),
      ),
    );
  }

  Row altIconlar() {
    return Row(
      children: [
        paylasIcon(),
        paylasanSayisi(),
        yorumIcon(),
        yorumAtanaKisiSayisi(),
        Spacer(),
        begenmeIcon(),
        begenenKisiSayisi(),
      ],
    );
  }

  Text begenenKisiSayisi() => Text("2.8K");

  IconButton begenmeIcon() {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.favorite,
        color: Colors.red,
      ),
    );
  }

  Text yorumAtanaKisiSayisi() {
    return Text(
      "325",
      style: TextStyle(
        color: Colors.grey.withOpacity(0.6),
      ),
    );
  }

  IconButton yorumIcon() {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.sms,
        color: Colors.grey.withOpacity(0.6),
      ),
    );
  }

  Text paylasanSayisi() {
    return Text(
      "1.7K",
      style: TextStyle(
        color: Colors.grey.withOpacity(0.6),
      ),
    );
  }

  IconButton paylasIcon() {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.reply,
        color: Colors.grey.withOpacity(0.6),
      ),
    );
  }

  Row etiketlerTasarim() {
    return Row(
      children: [
        birinciEtiket(),
        SizedBox(width: 10),
        ikinciEtiket(),
      ],
    );
  }

  Container ikinciEtiket() {
    return Container(
      height: 25,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueGrey.withOpacity(0.2),
      ),
      child: Center(
        child: Text(
          "# Ceket",
          style: TextStyle(
            fontFamily: "$fontAilesi",
            fontSize: 10,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Container birinciEtiket() {
    return Container(
      height: 25,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueGrey.withOpacity(0.2),
      ),
      child: Center(
        child: Text(
          "# 2020",
          style: TextStyle(
            fontFamily: "$fontAilesi",
            fontSize: 10,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Row resimlerYanYanaTasarim(BuildContext context) {
    return Row(
      children: [
        buyukResim(context),
        SizedBox(width: 10),
        kucukResimler(context),
      ],
    );
  }

  Column kucukResimler(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ortancaResimBir(context),
        SizedBox(height: 10),
        ortancaResimIki(context),
      ],
    );
  }

  Widget ortancaResimIki(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetaySayfasi(
              resim: "$resimBir",
              heroTag: "bir",
            ),
          ),
        );
      },
      child: Hero(
        tag: "bir",
        child: Container(
          width: (MediaQuery.of(context).size.width - 100) / 2,
          height: 95,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage("$resimBir"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget ortancaResimBir(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetaySayfasi(
              resim: "$resimBir",
              heroTag: "iki",
            ),
          ),
        );
      },
      child: Hero(
        tag: "iki",
        child: Container(
          width: (MediaQuery.of(context).size.width - 100) / 2,
          height: 95,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage("$resimBir"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget buyukResim(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetaySayfasi(
              resim: "$resimBir",
              heroTag: "uc",
            ),
          ),
        );
      },
      child: Hero(
        tag: "uc",
        child: Container(
          width: (MediaQuery.of(context).size.width - 50) / 2,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage("$resimBir"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Text cardYaziIcerigiTasarimi() {
    return Text(
      "2020 Trendlerine Uygun Ve Şık Bir Takım"
      " Detaylar İçin Resimlere Tıklayabilirsiniz",
      style: TextStyle(
        fontSize: 13,
        fontFamily: '$fontAilesi',
        color: Colors.grey,
      ),
    );
  }

  Row fotoVeIsimTasarim(BuildContext context) {
    return Row(
      children: [
        fotoTasarim(),
        SizedBox(width: 10),
        isimTasarim(context),
        Spacer(),
        dahaFazlaMenuTasarim(),
      ],
    );
  }

  IconButton dahaFazlaMenuTasarim() {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.more_vert_rounded,
        color: Colors.blueGrey,
      ),
    );
  }

  Container isimTasarim(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 200,
      child: ListTile(
        title: Text(
          "Sercan Sever",
          style: TextStyle(
            color: Colors.blueGrey,
            fontFamily: "$fontAilesi",
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "34 mins ago",
          style: TextStyle(
            color: Colors.blueGrey,
            fontFamily: "$fontAilesi",
          ),
        ),
      ),
    );
  }

  Container fotoTasarim() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("$resimBir"),
        ),
      ),
    );
  }

  Container ustTarafProfilListesi() {
    return Container(
      height: 140,
      width: double.infinity,
      child: profilListesi(),
    );
  }

  ListView profilListesi() {
    return ListView(
      padding: EdgeInsets.all(10),
      scrollDirection: Axis.horizontal,
      children: [
        listeElemani("$resimBir", "$logo"),
        SizedBox(width: 30),
        listeElemani("$resimBir", "$logo"),
        SizedBox(width: 30),
        listeElemani("$resimBir", "$logo"),
        SizedBox(width: 30),
        listeElemani("$resimBir", "$logo"),
        SizedBox(width: 30),
        listeElemani("$resimBir", "$logo"),
        SizedBox(width: 30),
        listeElemani("$resimBir", "$logo"),
        SizedBox(width: 30),
        listeElemani("$resimBir", "$logo"),
        SizedBox(width: 30),
        listeElemani("$resimBir", "$logo"),
        SizedBox(width: 30),
        listeElemani("$resimBir", "$logo"),
        SizedBox(width: 10),
      ],
    );
  }

  AppBar appBarWidget() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        "Trendler",
        style: TextStyle(
          fontFamily: "$fontAilesi",
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: actionButton(),
    );
  }

  List<Widget> actionButton() {
    return [
      IconButton(
        icon: Icon(
          Icons.camera_alt,
          color: Colors.blueGrey,
        ),
        onPressed: () {},
      ),
    ];
  }

  Widget listeElemani(String resimYolu, String logoYolu) {
    return Column(
      children: [
        resimVeLogo(resimYolu, logoYolu),
        SizedBox(height: 10),
        followButton(),
      ],
    );
  }

  Container followButton() {
    return Container(
      width: 75,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.blueGrey,
      ),
      child: Center(
        child: Text(
          "Follow",
          style: TextStyle(fontFamily: "$fontAilesi", color: Colors.white),
        ),
      ),
    );
  }

  Stack resimVeLogo(String resimYolu, String logoYolu) {
    return Stack(
      children: [
        resim(resimYolu),
        logoResim(logoYolu),
      ],
    );
  }

  Positioned logoResim(String logoYolu) {
    return Positioned(
      top: 50,
      left: 50,
      child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          image: DecorationImage(
            image: AssetImage("$logoYolu"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Container resim(String resimYolu) {
    return Container(
      height: 75,
      width: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        image: DecorationImage(
          image: AssetImage("$resimYolu"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
