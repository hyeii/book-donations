import 'package:bookdone/article/model/article_data.dart';
import 'package:bookdone/bookinfo/model/book_comment.dart';
import 'package:bookdone/bookinfo/model/donation.dart';
import 'package:bookdone/mypage/model/like_book.dart';
import 'package:bookdone/mypage/model/my_book.dart';
import 'package:bookdone/onboard/model/user_res.dart';
import 'package:bookdone/regist/model/regist_get_data.dart';
import 'package:bookdone/rest_api/app_dio.dart';
import 'package:bookdone/search/model/book.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rest_client.g.dart';

@riverpod
RestClient restApiClient(RestApiClientRef ref) {
  return RestClient(ref.watch(dioProvider));
}

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  // @Header({'Authorization : $subToken'})
  @GET('/api/books/search/{title}')
  Future<Book> searchBook(@Path() String title);

  @GET('/api/books/detail/{isbn}')
  Future<BookDetail> getDetailBook(@Path() String isbn);

  @GET('/api/books/auto-completion/{title}')
  Future<AutoList> getAutoCompletion(@Path() String title);

  @GET('/api/members/check-nickname/{nickname}')
  Future<CheckNickname> checkNickname(@Path() String nickname);

  @PATCH('/api/members/additional-info')
  Future<void> postAdditionalInfo(@Body() Map<String, dynamic> map);

  @GET('/api/books/reviews/{isbn}')
  Future<BookComment> getCommentsList(@Path() String isbn);

  @POST('/api/books/reviews')
  Future<void> postComment(@Body() Map<String, dynamic> map);

  @GET('/api/members/me')
  Future<UserInfoRes> getMyInfo();

  @GET('/api/donations')
  Future<DonationByRegionData> getDonationByRegion(
    @Query("isbn") String isbn,
    @Query("address") String address,
  );

  @GET('/api/donations/{donationId}')
  Future<ArticleRespByid> getArticleById(@Path() int donationId);

  @GET('/api/donations/address')
  Future<KeepingBookByRegion> getKeepingCntByRegion(
    @Query("isbn") String isbn,
    @Query("address") String address,
  );

  @POST('/api/books/likes')
  Future<BooksLikeResp> setBooksLikes(@Body() Map<String, dynamic> map);

  @POST('/api/donations')
  @MultiPart()
  Future<RegisterResponse> registArticle({
    @Part() required String isbn,
    @Part() required String address,
    @Part() required String content,
    @Part() required bool canDelivery,
    @Part() required List<MultipartFile> images,
  });

  @GET('/api/donations/members/mypage')
  Future<MyBookData> getMyBook();

  @GET('/api/histories/donations/{donationId}')
  Future<HistoryResp> getHistoriesByDonation(@Path() int donationId);

  @GET('/api/books/likes')
  Future<MyLikeBook> getLikeBooks();

  @POST('/api/donations/{donationId}')
  @MultiPart()
  Future<RegisterResponse> updateArticle(
    @Path() int donationId, {
    @Part() required String isbn,
    @Part() required String address,
    @Part() required String content,
    @Part() required bool canDelivery,
    @Part() required List<MultipartFile> images,
  });

  @PATCH('/api/histories/donations/{donationId}')
  Future<RegisterResponse> postHistory(
      @Path() int donationId, @Body() Map<String, dynamic> map);

  @GET('/api/histories/members/me/unwritten')
  Future<HistoryResp> getMyHistoryUnwriteen();

  @GET('/api/histories/members/me/written')
  Future<HistoryResp> getMyHistoryWritten();

  @GET('/api/ranks')
  Future<RankResp> getRanking();

  @GET('/api/donations/members/mypage/unwritten')
  Future<UnwrittenHistory> getUnwrittenHistoryDonations();

  @GET('/api/notifications')
  Future<NotificationsResp> getNotifications();

  @DELETE('/api/notifications/{notificationsid}')
  Future<BooksLikeResp> deleteNotifications(@Path() int notificationsid);

  @PATCH('/api/members/me/fcm-token')
  Future<DefaultReps> updateFcm(@Body() Map<String, dynamic> map);

  @POST('/api/chats')
  Future<void> createChatRoom(@Body() Map<String, dynamic> map);

  @POST('/api/trades/donations/{donationId}/members/{memberId}')
  Future<TradeResponseDto> createTrade(@Path() int donationId, @Path() int memberId);

}
