<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="zxx">
  <head>
    <meta charset="UTF-8" />
    <title>adminGoodsDetail</title>
    <link href="${contextPath}/css/cyform.css" rel="stylesheet" />

    <link rel="stylesheet" href="${contextPath}/css/community.css" />
    <script src="${contextPath}/js/community.js"></script>
    <script src="${contextPath}/js/textareaToInput.js"></script>
    <script>
      function readURL(input) {
        if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function (e) {
            $("#goods_preview").attr("src", e.target.result);
          };

          reader.readAsDataURL(input.files[0]);
        }
      }
    </script>
  </head>
  <body>
    <!-- Product Details Section Begin -->
    <section class="spad" style="padding-top: 28px !important">
      <div class="container">
        <form
          id="register-form"
          method="post"
          enctype="multipart/form-data"
          action="${contextPath}/admin/goods/addAdminGoods.do"
        >
          <div class="row">
            <div class="col-lg-6 col-md-6">
              <div class="product__details__pic">
                <div class="product__details__pic__item">
                  <img id="goods_preview" src="" alt="" />
                  <input
                    type="file"
                    name="img1"
                    id=""
                    onchange="readURL(this)"
                  />
                  <input
                    type="file"
                    name="img2"
                    id=""
                    onchange="readURL(this)"
                  />
                  <input
                    type="file"
                    name="img3"
                    id=""
                    onchange="readURL(this)"
                  />
                  <input
                    type="file"
                    name="img4"
                    id=""
                    onchange="readURL(this)"
                  />
                  <input
                    type="file"
                    name="img5"
                    id=""
                    onchange="readURL(this)"
                  />
                </div>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 text-left">
              <div class="product__details__text">
                <section>
                  <input name="type" type="hidden" value="admin" />
                  <div class="property-margin1">
                    <dl class="property-flex2" style="height: 66px">
                      <dt
                        class="property_title1 textbold"
                        style="margin-top: 16px"
                      >
                        카테고리
                      </dt>
                      <dd class="property-flex1">
                        <div style="align-content: center; margin-top: 4px">
                          <select name="category" class="opt">
                            <option value="zzigae">Stew/ Soup/ Steamed</option>
                            <option value="meal">Meal/ Appetizers</option>
                            <option value="porridge">Porridge</option>
                            <option value="mealReplacement">Meal Replacement</option>
                            <option value="sidedish">Sidedish</option>
                          </select>
                        </div>
                      </dd>
                    </dl>
                  </div>

                  <div class="property-margin1">
                    <dl class="property-flex2" style="height: 66px">
                      <dt
                        class="property_title1 textbold"
                        style="margin-top: 16px"
                      >
                        상품명
                      </dt>
                      <dd class="property-flex1">
                        <input
                          name="name"
                          class="property-font1 nice-select"
                          style="width: 176px"
                        />
                      </dd>
                    </dl>
                  </div>

                  <dl class="property-flex2" style="height: 60px">
                    <dt
                      class="property_title1 textbold"
                      style="margin-top: 16px"
                    >
                      판매가격
                    </dt>
                    <dd class="property-flex1">
                      <input
                        name="price"
                        class="property-font1 nice-select"
                        style="width: 176px"
                      />
                    </dd>
                  </dl>

                  <dl class="property-flex2" style="height: 60px">
                    <dt
                      class="property_title1 textbold"
                      style="margin-top: 16px"
                    >
                      판매자
                    </dt>
                    <dd class="property-flex1">
                      <input
                        class="property-font1 nice-select"
                        style="width: 176px"
                        value="원이츠"
                      />
                    </dd>
                  </dl>

                  <dl class="property-flex2" style="height: 60px">
                    <dt
                      class="property_title1 textbold"
                      style="margin-top: 16px"
                    >
                      포장타입
                    </dt>
                    <dd class="property-flex1">
                      <input
                        name="rapping"
                        class="property-font1 nice-select"
                        style="width: 176px"
                      />
                    </dd>
                  </dl>

                  <dl class="property-flex2" style="height: 60px">
                    <dt
                      class="property_title1 textbold"
                      style="margin-top: 16px"
                    >
                      제조원
                    </dt>
                    <dd class="property-flex1">
                      <input
                        name="manufacturer"
                        class="property-font1 nice-select"
                        style="width: 176px"
                      />
                    </dd>
                  </dl>

                  <dl class="property-flex2" style="height: 60px">
                    <dt
                      class="property_title1 textbold"
                      style="margin-top: 16px"
                    >
                      무게 / 용량
                    </dt>
                    <dd class="property-flex1">
                      <input
                        name="weight"
                        class="property-font1 nice-select"
                        style="width: 176px"
                      />
                    </dd>
                  </dl>

                  <dl class="property-flex2" style="height: 60px">
                    <dt
                      class="property_title1 textbold"
                      style="margin-top: 16px"
                    >
                      유통기한
                    </dt>
                    <dd class="property-flex1">
                      <input
                        name="expDate"
                        type="date"
                        class="property-font1 nice-select"
                        style="width: 176px"
                        required
                      />
                    </dd>
                  </dl>
                  <div class="row ingredient_grid">
                    <div class="col">
                      <div class="row">&nbsp;</div>
                      <div class="row ingredient_rows">
                        <div class="col-md-11 ingredient_col">
                          <div
                            class="row ingredient_row head_row bg-lightgreen"
                          >
                            <div class="col-md">옵션의 이름</div>
                            <div class="col-md">옵션의 양</div>

                            <div class="col-md">가격</div>
                            <div class="col-md-1"></div>
                          </div>
                          <div class="row ingredient_row">
                            <div class="col-md">
                              <input
                                type="text"
                                name="option_name"
                                class="form-control"
                                placeholder="상품명"
                                required
                              />
                            </div>
                            <div class="col-md">
                              <input
                                type="text"
                                name="option_qty"
                                class="form-control"
                                placeholder="양"
                                required
                              />
                            </div>
                            <input type="hidden" name="optionNo" />

                            <div class="col-md">
                              <input
                                type="text"
                                name="option_price"
                                class="form-control"
                                placeholder="가격"
                                required
                              />
                            </div>
                            <div class="col-md-1"></div>
                          </div>

                          <div class="row ingredient_row">
                            <div class="col-md">
                              <input
                                type="text"
                                name="option_name"
                                class="form-control"
                                placeholder="상품명"
                              />
                            </div>
                            <div class="col-md">
                              <input
                                type="text"
                                name="option_qty"
                                class="form-control"
                                placeholder="양"
                              />
                            </div>

                            <div class="col-md">
                              <input
                                type="text"
                                name="option_price"
                                class="form-control"
                                placeholder="가격"
                                required
                              />
                            </div>
                            <div class="col-md-1">
                              <img
                                id="minus_btn"
                                class="btn-smallsquare border"
                                src="${contextPath}/img/icon/minus.png"
                                alt="빼기 버튼"
                              />
                            </div>
                          </div>
                          <div class="row ingredient_row">
                            <div class="col-md">
                              <input
                                type="text"
                                name="option_name"
                                class="form-control"
                                placeholder="상품명"
                              />
                            </div>
                            <div class="col-md">
                              <input
                                type="text"
                                name="option_qty"
                                class="form-control"
                                placeholder="양"
                              />
                            </div>

                            <div class="col-md">
                              <input
                                type="text"
                                name="option_price"
                                class="form-control"
                                placeholder="가격"
                                required
                              />
                            </div>
                            <div class="col-md-1">
                              <img
                                id="minus_btn"
                                class="btn-smallsquare border"
                                src="${contextPath}/img/icon/minus.png"
                                alt="빼기 버튼"
                              />
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div
                      class="col-md-11"
                      style="width: 100%; text-align: center"
                    >
                      <img
                        id="plus_btn"
                        src="${contextPath}/img/icon/plus.png"
                        alt="더하기 버튼"
                        class="btn-smallsquare border"
                      />
                    </div>
                  </div>
                  <div class="property-flex2" style="height: 60px">
                    <div
                      class="property_title1 textbold"
                      style="margin-top: 16px"
                    >
                      상품 정보 기입
                    </div>
                  </div>
                  <p style="margin-top: 16px">
                    <textarea
                      class="goodsinfo s_textarea"
                      cols="50"
                      rows="8"
                      style="width: 350px"
                    ></textarea>
                    <input
                      type="hidden"
                      name="description"
                      id="h_input"
                      value=""
                    />
                  </p>

                  <div style="display: inline-block; margin: 50px 145px 0 0">
                    <button
                      class="cart-button css-cartbtn e4nu7ef3"
                      type="reset"
                      radius="3"
                      style="width: 100px"
                    >
                      <span class="css-nytqmg textbold">다시 쓰기</span>
                    </button>
                  </div>
                  <!--중간부분-->
                  <div style="display: inline-block">
                    <button
                      class="cart-button css-cartbtn e4nu7ef3"
                      type="submit"
                      radius="3"
                      style="width: 100px"
                    >
                      <span class="css-nytqmg textbold">상품 등록</span>
                    </button>
                  </div>
                </section>
              </div>
            </div>
          </div>
        </form>
      </div>
    </section>
  </body>
</html>
