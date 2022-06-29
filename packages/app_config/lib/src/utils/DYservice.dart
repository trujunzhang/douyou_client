


import 'dart:math';

abstract class DYservice {
  // 获取直播间列表
  // static Future<List> getLiveData(context, [ pageIndex ]) async {
  //   final counterBloc = BlocProvider.of<CounterBloc>(context);
  //   int livePageIndex = BlocObj.counter.state;

  //   var res = await httpClient.get(
  //     API.liveData,
  //     queryParameters: {
  //       'page': pageIndex == null ? livePageIndex : pageIndex
  //     },
  //     options: livePageIndex == 1 ? buildCacheOptions(
  //       Duration(minutes: 30),
  //     ) : null,
  //   );

  //   // counterBloc.add(CounterEvent.increment);
  //   return res.data['data']['list'];
  // }

  // 格式化数值
  static String formatNum(int number) {
    if (number > 10000) {
      var str = DYservice._formatNum(number / 10000, 1);
      if (str.split('.')[1] == '0') {
        str = str.split('.')[0];
      }
      return str + '万';
    }
    return number.toString();
  }
  static String _formatNum(double number, int postion) {
    if((number.toString().length - number.toString().lastIndexOf(".") - 1) < postion) {
      // 小数点后有几位小数
      return ( number.toStringAsFixed(postion).substring(0, number.toString().lastIndexOf(".")+postion + 1).toString());
    } else {
      return ( number.toString().substring(0, number.toString().lastIndexOf(".") + postion + 1).toString());
    }
  }

  // 格式化时间
  static String formatTime(int timeSec) {
    var date = DateTime.fromMillisecondsSinceEpoch(timeSec * 1000);
    var now = DateTime.now();
    var yesterday = DateTime.fromMillisecondsSinceEpoch(now.millisecondsSinceEpoch - 24 * 60 * 60 * 1000);

    if (date.year == now.year && date.month == now.month && date.day == now.day) {
      return '今天${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
    } else if (date.year == yesterday.year && date.month == yesterday.month && date.day == yesterday.day) {
      return '昨天${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
    }
    return '${date.year.toString()}-${date.month.toString().padLeft(2,'0')}-${date.day.toString().padLeft(2,'0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
  
  // 生成随机串
  static dynamic randomBit(int len, { String? type }) {
    String character = type == 'num' ? '0123456789' : 'qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM';
    String left = '';
    for (var i = 0; i < len; i++) {
      left = left + character[Random().nextInt(character.length)]; 
    }
    return type == 'num' ? int.parse(left) : left;
  }
}