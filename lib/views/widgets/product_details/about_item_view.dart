import '../../../__lib.dart';

class AboutItemView extends StatelessWidget {
  const AboutItemView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<NavItem> left = [
      NavItem(title: 'Brand', content: 'Versace'),
      NavItem(title: 'Category', content: 'Casual Shirt'),
      NavItem(title: 'Condition', content: 'New'),
    ];
    List<NavItem> right = [
      NavItem(title: 'Color:', content: 'Cream'),
      NavItem(title: 'Material', content: 'Polyester'),
      NavItem(title: 'Heavy', content: '200g'),
    ];
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: Column(
            children: [
              const HGap(16),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = left[index];
                  return DetailsView(title: item.title, value: item.content);
                },
                separatorBuilder: (context, index) => const HGap(16),
                itemCount: left.length,
              )
            ],
          ),
        ),
        Expanded(
            flex: 5,
            child: Column(
              children: [
                const HGap(16),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = right[index];
                    return DetailsView(title: item.title, value: item.content);
                  },
                  separatorBuilder: (context, index) => const HGap(16),
                  itemCount: right.length,
                )
              ],
            )),
      ],
    );
  }
}

class DetailsView extends StatelessWidget {
  final String title, value;
  const DetailsView({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        RobotoText(
          '$title:',
          color: AppColors.navGrey,
          weight: FontWeight.w500,
          size: 16,
        ),
        const WGap(4),
        Expanded(
          child: RobotoText(
            value,
            weight: FontWeight.w700,
            size: 18,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
