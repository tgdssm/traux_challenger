import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traux_challenger/app/controllers/home_controller.dart';
import 'package:traux_challenger/app/utils/globals.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _controller = Get.find<HomeController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.fetchMovies();

    _controller.scrollController = ScrollController()..addListener(() {
      if(_controller.scrollController.offset >= 
         _controller.scrollController.position.maxScrollExtent) {
        if(_controller.currentPage < lastPage) {
          _controller.currentPage++;
          _controller.fetchMovies();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
       child: Container(
         padding: const EdgeInsets.symmetric(horizontal: 15),
         child: Column(
           children: [
             const SizedBox(height: 20,),
             Align(child: Text('Filmes', style: GoogleFonts.montserrat(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),), alignment: Alignment.centerLeft,),
             const SizedBox(height: 20,),

             Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(15),
                 color: const Color(0xffF1F3F5),
               ),
               child: TextField(
                 controller: _controller.searchMovies,
                 onSubmitted: (_){
                   _controller.fSearchMovies();
                 },
                 decoration: const InputDecoration(
                   border: InputBorder.none,
                   hintText: 'Pesquise filmes',
                   prefixIcon: Icon(Icons.search)
                 ),
               ),
             ),
             const SizedBox(height: 20,),
             Flexible(
               child: Obx(
                   () => SizedBox(
                     width: 250,
                     child: ListView.builder(
                         controller: _controller.scrollController,
                         itemCount: _controller.movies.length,
                         shrinkWrap: true,
                         itemBuilder: (context, index) {
                           return InkWell(
                             onTap: (){

                             },
                             child: Container(
                               height: 360,
                               width: 220,
                               decoration: BoxDecoration(
                                 color: Colors.black,
                                 borderRadius: BorderRadius.circular(15),
                                 image: _controller.movies[index].backdropPath == null ? const DecorationImage(
                                     image: AssetImage("assets/images/not_found.png"),
                                     fit: BoxFit.fitHeight
                                 ) : DecorationImage(
                                   image: NetworkImage('$BASE_URL_IMAGE${_controller.movies[index].backdropPath}'),
                                   fit: BoxFit.fitHeight
                                 )
                               ),
                               margin: const EdgeInsets.symmetric(vertical: 15),
                               child: Stack(
                                 children: [
                                   Positioned(
                                     bottom: 0,
                                     child: Container(
                                       height: 150,
                                       width: 250,
                                       padding: const EdgeInsets.symmetric(horizontal: 15),
                                       decoration: BoxDecoration(
                                           gradient: LinearGradient(
                                             begin: Alignment.topCenter,
                                             end: Alignment.bottomCenter,
                                             stops: const [
                                               0.1,
                                               0.4,
                                               0.6,
                                               0.8,
                                             ],
                                             colors: [
                                               Colors.black.withOpacity(.01),
                                               Colors.black.withOpacity(.4),
                                               Colors.black.withOpacity(.6),
                                               Colors.black.withOpacity(.8),
                                             ],
                                           ),
                                         borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))
                                       ),
                                       child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.stretch,
                                         children: [
                                           const SizedBox(height: 60,),
                                           Text(_controller.movies[index].title, style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
                                           const SizedBox(height: 10,),
                                           Text(_controller.getCategories(index), style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300), textAlign: TextAlign.left,),

                                         ],
                                       ),
                                     ),
                                   )
                                 ],
                               ),
                             ),
                           );
                         }
                     ),
                   )
               ),
             )
           ],
         ),
       ),
     ),
    );
  }
}
