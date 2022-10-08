class ProductModel {
  final String productName;
  final double productPrice;
  final String productImage;

  const ProductModel({
    required this.productName,
    required this.productPrice,
    required this.productImage,
  });

  static const List<ProductModel> productList = [
    ProductModel(
        productName: 'Apple',
        productPrice: 2.99,
        productImage: 'https://www-konga-com-res.cloudinary.com/w_auto,f_auto,fl_lossy,dpr_auto,q_auto/media/catalog/product/A/p/Apple-Carton---100-Pieces-5830486.jpg',
    ),
    ProductModel(
      productName: 'Pear',
      productPrice: 5.99,
      productImage: 'https://img.freepik.com/free-vector/vintage-pear-illustration_53876-112720.jpg?w=2000',
    ),
    ProductModel(
      productName: 'grape',
      productPrice: 4.99,
      productImage: 'https://media.istockphoto.com/photos/ripe-red-grape-isolated-on-white-background-with-clipping-path-picture-id535893029?k=20&m=535893029&s=612x612&w=0&h=45leoeNsj_svRp4dXVio6dsX0Lb0I9EHIt50R1dNPTQ=',
    )
  ];
}
