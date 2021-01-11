import 'package:flutter/material.dart';

class DetaySayfasi extends StatefulWidget {
  String resim;
  String heroTag;
  DetaySayfasi({this.resim, this.heroTag});

  @override
  _DetaySayfasiState createState() => _DetaySayfasiState();
}

class _DetaySayfasiState extends State<DetaySayfasi> {
  String ceket = "assets/images/ceket.jpg";
  String fontAilesi = "Montserrat";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          gelenArkaPlanResmi(context),
          detayTasarim(context),
          buildPositioned(context),
          geriTusu(context)
        ],
      ),
    );
  }

  Positioned geriTusu(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height / 30,
      left: 5,
      child: Container(
        width: 50,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(8),
        ),
        child: tiklamaMethod(context),
      ),
    );
  }

  Widget tiklamaMethod(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
    );
  }

  Positioned buildPositioned(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height / 2,
      left: 50,
      child: buildContainer(),
    );
  }

  Container buildContainer() {
    return Container(
      width: 130,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: buildRow(),
    );
  }

  Row buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Center(
          child: Text(
            "Takım Elbise",
            style: TextStyle(
              fontFamily: "$fontAilesi",
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.blueGrey,
        ),
      ],
    );
  }

  Widget detayTasarim(BuildContext context) {
    return Positioned(
      left: 15,
      right: 15,
      bottom: 15,
      child: detayIcerik(context),
    );
  }

  Material detayIcerik(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      elevation: 10,
      child: detay(context),
    );
  }

  Container detay(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width - 30,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ustYatayDetay(context),
          Divider(),
          altDetay(),
        ],
      ),
    );
  }

  Padding altDetay() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          fiyat(),
          Spacer(),
          detayaGitmeButonu(),
        ],
      ),
    );
  }

  FloatingActionButton detayaGitmeButonu() {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(
        Icons.arrow_forward_ios_rounded,
        color: Colors.white,
      ),
      backgroundColor: Colors.blueGrey.shade900,
    );
  }

  Text fiyat() {
    return Text(
      "6500 \₺",
      style: TextStyle(
        fontFamily: "$fontAilesi",
        fontSize: 22,
      ),
    );
  }

  Row ustYatayDetay(BuildContext context) {
    return Row(
      children: [
        takimElbiseResim(),
        baslikVeCeketDetay(context),
      ],
    );
  }

  Widget baslikVeCeketDetay(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        baslik(),
        SizedBox(height: 5),
        tasarlayan(),
        SizedBox(height: 10),
        ceketTanitimYazisi(context),
      ],
    );
  }

  Container ceketTanitimYazisi(BuildContext context) {
    return Container(
      height: 30,
      width: MediaQuery.of(context).size.width - 170,
      child: Text(
        "Classics Smart Line Slim Fit Takım Elbise, Drop: 6, Ürün Bedeni: 50.",
        style: TextStyle(
          fontFamily: "$fontAilesi",
          fontSize: 13,
          color: Colors.black.withOpacity(0.6),
        ),
      ),
    );
  }

  Text tasarlayan() {
    return Text(
      "Sercan Sever",
      style: TextStyle(
        fontFamily: "$fontAilesi",
        fontSize: 16,
        color: Colors.black.withOpacity(0.6),
      ),
    );
  }

  Text baslik() {
    return Text(
      "Takım Elbise",
      style: TextStyle(
        fontFamily: "$fontAilesi",
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    );
  }

  Padding takimElbiseResim() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white),
          image: DecorationImage(
            image: AssetImage("$ceket"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget gelenArkaPlanResmi(BuildContext context) {
    return Hero(
      tag: "${widget.heroTag}",
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("${widget.resim}"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
