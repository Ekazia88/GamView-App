import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamview/Models/UsersList.dart';
import 'package:gamview/Provider/usersProvider.dart';
import 'package:provider/provider.dart';

import '../../Models/DataReview.dart';
import '../../Models/UsersDetail.dart';
import '../../Provider/MyListProvider.dart';
import '../../Screen/Game_page.dart';
import '../../Screen/EditListPage.dart';

class SectItem extends StatelessWidget {
  const SectItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyListProvider myListProvider = Provider.of(context);
    UsersProviders user = context.read<UsersProviders>();
     user.getUsers();

     UsersDetail? usersdetail = user.users;
     myListProvider.GetUsersList(usersdetail!.Uid, myListProvider.status);
     List <MyList> listx = myListProvider.Lists;
     if(usersdetail == null){
      return CircularProgressIndicator();
     }else{
          return listx.isEmpty ?
          Center(
            child: Text("Yah!! anda belum isi"),
          ):
          ListView.builder(
            shrinkWrap: true,
            itemCount: myListProvider.Lists.length,
            itemBuilder: (context, index) {
              MyList list = listx[index];

                   return CardBoxList(
                      TahunRilis: list.Released,
                      id: list.idGame,
                      image: dtr[index].imagepath,
                      title: list.name,
                      platform: list.listplatform.join(","),
                      Status: myListProvider.status,
                      uid: user.uid!,
                      idx:index,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return GamePage(Idx: index);
                          }),
                        );
                      },
                      onPressed: () async{
                        myListProvider.removeList(
                          usersdetail!.Uid,
                          myListProvider.status,   
                          list.idGame,
                        );
                      },
                      list: list,
                    );}
                    );

        }
      }
}
class CardBoxList extends StatelessWidget {
  const CardBoxList({
    Key? key,
    required this.id,
    required this.image,
    required this.title,
    required this.platform,
    required this.onTap,
    required this.TahunRilis,
    required this.onPressed, 
    required this.list, required this.uid, required this.Status,
    required this.idx

  }) : super(key: key);

  final String id;
  final String image;
  final String title;
  final String platform;
  final String TahunRilis;
  final void Function()? onTap;
  final void Function()? onPressed;
  final MyList list;
  final String uid;
  final String Status;
  final int idx;

  @override
  Widget build(BuildContext context) {
      return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Container(
          height: 120,
          color: Colors.blueGrey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 18,
                          ),
                    ),
                    Text(
                      platform,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                    ),
                    Text(
                      TahunRilis,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit_document),
                          iconSize: 30,
                          onPressed: (){
                               Navigator.of(context).push(
  MaterialPageRoute(
    builder: (context) {
      return EditListPage(
          idx: list.idGame,
          uid: uid,
          status: Status,
          list : list,
        );
    },
  ),
);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete_rounded),
                          iconSize: 30,
                          onPressed: onPressed,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  }
    
 