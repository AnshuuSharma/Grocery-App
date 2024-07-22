class Product{
String _title='',_img='',_price='',_quantity='';
int _qty=1;

Product(this._title, this._img, this._price,this._qty,this._quantity);

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  get quantity => _quantity;

  set quantity(value) {
    _quantity = value;
  }

  int get qty => _qty;

  set qty(int value) {
    _qty = value;
  }

  get img => _img;

  get price => _price;

  set price(value) {
    _price = value;
  }

  set img(value) {
    _img = value;
  }

@override
  String toString() {
    return 'Product{_title: $_title, _img: $_img, _price: $_price, _quantity: $_quantity, _qty: $_qty}';
  }
  getProduct()
  {
    return {"title":_title,
            "price":_price,
            "qty":_qty,
            "quantity":_quantity,
            "img":_img
    };
  }
}
// https://d39vol41m7feya.cloudfront.net/1629253160-banner1.jfif
// void extractItem(){
//   var title,img,price,desc,quantity;
//   int random(int min,int max){
//     return min+Random().nextInt(max-min);
//   }
//   List item=obj.values.elementAt(random(0, 11));
//   var rd=random(0, 11);
//   title=item[rd].values.elementAt(1);
//   img=item[rd].values.elementAt(2);
//   price=item[rd].values.elementAt(3);
//   desc=item[rd].values.elementAt(6);
//   quantity=item[rd].values.elementAt(5);
// }