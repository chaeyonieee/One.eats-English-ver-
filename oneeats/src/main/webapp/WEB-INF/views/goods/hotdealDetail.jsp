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
    <title>hotdealDetail</title>

    <link href="${contextPath}/css/goodsDetail.css" rel="stylesheet" />
    <style>
      dl.goods_option_row > dt {
        width: 100%;
      }
      dl.goods_option_row > dt > div.option_price {
        text-align: right;
        font-size: 16px;
        float: right;
        font-weight: 600;
      }
      div.div-qty-input {
        width: 140px;
        height: 42px;
        display: inline-block;
        position: relative;
        text-align: center;
        background: #f5f5f5;
        margin-bottom: 8px;
        align-content: center;
        align-self: center;
      }
      div.div-qty-input input {
        height: 100%;
        width: 100%;
        font-size: 16px;
        color: #6f6f6f;
        width: 50px;
        border: none;
        background: #f5f5f5;
        text-align: center;
      }
    </style>
    <!--옵션을 선택할 때마다 행이 추가됨-->
    <script>
      var storeValueUrl = "${contextPath}" + "/addCartToListValue.do";
      var goodsPrice = "${goods.price}";
      goodsPrice = parseInt(goodsPrice);
      var cartPage = "${contextPath}/main/cart.do";
    </script>
    <script src="${contextPath}/js/goodsDetail.js"></script>
  </head>

  <body>
    <!-- Breadcrumb Section Begin -->
    <c:choose>
      <c:when
        test="${goods.category == 'Juice / Homemade Jam' || goods.category == 'Fruits' || goods.category == 'Vegetables'}"
      >
        <section
          class="breadcrumb-section set-bg"
          data-setbg="${contextPath}/img/breadcrumb1.jpg"
        >
          <div class="container">
            <div class="row">
              <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                  <h2>${goods.category}</h2>
                  <div class="breadcrumb__option"></div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </c:when>
      <c:otherwise>
        <section
          class="breadcrumb-section set-bg"
          data-setbg="${contextPath}/img/breadcrumb5.png"
        >
          <div class="container">
            <div class="row">
              <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                  <h2>${goods.category}</h2>
                  <div class="breadcrumb__option"></div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </c:otherwise>
    </c:choose>

    <section class="product-details spad">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 col-md-6">
            <div class="product__details__pic">
              <div class="product__details__pic__item">
                <img
                  src="${contextPath}/download.do?imageFileName=${goods.img1}&path=goodsNo${goods.goodsNo}"
                />
                <div class="product__details__pic__slider owl-carousel">
                  <c:if test="${not empty goods.img2}">
                    <img
                      src="${contextPath}/download.do?imageFileName=${goods.img2}&path=goodsNo${goods.goodsNo}"
                    />
                  </c:if>
                  <c:if test="${not empty goods.img3}">
                    <img
                      src="${contextPath}/download.do?imageFileName=${goods.img3}&path=goodsNo${goods.goodsNo}"
                    />
                  </c:if>
                  <c:if test="${not empty goods.img4}">
                    <img
                      src="${contextPath}/download.do?imageFileName=${goods.img4}&path=goodsNo${goods.goodsNo}"
                    />
                  </c:if>
                  <c:if test="${not empty goods.img5}">
                    <img
                      src="${contextPath}/download.do?imageFileName=${goods.img5}&path=goodsNo${goods.goodsNo}"
                    />
                  </c:if>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-6 col-md-6 text-left">
            <div class="product__details__text">
              <h3>${hotdeal.name}</h3>
              <div class="product__details__rating">
                <img
                  src="${contextPath}/img/product/review/star.jpg"
                  alt="Review 별"
                />
                <span>Average ${reviewAvg} point </span>
                <span>(${totalReviewsNum} reviews)</span>
                <div class="product__details__price">
                  ${hotdeal.discounted_price}
                </div>
                <section class="css-1ua1wyk">
                  <div class="css-iqoq9n">
                    <c:choose>
                      <c:when test="${goods.type=='Business'}">
                        <div class="goods_detail_description">
                          <dl class="property-flex2">
                            <dt class="property-input-gd">Package Type</dt>
                            <dd class="property-flex4">
                              <span class="property-input"
                                >${goods.rapping}</span
                              >
                            </dd>
                          </dl>
                          <dl class="property-flex2">
                            <dt class="property-input-gd">Country of origin</dt>
                            <dd class="property-flex4">
                              ${goods.manufacturer}
                            </dd>
                          </dl>
                          <dl class="property-flex2">
                            <dt class="property-input-gd">Weight /Capacity</dt>
                            <dd class="property-flex4">
                              <span class="property-input"
                                >${goods.weight}</span
                              >
                            </dd>
                          </dl>
                          <dl class="property-flex2">
                            <dt class="property-input-gd">Harvesting Season</dt>
                            <dd class="property-flex4">
                              <span class="property-input"
                                >${goods.harvest}</span
                              >
                            </dd>
                          </dl>

                          <dl class="property-flex2">
                            <dt class="property-input-gd">Hot Deal Quantity</dt>
                            <dd class="property-flex4">
                              <span class="property-input"
                                >${hotdeal.goods_qty}</span
                              >
                            </dd>
                          </dl>

                          <dl class="property-flex2">
                            <dt class="property-input-gd">
                              Hot Deal Finish Date
                            </dt>
                            <dd class="property-flex4">
                              <span class="property-input"
                                >${hotdeal.finishDate}</span
                              >
                            </dd>
                          </dl>

                          <dl class="property-flex2">
                            <dt class="property-input-gd">
                              Hot Deal Information
                            </dt>
                            <dd class="property-flex4">
                              <span class="property-input"
                                >${hotdeal.description}</span
                              >
                            </dd>
                          </dl>
                        </div>
                      </c:when>

                      <c:otherwise>
                        <div class="goods_detail_description">
                          <dl class="property-flex2">
                            <dt class="property-input-gd">Seller</dt>
                            <dd class="property-flex4">
                              <span class="property-input">OneEATS</span>
                            </dd>
                          </dl>
                          <dl class="property-flex2">
                            <dt class="property-input-gd">Package Type</dt>
                            <dd class="property-flex4">
                              <span class="property-input"
                                >${goods.rapping}</span
                              >
                            </dd>
                          </dl>
                          <dl class="property-flex2">
                            <dt class="property-input-gd">Manufacturer</dt>
                            <dd class="property-flex4">
                              <span class="property-input">
                                ${goods.manufacturer}
                              </span>
                            </dd>
                          </dl>
                          <dl class="property-flex2">
                            <dt class="property-input-gd">Weight /Capacity</dt>
                            <dd class="property-flex4">
                              <span class="property-input"
                                >${goods.weight}</span
                              >
                            </dd>
                          </dl>
                          <dl class="property-flex2">
                            <dt class="property-input-gd">Expiration date</dt>
                            <dd class="property-flex4">
                              <span class="property-input"
                                >${goods.expDate}</span
                              >
                            </dd>
                          </dl>

                          <dl class="property-flex2">
                            <dt class="property-input-gd">Hot Deal Quantity</dt>
                            <dd class="property-flex4">
                              <span class="property-input"
                                >${hotdeal.goods_qty}</span
                              >
                            </dd>
                          </dl>

                          <dl class="property-flex2">
                            <dt class="property-input-gd">
                              Hot Deal Finish Date
                            </dt>
                            <dd class="property-flex4">
                              <span class="property-input"
                                >${hotdeal.finishDate}</span
                              >
                            </dd>
                          </dl>

                          <dl class="property-flex2">
                            <dt class="property-input-gd">
                              Hot Deal Information
                            </dt>
                            <dd class="property-flex4">
                              <span class="property-input"
                                >${hotdeal.description}</span
                              >
                            </dd>
                          </dl>
                        </div>
                      </c:otherwise>
                    </c:choose>
                    <form
                      id="optionForm"
                      action="${contextPath}/orderNow.do"
                      method="post"
                    >
                      <!--Modify-->
                      <div class="property-margin" style="margin-bottom: -40px">
                        <div class="property-margin1">
                          <input
                            type="hidden"
                            class="h_option_qty_${hotdeal.hotdealNo}"
                            value="${hotdeal.goods_qty}"
                          />
                          <input
                            type="hidden"
                            class="h_option_price_${hotdeal.hotdealNo}"
                            value="${hotdeal.discounted_price}"
                          />
                          <input
                            type="hidden"
                            class="h_option_name_${hotdeal.hotdealNo}"
                            value=" ${hotdeal.name}"
                          />
                          <div
                            class="cart-option-item property-flex5 goods_option_grid"
                            style="width: 525px"
                          >
                            <!--선택한 Product 옵션이 나타나는 구역 -->
                            <div class="goods_option_rows">
                              <dl class="property-flex2 goods_option_row">
                                <dt class="property-font2 epzddad1">
                                  <div
                                    class="property-font3 font-bold"
                                    style="margin-bottom: 24px; font-size: 22px"
                                    id="goods_option_name"
                                  >
                                    ${hotdeal.name}
                                  </div>
                                  <input
                                    type="hidden"
                                    value="${hotdeal.hotdealNo}"
                                    name="optionNo"
                                    class="h_optionNo"
                                  />
                                  <div class="">
                                    <div class="text-left">
                                      <div class="div-qty-input border6">
                                        <a class="goods_option_minus_btn">-</a>
                                        <input
                                          type="text"
                                          value="1"
                                          name="goodsQty"
                                          class="goodsQty_input"
                                        />
                                        <a class="goods_option_plus_btn">+</a>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="option_price">
                                    ${hotdeal.discounted_price}
                                  </div>

                                  <input
                                    type="hidden"
                                    class="h_option_price"
                                    value="${hotdeal.discounted_price}"
                                  />
                                  <input
                                    type="hidden"
                                    class="h_option_discount"
                                    value="${goods.price*hotdeal.goods_qty-hotdeal.discounted_price}"
                                  />
                                </dt>
                              </dl>
                            </div>
                            <span
                              class="property-font3 text-right"
                              style="
                                font-size: 16px;
                                border-top: 1px solid rgb(244, 244, 244);
                                margin: 12px 0 -10px 0;
                                padding: 10px 0 10px 0;
                              "
                            >
                              Total product price
                            </span>
                            <span
                              class="property-font3 text-right"
                              style="font-size: 22px; margin-bottom: -10px"
                              id="payment_price"
                              >${goods.price*hotdeal.goods_qty}</span
                            >
                            <span
                              class="property-font3 text-right"
                              style="
                                font-size: 16px;
                                border-top: 1px solid rgb(244, 244, 244);
                                margin: 12px 0 -10px 0;
                                padding: 10px 0 10px 0;
                              "
                            >
                              Discount Price
                            </span>
                            <span
                              class="property-font3 text-right"
                              style="font-size: 22px; margin-bottom: -10px"
                              id="discount_price"
                              >${goods.price*hotdeal.goods_qty-hotdeal.discounted_price}</span
                            >

                            <span
                              class="property-font3 text-right"
                              style="
                                font-size: 16px;
                                border-top: 1px solid rgb(244, 244, 244);
                                margin: 12px 0 -10px 0;
                                padding: 10px 0 10px 0;
                              "
                            >
                              Payment
                            </span>
                            <span
                              class="property-font3 text-right"
                              style="font-size: 22px; margin-bottom: -10px"
                              id="t_price"
                              >${hotdeal.discounted_price}</span
                            >
                            <!--Shipping Fee와 ProductPrice hidden-->
                            <input type="hidden" name="shippingFee" value="0" />
                            <input
                              type="hidden"
                              id="h_payment_price"
                              name="payment_price"
                              value="${goods.price}"
                            />
                            <input
                              type="hidden"
                              id="h_discount_price"
                              name="discount_price"
                              value="${goods.price*hotdeal.goods_qty-hotdeal.discounted_price}"
                            />
                            <input
                              type="hidden"
                              id="total_price"
                              value="${hotdeal.discounted_price}"
                            />
                          </div>
                        </div>

                        <div class="css-9y0nwt">
                          <div class="css-ixlb9s">
                            <div class="css-yhijln">
                              <span
                                class="css-x4cdgl"
                                id="sum"
                                value="0"
                              ></span>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="css-lay goods_detail_buttons">
                        <button
                          class="css-heartbtn btn-regular"
                          type="button"
                          width="56"
                          height="56"
                          radius="3"
                          onclick="fn_bookmark('${goods.goodsNo}')"
                        >
                          <span class="css-let1"
                            ><img
                              src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzIiIGhlaWdodD0iMzIiIHZpZXdCb3g9IjAgMCAzMiAzMiIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICAgIDxwYXRoIGQ9Ik0yNS44MDcgNy44NjNhNS43NzcgNS43NzcgMCAwIDAtOC4xNzIgMEwxNiA5LjQ5N2wtMS42MzUtMS42MzRhNS43NzkgNS43NzkgMCAxIDAtOC4xNzMgOC4xNzJsMS42MzQgMS42MzQgNy40NjYgNy40NjdhMSAxIDAgMCAwIDEuNDE1IDBzMCAwIDAgMGw3LjQ2Ni03LjQ2N2gwbDEuNjM0LTEuNjM0YTUuNzc3IDUuNzc3IDAgMCAwIDAtOC4xNzJ6IiBzdHJva2U9IiM1RjAwODAiIHN0cm9rZS13aWR0aD0iMS42IiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIvPgo8L3N2Zz4K"
                              alt=""
                              class="css-0"
                          /></span>
                        </button>
                        <div class="css-lay2">
                          <button
                            class="cart-button css-cartbtn"
                            type="submit"
                            radius="3"
                          >
                            <div class="css-nytqmg textbold btn-hover">
                              Buy Now
                            </div>
                          </button>
                        </div>
                        <div class="css-lay2">
                          <button
                            class="cart-button css-cartbtn"
                            type="button"
                            radius="3"
                            onclick="fn_toCart()"
                          >
                            <div class="css-nytqmg textbold btn-hover">
                              Add to Cart
                            </div>
                          </button>
                        </div>
                      </div>
                    </form>
                  </div>
                </section>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Product Details Section End -->

    <!-- Js Plugins -->
  </body>
</html>
