// This file has been generated by the reflectable package.
// https://github.com/dart-lang/reflectable.

import 'dart:core';
import 'package:dart_json_mapper/src/model/annotations.dart' as prefix0;
import 'package:zapfmaster2k20/core/db/domain/news_item.dart' as prefix1;

// ignore_for_file: unnecessary_const
// ignore_for_file: prefer_collection_literals
// ignore_for_file: prefer_adjacent_string_concatenation

// ignore:unused_import
import 'package:reflectable/mirrors.dart' as m;
// ignore:unused_import
import 'package:reflectable/src/reflectable_builder_based.dart' as r;
// ignore:unused_import
import 'package:reflectable/reflectable.dart' as r show Reflectable;

final _data = <r.Reflectable, r.ReflectorData>{
  const prefix0.JsonSerializable(): r.ReflectorData(
      <m.TypeMirror>[
        r.NonGenericClassMirrorImpl(
            r'NewsDetails',
            r'.NewsDetails',
            519,
            0,
            const prefix0.JsonSerializable(),
            const <int>[0],
            const <int>[1, 2, 3, 4, 5],
            const <int>[],
            -1,
            {},
            {},
            {},
            -1,
            0,
            const <int>[],
            const <Object>[
              prefix0.jsonSerializable,
              const prefix0.Json(typeNameProperty: 'typeName')
            ],
            null),
        r.NonGenericClassMirrorImpl(
            r'UserTappedNewsDetails',
            r'.UserTappedNewsDetails',
            7,
            1,
            const prefix0.JsonSerializable(),
            const <int>[6],
            const <int>[1, 2, 3, 4, 5],
            const <int>[],
            0,
            {},
            {},
            {r'': (b) => () => b ? prefix1.UserTappedNewsDetails() : null},
            -1,
            1,
            const <int>[],
            const <Object>[prefix0.jsonSerializable],
            null)
      ],
      <m.DeclarationMirror>[
        r.MethodMirrorImpl(r'', 64, 0, -1, 0, 0, const <int>[], const <int>[],
            const prefix0.JsonSerializable(), const []),
        r.MethodMirrorImpl(r'==', 131074, null, -1, 2, 2, const <int>[],
            const <int>[0], const prefix0.JsonSerializable(), const []),
        r.MethodMirrorImpl(r'toString', 131074, null, -1, 3, 3, const <int>[],
            const <int>[], const prefix0.JsonSerializable(), const []),
        r.MethodMirrorImpl(
            r'noSuchMethod',
            65538,
            null,
            null,
            null,
            null,
            const <int>[],
            const <int>[1],
            const prefix0.JsonSerializable(),
            const []),
        r.MethodMirrorImpl(r'hashCode', 131075, null, -1, 4, 4, const <int>[],
            const <int>[], const prefix0.JsonSerializable(), const []),
        r.MethodMirrorImpl(
            r'runtimeType',
            131075,
            null,
            -1,
            5,
            5,
            const <int>[],
            const <int>[],
            const prefix0.JsonSerializable(),
            const []),
        r.MethodMirrorImpl(r'', 64, 1, -1, 1, 1, const <int>[], const <int>[],
            const prefix0.JsonSerializable(), const [])
      ],
      <m.ParameterMirror>[
        r.ParameterMirrorImpl(
            r'other',
            16390,
            1,
            const prefix0.JsonSerializable(),
            null,
            null,
            null,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'invocation',
            32774,
            3,
            const prefix0.JsonSerializable(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            null,
            null)
      ],
      <Type>[
        prefix1.NewsDetails,
        prefix1.UserTappedNewsDetails,
        bool,
        String,
        int,
        Type,
        Invocation
      ],
      2,
      {
        r'==': (dynamic instance) => (x) => instance == x,
        r'toString': (dynamic instance) => instance.toString,
        r'noSuchMethod': (dynamic instance) => instance.noSuchMethod,
        r'hashCode': (dynamic instance) => instance.hashCode,
        r'runtimeType': (dynamic instance) => instance.runtimeType
      },
      {},
      null,
      [])
};

final _memberSymbolMap = null;

void initializeReflectable() {
  r.data = _data;
  r.memberSymbolMap = _memberSymbolMap;
}
