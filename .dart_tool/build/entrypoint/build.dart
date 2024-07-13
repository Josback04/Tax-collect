// ignore_for_file: directives_ordering
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:build_runner_core/build_runner_core.dart' as _i1;
import 'package:retrofit_generator/retrofit_generator.dart' as _i2;
import 'package:json_serializable/builder.dart' as _i3;
import 'package:hive_generator/hive_generator.dart' as _i4;
import 'package:drift_dev/integrations/build.dart' as _i5;
import 'package:copy_with_extension_gen/builder.dart' as _i6;
import 'package:source_gen/builder.dart' as _i7;
import 'package:flutter_gen_runner/flutter_gen_runner.dart' as _i8;
import 'package:auto_route_generator/builder.dart' as _i9;
import 'package:build_resolvers/builder.dart' as _i10;
import 'dart:isolate' as _i11;
import 'package:build_runner/build_runner.dart' as _i12;
import 'dart:io' as _i13;

final _builders = <_i1.BuilderApplication>[
  _i1.apply(
    r'retrofit_generator:retrofit_generator',
    [_i2.retrofitBuilder],
    _i1.toDependentsOf(r'retrofit_generator'),
    hideOutput: true,
    appliesBuilders: const [r'source_gen:combining_builder'],
  ),
  _i1.apply(
    r'json_serializable:json_serializable',
    [_i3.jsonSerializable],
    _i1.toDependentsOf(r'json_serializable'),
    hideOutput: true,
    appliesBuilders: const [r'source_gen:combining_builder'],
  ),
  _i1.apply(
    r'hive_generator:hive_generator',
    [_i4.getBuilder],
    _i1.toDependentsOf(r'hive_generator'),
    hideOutput: true,
    appliesBuilders: const [r'source_gen:combining_builder'],
  ),
  _i1.apply(
    r'drift_dev:preparing_builder',
    [_i5.preparingBuilder],
    _i1.toNoneByDefault(),
    hideOutput: true,
    appliesBuilders: const [r'drift_dev:cleanup'],
  ),
  _i1.apply(
    r'drift_dev:drift_dev',
    [
      _i5.discover,
      _i5.analyzer,
      _i5.driftBuilder,
    ],
    _i1.toDependentsOf(r'drift_dev'),
    hideOutput: true,
    appliesBuilders: const [
      r'source_gen:combining_builder',
      r'drift_dev:preparing_builder',
    ],
  ),
  _i1.apply(
    r'copy_with_extension_gen:copy_with_extension_gen',
    [_i6.copyWith],
    _i1.toDependentsOf(r'copy_with_extension_gen'),
    hideOutput: true,
    appliesBuilders: const [r'source_gen:combining_builder'],
  ),
  _i1.apply(
    r'source_gen:combining_builder',
    [_i7.combiningBuilder],
    _i1.toNoneByDefault(),
    hideOutput: false,
    appliesBuilders: const [r'source_gen:part_cleanup'],
  ),
  _i1.apply(
    r'flutter_gen_runner:flutter_gen_runner',
    [_i8.build],
    _i1.toDependentsOf(r'flutter_gen_runner'),
    hideOutput: false,
  ),
  _i1.apply(
    r'drift_dev:analyzer',
    [
      _i5.discover,
      _i5.analyzer,
    ],
    _i1.toNoneByDefault(),
    hideOutput: true,
    appliesBuilders: const [r'drift_dev:preparing_builder'],
  ),
  _i1.apply(
    r'drift_dev:not_shared',
    [_i5.driftBuilderNotShared],
    _i1.toNoneByDefault(),
    hideOutput: false,
  ),
  _i1.apply(
    r'drift_dev:modular',
    [_i5.modular],
    _i1.toNoneByDefault(),
    hideOutput: false,
    appliesBuilders: const [r'drift_dev:analyzer'],
  ),
  _i1.apply(
    r'auto_route_generator:auto_route_generator',
    [_i9.autoRouteBuilder],
    _i1.toDependentsOf(r'auto_route_generator'),
    hideOutput: true,
  ),
  _i1.apply(
    r'auto_route_generator:auto_router_module_generator',
    [_i9.autoRouterModuleBuilder],
    _i1.toDependentsOf(r'auto_route_generator'),
    hideOutput: false,
  ),
  _i1.apply(
    r'auto_route_generator:auto_router_generator',
    [_i9.autoRouterBuilder],
    _i1.toDependentsOf(r'auto_route_generator'),
    hideOutput: false,
  ),
  _i1.apply(
    r'build_resolvers:transitive_digests',
    [_i10.transitiveDigestsBuilder],
    _i1.toAllPackages(),
    isOptional: true,
    hideOutput: true,
    appliesBuilders: const [r'build_resolvers:transitive_digest_cleanup'],
  ),
  _i1.applyPostProcess(
    r'build_resolvers:transitive_digest_cleanup',
    _i10.transitiveDigestCleanup,
  ),
  _i1.applyPostProcess(
    r'source_gen:part_cleanup',
    _i7.partCleanup,
  ),
  _i1.applyPostProcess(
    r'drift_dev:cleanup',
    _i5.driftCleanup,
  ),
];
void main(
  List<String> args, [
  _i11.SendPort? sendPort,
]) async {
  var result = await _i12.run(
    args,
    _builders,
  );
  sendPort?.send(result);
  _i13.exitCode = result;
}
