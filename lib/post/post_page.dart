import "package:flutter/material.dart";
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
    _captionController.addListener(() { _onCaptionUpdated();});
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
    return TextField(
      controller: _captionController,
    );
  }

    _onCaptionUpdated() {
      final viewModel = Provider.of<PostViewModel>(context, listen: false);
      viewModel.caption = _captionController.text;
    }
}

