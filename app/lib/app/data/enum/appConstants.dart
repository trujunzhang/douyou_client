import 'Types.dart';

class AppConstants {
  static Map<Types_modal, String> realmTypes = {
    Types_modal.PARSE_RECORDS: 'record',
    Types_modal.PARSE_RESTAURANTS: 'restaurant',
    Types_modal.PARSE_EVENTS: 'event',
    Types_modal.PARSE_PEOPLE_IN_EVENTS: 'peopleInEvent',
    Types_modal.PARSE_USERS: 'user',
    Types_modal.PARSE_RECIPES: 'recipe',
    Types_modal.PARSE_PHOTOS: 'photo',
    Types_modal.PARSE_REVIEWS: 'review'
  };

  static Map<Types_modal, String> realmObjectTypes = {
    Types_modal.PARSE_RECORDS: 'Records',
    Types_modal.PARSE_RESTAURANTS: 'Restaurants',
    Types_modal.PARSE_EVENTS: 'Events',
    Types_modal.PARSE_PEOPLE_IN_EVENTS: 'PeopleInEvents',
    Types_modal.PARSE_USERS: 'Users',
    Types_modal.PARSE_RECIPES: 'Recipes',
    Types_modal.PARSE_PHOTOS: 'Photos',
    Types_modal.PARSE_REVIEWS: 'Reviews'
  };
}
