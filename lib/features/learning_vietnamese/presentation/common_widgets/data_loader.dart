import 'dart:async';
import 'package:flutter/material.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/presentation/common_widgets/widget_loading.dart';
import 'package:learning_vietnamese/features/learning_vietnamese/presentation/common_widgets/widget_reload.dart';

enum DataStatus {
  none,
  loading,
  error,
  hasData,
  empty,
}

typedef DataLoaderBuilder<T> = Widget Function(T data);

class DataLoader<T> extends StatefulWidget {
  /// Function để lấy dữ liệu (ví dụ: gọi API) và return dữ liệu muốn lấy,
  /// nếu ko lấy được dữ liệu (ví dụ: API trả về lỗi) thì return null.
  final Future<T> Function() loadData;

  /// Function return Widget để hiển thị dữ liệu nếu lấy dữ liệu thành công (hàm [loadData] return khác null).
  final DataLoaderBuilder<T> builder;

  /// Widget khi lấy được dữ liệu dạng list nhưng trống.
  final Widget emptyBuilder;

  /// Widget hiển thị khi đang load dữ liệu
  final Widget loadingBuilder;

  /// trạng thái khởi tạo ban đầu, mặc định là DataStatus.loading
  final DataStatus initStatus;

  /// controller để lấy trạng thái hiện tại hoặc để load lại dữ liệu (ví dụ pull to refresh)
  final DataLoaderController<T> controller;

  /// Chiều cao của khối khi đang load dữ liệu (hiển thị hình loading) và khi load dữ liệu bị lỗi (hiển thị nút reload).
  /// Nếu widget cha của DataLoader đã set chiều cao thì thôi.
  final double height;

  /// Background color của khối khi đang load dữ liệu (hiển thị hình loading) và khi load dữ liệu bị lỗi (hiển thị nút reload)
  final Color backgroundColor;

  const DataLoader({
    @required this.loadData,
    @required this.builder,
    this.emptyBuilder,
    this.loadingBuilder,
    this.initStatus = DataStatus.loading,
    this.controller,
    this.height,
    this.backgroundColor,
  });

  @override
  _DataLoaderState<T> createState() => _DataLoaderState<T>();
}

class _DataLoaderState<T> extends State<DataLoader<T>> with AutomaticKeepAliveClientMixin<DataLoader<T>> {
  @override
  bool get wantKeepAlive => true;

  StreamController<DataStatus> streamDataStatus;
  DataStatus _currentStatus;
  DataStatus get currentStatus => _currentStatus;

  T data;

  @override
  void initState() {
    super.initState();
    _currentStatus = widget.initStatus;
    streamDataStatus = StreamController<DataStatus>.broadcast();
    streamDataStatus.stream.listen((status) {
      _currentStatus = status;
    });
    if (widget.initStatus == DataStatus.loading) getData(widget.loadData, autoReload: true);
    if (widget.controller == null) return;
    widget.controller.bindState(this);
    if (widget.controller.loadData == null) {
      widget.controller.addLoadData(() => getData(widget.loadData));
    } else {
      Future<T> Function() fetchData = widget.controller.loadData;
      widget.controller.addLoadData(() => getData(fetchData));
    }
  }

  @override
  void dispose() {
    streamDataStatus.close();
    widget.controller?.dispose();
    super.dispose();
  }

  Future<T> getData(Future<T> Function() loadData, {bool autoReload = false}) async {
    streamDataStatus.sink.add(DataStatus.loading);
    if (autoReload) {
      int count = 3;
      do {
        count--;
        data = await loadData();
      } while (data == null && count > 0);
    } else {
      data = await loadData();
    }
    if (!mounted) return data;
    if (data == null) {
      streamDataStatus.sink.add(DataStatus.error);
    } else if (data is List && (data as List).isEmpty) {
      streamDataStatus.sink.add(DataStatus.empty);
    } else {
      streamDataStatus.sink.add(DataStatus.hasData);
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder<DataStatus>(
      stream: streamDataStatus.stream,
      initialData: widget.initStatus,
      builder: (context, snapshot) {
        switch (snapshot.data) {
          case DataStatus.loading:
            return Container(
              height: widget.height,
              color: widget.backgroundColor,
              child: widget.loadingBuilder ?? WidgetLoading(),
            );
          case DataStatus.error:
            return Container(
              height: widget.height,
              color: widget.backgroundColor,
              child: WidgetReload(
                () => getData(widget.loadData),
              ),
            );
          case DataStatus.hasData:
            return widget.builder(data);
          case DataStatus.empty:
            return widget.emptyBuilder ?? Container();
          default:
            return Container();
        }
      },
    );
  }
}

class DataLoaderController<T> {
  Future<T> Function() loadData;
  _DataLoaderState _state;
  DataLoaderController({this.loadData});

  /// lấy trạng thái hiện tại
  DataStatus get currentStatus => _state?.currentStatus ?? DataStatus.none;

  void bindState(_DataLoaderState<T> state) {
    this._state = state;
  }

  void addLoadData(Future<T> Function() loadData) {
    this.loadData = loadData;
  }

  /// load lại dữ liệu
  Future<void> reloadData() async {
    if (loadData == null) return;
    await loadData();
  }

  void dispose() {
    this.loadData = null;
  }
}
