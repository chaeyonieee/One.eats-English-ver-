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
    <title>goodsDetail</title>

    <link href="${contextPath}/css/cyform.css" rel="stylesheet" />
    <link rel="stylesheet" href="${contextPath}/css/community.css" />
  </head>
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
    function input() {
      const date = document.querySelector("#input_date").value;
      console.log(date);

      const goods_description =
        document.querySelector("#goods_description").value;
      console.log(goods_description);
    }
  </script>
  <body>
    <section class="spad" style="padding-top: 28px !important">
      <div class="container">
        <form
          id="register-form"
          method="post"
          enctype="multipart/form-data"
          action="${contextPath}/admin/hotdeal/adminHotDealAdd.do?goodsNo=${goods.goodsNo}"
        >
          <div class="row">
            <div class="col-lg-6 col-md-6">
              <div class="product__details__pic">
                <div class="product__details__pic__item">
                  <img id="goods_preview" src="" alt="" />
                  <img
                    src="${contextPath}/download.do?imageFileName=${goods.img1}&path=goods/${goods.goodsNo}"
                  />
                  <div class="product__details__pic__slider owl-carousel">
                    <c:if test="${not empty goods.img2}">
                      <img
                        src="${contextPath}/download.do?imageFileName=${goods.img2}&path=goods/${goods.goodsNo}"
                      />
                    </c:if>
                    <c:if test="${not empty goods.img3}">
                      <img
                        src="${contextPath}/download.do?imageFileName=${goods.img3}&path=goods/${goods.goodsNo}"
                      />
                    </c:if>
                    <c:if test="${not empty goods.img4}">
                      <img
                        src="${contextPath}/download.do?imageFileName=${goods.img4}&path=goods/${goods.goodsNo}"
                      />
                    </c:if>
                    <c:if test="${not empty goods.img5}">
                      <img
                        src="${contextPath}/download.do?imageFileName=${goods.img5}&path=goods/${goods.goodsNo}"
                      />
                    </c:if>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6 col-md-6 text-left">
              <div class="product__details__text">
                <section>
                  <input name="type" type="hidden" value="Business" />

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
                            <option value="category">
                              Please select a category
                            </option>

                            <option value="Stew/ Soup/ Steamed">Stew/ Soup/ Steamed</option>
                            <option value="Meal/ Appetizers">Meal/ Appetizers</option>
                            <option value="Porridge">Porridge</option>
                            <option value="Meal Replacement">Meal Replacement</option>
                            <option value="Sidedish">Sidedish</option>
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
                        Product Name
                      </dt>
                      <dd class="property-flex1">
                        <input
                          name="goodsname"
                          readonly
                          value="${goods.name}"
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
                      Selling price
                    </dt>
                    <dd class="property-flex1">
                      <input
                        name="price"
                        readonly
                        value="${goods.price}"
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
                      Seller
                    </dt>
                    <dd class="property-flex1">
                      <input
                        readonly
                        value="OneEATS"
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
                      Package Type
                    </dt>
                    <dd class="property-flex1">
                      <input
                        readonly
                        name="rapping"
                        value="${goods.rapping}"
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
                      Manufacturer
                    </dt>
                    <dd class="property-flex1">
                      <input
                        readonly
                        name="manufacturer"
                        value="${goods.manufacturer}"
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
                      Weight /Capacity
                    </dt>
                    <dd class="property-flex1">
                      <input
                        readonly
                        name="weight"
                        value="${goods.weight}"
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
                      Expiration date
                    </dt>
                    <dd class="property-flex1">
                      <input
                        readonly
                        value="${goods.expDate}"
                        type="text"
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
                      Hot Deal Finish Date
                    </dt>
                    <dd class="property-flex1">
                      <input
                        name="finishDate"
                        id="input_date"
                        type="date"
                        class="property-font1 nice-select"
                        style="width: 176px"
                      />
                    </dd>
                  </dl>
                  <div class="row ingredient_grid">
                    <div class="col">
                      <div class="row">&nbsp;</div>
                      <div class="row ingredient_rows">
                        <div class="col-md-11 ingredient_col">
                          <div
                            class="row ingredient_row head_row bg-lightgreen" style="color:#666666"
                          >
                            <div class="col-md">Hot Deal Name</div>
                            <div class="col-md">Hot Deal Quantity</div>

                            <div class="col-md">Discount PricePrice</div>
                            <div class="col-md-1"></div>
                          </div>
                          <div class="row ingredient_row">
                            <div class="col-md">
                              <input
                                type="text"
                                name="name"
                                class="form-control"
                                placeholder=" Product Name"
                                required
                              />
                            </div>
                            <div class="col-md">
                              <input
                                type="text"
                                name="goods_qty"
                                class="form-control"
                                placeholder="Amount"
                                required
                              />
                            </div>
                            <input type="hidden" name="optionNo" />

                            <div class="col-md">
                              <input
                                type="text"
                                name="discounted_price"
                                class="form-control"
                                placeholder="Price"
                                required
                              />
                            </div>
                            <div class="col-md-1"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="property-flex2" style="height: 60px">
                    <div
                      class="property_title1 textbold"
                      style="margin-top: 16px"
                    >
                      Write Hot Deal Information
                    </div>
                  </div>
                  <p style="margin-top: 16px">
                    <textarea
                      class="goodsinfo description_textarea"
                      cols="50"
                      rows="8"
                      style="width: 350px"
                    ></textarea>

                    <input
                      type="hidden"
                      name="description"
                      id="goods_description"
                      value=""
                    />
                  </p>

                  <div style="display: inline-block; margin: 50px 145px 0 0">
                    <button
                      class="cart-button css-cartbtn e4nu7ef3"
                      type="reset"
                      radius="3"
                      style="width: 120px"
                    >
                      <span class="css-nytqmg textbold">Rewrite</span>
                    </button>
                  </div>
                  <!--중간부분-->
                  <div style="display: inline-block">
                    <button
                      type="submit"
                      class="cart-button css-cartbtn"
                      radius="3"
                      style="width: 120px"
                      id="input_submit"
                    >
                      <div class="css-nytqmg textbold">Registration </div>
                    </button>
                  </div>
                </section>
              </div>
            </div>
          </div>
        </form>
      </div>
    </section>
    <script>
      $(document).ready(function () {
        var textareaInput = $(".description_textarea").val();
        var output = textareaInput.replace(/\n/g, "<br>");
        var input = textareaInput.replace(/<br>/g, "\n");
        $(".description_textarea").val(input);
        $("#goods_description").val(output);

        $(".description_textarea").on("input", function () {
          var textareaInput = $(this).val();
          var output = textareaInput.replace(/\n/g, "<br>");

          $("#goods_description").val(output);
        });
      });
    </script>
  </body>
</html>
