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
    <title>sellerGoodsDetail</title>
    <link href="${contextPath}/css/cyform.css" rel="stylesheet" />

    <link rel="stylesheet" href="${contextPath}/css/community.css" />
    <script src="${contextPath}/js/community.js"></script>
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
      const category = document.querySelector("#input_category").value;
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
          action="${contextPath}/seller/goods/addSellerGoods.do"
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
                  <input name="type" type="hidden" value="Business" />

                  <div class="property-margin1">
                    <dl class="property-flex2" style="height: 66px">
                      <dt
                        class="property_title1 textbold"
                        style="margin-top: 16px"
                      >
                        Category
                      </dt>
                      <dd class="property-flex1">
                        <div style="align-content: center; margin-top: 4px">
                          <select id="category" name="category" class="opt">
                            <option value="Vegetables">Vegetables</option>
                            <option value="Fruits">Fruits</option>
                            <option value="Juice / Homemade Jam">Juice / Homemade Jam</option>
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
                          type="text"
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
                      Selling price
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
                      Seller
                    </dt>
                    <dd class="property-flex1">
                      <input
                        value="${memberInfo.name}"
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
                      Country of origin
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
                      Weight /Capacity
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
                      Harvesting Season
                    </dt>
                    <dd class="property-flex1">
                      <input
                        name="harvest"
                        type="text"
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
                            <div class="col-md">Name of the option</div>
                            <div class="col-md">Amount of the option</div>

                            <div class="col-md">Price</div>
                            <div class="col-md-1"></div>
                          </div>
                          <div class="row ingredient_row">
                            <div class="col-md">
                              <input
                                type="text"
                                name="option_name"
                                class="form-control"
                                placeholder="Product Name"
                                required
                              />
                            </div>
                            <div class="col-md">
                              <input
                                type="text"
                                name="option_qty"
                                class="form-control"
                                placeholder="Amount"
                                required
                              />
                            </div>
                            <input type="hidden" name="optionNo" />

                            <div class="col-md">
                              <input
                                type="text"
                                name="option_price"
                                class="form-control"
                                placeholder="Price"
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
                                placeholder="Product Name"
                              />
                            </div>
                            <div class="col-md">
                              <input
                                type="text"
                                name="option_qty"
                                class="form-control"
                                placeholder="Amount"
                              />
                            </div>

                            <div class="col-md">
                              <input
                                type="text"
                                name="option_price"
                                class="form-control"
                                placeholder="Price"
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
                                placeholder="Product Name"
                              />
                            </div>
                            <div class="col-md">
                              <input
                                type="text"
                                name="option_qty"
                                class="form-control"
                                placeholder="Amount"
                              />
                            </div>

                            <div class="col-md">
                              <input
                                type="text"
                                name="option_price"
                                class="form-control"
                                placeholder="Price"
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
                  <div class="row"></div>
                  <div class="property-flex2" style="height: 60px">
                    <div
                      class="property_title1 textbold"
                      style="margin-top: 16px"
                    >
                      Entering product details
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
                      <div class="css-nytqmg textbold">
                        Registration
                      </div>
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
