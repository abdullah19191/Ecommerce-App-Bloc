part of 'wishlist_bloc.dart';


abstract class WishlistState extends Equatable {
  const WishlistState();
  @override
  List<Object> get props => [];

  get wishlist => null;
}

class WishlistLoading extends WishlistState {}
class WishlistError extends WishlistState {}
class WishlistLoaded extends WishlistState {
  final Wishlist wishlist;
  const WishlistLoaded({this.wishlist = const Wishlist()});
  @override
  List<Object> get props => [wishlist];
}
