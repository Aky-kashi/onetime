import "package:flutter/material.dart";
import 'package:onetime/screens/publish/confirm_dialog.dart';
import 'package:onetime/screens/publish/time_setting_button.dart';
import 'package:onetime/view_models/post_view_model.dart';
import 'package:provider/provider.dart';

class PublishClassScreen extends StatefulWidget {
  @override
  _PublishClassScreenState createState() => _PublishClassScreenState();
}

class _PublishClassScreenState extends State<PublishClassScreen> {
  final _captionController = TextEditingController();

  @override
  void initState() {
    _captionController.addListener(() {
      _onCaptionUpdated();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _captionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
          actions: [
            ElevatedButton(
                child: Text(
                  '投稿',
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                ),
              onPressed: () => showConfirmedDialog(
                  context: context,
                  title: "投稿",
                  content:"投稿しても良いですか?",
                  onConfirmed: null,

            )
            )],
        ),
        body: Container(
            padding: EdgeInsets.all(5.0),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextField(
                      controller: _captionController,
                      decoration: InputDecoration(
                        hintText: "科目",
                        labelText: '科目',
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextField(
                      controller: _captionController,
                      decoration: InputDecoration(
                        hintText: "具体的に記入してください。",
                        labelText: '生徒:質問内容/先生:教えられる内容',
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ]))));
  }

  _onCaptionUpdated() {
    final viewModel = Provider.of<PostViewModel>(context, listen: false);
    viewModel.caption = _captionController.text;
  }
}
