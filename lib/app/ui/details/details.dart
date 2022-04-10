import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traux_challenger/app/controllers/details_controller.dart';
import 'package:traux_challenger/app/ui/details/widgets/date_duration.dart';
import 'package:traux_challenger/app/ui/details/widgets/genre_widget.dart';

import '../../utils/globals.dart';

class Details extends StatefulWidget {
  final int id;
  const Details({Key? key, required this.id}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final _controller = Get.find<DetailsController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.fetchMovie(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SafeArea(
        child: Obx(
            () {
              if(_controller.isLoading.value) return const Center(child: CircularProgressIndicator());
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 120,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.arrow_back_ios, color: Colors.black),
                                Text('Voltar', style: TextStyle(color: Colors.black),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Center(
                        child: Container(
                          height: 360,
                          width: 220,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                              image: _controller.movie.backdropPath == null ? const DecorationImage(
                                  image: AssetImage("assets/images/not_found.png"),
                                  fit: BoxFit.fitHeight
                              ) : DecorationImage(
                                  image: NetworkImage('$BASE_URL_IMAGE${_controller.movie.backdropPath}'),
                                  fit: BoxFit.fitHeight
                              )
                          ),),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${_controller.movie.voteAverage}", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                          Text("/10", style: GoogleFonts.montserrat(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Text(_controller.movie.title, style: GoogleFonts.montserrat(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Titulo original: ", style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w300),),
                          SizedBox( width:150,child: Text(_controller.movie.originalTitle, style: GoogleFonts.montserrat(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis,)),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DateDuration(label: "Ano: ", data: _controller.movie.releaseDate!.split('-')[0]),
                          const SizedBox(width: 10,),
                          DateDuration(label: "Duração: ", data: _controller.convertRuntime()),

                        ],
                      ),
                      const SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(_controller.getCategories(), (index) => GenreWidget(genre: _controller.movie.genres![index].name.toUpperCase()))
                            .fold(<Widget>[], (previousValue, element){
                              previousValue.isEmpty ? previousValue.add(element) : previousValue.addAll([const SizedBox(width: 10,), element]);
                              return previousValue;
                        }),
                      ),
                      const SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.centerLeft,
                          child: Text("Descrição", style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w300),)),
                      Text(_controller.movie.overview, style: GoogleFonts.montserrat(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500), textAlign: TextAlign.justify,),
                      const SizedBox(height: 10,),
                      DateDuration(label: "ORÇAMENTO: ", data: _controller.formatCurrency()),
                      const SizedBox(height: 10,),
                      DateDuration(label: "PRODUTORAS: ", data: _controller.getCompanies(), expanded: true,),
                      const SizedBox(height: 10,),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Diretores", style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w300),)),
                      Align(
                        alignment: Alignment.centerLeft,
                          child: Text(_controller.getDirectors(), style: GoogleFonts.montserrat(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500), textAlign: TextAlign.justify,)),
                      const SizedBox(height: 10,),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Elenco", style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w300),)),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(_controller.getCast(), style: GoogleFonts.montserrat(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500), textAlign: TextAlign.justify,)),
                      const SizedBox(height: 30,),
                    ],
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}
