import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final String name = 'infinite_scroll';
  final ScrollController scrollController = ScrollController();
  final List<int> scrollItems = [1, 2, 3, 4];
  bool isLoading = false;
  bool isMount = false;

  void addFiveImage() {
    final lasId = scrollItems.last;
    scrollItems.addAll([1, 2, 3, 6, 7].map((e) => lasId + e));
  }

  Future loadingImages() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(milliseconds: 1500));

    addFiveImage();
    isLoading = false;

    if (!isMount) return;

    setState(() {});
    moveToBottom();
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    final lasId = scrollItems.last;
    scrollItems.clear();
    scrollItems.add(lasId + 1);
    addFiveImage();
    isLoading = false;
    setState(() {});
  }

  void moveToBottom() {
    if (scrollController.position.pixels + 150 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(scrollController.position.pixels + 150,
        duration: const Duration(microseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  @override
  void initState() {
    super.initState();
    isMount = true;

    scrollController.addListener(() async {
      // pixels => es la posicion en la que nos encontramos
      // maxScrollExtent => es la posicion final
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        await loadingImages();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    isMount = false;

    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Infinite Scroll'),
      ),
      // MediaQuery.removePadding => remuve el padding
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          edgeOffset: 10,
          strokeWidth: 2,
          onRefresh: () => onRefresh(),
          child: ListView.builder(
            controller: scrollController,
            itemCount: scrollItems.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                  // el placeholder me permite color algo mientras carga
                  placeholder: const AssetImage('assets/imgs/1.png'),
                  image: NetworkImage(
                      'https://picsum.photos/id/${scrollItems[index]}/500/300'));
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
