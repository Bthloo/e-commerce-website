import 'package:bn_website/features/home_screen/domain/entity/product_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({
    super.key,
    required this.product,
    required this.onTap,
  });
final ProductEntity product;
final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          CachedNetworkImage(
              height: 100.h,
              width: 100.w,
              imageUrl: product.imageUrl??''
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 150.w,
                child: Text(
                    product.name??"No Name",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 16,
                    )
                ),
              ),
              Row(
                children: [
                  Text("-${product.discount}",
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 16
                    ),),
                  SizedBox(width: 10.w,),
                  Text("${(product.price!) - (product.discount!)}\$",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 16,
                      )
                  ),
                ],
              ),
              Text("${product.price}",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 16,
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Theme.of(context).textTheme.titleMedium?.color!.withOpacity(.5),
                    color: Theme.of(context).textTheme.titleMedium?.color!.withOpacity(.5)
                )
                ,),

            ],
          )
        ],
      ),
    );
  }
}
