import 'package:beautifx/Screens/sensitive.dart';
import 'package:beautifx/jsonmodels/categories.dart';
import 'package:beautifx/jsonmodels/products.dart';
import 'package:beautifx/services/categoryService.dart';
import 'package:beautifx/services/productService.dart';
import 'package:flutter/material.dart';

class Evening extends StatefulWidget {
  @override
  _EveningState createState() => _EveningState();
}

class _EveningState extends State<Evening> {

  Future<Categories> _categoryFuture;
  Future<Products> _productFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _categoryFuture = getCategories();
    _productFuture = getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
             Container(
                decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/bg1.png"),
                fit: BoxFit.fill)
                ),
              ),
             Container(
                child: Image.asset('assets/images/icon3.png',
                width: 130,
                height: 130,
                ),
                 padding: EdgeInsets.only(top:150,left: 230),
              ),
              Container(
                child: Image.asset('assets/images/icon4.png',
                width: 200,
                height: 200,
                ),
                 padding: EdgeInsets.only(right: 100,top: 520 ),
              ),
              SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Stack(
        children: [
          Column(children: [
            Container(child: 
              Center(child: 
                 Padding(
                  padding: EdgeInsets.only(top:15,),
                  child: ButtonTheme(
                    minWidth: 300.0,
                    height: 40.0,
                    child: RaisedButton(
                  child: Text('                      BeautiFx ', 
                  style: TextStyle(fontSize: 36.0, fontFamily: 'Raleway',color: Colors.white,fontWeight: FontWeight.w900,
                  shadows: <Shadow>[
                 Shadow(
                offset: Offset(1.0, 2.0),
                blurRadius: 2.0,
                color: Color.fromARGB(150, 0, 0, 0))]),
                ),
                 color: Color(0xFFFFBE3F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0) 
                ),
                padding: const EdgeInsets.all(0),
                onPressed: (){},
                   ),
                 ),
               ),
             ),
            ),
          ]
         ),
          Padding(
              padding: EdgeInsets.only(top:19,left:16),
              child:
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: new BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                        ),
                      ),
                    ),
                Container(
                  child: Image.asset('assets/images/arr.png',
                  width: 20,
                  height: 20,
                ),
                padding: EdgeInsets.only(top:29,left: 24),
                ),
                Column(children: [
                  Container(child: 
                  Center(child: 
                  Padding(
                    padding: EdgeInsets.only(top:20),
                    child: FlatButton(
                      onPressed: (){
                          Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: EdgeInsets.only(top:48,left:24),
                      ),
                     ),
                    ),
                    ),
                    ),
                   ]
                  ),
              Column(children: [
                  Container(child: 
                    Center(child: 
                      Padding(
                        padding: EdgeInsets.only(top:75,left: 40,right: 40),
                        child: ButtonTheme(
                          minWidth: 220.0,
                          height: 10.0,
                          child: RaisedButton(
                        child: Text('Morning Routine', style: TextStyle(fontSize: 20.0, fontFamily: 'Raleway',color: Color(0xFFFFBE0C),fontWeight: FontWeight.w900,
                        shadows: <Shadow>[
                              Shadow(
                                offset: Offset(-0.3, -0.3),
                                blurRadius: 0.5,
                                color: Color.fromARGB(150, 0, 0, 0),
                              ),])),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          padding: const EdgeInsets.all(5.0),
                          onPressed: (){},
                          elevation: 8.0,
                        ),
                        ),
                        ),
                        ),
                        ),
                    Container(child: 
                        Center(child: 
                          Padding(
                            padding: EdgeInsets.only(top:1,right: 230),
                            child: ButtonTheme(
                              minWidth: 50.0,
                              height: 5.0,
                              child: RaisedButton(
                          child: Padding(
                            padding: EdgeInsets.only(left: 3),
                              child: Container(
                                  child: FutureBuilder<Categories>(
                            future: _categoryFuture,
                            builder: (context,snapshot){
                              if(snapshot.hasError){
                                return Text('Cant load skins');
                              }else if(snapshot.hasData){
                                var temp = snapshot.data.categories;
                                return RichText(
                                    text: TextSpan(
                                      text: 'Step1: ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12
                                      ),
                                      children: [
                                        TextSpan(text:temp[0]['category_name'],style: TextStyle(color: Colors.orange[300],fontWeight: FontWeight.w900)),
                                      ],
                                    ),
                                );
                              }
                              return CircularProgressIndicator();
                            },
                          ),
                                      ),
                                    ),
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              padding: const EdgeInsets.all(5.0),
                              onPressed: (){},
                              elevation: 8.0,
                            ),
                            ),
                            ),
                            ),
                            ), 
                        Container( 
                          child: Center(child: 
                            Padding(
                            padding: EdgeInsets.only(top:1,right: 180),
                              child: Container(
                                  child: Text(
                                       'Products: ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.w900,
                                        fontSize: 10,
                                         ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 150,
                              width: 250,
                              child: FutureBuilder<Products>(
                                future: _productFuture,
                                builder: (context,snapshot){
                                  if(snapshot.hasError){
                                    return Text('Cant load skins');
                                  }else if(snapshot.hasData){
                                    var temp = snapshot.data.products;
                                    return ListView(
                                      physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      padding: EdgeInsets.only(left:15, top:5),
                                      children: [
                                       Column(
                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Text(temp[0]['product_name'],style: TextStyle(fontSize: 12,),),
                                           Text(temp[1]['product_name'],style: TextStyle(fontSize: 12),),
                                           Text(temp[0]['product_name'],style: TextStyle(fontSize: 12),),
                                           Text(temp[1]['product_name'],style: TextStyle(fontSize: 12),),
                                           Text(temp[0]['product_name'],style: TextStyle(fontSize: 12),),
                                           Text(temp[1]['product_name'],style: TextStyle(fontSize: 12),),
                                       ],)
                                      ],
                                    );
                                  }
                                  return CircularProgressIndicator();
                                },
                              ),
                            ),
                          ),
                        Container(child: 
                              Center(child: 
                                Padding(
                                  padding: EdgeInsets.only(top:1,right: 248),
                                  child: ButtonTheme(
                                    minWidth: 50.0,
                                    height: 5.0,
                                    child: RaisedButton(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 3),
                                    child: Container(
                                        child: FutureBuilder<Categories>(
                            future: _categoryFuture,
                            builder: (context,snapshot){
                              if(snapshot.hasError){
                                return Text('Cant load skins');
                              }else if(snapshot.hasData){
                                var temp = snapshot.data.categories;
                                return RichText(
                                    text: TextSpan(
                                      text: 'Step2: ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12
                                      ),
                                      children: [
                                        TextSpan(text:temp[1]['category_name'],style: TextStyle(color: Colors.orange[300],fontWeight: FontWeight.w900)),
                                      ],
                                    ),
                                );
                              }
                              return CircularProgressIndicator();
                            },
                          ),
                                            ),
                                          ),
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    padding: const EdgeInsets.all(5.0),
                                    onPressed: (){},
                                    elevation: 8.0,
                                  ),
                                  ),
                                  ),
                                  ),
                                  ),
                                Container( 
                                  child: Center(child: 
                                    Padding(
                                    padding: EdgeInsets.only(top:1,right: 180),
                                      child: Container(
                                          child: Text(
                                              'Products: ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Raleway',
                                                fontWeight: FontWeight.w900,
                                                fontSize: 10,
                                                ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: 150,
                                        width: 250,
                                          child: FutureBuilder<Products>(
                                            future: _productFuture,
                                            builder: (context,snapshot){
                                              if(snapshot.hasError){
                                                return Text('Cant load skins');
                                              }else if(snapshot.hasData){
                                                var temp = snapshot.data.products;
                                                return ListView(
                                                  physics: const NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  padding: EdgeInsets.only(left:15, top:5),
                                                  children: [
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(temp[0]['product_name'],style: TextStyle(fontSize: 12,),),
                                                      Text(temp[1]['product_name'],style: TextStyle(fontSize: 12),),
                                                      Text(temp[0]['product_name'],style: TextStyle(fontSize: 12),),
                                                      Text(temp[1]['product_name'],style: TextStyle(fontSize: 12),),
                                                      Text(temp[0]['product_name'],style: TextStyle(fontSize: 12),),
                                                      Text(temp[1]['product_name'],style: TextStyle(fontSize: 12),),
                                                  ],)
                                                  ],
                                                );
                                              }
                                              return CircularProgressIndicator();
                                            },
                                          ),
                                        ),
                                      ),
                            Container(child: 
                                Center(child: 
                                  Padding(
                                    padding: EdgeInsets.only(top:1,right: 242),
                                    child: ButtonTheme(
                                      minWidth: 50.0,
                                      height: 5.0,
                                      child: RaisedButton(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 3),
                                      child: Container(
                                          child:FutureBuilder<Categories>(
                            future: _categoryFuture,
                            builder: (context,snapshot){
                              if(snapshot.hasError){
                                return Text('Cant load skins');
                              }else if(snapshot.hasData){
                                var temp = snapshot.data.categories;
                                return RichText(
                                    text: TextSpan(
                                      text: 'Step3: ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12
                                      ),
                                      children: [
                                        TextSpan(text:temp[2]['category_name'],style: TextStyle(color: Colors.orange[300],fontWeight: FontWeight.w900)),
                                      ],
                                    ),
                                );
                              }
                              return CircularProgressIndicator();
                            },
                          ),
                                              ),
                                            ),
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      padding: const EdgeInsets.all(5.0),
                                      onPressed: (){},
                                      elevation: 8.0,
                                    ),
                                    ),
                                    ),
                                    ),
                                    ),
                                     Container( 
                                  child: Center(child: 
                                    Padding(
                                    padding: EdgeInsets.only(top:1,right: 180),
                                      child: Container(
                                          child: Text(
                                              'Products: ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Raleway',
                                                fontWeight: FontWeight.w900,
                                                fontSize: 10,
                                                ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: 150,
                                        width: 250,
                                          child: FutureBuilder<Products>(
                                            future: _productFuture,
                                            builder: (context,snapshot){
                                              if(snapshot.hasError){
                                                return Text('Cant load skins');
                                              }else if(snapshot.hasData){
                                                var temp = snapshot.data.products;
                                                return ListView(
                                                  physics: const NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  padding: EdgeInsets.only(left:15, top:5),
                                                  children: [
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(temp[0]['product_name'],style: TextStyle(fontSize: 12,),),
                                                      Text(temp[1]['product_name'],style: TextStyle(fontSize: 12),),
                                                      Text(temp[0]['product_name'],style: TextStyle(fontSize: 12),),
                                                      Text(temp[1]['product_name'],style: TextStyle(fontSize: 12),),
                                                      Text(temp[0]['product_name'],style: TextStyle(fontSize: 12),),
                                                      Text(temp[1]['product_name'],style: TextStyle(fontSize: 12),),
                                                  ],)
                                                  ],
                                                );
                                              }
                                              return CircularProgressIndicator();
                                            },
                                          ),
                                        ),
                                      ),
                                Container(child: 
                                    Center(child: 
                                      Padding(
                                        padding: EdgeInsets.only(top:1,right: 215),
                                        child: ButtonTheme(
                                          minWidth: 50.0,
                                          height: 5.0,
                                          child: RaisedButton(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 3),
                                          child: Container(
                                              child: FutureBuilder<Categories>(
                            future: _categoryFuture,
                            builder: (context,snapshot){
                              if(snapshot.hasError){
                                return Text('Cant load skins');
                              }else if(snapshot.hasData){
                                var temp = snapshot.data.categories;
                                return RichText(
                                    text: TextSpan(
                                      text: 'Step4: ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12
                                      ),
                                      children: [
                                        TextSpan(text:temp[3]['category_name'],style: TextStyle(color: Colors.orange[300],fontWeight: FontWeight.w900)),
                                      ],
                                    ),
                                );
                              }
                              return CircularProgressIndicator();
                            },
                          ),
                                                  ),
                                                ),
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(0),
                                          ),
                                          padding: const EdgeInsets.all(5.0),
                                          onPressed: (){},
                                          elevation: 8.0,
                                        ),
                                        ),
                                        ),
                                        ),
                                        ),
                                         Container( 
                                  child: Center(child: 
                                    Padding(
                                    padding: EdgeInsets.only(top:1,right: 180),
                                      child: Container(
                                          child: Text(
                                              'Products: ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Raleway',
                                                fontWeight: FontWeight.w900,
                                                fontSize: 10,
                                                ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: 150,
                                        width: 250,
                                          child: FutureBuilder<Products>(
                                            future: _productFuture,
                                            builder: (context,snapshot){
                                              if(snapshot.hasError){
                                                return Text('Cant load skins');
                                              }else if(snapshot.hasData){
                                                var temp = snapshot.data.products;
                                                return ListView(
                                                  physics: const NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  padding: EdgeInsets.only(left:15, top:5),
                                                  children: [
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(temp[0]['product_name'],style: TextStyle(fontSize: 12,),),
                                                      Text(temp[1]['product_name'],style: TextStyle(fontSize: 12),),
                                                      Text(temp[0]['product_name'],style: TextStyle(fontSize: 12),),
                                                      Text(temp[1]['product_name'],style: TextStyle(fontSize: 12),),
                                                      Text(temp[0]['product_name'],style: TextStyle(fontSize: 12),),
                                                      Text(temp[1]['product_name'],style: TextStyle(fontSize: 12),),
                                                  ],)
                                                  ],
                                                );
                                              }
                                              return CircularProgressIndicator();
                                            },
                                          ),
                                        ),
                                      ),
                                    Container(child: 
                                      Center(child: 
                                        Padding(
                                          padding: EdgeInsets.only(top:1,right: 220),
                                          child: ButtonTheme(
                                            minWidth: 50.0,
                                            height: 5.0,
                                            child: RaisedButton(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 3),
                                            child: Container(
                                                child: FutureBuilder<Categories>(
                            future: _categoryFuture,
                            builder: (context,snapshot){
                              if(snapshot.hasError){
                                return Text('Cant load skins');
                              }else if(snapshot.hasData){
                                var temp = snapshot.data.categories;
                                return RichText(
                                    text: TextSpan(
                                      text: 'Step5: ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12
                                      ),
                                      children: [
                                        TextSpan(text:temp[4]['category_name'],style: TextStyle(color: Colors.orange[300],fontWeight: FontWeight.w900)),
                                      ],
                                    ),
                                );
                              }
                              return CircularProgressIndicator();
                            },
                          ),
                                                    ),
                                                  ),
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(0),
                                            ),
                                            padding: const EdgeInsets.all(5.0),
                                            onPressed: (){},
                                            elevation: 8.0,
                                          ),
                                          ),
                                          ),
                                          ),
                                          ),
                                           Container( 
                                  child: Center(child: 
                                    Padding(
                                    padding: EdgeInsets.only(top:1,right: 180),
                                      child: Container(
                                          child: Text(
                                              'Products: ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Raleway',
                                                fontWeight: FontWeight.w900,
                                                fontSize: 10,
                                                ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: 150,
                                        width: 250,
                                          child: FutureBuilder<Products>(
                                            future: _productFuture,
                                            builder: (context,snapshot){
                                              if(snapshot.hasError){
                                                return Text('Cant load skins');
                                              }else if(snapshot.hasData){
                                                var temp = snapshot.data.products;
                                                return ListView(
                                                  physics: const NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  padding: EdgeInsets.only(left:15, top:5),
                                                  children: [
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(temp[0]['product_name'],style: TextStyle(fontSize: 12,),),
                                                      Text(temp[1]['product_name'],style: TextStyle(fontSize: 12),),
                                                      Text(temp[0]['product_name'],style: TextStyle(fontSize: 12),),
                                                      Text(temp[1]['product_name'],style: TextStyle(fontSize: 12),),
                                                      Text(temp[0]['product_name'],style: TextStyle(fontSize: 12),),
                                                      Text(temp[1]['product_name'],style: TextStyle(fontSize: 12),),
                                                  ],)
                                                  ],
                                                );
                                              }
                                              return CircularProgressIndicator();
                                            },
                                          ),
                                        ),
                                      ),
                                            
                ]
             ),
           ],
         ),
        ),
          ],
        ),
    ),
    );
  }
}