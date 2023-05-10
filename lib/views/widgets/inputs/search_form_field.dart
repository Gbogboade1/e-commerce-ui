import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../__lib.dart';

class SearchFormField extends ConsumerStatefulWidget {
  const SearchFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.type = InputType.primary,
    this.label,
    this.inputFormatters,
    this.hintWidget,
    this.onClearController,
  });
  final InputType type;
  final String? label;
  final String hintText;
  final Widget? hintWidget;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onClearController;

  @override
  ConsumerState<SearchFormField> createState() => _SearchFormFieldState();
}

class _SearchFormFieldState extends ConsumerState<SearchFormField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();

    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = ref.watch(appThemeProvider);
    return Container(
      height: context.scaleH(48),
      padding: context.insetsSymetric(vertical: 14),
      width: double.infinity,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          // color: appTheme.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              width: _focusNode.hasPrimaryFocus ? 1.5 : 1,
              color: _focusNode.hasPrimaryFocus
                  ? appTheme.neutral.c200!
                  : appTheme.neutral.c100!)),
      child: Row(
        children: [
          const WGap(12),
          Align(
            alignment: Alignment.centerRight,
            child: AssetsImage(
              AppAssets.ASSETS_ICONS_SEARCH_PNG,
              fit: BoxFit.cover,
              both: context.scaleW(24),
            ),
          ),
          const WGap(8),
          Expanded(
            child: TextFormField(
              focusNode: _focusNode,
              controller: widget.controller,
              cursorColor: appTheme.neutral.c500,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: context.insetsZero(),
                hintText: widget.hintText,
                hintStyle: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  fontSize: context.fontSize(14),
                  color: appTheme.neutral.c200,
                  height: 20.0.toFigmaHeight(context.fontSize(14)),
                ),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          ),
          if (_focusNode.hasPrimaryFocus)
            InkWell(
              onTap: widget.onClearController,
              child: const Center(
                child: Icon(
                  Icons.clear,
                  size: 20,
                ),
              ),
            ),
          const WGap(14),
        ],
      ),
    );
  }
}
