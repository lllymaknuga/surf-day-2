import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  List<String> images = [];
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(33, 33, 33, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(46, 46, 46, 1),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop({
              'select': false,
            }),
          ),
          title: const Text('Фотограции'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Кол-во изоображений: ${images.length}',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(46, 46, 46, 1),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                hintText: 'Введите url',
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(46, 46, 46, 1),
                  ),
                  onPressed: () {
                    if (images.isNotEmpty) {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          backgroundColor: const Color.fromRGBO(46, 46, 46, 1),
                          title: const Text(
                            'Удаление из списка',
                            style: TextStyle(color: Colors.white),
                          ),
                          content: Image.network(images.last),
                          actions: <Widget>[
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: const Color.fromRGBO(46, 46, 46, 1),
                              ),
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Отмена'),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: const Color.fromRGBO(46, 46, 46, 1),
                              ),
                              onPressed: () {
                                setState(() {
                                  images.remove(images.last);
                                });
                                Navigator.pop(context);
                              },
                              child: const Text('Да'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Удалить последнее фото',
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(46, 46, 46, 1),
                  ),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          backgroundColor: const Color.fromRGBO(46, 46, 46, 1),
                          title: const Text(
                            'Добавдение в список',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          content: Image.network(_controller.text),
                          actions: <Widget>[
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: const Color.fromRGBO(46, 46, 46, 1),
                              ),
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Отмена'),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: const Color.fromRGBO(46, 46, 46, 1),
                              ),
                              onPressed: images.length <= 9
                                  ? () {
                                      setState(() {
                                        images.add(_controller.text);
                                        _controller.text = '';
                                      });
                                      Navigator.pop(context);
                                    }
                                  : null,
                              child: const Text('Добавить'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Добавить фото',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(46, 46, 46, 1),
                ),
                onPressed: () {
                  if (images.isNotEmpty) {
                    Navigator.of(context).pop(
                      {
                        'select': true,
                        'images': images,
                      },
                    );
                  } else {
                    Navigator.of(context).pop(
                      {
                        'select': false,
                      },
                    );
                  }
                },
                child: const Text('Перейти к отправке'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
