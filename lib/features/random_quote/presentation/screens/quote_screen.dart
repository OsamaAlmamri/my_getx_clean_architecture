// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:my_getx_clean_architecture/core/utils/app_colors.dart';
// import 'package:my_getx_clean_architecture/features/random_quote/presentation/cubit/random_quote_controller.dart';
// import '../widgets/quote_screen_content.dart';
// import 'package:my_getx_clean_architecture/core/widgets/error_widget.dart' as error_widget;
//
// class QuoteScreen extends StatefulWidget {
//   const QuoteScreen({Key? key}) : super(key: key);
//
//   @override
//   State<QuoteScreen> createState() => _QuoteScreenState();
// }
//
// class _QuoteScreenState extends State<QuoteScreen> {
//   _getRandomQuote() =>
//       BlocProvider.of<RandomQuoteCubit>(context).getRandomQuote();
//
//   @override
//   void initState() {
//     super.initState();
//     _getRandomQuote();
//   }
//
//   Widget _buildBodyContent() {
//     return BlocBuilder<RandomQuoteCubit, RandomQuoteState>(
//         builder: ((context, state) {
//           if (state is RandomQuoteIsLoading) {
//             return Center(
//               child: SpinKitFadingCircle(
//                 color: AppColors.primary,
//               ),
//             );
//           } else if (state is RandomQuoteError) {
//             return error_widget.ErrorWidget(
//               onPress: () => _getRandomQuote(),
//             );
//           } else if (state is RandomQuoteLoaded) {
//             return
//               Column(
//               children: [
//                 QuoteContent(
//                   quote: state.quote,
//                 ),
//                 InkWell(
//                     onTap: () => _getRandomQuote(),
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(vertical: 15),
//                       padding: const EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle, color: AppColors.primary),
//                       child: const Icon(
//                         Icons.refresh,
//                         size: 28,
//                         color: Colors.white,
//                       ),
//                     ))
//               ],
//             );
//           } else {
//             return Center(
//               child: SpinKitFadingCircle(
//                 color: AppColors.primary,
//               ),
//             );
//           }
//         }));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final appBar = AppBar(
//       leading: IconButton(
//         icon: Icon(
//           Icons.translate_outlined,
//           color: AppColors.primary,
//         ),
//         onPressed: () {
//           if (AppLocalizations.of(context)!.isEnLocale) {
//             BlocProvider.of<LocaleCubit>(context).toArabic();
//           } else {
//             BlocProvider.of<LocaleCubit>(context).toEnglish();
//           }
//         },
//       ),
//       title: Text(AppLocalizations.of(context)!.translate('app_name')!),
//     );
//     return RefreshIndicator(
//         child: Scaffold(appBar: appBar, body: _buildBodyContent()),
//         onRefresh: () => _getRandomQuote());
//   }
// }
