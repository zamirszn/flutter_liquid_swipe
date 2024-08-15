import 'package:flutter/material.dart';

class LiquidSwipeCard extends StatelessWidget {
  const LiquidSwipeCard({
    super.key,
    required this.gradient,
    required this.buttonColor,
    required this.name,
    required this.action,
    required this.title,
    required this.titleStyle,
    required this.subtitle,
    required this.subtitleStyle,
    required this.body,
    required this.bodyStyle,
    required this.onTapName,
    required this.onSkip,
    required this.child,
  });

  final Gradient gradient;
  final Color buttonColor;
  final String name;
  final String action;
  final String title;
  final TextStyle titleStyle;
  final String subtitle;
  final TextStyle subtitleStyle;
  final String body;
  final TextStyle bodyStyle;
  final VoidCallback onTapName;
  final VoidCallback onSkip;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
      ),
      child: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Builder(
              builder: (context) {
                var style = TextStyle(
                  color: buttonColor,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                );

                return Row(
                  children: [
                    TextButton(
                      onPressed: onTapName,
                      child: Text(
                        name,
                        style: style,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: onSkip,
                      child: Text(
                        action,
                        style: style,
                      ),
                    ),
                    const SizedBox(width: 16.0 * 2),
                  ],
                );
              },
            ),
            const Spacer(),
            Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(16),
                child: child),
            const Spacer(),
            Text(title, style: titleStyle),
            Text(subtitle, style: subtitleStyle),
            const SizedBox(height: 16),
            FractionallySizedBox(
              widthFactor: 0.7,
              alignment: Alignment.centerLeft,
              child: Text(body, style: bodyStyle),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
