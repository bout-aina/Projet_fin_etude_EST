import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_swiper/flutter_swiper.dart';




import 'Connexion_Patient/login_patient.dart';



class AuthThreePage extends StatefulWidget {


  @override
  _AuthThreePageState createState() => _AuthThreePageState();
}
class _AuthThreePageState extends State<AuthThreePage> {
  final String backImg = 'assets/l4.jpg';
  bool formVisible;
  int formsIndex;

  @override
  void initState() {
    super.initState();
    formVisible = false;
    formsIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/l4.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                color: Colors.black26,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: kToolbarHeight + 40),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Soyez Bienvenue",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 35.0,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            "Connectez-vous à votre compte pour \n profiter de notre cabinet",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 23.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: RaisedButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text("Se connecter"),
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => LoginTwoPage()
                                  )
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: RaisedButton(
                            color: Colors.grey.shade700,
                            textColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text("A-propos"),
                            onPressed: () {

                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => TravelNepalPage()
                                  )
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 10.0),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Divider(),
                    OutlineButton.icon(
                      borderSide: BorderSide(color:  Colors.blue),
                      color: Colors.blue,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      icon: Icon(FontAwesomeIcons.info),
                      label: Text("Visitez notre site",style: TextStyle(
                        fontSize: 15.0,),),
                      onPressed: () => url_launcher.launch('https://www.google.fr/'),
                    ),
                    const SizedBox(height: 40.0),

                  ],
                ),
              ),

            ],
          ),
        ));
  }
}





class TravelNepalPage extends StatelessWidget {
  static final String path = "lib/src/pages/travel/travel_nepal.dart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              height: 400,

              child: Image(image: AssetImage("assets/doctor.jpg"))

          ),
          Container(
            height: 300,
            width: double.infinity,
            color: Colors.black.withOpacity(0.2),
          ),
          ListView(
            children: <Widget>[
              SizedBox(height: 100.0),
              Text("Ophtalmo express".toUpperCase(), textAlign: TextAlign.center, style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white
              )),
              Text("QUALITE-RESPECT-CHALEUR.", textAlign: TextAlign.center, style: TextStyle(
                  color: Colors.white
              )),
              SizedBox(height: 50.0,),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Material(
                  elevation: 5.0,
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Nous sommes ici".toUpperCase()),
                        Text("pour vous"),
                        SizedBox(height: 20.0,),
                        Container(
                          margin: EdgeInsets.all(10.0),
                          height: 200,
                          child: Swiper.children(
                            autoplay: true,
                            loop: true,
                            pagination: SwiperPagination(
                              margin: EdgeInsets.only(right: 25.0,),
                              builder: DotSwiperPaginationBuilder(
                                  color: Colors.grey
                              ),
                            ),
                            control: SwiperControl(
                              iconNext: Icons.arrow_forward_ios,
                              iconPrevious: null,
                            ),
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(right: 50.0, bottom: 20.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.asset('assets/l6.jpg'))
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 50.0, bottom: 20.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.asset('assets/l7.jpg'))
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 50.0, bottom: 20.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.asset('assets/l8.jpg'))
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 50.0, bottom: 20.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.asset('assets/l9.jpg'))
                              ),
                              Container(
                                  margin: EdgeInsets.only(right: 50.0, bottom: 20.0),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.asset('assets/l10.jpg'))
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Nos Spécialitées".toUpperCase(),style: TextStyle(fontSize: 23.00)),
                    SizedBox(height: 10.0,),
                    Wrap(
                      runAlignment: WrapAlignment.center,
                      alignment: WrapAlignment.center,
                      spacing: 5.0,
                      children: <Widget>[

                        ExpansionTile(
                          title: Text('Ophtalmologie générale',style: TextStyle(fontSize: 21.00,fontFamily : 'Brandon_bld',color: const Color(0xFF00B0FF),fontWeight: FontWeight.bold)),
                          leading: Icon(Icons.looks_one),
                          children: <Widget>[
                            Text(
                                'Ophtalmologie générale:Le contrôle de la vision est recommandé pour toute personne présentant des troubles visuels ou non \n surtout au  personnes dont le travail est fatigant pour la vue (ordinateurs...) et les sujets souffrant de diabète d hypertension artérielle ou ayant des antécédents familiaux de glaucome,ce contrôle consiste à examiner l’état des yeux et à identifier le défaut ou la maladie oculaire éventuelle.et Selon les résultats du diagnostic effectué, l’ophtalmologiste prescrit au patient le traitement adéquat :médicaments -chirurgie ou des explorations complémentaires -pour mieux cerner la maladie ou le défaut ets’assurer de la faisabilité du traitement à prescrire et des contre-indications éventuelles.',style: TextStyle(fontSize: 17.00,fontFamily : 'Brandon_bld')
                            )
                          ],
                        ),
                        ExpansionTile(

                          leading: Icon(Icons.looks_two),

                          title: Text('Chirurgie de la cataracte:',style: TextStyle(fontSize: 21.00,fontFamily : 'Brandon_bld',color: const Color(0xFF00B0FF),fontWeight: FontWeight.bold)),
                          children: <Widget>[

                            Text("Qu’ est-ce que la cataracte ? On parle de cataracte lorsque le cristallin, lentille naturelle de l’œil, perd sa transparence, ce qui entraîne des troubles visuels pouvant aller jusqu’ à la cécité. \n Qui est concerné ? Cette maladie concerne les patients à partir de l’âge de 50 ans, mais elle peut, dans de cas rares, se déclarer également chez des personnes plus jeunes. \n Alors  Si vous avez la cataracte, vous devez  nous consulter pour déterminer, après un diagnostic, le choix du traitement approprié, en vue de remplacer le cristallin opaque détérioré par une lentille intraoculaire (cristallin synthétique).",style: TextStyle(fontSize: 17.00,fontFamily : 'Brandon_bld'),
                            ),

                          ],
                        ),
                        ExpansionTile(
                          title: Text('Le strabisme',style: TextStyle(fontSize: 21.00,fontFamily : 'Brandon_bld',color: const Color(0xFF00B0FF),fontWeight: FontWeight.bold)),
                          leading: Icon(Icons.looks_3),
                          children: <Widget>[
                            Text("Le strabisme est un défaut d’action des muscles de l’œil  a pour conséquence une déviation de l’œil :\n le cerveau élimine en effet l’image reçue de l’œil affecté, ce qui entraîne la perte d’une zone de vision.\n  Le strabisme apparaît presque toujours avant l’âge de 4 ans chez les enfants.\n Le strabisme  peut être traité en faisant travailler l’œil atteint par la pose d’un bandeau sur l’œil sain, par le port de lunettes spéciales ou par la chirurgie.\n Plusieurs étapes sont nécessaires pour déterminer le degré du strabisme et le traitement approprié.",style: TextStyle(fontSize: 17.00,fontFamily : 'Pacifico_Regular')
                            )
                          ],
                        ),
                        ExpansionTile(
                          title: Text('Le kératocône',style: TextStyle(fontSize: 21.00,fontFamily : 'Brandon_bld',color: const Color(0xFF00B0FF),fontWeight: FontWeight.bold)),
                          leading: Icon(Icons.looks_4),
                          children: <Widget>[
                            Text("Le kératocône est une déformation évolutive de la cornée qui peut diminuer gravement l’acuité visuelle dans certains cas. \n Il doit être pris en charge le plus rapidement possible grâce à un arsenal thérapeutique varié qu’il convient d’adapter pour chaque patient.",style: TextStyle(fontSize: 17.00,fontFamily : 'Pacifico_Regular')
                            )
                          ],
                        ),
                        ExpansionTile(
                          title: Text('La chirurgie réfractive',style: TextStyle(fontSize: 21.00,fontFamily : 'Brandon_bld',color: const Color(0xFF00B0FF),fontWeight: FontWeight.bold)),
                          leading: Icon(Icons.looks_5),
                          children: <Widget>[
                            Text("Aujourd’hui, la chirurgie réfractive est une alternative éprouvée, qui vous permet de vous débarrasser de vous lunettes ou de vous lentilles de contact.\n Pour en savoir si vous êtes un bon candidat pour cette chirurgie, vous devez passer un diagnostic réfractif.",style: TextStyle(fontSize: 17.00,fontFamily : 'Pacifico_Regular')
                            )
                          ],
                        ),
                        ExpansionTile(
                          title: Text('Correction visuelle au laser',style: TextStyle(fontSize: 21.00,fontFamily : 'Brandon_bld',color: const Color(0xFF00B0FF),fontWeight: FontWeight.bold)),
                          leading: Icon(Icons.looks_6),
                          children: <Widget>[
                            Text("On peut  corriger aujourd’hui la myopie (mauvaise vision de loin), l’hypermétropie (mauvaise vision de près), l’astigmatisme (vision déformée par une géométrie irrégulière de l’œil) ou même la presbytie (défaut d’accommodation qui survient avec l’âge). Inventée il y a une trentaine d’années, la technique a progressé, s’est sécurisée et permet aujourd’hui dans la plupart des cas de voir bien dès le lendemain de l’opération.",style: TextStyle(fontSize: 17.00,fontFamily : 'Pacifico_Regular')
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}