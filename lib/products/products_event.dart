import 'package:equatable/equatable.dart';

import '../modal/productsmodal.dart';
abstract class ProductsEvent extends Equatable{
  const ProductsEvent();
  List<Object> get props => [];
}
class ProductsLoadedData extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}