import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var resultado = "Bora jogar :) !!";
  var EscolhaComputador = "padrao";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
        child: Text(
            "JokenPo",
             style: TextStyle(
               fontStyle: FontStyle.italic,
               fontWeight: FontWeight.bold,
               color: Colors.white,
             ),
          textAlign: TextAlign.justify,
        )),
        backgroundColor: Colors.blue,

      ) ,
      body: Container(
        child: Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child:Column(
                  children: <Widget>[
                    Text(
                        "Escolha do App",
                         style: TextStyle(
                           fontStyle: FontStyle.normal,
                           fontSize: 20,
                           color: Colors.black,
                         ),
                      textAlign: TextAlign.justify,
                    ),
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Image(image: AssetImage("imga/$EscolhaComputador.png")),
                    ),
                    Padding(
                        padding: EdgeInsets.all(30),
                        child: Text(
                            "$resultado",
                             style: TextStyle(
                               fontSize: 20,
                               fontStyle: FontStyle.normal,
                               color: Colors.black,
                             ),
                            textAlign: TextAlign.justify,
                        )
                    ),
                    Row(
                      children: <Widget>[
                        FlatButton(
                          onPressed: (){
                            ResultadoJogo("papel");
                          },
                          padding: EdgeInsets.all(10),
                          child: Image.asset("imga/papel.png",width: 100,height: 100),
                        ),
                        FlatButton(
                          onPressed: (){
                            ResultadoJogo("pedra");
                          },
                          padding: EdgeInsets.all(10),
                          child: Image.asset("imga/pedra.png",width: 100,height: 100),
                        ),
                        FlatButton(
                          onPressed: (){
                            ResultadoJogo("tesoura");
                          },
                          padding: EdgeInsets.all(10),
                          child: Image.asset("imga/tesoura.png",width: 100, height: 100),
                        )
                      ],
                    )
                  ],
                ),
              ),
        ),
      )

    );
  }
  void ResultadoJogo(var EscolhaUsuario){
    var ResultadosPossiveis =[
      "Parabéns você venceu :) !!",
      "Você Pedeu :(",
      "Empataram"];
    var EscolhasPossiveis = [
      "pedra","tesoura","papel"
    ];
    int numero = Random().nextInt(EscolhasPossiveis.length);
    setState(() {
       EscolhaComputador = EscolhasPossiveis[numero];
       if(EscolhaComputador == EscolhaUsuario){
         this.resultado = ResultadosPossiveis[2];
       }else if((EscolhaComputador == "pedra" && EscolhaUsuario == "tesoura") ||  (EscolhaComputador == "tesoura" && EscolhaUsuario == "papel") || (EscolhaComputador == "papel" && EscolhaUsuario == "pedra")){
         this.resultado =ResultadosPossiveis[1];
       }else{
         this.resultado = ResultadosPossiveis[0];
       }
    });
  }
}
