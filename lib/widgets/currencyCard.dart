import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool isInverted;
  final _blackColor = const Color(0xFF1F2123);
  final double order;

  const CurrencyCard(
      {super.key,
      required this.name,
      required this.code,
      required this.amount,
      required this.icon,
      required this.isInverted,
      required this.order});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -(order - 1) * 20),
      child: Container(
        clipBehavior: Clip.hardEdge, //overflow 삭제하기
        decoration: BoxDecoration(
          color: isInverted ? _blackColor : Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: isInverted ? Colors.white : _blackColor,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                          color: isInverted ? Colors.white : _blackColor,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        code,
                        style: TextStyle(
                          color: isInverted ? Colors.white : _blackColor,
                          fontSize: 20,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Transform.scale(
                scale: 2.2,
                // scale을 쓰면 부모에게 어떠한 영향도 끼치지 않은 채 크기 바꿀 수있음.
                // 만약 사이즈를 왕창 키워버리면 카드 크기까지 커져버림
                child: Transform.translate(
                  offset: const Offset(-5, 12),
                  child: Icon(
                    icon,
                    color: isInverted ? Colors.white : _blackColor,
                    size: 88,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
