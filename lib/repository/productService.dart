import 'package:flutter/cupertino.dart';
import 'package:shopping_app/entity/product.dart';
class ProductService extends ChangeNotifier {
  List<Product> _data = [];
  int index = 0;

  var total=0.0;
  void doTotal()
  {
    var i=0;
    total=0;
    var item=0;
    for(i=0;i<_data.length;i++)
      {
        total=total+(double.parse(_data[i].price)*_data[i].qty);

      }
    notifyListeners();

  }
  void doNTotal()
  {
    var i=0;
    for(i;i<_data.length;i++)
    {
      total-=double.parse(_data[i].price);
    }

  }

  double getTotal()
  {
    return total;
  }
  void addItem(Product product) {
    _data.add(product);
    // total+=double.parse(product.price);
    doTotal();
    notifyListeners();
  }

  int getLength() {
    if (_data.isNotEmpty) {
      return _data.length;
    }
    else {
      return 0;
    }
  }

  int getTotalLength() {
    int count = 0;
    for (Product item in _data) {
      count += item.qty;
    }
    return count;
  }

  getItem(var index) {
    return _data[index];
  }

  getQuantity(var index) {
    return _data[index].quantity;
  }

  removeItem(var index) {
    _data.removeAt(index);
    notifyListeners();
  }

  getTitle(var index) {
    return _data[index].title;
  }

  getImage(var index) {
    return _data[index].img;
  }

  getPrice(var index) {
    return _data[index].price;
  }

  getQty(var index) {
    return _data[index].qty;
    }

  void increaseQty(var index) {
    _data[index].qty += 1;
    doTotal();
    notifyListeners();
  }
  void increaseQty2(var name)
  {
    for(var item in _data)
    {
      if(item.title==name)
      {
        increaseQty(_data.indexOf(item));
      }
    }
  }

  void decreaseQty(var index) {
    if (_data.isNotEmpty) {
      _data[index].qty -= 1;
      if(_data[index].qty==0)
        {
          removeItem(index);
        }
      doTotal();
      notifyListeners();
    }
  }
  void decreaseQty2(var name)
  {
    var p;
    // if(_data.isNotEmpty){}
    for(var item in _data)
    {
      if(item.title==name)
      {
        p=item;
      }
    }
    decreaseQty(_data.indexOf(p));
  }

bool  isAdded(var name)
  {
    for(var item in _data)
    {
        if(item.title==name)
        {
          return true;
        }
    }
    return false;
  }

  isQty(var name)
  {
    for (var item in _data)
      {
        if(item.title==name)
          {
            return item.qty;
          }
      }
    return "";
  }
}