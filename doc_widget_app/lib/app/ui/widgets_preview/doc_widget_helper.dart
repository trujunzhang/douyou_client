import 'package:flutter/material.dart';
import 'package:my_plugin/my_plugin.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:mix/mix.dart';
import 'package:app_widgets/app_widgets.dart';
import 'package:doc_widget_app/const/resource.dart' as LocalResource;

class DocWidgetHelper {
  // late List<ParseModelUsers> users;
  // late ParseModelRestaurants restaurant;

  Future<void> setup() async {
    // =====================
    // Models
    // =====================

    // List<dynamic> usersJson =
    //     await loadJsonList(LocalResource.R.ASSETS_JSONS_USERS_JSON);
    // users = usersJson.map((e) => User.fromJson(e)).toList();
    // restaurant = ParseModelRestaurants.fromJson(
    //     await loadJsonObject(LocalResource.R.ASSETS_JSONS_RESTAURANT_JSON));
  }

  ///
  /// Example
  ///
  ElementPreview get button => ElementPreview(
        document: ButtonDocWidget(), // From generated file
        previews: [
          WidgetPreview(
            // This will show your widget and a description about.
            widget: Button(
              'Button',
              onPressed: () => debugPrint('Hello'),
            ),
            description: 'Default button.',
          ),
        ],
      );

  // Menu item
  // ElementPreview get menuItem => ElementPreview(
  //       document: MenuItemDocWidget(), // From generated file
  //       previews: [
  //         WidgetPreview(
  //           // This will show your widget and a description about.
  //           widget: MenuItem(
  //             recipe: recipe,
  //             onItemTap: () => debugPrint('Hello'),
  //           ),
  //           description: 'Menu Item.',
  //         ),
  //       ],
  //     );

}
