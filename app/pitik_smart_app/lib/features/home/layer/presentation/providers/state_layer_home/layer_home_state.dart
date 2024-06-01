import 'package:pitik_app_depedencies/pitik_app_depedencies.dart';

enum EnumLayerHomeState {
  initial,
  loading,
  loaded,
  failure,
}

class LayerHomeState extends Equatable {
  final bool isLoading;
  final bool hasData;
  final EnumLayerHomeState state;
  final String message;
  final Monitoring? monitoring;

  const LayerHomeState({
    this.isLoading = false,
    this.hasData = false,
    this.state = EnumLayerHomeState.initial,
    this.message = '',
    this.monitoring,
  });

  const LayerHomeState.initial({
    this.isLoading = false,
    this.hasData = false,
    this.state = EnumLayerHomeState.initial,
    this.message = '',
    this.monitoring,
  });

  LayerHomeState copyWith({
    bool? isLoading,
    bool? hasData,
    EnumLayerHomeState? state,
    String? message,
    Monitoring? monitoring,
  }) {
    return LayerHomeState(
      isLoading: isLoading ?? this.isLoading,
      hasData: hasData ?? this.hasData,
      state: state ?? this.state,
      message: message ?? this.message,
      monitoring: monitoring ?? this.monitoring,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isLoading, hasData, state, message, monitoring];
}
