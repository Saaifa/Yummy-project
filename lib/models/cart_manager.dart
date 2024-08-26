class CartItem{
  final String id;
  final String name;
  final double price;
  final int quantity;
  
  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
});
  
  double get totalCost => price * quantity;
}

enum DeliveryMode{delivery, pickup}

class CartManager{
  final List<CartItem> _items = [];
  DeliveryMode _mode = DeliveryMode.pickup;
  DateTime? _timeOfPickupOrDelivery;
  
  //Add a new item in cart 
void addItem(CartItem item){
  _items.add(item);
}
//remove an item from cart
void removeItem(String id){
  _items.removeWhere((item) => item.id == id);
}

//reset the shoppig cart
void resetCart(){
  _items.clear();
  _mode = DeliveryMode.pickup;
  _timeOfPickupOrDelivery = null;
}

CartItem itemAt(int index){
  if(index>0 && index < _items.length){
    return _items[index];
  } else{
    throw IndexError.withLength(index, _items.length);
  }
}
//calculate total cost of cart
double get totalCost{
  return _items.fold(0.0, (sum, item)=> sum + item.totalCost );

}
//get list of item in cart
List<CartItem> get items => List.unmodifiable(_items);

//check if cart is empty
 bool get isEmpty => _items.isEmpty;

 //set the delivery mode
void setMode(DeliveryMode mode){
  _mode =  mode;
}
//get current mode
DeliveryMode get mde => _mode;

//set time for pickup
void setTime(DateTime time){
  _timeOfPickupOrDelivery = time;
}

DateTime? get time => _timeOfPickupOrDelivery;

}