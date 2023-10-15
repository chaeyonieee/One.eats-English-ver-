function calculate() {
        noshipping_price = parseInt(payment_price) - parseInt(discount_price);
        total_price =
          parseInt(payment_price) -
          parseInt(discount_price) +
          parseInt(shippingFee);
      }

      function changeTexts() {
        $(".shippingFee_text").text(shippingFee);
        $(".payment_price_text").text(payment_price);
        $(".discount_price_text").text(discount_price);
        $(".noshipping_price_text").text(noshipping_price);
        $(".total_price_text").text(total_price);
      }

      function fn_uncheckCartItem(row) {
        var row_discount_price = parseInt(
          row.find(".h_row_discount_price").val()
        );
        var row_total_price = parseInt(row.find(".h_row_total_price").val());
        var row_payment_price = parseInt(
          row.find(".h_row_payment_price").val()
        );

        payment_price = parseInt(payment_price) - row_payment_price;
        discount_price = parseInt(discount_price) - row_discount_price;
        total_price = parseInt(total_price) - row_total_price;
        calculate();
        changeTexts();
        
        row.find(".h_goods_no").attr("disabled","disabled");
        row.find(".h_option_no").attr("disabled","disabled");
        row.find(".h_goods_inbun").attr("disabled","disabled");
         console.log(row.find(".h_goods_no").val());
      }

      function fn_checkCartItem(row) {
        var row_discount_price = parseInt(
          row.find(".h_row_discount_price").val()
        );
        var row_total_price = parseInt(row.find(".h_row_total_price").val());
        var row_payment_price = parseInt(
          row.find(".h_row_payment_price").val()
        );

        payment_price = parseInt(payment_price) + row_payment_price;
        discount_price = parseInt(discount_price) + row_discount_price;
        total_price = parseInt(total_price) + row_total_price;
        calculate();
        changeTexts();
        
        row.find(".h_goods_no").removeAttr("disabled");
        row.find(".h_option_no").removeAttr("disabled");
        row.find(".h_goods_inbun").removeAttr("disabled");
       
        
      }

      $(document).on("click", ".goods_option_plus_btn", function () {
        var goodsOptionVar = $(this).parent().find(".goodsQty_input").val();
        var changedVar = parseInt(goodsOptionVar) + 1;
        var parentRow = $(this).closest(".cart_goods_row");
        if (changedVar < 100) {
          $(this).parent().find(".goodsQty_input").val(changedVar);
          var row_option_price = parseInt(
            parentRow.find(".h_row_option_price").val()
          );
          var row_option_discount = parseInt(
            parentRow.find(".h_row_option_discount").val()
          );
          var row_discount_price = parseInt(
            parentRow.find(".h_row_discount_price").val()
          );
          var row_total_price = parseInt(
            parentRow.find(".h_row_total_price").val()
          );
          var row_payment_price = parseInt(
            parentRow.find(".h_row_payment_price").val()
          );
          var row_goods_price = parseInt(
            parentRow.find(".h_row_goods_price").val()
          );
          var row_option_qty = parseInt(
            parentRow.find(".h_row_option_qty").val()
          );
          row_payment_price =
            row_payment_price + row_goods_price * row_option_qty;
          row_discount_price = row_discount_price + row_option_discount;
          row_total_price = row_total_price + row_option_price;
          parentRow.find(".row_payment_price").text(row_payment_price);
          parentRow.find(".h_row_payment_price").val(row_payment_price);
          parentRow.find(".row_discount_price").text(row_discount_price);
          parentRow.find(".h_row_discount_price").val(row_discount_price);
          parentRow.find(".row_total_price").text(row_total_price);
          parentRow.find(".h_row_total_price").val(row_total_price);

          payment_price =
            parseInt(payment_price) + row_goods_price * row_option_qty;
          discount_price = parseInt(discount_price) + row_option_discount;
          calculate();
          changeTexts();
        }
      });

      $(document).on("click", ".goods_option_minus_btn", function () {
        var goodsOptionVar = $(this).parent().find(".goodsQty_input").val();
        var changedVar = parseInt(goodsOptionVar) - 1;
        var parentRow = $(this).closest(".cart_goods_row");
        if (changedVar > 0) {
          $(this).parent().find(".goodsQty_input").val(changedVar);
          var row_option_price = parseInt(
            parentRow.find(".h_row_option_price").val()
          );
          var row_option_discount = parseInt(
            parentRow.find(".h_row_option_discount").val()
          );
          var row_discount_price = parseInt(
            parentRow.find(".h_row_discount_price").val()
          );
          var row_total_price = parseInt(
            parentRow.find(".h_row_total_price").val()
          );
          var row_payment_price = parseInt(
            parentRow.find(".h_row_payment_price").val()
          );
          var row_goods_price = parseInt(
            parentRow.find(".h_row_goods_price").val()
          );

          var row_option_qty = parseInt(
            parentRow.find(".h_row_option_qty").val()
          );
          row_payment_price =
            row_payment_price - row_goods_price * row_option_qty;
          row_discount_price = row_discount_price - row_option_discount;
          row_total_price = row_total_price - row_option_price;
          parentRow.find(".row_payment_price").text(row_payment_price);
          parentRow.find(".h_row_payment_price").val(row_payment_price);
          parentRow.find(".row_discount_price").text(row_discount_price);
          parentRow.find(".h_row_discount_price").val(row_discount_price);
          parentRow.find(".row_total_price").text(row_total_price);
          parentRow.find(".h_row_total_price").val(row_total_price);

          payment_price =
            parseInt(payment_price) - row_goods_price * row_option_qty;
          discount_price = parseInt(discount_price) - row_option_discount;
          calculate();
          changeTexts();
        }
      });

      $(document).on("click", ".cart_remove_btn", function () {
        var parentRow = $(this).closest(".cart_goods_row");
        var row_option_qty = parseInt(
          parentRow.find(".h_row_option_qty").val()
        );
        var row_option_No = parseInt(parentRow.find(".h_option_no").val());

        $.ajax({
          type: "POST",
          url: removeValUrl,
          data: { num: row_option_No },
          success: function (response) {
            if (response == "success") {
              alert("Deleted.");
              fn_uncheckCartItem(parentRow);
              parentRow.remove();
            } else {
              alert("Unable to complete delete. in the cart.");
            }
          },
          error: function (response) {
            alert("An error of unknown cause");
            console.log(response);
          },
        });
      });

      $(document).ready(function () {
        $("#cart_all_checkbox").change(function () {
          if ($(this).is(":checked")) {
            $(".cart_checkbox").prop("checked", true);
            payment_price = 0;
            discount_price = 0;
            total_price = 0;
            var rows = $(".cart_goods_row");
            $(".cart_goods_row").each(function () {
              var row = $(this);
              fn_checkCartItem(row);
            });
            calculate();
            changeTexts();
          } else {
            $(".cart_checkbox").prop("checked", false);
            payment_price = 0;
            discount_price = 0;
            total_price = 0;
            calculate();
            changeTexts();
          }
        });

        $(".cart_checkbox").change(function () {
          var isChecked = $(this).is(":checked");
          var parentRow = $(this).closest(".cart_goods_row");

          if (isChecked) {
            fn_checkCartItem(parentRow);
          } else {
            fn_uncheckCartItem(parentRow);
          }
        });
      });
