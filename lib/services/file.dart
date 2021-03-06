import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

RegExp invalidChars = RegExp(r'[\\\/:*?"<>|]');

class FileService {
  Future<String> get getDownloadFolder async {
    try {
      Directory? directory = await getDownloadsDirectory();

      return directory!.path;
    } catch (error) {
      if (error is UnsupportedError) {
        return throw Exception(error.message);
      }

      return throw Exception('Something went wrong');
    }
  }

  Future<bool> get isDownloadFolderExists async {
    Directory? downloadFolder = await getDownloadsDirectory();

    return await downloadFolder?.exists() ?? false;
  }

  Future<String> mapWithDownloadFolder(String name) async {
    return join(await getDownloadFolder, name);
  }

  Future<String> getTempSavePath(String title) async {
    String titleWithoutInvalidChars = removeInvalidChars(title);
    String temporarySavePath =
        'Unconfirmed $titleWithoutInvalidChars - ${DateTime.now().millisecondsSinceEpoch}.bd';

    return await mapWithDownloadFolder(temporarySavePath);
  }

  Future<String> getSavePath(String title, String extension) async {
    String titleWithoutInvalidChars = removeInvalidChars(title);
    String savePath =
        '$titleWithoutInvalidChars - ${DateTime.now().millisecondsSinceEpoch}.$extension';

    return await mapWithDownloadFolder(savePath);
  }

  String removeInvalidChars(String value) {
    return value.replaceAll(invalidChars, '');
  }
}

FileService fileService = FileService();
