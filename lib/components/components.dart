import 'package:flutter/material.dart';
import 'package:news_app/web_view/web_view_screen.dart';

Widget buildArticleItem(article,context) => InkWell(
  onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewScreen(url: article['url'],)));
  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

          height: 120,

          width: 120,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10),

            image: DecorationImage(image: NetworkImage('${article['urlToImage']}'),fit: BoxFit.cover),



          ),

        ),

        SizedBox(width: 20,),

        Expanded(

          child: Container(

            height: 120,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.start,

              children: [

                Expanded(

                  child: Text('${article['title']}',

                    maxLines: 4,

                    overflow: TextOverflow.ellipsis,

                    style: Theme.of(context).textTheme.bodyText1,

                  ),

                ),

                Text('${article['publishedAt']}',

                  style: TextStyle(

                    fontSize: 18,

                    color: Colors.grey,

                    fontWeight: FontWeight.w600,

                  ),

                ),

              ],

            ),

          ),

        ),

      ],

    ),

  ),
);

Widget defulutTextFormFild ({@required TextEditingController controller, @required Function  validator, @required TextInputType type, @required String label, Color BorderSideColor:Colors.deepOrange, @required IconData prefixIcon})=>
    TextFormField(
      validator:validator(),
      controller:controller,
      keyboardType: type,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefixIcon,color: Colors.deepOrange,),
      ),

    );

