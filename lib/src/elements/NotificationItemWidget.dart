import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../helpers/swipe_widget.dart';
import '../models/notification.dart' as model;

class NotificationItemWidget extends StatelessWidget {
  model.Notification notification;
  VoidCallback onMarkAsRead;
  VoidCallback onMarkAsUnRead;
  VoidCallback onRemoved;

  NotificationItemWidget({Key key, this.notification, this.onMarkAsRead, this.onMarkAsUnRead, this.onRemoved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnSlide(
      backgroundColor: notification.read ? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).primaryColor,
      items: <ActionItems>[
        ActionItems(
            icon: new IconButton(
              icon: notification.read ? new Icon(Icons.panorama_fish_eye) : new Icon(Icons.brightness_1),
              onPressed: () {},
              color: Theme.of(context).accentColor,
            ),
            onPress: () {
              if (notification.read) {
                onMarkAsUnRead();
              } else {
                onMarkAsRead();
              }
            },
            backgroudColor: Theme.of(context).scaffoldBackgroundColor),
        new ActionItems(
            icon: new IconButton(
              padding: EdgeInsets.only(right: 10),
              icon: new Icon(Icons.delete),
              onPressed: () {
                print('onPressed');
              },
              color: Theme.of(context).accentColor,
            ),
            onPress: () {
              onRemoved();
            },
            backgroudColor: Theme.of(context).scaffoldBackgroundColor),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: CachedNetworkImage(
                height: 65,
                width: 65,
                fit: BoxFit.cover,
                imageUrl: this.notification.type.image.thumb,
                placeholder: (context, url) => Image.asset(
                  'assets/img/loading.gif',
                  fit: BoxFit.cover,
                  height: 65,
                  width: 65,
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(width: 15),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    this.notification.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context)
                        .textTheme
                        .body2
                        .merge(TextStyle(fontWeight: notification.read ? FontWeight.w300 : FontWeight.w600)),
                  ),
                  Text(
                    DateFormat('yyyy-MM-dd').format(notification.dateTime),
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
