import "package:flutter/material.dart";

class NavBox extends StatelessWidget {
  final Widget child;

  const NavBox({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow:[ 
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 4,
            offset: Offset(4, 4),
          ),
          BoxShadow(
            color: Colors.white,
            blurRadius: 4,
            offset: Offset(-4, -4),
          ),
        ]
      ),
      child: child,
    );
  }
}
