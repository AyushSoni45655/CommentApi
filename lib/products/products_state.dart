import 'package:equatable/equatable.dart';

import '../modal/productsmodal.dart';
 class ProductsState extends Equatable{
   const ProductsState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class InitialProducts extends ProductsState{}
class LoadingProducts extends ProductsState{}
class LoadedProducts extends ProductsState{
   final List<ProductsModel>  productModel;
   const LoadedProducts(this.productModel);
   List<Object>get props => [productModel];

}
class ErrorProducts extends ProductsState{
   final String errorMessage;
   const ErrorProducts(this.errorMessage);
   List<Object> get props => [errorMessage];
}
