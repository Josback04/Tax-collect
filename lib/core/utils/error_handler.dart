import 'dart:io';

import 'package:dio/dio.dart';
import 'package:drift/native.dart';
import 'package:drift/remote.dart';
import 'package:either_dart/either.dart';
import 'package:tax_collect/generated/locale_keys.g.dart';

import '../models/failure.dart';
import '../models/message_error.dart';

Future<Either<Failure, T>> errorHandler<T>(
  AsyncCallback<T> asyncCallback,
) async {
  try {
    return Right(await asyncCallback());
  } on SocketException catch (e) {
    final error = Failure(
      '${e.runtimeType}',
      e.message,
      e,
    );
    return Left(error);
  } on DioException catch (e) {
    var message = LocaleKeys.error_happened;
    switch (e.response?.statusCode) {
      case 401:
        message = LocaleKeys.error_401;
      case 403:
        message = LocaleKeys.error_403;
      case 404:
        message = LocaleKeys.error_404;
      case 500:
      case 502:
      case 504:
        message = LocaleKeys.error_500;
    }
    if (e.type == DioExceptionType.connectionError) {
      message = LocaleKeys.error_connection;
    }
    final error = Failure(
      '${e.runtimeType}',
      message,
      e,
    );
    return Left(error);
  } on SqliteException catch (e) {
    var message = LocaleKeys.error_db;
    if (e.message.contains('ON CONFLICT') ||
        e.message.contains('UNIQUE constraint')) {
      message = LocaleKeys.error_db_conflict;
    }
    final error = Failure(
      '${e.runtimeType}',
      message,
      e,
    );
    return Left(error);
  } on DriftRemoteException catch (e) {
    var message = LocaleKeys.error_db;
    if (e.remoteStackTrace.toString().contains("ON CONFLICT")) {
      message = LocaleKeys.error_db_conflict;
    }
    final error = Failure(
      '${e.runtimeType}',
      message,
      e,
    );

    return Left(error);
  } on UnimplementedError catch (e) {
    final error = Failure(
      '${e.runtimeType}',
      '${e.message}',
      e,
    );
    return Left(error);
  } on MessageError catch (e) {
    final error = Failure(
      e.title,
      e.message,
      e,
    );
    return Left(error);
  } catch (e) {
    final error = Failure(
      '${e.runtimeType}',
      '$e',
      e,
    );
    return Left(error);
  }
}

typedef AsyncCallback<T> = Future<T> Function();
