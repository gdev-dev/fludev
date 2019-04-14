// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class ExpansionTileWechat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter展示'),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) =>
              EntryItem(data[index]),
          itemCount: data.length,
        ),
      ),
    );
  }
}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);
  final String title;
  final List<Entry> children;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    '组件',
    <Entry>[
      Entry(
        '视图容器',
        <Entry>[
          Entry('view'),
          Entry('scroll-view'),
          Entry('swiper'),
          Entry('movable-view'),
          Entry('cover-view'),
        ],
      ),
      Entry(
        '基础内容',
        <Entry>[
          Entry('text'),
          Entry('icon'),
          Entry('progress'),
          Entry('rich-text'),
        ],
      ),
      Entry(
        '表单组件',
        <Entry>[
          Entry('button'),
          Entry('checkbox'),
          Entry('form'),
          Entry('input'),
          Entry('label'),
          Entry('picker'),
          Entry('picker-view'),
          Entry('radio'),
          Entry('slider'),
          Entry('switch'),
          Entry('textarea'),
        ],
      ),
      Entry(
        '导航',
        <Entry>[
          Entry('navigator'),
        ],
      ),
      Entry(
        '媒体组件',
        <Entry>[
          Entry('image'),
          Entry('audio'),
          Entry('video'),
          Entry('camera'),
        ],
      ),
      Entry(
        '地图',
        <Entry>[
          Entry('map'),
        ],
      ),
      Entry(
        '画布',
        <Entry>[
          Entry('canvas'),
        ],
      ),
      Entry(
        '开放能力',
        <Entry>[
          Entry('ad'),
          Entry('open-data'),
          Entry('web-view'),
        ],
      ),
    ],
  ),
  Entry(
    '接口',
    <Entry>[
      Entry(
        '开放接口',
        <Entry>[
          Entry('微信登录'),
          Entry('获取用户信息'),
          Entry('发起支付'),
          Entry('转发'),
          Entry('转发按钮'),
          Entry('客服消息'),
          Entry('模板消息'),
          Entry('收货地址'),
          Entry('获取发票抬头'),
          Entry('生物认证'),
          Entry('设置'),
        ],
      ),
      Entry(
        '界面',
        <Entry>[
          Entry('设置界面标题'),
          Entry('标题栏加载动画'),
          Entry('设置TabBar'),
          Entry('页面跳转'),
          Entry('下拉刷新'),
          Entry('创建动画'),
          Entry('创建绘画'),
          Entry('显示操作菜单'),
          Entry('显示模态弹窗'),
          Entry('页面滚动'),
          Entry('显示消息提示框'),
          Entry('获取节点信息'),
          Entry('节点布局相交状态'),
        ],
      ),
      Entry(
        '设备',
        <Entry>[
          Entry('获取手机网络状态'),
          Entry('监听手机网络变化'),
          Entry('获取手机系统信息'),
          Entry('监听重力感应数据'),
          Entry('监听罗盘数据'),
          Entry('打电话'),
          Entry('扫码'),
          Entry('剪切板'),
          Entry('蓝牙'),
          Entry('iBeacon'),
          Entry('屏幕亮度'),
          Entry('用户截屏事件'),
          Entry('振动'),
          Entry('手机联系人'),
          Entry('Wi-Fi'),
        ],
      ),
      Entry(
        '网络',
        <Entry>[
          Entry('发起一个请求'),
          Entry('WebSocket'),
          Entry('上传文件'),
          Entry('下载文件'),
        ],
      ),
      Entry(
        '媒体',
        <Entry>[
          Entry('图片'),
          Entry('录音'),
          Entry('背景音频'),
          Entry('文件'),
          Entry('视频'),
          Entry('动态加载字体'),
        ],
      ),
      Entry(
        '位置',
        <Entry>[
          Entry('获取当前位置'),
          Entry('使用原生地图查看位置'),
          Entry('使用原生地图选择位置'),
        ],
      ),
      Entry('数据'),
      Entry('多线程'),
    ],
  ),
  Entry(
    '云开发',
    <Entry>[
      Entry(
        '用户鉴权',
        <Entry>[
          Entry('获取OpenID'),
        ],
      ),
      Entry(
        '数据库',
        <Entry>[
          Entry('基本操作'),
          Entry('权限管理'),
          Entry('服务断时间'),
        ],
      ),
      Entry(
        '存储',
        <Entry>[
          Entry('上传文件'),
          Entry('下载文件'),
          Entry('删除文件'),
          Entry('切换临时链接'),
          Entry('组件支持'),
        ],
      ),
      Entry(
        '云函数',
        <Entry>[
          Entry('FLContext'),
          Entry('数据库'),
          Entry('存储'),
          Entry('云调用'),
        ],
      ),
    ],
  ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

void main() {
  runApp(new ExpansionTileWechat());
}

/*
Sample Catalog
Title: ExpansionTile
Summary: An ExpansionTile for building nested lists, with two or more levels.
Description:
This app displays hierarchical data with ExpansionTiles. Tapping a tile
expands or collapses the view of its children. When a tile is collapsed
its children are disposed so that the widget footprint of the list only
reflects what's visible.
When displayed within a scrollable that creates its list items lazily,
like a scrollable list created with `ListView.builder()`, ExpansionTiles
can be quite efficient, particularly for material design "expand/collapse"
lists.
Classes: ExpansionTile, ListView
Sample: ExpansionTileSample
See also:
  - The "expand/collapse" part of the material design specification:
    <https://material.io/guidelines/components/lists-controls.html#lists-controls-types-of-list-controls>
*/
