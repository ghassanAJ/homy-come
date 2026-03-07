// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderState {

 List<BookingModelResponse> get allOrder; List<BookingModelResponse> get inProcessOrder; List<BookingModelResponse> get completedOrder; List<BookingModelResponse> get schaduledOrder; List<TodaySchaduleModelResponse> get todaySchaduleOrder; String? get fetchTodayScheduleError; dynamic get isLoadingTodayScheduleOrder; TodaySchaduleModelResponse? get orderDetailsById; dynamic get isLoadingOrderDetailsById; String? get fetchOrderDetailsError; BookingDetailseModelResponse? get orderDetailse; bool get isOrderCancelled; bool get isCancelOrderLoading; String? get cancelOrderError;
/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderStateCopyWith<OrderState> get copyWith => _$OrderStateCopyWithImpl<OrderState>(this as OrderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderState&&const DeepCollectionEquality().equals(other.allOrder, allOrder)&&const DeepCollectionEquality().equals(other.inProcessOrder, inProcessOrder)&&const DeepCollectionEquality().equals(other.completedOrder, completedOrder)&&const DeepCollectionEquality().equals(other.schaduledOrder, schaduledOrder)&&const DeepCollectionEquality().equals(other.todaySchaduleOrder, todaySchaduleOrder)&&(identical(other.fetchTodayScheduleError, fetchTodayScheduleError) || other.fetchTodayScheduleError == fetchTodayScheduleError)&&const DeepCollectionEquality().equals(other.isLoadingTodayScheduleOrder, isLoadingTodayScheduleOrder)&&(identical(other.orderDetailsById, orderDetailsById) || other.orderDetailsById == orderDetailsById)&&const DeepCollectionEquality().equals(other.isLoadingOrderDetailsById, isLoadingOrderDetailsById)&&(identical(other.fetchOrderDetailsError, fetchOrderDetailsError) || other.fetchOrderDetailsError == fetchOrderDetailsError)&&(identical(other.orderDetailse, orderDetailse) || other.orderDetailse == orderDetailse)&&(identical(other.isOrderCancelled, isOrderCancelled) || other.isOrderCancelled == isOrderCancelled)&&(identical(other.isCancelOrderLoading, isCancelOrderLoading) || other.isCancelOrderLoading == isCancelOrderLoading)&&(identical(other.cancelOrderError, cancelOrderError) || other.cancelOrderError == cancelOrderError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(allOrder),const DeepCollectionEquality().hash(inProcessOrder),const DeepCollectionEquality().hash(completedOrder),const DeepCollectionEquality().hash(schaduledOrder),const DeepCollectionEquality().hash(todaySchaduleOrder),fetchTodayScheduleError,const DeepCollectionEquality().hash(isLoadingTodayScheduleOrder),orderDetailsById,const DeepCollectionEquality().hash(isLoadingOrderDetailsById),fetchOrderDetailsError,orderDetailse,isOrderCancelled,isCancelOrderLoading,cancelOrderError);

@override
String toString() {
  return 'OrderState(allOrder: $allOrder, inProcessOrder: $inProcessOrder, completedOrder: $completedOrder, schaduledOrder: $schaduledOrder, todaySchaduleOrder: $todaySchaduleOrder, fetchTodayScheduleError: $fetchTodayScheduleError, isLoadingTodayScheduleOrder: $isLoadingTodayScheduleOrder, orderDetailsById: $orderDetailsById, isLoadingOrderDetailsById: $isLoadingOrderDetailsById, fetchOrderDetailsError: $fetchOrderDetailsError, orderDetailse: $orderDetailse, isOrderCancelled: $isOrderCancelled, isCancelOrderLoading: $isCancelOrderLoading, cancelOrderError: $cancelOrderError)';
}


}

/// @nodoc
abstract mixin class $OrderStateCopyWith<$Res>  {
  factory $OrderStateCopyWith(OrderState value, $Res Function(OrderState) _then) = _$OrderStateCopyWithImpl;
@useResult
$Res call({
 List<BookingModelResponse> allOrder, List<BookingModelResponse> inProcessOrder, List<BookingModelResponse> completedOrder, List<BookingModelResponse> schaduledOrder, List<TodaySchaduleModelResponse> todaySchaduleOrder, String? fetchTodayScheduleError, dynamic isLoadingTodayScheduleOrder, TodaySchaduleModelResponse? orderDetailsById, dynamic isLoadingOrderDetailsById, String? fetchOrderDetailsError, BookingDetailseModelResponse? orderDetailse, bool isOrderCancelled, bool isCancelOrderLoading, String? cancelOrderError
});


$TodaySchaduleModelResponseCopyWith<$Res>? get orderDetailsById;$BookingDetailseModelResponseCopyWith<$Res>? get orderDetailse;

}
/// @nodoc
class _$OrderStateCopyWithImpl<$Res>
    implements $OrderStateCopyWith<$Res> {
  _$OrderStateCopyWithImpl(this._self, this._then);

  final OrderState _self;
  final $Res Function(OrderState) _then;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? allOrder = null,Object? inProcessOrder = null,Object? completedOrder = null,Object? schaduledOrder = null,Object? todaySchaduleOrder = null,Object? fetchTodayScheduleError = freezed,Object? isLoadingTodayScheduleOrder = freezed,Object? orderDetailsById = freezed,Object? isLoadingOrderDetailsById = freezed,Object? fetchOrderDetailsError = freezed,Object? orderDetailse = freezed,Object? isOrderCancelled = null,Object? isCancelOrderLoading = null,Object? cancelOrderError = freezed,}) {
  return _then(_self.copyWith(
allOrder: null == allOrder ? _self.allOrder : allOrder // ignore: cast_nullable_to_non_nullable
as List<BookingModelResponse>,inProcessOrder: null == inProcessOrder ? _self.inProcessOrder : inProcessOrder // ignore: cast_nullable_to_non_nullable
as List<BookingModelResponse>,completedOrder: null == completedOrder ? _self.completedOrder : completedOrder // ignore: cast_nullable_to_non_nullable
as List<BookingModelResponse>,schaduledOrder: null == schaduledOrder ? _self.schaduledOrder : schaduledOrder // ignore: cast_nullable_to_non_nullable
as List<BookingModelResponse>,todaySchaduleOrder: null == todaySchaduleOrder ? _self.todaySchaduleOrder : todaySchaduleOrder // ignore: cast_nullable_to_non_nullable
as List<TodaySchaduleModelResponse>,fetchTodayScheduleError: freezed == fetchTodayScheduleError ? _self.fetchTodayScheduleError : fetchTodayScheduleError // ignore: cast_nullable_to_non_nullable
as String?,isLoadingTodayScheduleOrder: freezed == isLoadingTodayScheduleOrder ? _self.isLoadingTodayScheduleOrder : isLoadingTodayScheduleOrder // ignore: cast_nullable_to_non_nullable
as dynamic,orderDetailsById: freezed == orderDetailsById ? _self.orderDetailsById : orderDetailsById // ignore: cast_nullable_to_non_nullable
as TodaySchaduleModelResponse?,isLoadingOrderDetailsById: freezed == isLoadingOrderDetailsById ? _self.isLoadingOrderDetailsById : isLoadingOrderDetailsById // ignore: cast_nullable_to_non_nullable
as dynamic,fetchOrderDetailsError: freezed == fetchOrderDetailsError ? _self.fetchOrderDetailsError : fetchOrderDetailsError // ignore: cast_nullable_to_non_nullable
as String?,orderDetailse: freezed == orderDetailse ? _self.orderDetailse : orderDetailse // ignore: cast_nullable_to_non_nullable
as BookingDetailseModelResponse?,isOrderCancelled: null == isOrderCancelled ? _self.isOrderCancelled : isOrderCancelled // ignore: cast_nullable_to_non_nullable
as bool,isCancelOrderLoading: null == isCancelOrderLoading ? _self.isCancelOrderLoading : isCancelOrderLoading // ignore: cast_nullable_to_non_nullable
as bool,cancelOrderError: freezed == cancelOrderError ? _self.cancelOrderError : cancelOrderError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TodaySchaduleModelResponseCopyWith<$Res>? get orderDetailsById {
    if (_self.orderDetailsById == null) {
    return null;
  }

  return $TodaySchaduleModelResponseCopyWith<$Res>(_self.orderDetailsById!, (value) {
    return _then(_self.copyWith(orderDetailsById: value));
  });
}/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingDetailseModelResponseCopyWith<$Res>? get orderDetailse {
    if (_self.orderDetailse == null) {
    return null;
  }

  return $BookingDetailseModelResponseCopyWith<$Res>(_self.orderDetailse!, (value) {
    return _then(_self.copyWith(orderDetailse: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderState].
extension OrderStatePatterns on OrderState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderState value)  $default,){
final _that = this;
switch (_that) {
case _OrderState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderState value)?  $default,){
final _that = this;
switch (_that) {
case _OrderState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<BookingModelResponse> allOrder,  List<BookingModelResponse> inProcessOrder,  List<BookingModelResponse> completedOrder,  List<BookingModelResponse> schaduledOrder,  List<TodaySchaduleModelResponse> todaySchaduleOrder,  String? fetchTodayScheduleError,  dynamic isLoadingTodayScheduleOrder,  TodaySchaduleModelResponse? orderDetailsById,  dynamic isLoadingOrderDetailsById,  String? fetchOrderDetailsError,  BookingDetailseModelResponse? orderDetailse,  bool isOrderCancelled,  bool isCancelOrderLoading,  String? cancelOrderError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderState() when $default != null:
return $default(_that.allOrder,_that.inProcessOrder,_that.completedOrder,_that.schaduledOrder,_that.todaySchaduleOrder,_that.fetchTodayScheduleError,_that.isLoadingTodayScheduleOrder,_that.orderDetailsById,_that.isLoadingOrderDetailsById,_that.fetchOrderDetailsError,_that.orderDetailse,_that.isOrderCancelled,_that.isCancelOrderLoading,_that.cancelOrderError);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<BookingModelResponse> allOrder,  List<BookingModelResponse> inProcessOrder,  List<BookingModelResponse> completedOrder,  List<BookingModelResponse> schaduledOrder,  List<TodaySchaduleModelResponse> todaySchaduleOrder,  String? fetchTodayScheduleError,  dynamic isLoadingTodayScheduleOrder,  TodaySchaduleModelResponse? orderDetailsById,  dynamic isLoadingOrderDetailsById,  String? fetchOrderDetailsError,  BookingDetailseModelResponse? orderDetailse,  bool isOrderCancelled,  bool isCancelOrderLoading,  String? cancelOrderError)  $default,) {final _that = this;
switch (_that) {
case _OrderState():
return $default(_that.allOrder,_that.inProcessOrder,_that.completedOrder,_that.schaduledOrder,_that.todaySchaduleOrder,_that.fetchTodayScheduleError,_that.isLoadingTodayScheduleOrder,_that.orderDetailsById,_that.isLoadingOrderDetailsById,_that.fetchOrderDetailsError,_that.orderDetailse,_that.isOrderCancelled,_that.isCancelOrderLoading,_that.cancelOrderError);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<BookingModelResponse> allOrder,  List<BookingModelResponse> inProcessOrder,  List<BookingModelResponse> completedOrder,  List<BookingModelResponse> schaduledOrder,  List<TodaySchaduleModelResponse> todaySchaduleOrder,  String? fetchTodayScheduleError,  dynamic isLoadingTodayScheduleOrder,  TodaySchaduleModelResponse? orderDetailsById,  dynamic isLoadingOrderDetailsById,  String? fetchOrderDetailsError,  BookingDetailseModelResponse? orderDetailse,  bool isOrderCancelled,  bool isCancelOrderLoading,  String? cancelOrderError)?  $default,) {final _that = this;
switch (_that) {
case _OrderState() when $default != null:
return $default(_that.allOrder,_that.inProcessOrder,_that.completedOrder,_that.schaduledOrder,_that.todaySchaduleOrder,_that.fetchTodayScheduleError,_that.isLoadingTodayScheduleOrder,_that.orderDetailsById,_that.isLoadingOrderDetailsById,_that.fetchOrderDetailsError,_that.orderDetailse,_that.isOrderCancelled,_that.isCancelOrderLoading,_that.cancelOrderError);case _:
  return null;

}
}

}

/// @nodoc


class _OrderState implements OrderState {
  const _OrderState({final  List<BookingModelResponse> allOrder = const [], final  List<BookingModelResponse> inProcessOrder = const [], final  List<BookingModelResponse> completedOrder = const [], final  List<BookingModelResponse> schaduledOrder = const [], final  List<TodaySchaduleModelResponse> todaySchaduleOrder = const [], this.fetchTodayScheduleError, this.isLoadingTodayScheduleOrder = false, this.orderDetailsById, this.isLoadingOrderDetailsById = false, this.fetchOrderDetailsError, this.orderDetailse, this.isOrderCancelled = false, this.isCancelOrderLoading = false, this.cancelOrderError}): _allOrder = allOrder,_inProcessOrder = inProcessOrder,_completedOrder = completedOrder,_schaduledOrder = schaduledOrder,_todaySchaduleOrder = todaySchaduleOrder;
  

 final  List<BookingModelResponse> _allOrder;
@override@JsonKey() List<BookingModelResponse> get allOrder {
  if (_allOrder is EqualUnmodifiableListView) return _allOrder;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allOrder);
}

 final  List<BookingModelResponse> _inProcessOrder;
@override@JsonKey() List<BookingModelResponse> get inProcessOrder {
  if (_inProcessOrder is EqualUnmodifiableListView) return _inProcessOrder;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_inProcessOrder);
}

 final  List<BookingModelResponse> _completedOrder;
@override@JsonKey() List<BookingModelResponse> get completedOrder {
  if (_completedOrder is EqualUnmodifiableListView) return _completedOrder;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_completedOrder);
}

 final  List<BookingModelResponse> _schaduledOrder;
@override@JsonKey() List<BookingModelResponse> get schaduledOrder {
  if (_schaduledOrder is EqualUnmodifiableListView) return _schaduledOrder;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_schaduledOrder);
}

 final  List<TodaySchaduleModelResponse> _todaySchaduleOrder;
@override@JsonKey() List<TodaySchaduleModelResponse> get todaySchaduleOrder {
  if (_todaySchaduleOrder is EqualUnmodifiableListView) return _todaySchaduleOrder;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_todaySchaduleOrder);
}

@override final  String? fetchTodayScheduleError;
@override@JsonKey() final  dynamic isLoadingTodayScheduleOrder;
@override final  TodaySchaduleModelResponse? orderDetailsById;
@override@JsonKey() final  dynamic isLoadingOrderDetailsById;
@override final  String? fetchOrderDetailsError;
@override final  BookingDetailseModelResponse? orderDetailse;
@override@JsonKey() final  bool isOrderCancelled;
@override@JsonKey() final  bool isCancelOrderLoading;
@override final  String? cancelOrderError;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderStateCopyWith<_OrderState> get copyWith => __$OrderStateCopyWithImpl<_OrderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderState&&const DeepCollectionEquality().equals(other._allOrder, _allOrder)&&const DeepCollectionEquality().equals(other._inProcessOrder, _inProcessOrder)&&const DeepCollectionEquality().equals(other._completedOrder, _completedOrder)&&const DeepCollectionEquality().equals(other._schaduledOrder, _schaduledOrder)&&const DeepCollectionEquality().equals(other._todaySchaduleOrder, _todaySchaduleOrder)&&(identical(other.fetchTodayScheduleError, fetchTodayScheduleError) || other.fetchTodayScheduleError == fetchTodayScheduleError)&&const DeepCollectionEquality().equals(other.isLoadingTodayScheduleOrder, isLoadingTodayScheduleOrder)&&(identical(other.orderDetailsById, orderDetailsById) || other.orderDetailsById == orderDetailsById)&&const DeepCollectionEquality().equals(other.isLoadingOrderDetailsById, isLoadingOrderDetailsById)&&(identical(other.fetchOrderDetailsError, fetchOrderDetailsError) || other.fetchOrderDetailsError == fetchOrderDetailsError)&&(identical(other.orderDetailse, orderDetailse) || other.orderDetailse == orderDetailse)&&(identical(other.isOrderCancelled, isOrderCancelled) || other.isOrderCancelled == isOrderCancelled)&&(identical(other.isCancelOrderLoading, isCancelOrderLoading) || other.isCancelOrderLoading == isCancelOrderLoading)&&(identical(other.cancelOrderError, cancelOrderError) || other.cancelOrderError == cancelOrderError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_allOrder),const DeepCollectionEquality().hash(_inProcessOrder),const DeepCollectionEquality().hash(_completedOrder),const DeepCollectionEquality().hash(_schaduledOrder),const DeepCollectionEquality().hash(_todaySchaduleOrder),fetchTodayScheduleError,const DeepCollectionEquality().hash(isLoadingTodayScheduleOrder),orderDetailsById,const DeepCollectionEquality().hash(isLoadingOrderDetailsById),fetchOrderDetailsError,orderDetailse,isOrderCancelled,isCancelOrderLoading,cancelOrderError);

@override
String toString() {
  return 'OrderState(allOrder: $allOrder, inProcessOrder: $inProcessOrder, completedOrder: $completedOrder, schaduledOrder: $schaduledOrder, todaySchaduleOrder: $todaySchaduleOrder, fetchTodayScheduleError: $fetchTodayScheduleError, isLoadingTodayScheduleOrder: $isLoadingTodayScheduleOrder, orderDetailsById: $orderDetailsById, isLoadingOrderDetailsById: $isLoadingOrderDetailsById, fetchOrderDetailsError: $fetchOrderDetailsError, orderDetailse: $orderDetailse, isOrderCancelled: $isOrderCancelled, isCancelOrderLoading: $isCancelOrderLoading, cancelOrderError: $cancelOrderError)';
}


}

/// @nodoc
abstract mixin class _$OrderStateCopyWith<$Res> implements $OrderStateCopyWith<$Res> {
  factory _$OrderStateCopyWith(_OrderState value, $Res Function(_OrderState) _then) = __$OrderStateCopyWithImpl;
@override @useResult
$Res call({
 List<BookingModelResponse> allOrder, List<BookingModelResponse> inProcessOrder, List<BookingModelResponse> completedOrder, List<BookingModelResponse> schaduledOrder, List<TodaySchaduleModelResponse> todaySchaduleOrder, String? fetchTodayScheduleError, dynamic isLoadingTodayScheduleOrder, TodaySchaduleModelResponse? orderDetailsById, dynamic isLoadingOrderDetailsById, String? fetchOrderDetailsError, BookingDetailseModelResponse? orderDetailse, bool isOrderCancelled, bool isCancelOrderLoading, String? cancelOrderError
});


@override $TodaySchaduleModelResponseCopyWith<$Res>? get orderDetailsById;@override $BookingDetailseModelResponseCopyWith<$Res>? get orderDetailse;

}
/// @nodoc
class __$OrderStateCopyWithImpl<$Res>
    implements _$OrderStateCopyWith<$Res> {
  __$OrderStateCopyWithImpl(this._self, this._then);

  final _OrderState _self;
  final $Res Function(_OrderState) _then;

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? allOrder = null,Object? inProcessOrder = null,Object? completedOrder = null,Object? schaduledOrder = null,Object? todaySchaduleOrder = null,Object? fetchTodayScheduleError = freezed,Object? isLoadingTodayScheduleOrder = freezed,Object? orderDetailsById = freezed,Object? isLoadingOrderDetailsById = freezed,Object? fetchOrderDetailsError = freezed,Object? orderDetailse = freezed,Object? isOrderCancelled = null,Object? isCancelOrderLoading = null,Object? cancelOrderError = freezed,}) {
  return _then(_OrderState(
allOrder: null == allOrder ? _self._allOrder : allOrder // ignore: cast_nullable_to_non_nullable
as List<BookingModelResponse>,inProcessOrder: null == inProcessOrder ? _self._inProcessOrder : inProcessOrder // ignore: cast_nullable_to_non_nullable
as List<BookingModelResponse>,completedOrder: null == completedOrder ? _self._completedOrder : completedOrder // ignore: cast_nullable_to_non_nullable
as List<BookingModelResponse>,schaduledOrder: null == schaduledOrder ? _self._schaduledOrder : schaduledOrder // ignore: cast_nullable_to_non_nullable
as List<BookingModelResponse>,todaySchaduleOrder: null == todaySchaduleOrder ? _self._todaySchaduleOrder : todaySchaduleOrder // ignore: cast_nullable_to_non_nullable
as List<TodaySchaduleModelResponse>,fetchTodayScheduleError: freezed == fetchTodayScheduleError ? _self.fetchTodayScheduleError : fetchTodayScheduleError // ignore: cast_nullable_to_non_nullable
as String?,isLoadingTodayScheduleOrder: freezed == isLoadingTodayScheduleOrder ? _self.isLoadingTodayScheduleOrder : isLoadingTodayScheduleOrder // ignore: cast_nullable_to_non_nullable
as dynamic,orderDetailsById: freezed == orderDetailsById ? _self.orderDetailsById : orderDetailsById // ignore: cast_nullable_to_non_nullable
as TodaySchaduleModelResponse?,isLoadingOrderDetailsById: freezed == isLoadingOrderDetailsById ? _self.isLoadingOrderDetailsById : isLoadingOrderDetailsById // ignore: cast_nullable_to_non_nullable
as dynamic,fetchOrderDetailsError: freezed == fetchOrderDetailsError ? _self.fetchOrderDetailsError : fetchOrderDetailsError // ignore: cast_nullable_to_non_nullable
as String?,orderDetailse: freezed == orderDetailse ? _self.orderDetailse : orderDetailse // ignore: cast_nullable_to_non_nullable
as BookingDetailseModelResponse?,isOrderCancelled: null == isOrderCancelled ? _self.isOrderCancelled : isOrderCancelled // ignore: cast_nullable_to_non_nullable
as bool,isCancelOrderLoading: null == isCancelOrderLoading ? _self.isCancelOrderLoading : isCancelOrderLoading // ignore: cast_nullable_to_non_nullable
as bool,cancelOrderError: freezed == cancelOrderError ? _self.cancelOrderError : cancelOrderError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TodaySchaduleModelResponseCopyWith<$Res>? get orderDetailsById {
    if (_self.orderDetailsById == null) {
    return null;
  }

  return $TodaySchaduleModelResponseCopyWith<$Res>(_self.orderDetailsById!, (value) {
    return _then(_self.copyWith(orderDetailsById: value));
  });
}/// Create a copy of OrderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingDetailseModelResponseCopyWith<$Res>? get orderDetailse {
    if (_self.orderDetailse == null) {
    return null;
  }

  return $BookingDetailseModelResponseCopyWith<$Res>(_self.orderDetailse!, (value) {
    return _then(_self.copyWith(orderDetailse: value));
  });
}
}

// dart format on
