function updateSeconds() {
        $(".hotdeal_time_row").each(function () {
          changeTexts($(this));
        });
      }

      function changeTexts(obj) {
        var currentDate = new Date();
        var specificDate = new Date(obj.find(".h_finishDate").val());
        var remainingTime = specificDate.getTime() - currentDate.getTime();

        var remainingDays = Math.floor(remainingTime / (1000 * 60 * 60 * 24));
        var remainingHours = Math.floor(
          (remainingTime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)
        );
        var remainingMinutes = Math.floor(
          (remainingTime % (1000 * 60 * 60)) / (1000 * 60)
        );
        var remainingSeconds = Math.floor((remainingTime % (1000 * 60)) / 1000);

        if (remainingDays < 10) {
          remainingDays = "0" + remainingDays;
        }
        if (remainingHours < 10) {
          remainingHours = "0" + remainingHours;
        }
        if (remainingMinutes < 10) {
          remainingMinutes = "0" + remainingMinutes;
        }
        if (remainingSeconds < 10) {
          remainingSeconds = "0" + remainingSeconds;
        }
        var dateText =
          remainingDays +
          ":" +
          remainingHours +
          ":" +
          remainingMinutes +
          ":" +
          remainingSeconds;
        obj.find(".hotdeal_time_text").text(dateText);
      }

      setInterval(updateSeconds, 1000);
