<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib uri
="http://tiles.apache.org/tags-tiles" prefix="tiles" %> <%@ taglib prefix ="c"
uri ="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>sidebar</title>
    <link rel="stylesheet" href="${contextPath}/css/side.css" />

    <script>
      var rotateArray = new Array(0, 0, 0, 0, 0);
    </script>
    <script src="${contextPath}/js/side.js"></script>
    <style>
      .recipe_search_type_select .nice-select {
        width: 90%;
        margin: auto;
      }
    </style>
  </head>
  <body>
    <div class="row">
      <div class="col-lg">
        <div class="textsize-2 textcolor-black border text-left">
          <div id="side_menu_title">
            <span>&nbsp;&nbsp;Recipe</span>
          </div>
          <form action="${contextPath}/community/recipe/recipeList.do">
            <div
              class="toggle-btn textsize-1 text-right"
              style="margin-right: 8px"
            >
              Search in detail
            </div>
            <div
              class="toggle-content recipe_search_type_select"
              style="padding-left: 8px; padding-right: 8px; margin: auto"
            >
              <select name="recipe_search_type">
                <option value="">Total</option>
                <option value="title">Title</option>
                <option value="description">How to make</option>
              </select>
              <div>&nbsp;</div>
            </div>
            <div
              class="input-group textsize-1"
              style="
                padding-left: 8px;
                padding-right: 8px;
                height: 24px;
                margin-top: 4px;
                margin-bottom: 24px;
              "
            >
              <input
                type="text"
                placeholder="Recipe Search..."
                name="recipe_search_word"
                class="form-control"
                style="height: 100%"
              />
              <div class="input-group-append" style="height: 100%">
                <button
                  class="bg-lightgreen textcolor-black border-0"
                  style="min-width: 40px"
                  type="submit"
                >
                  Search
                </button>
              </div>
            </div>
          </form>
          <ul class="ul_menus">
            <li>
              <div class="textsize-2" style="margin-right: 12px">
                <div
                  class="textbold"
                  style="width: 100%"
                  onclick="fn_slideToggle(1);"
                >
                  Total(${totalRecipeNum})
                  <img
                    id="arrow_1"
                    src="${contextPath}/img/icon/uparrow.png"
                    alt=""
                    style="width: 10px; float: right"
                  />
                </div>
                <ul
                  id="category_1"
                  class="textsize-1"
                  style="margin-left: 12px; margin-top: 12px"
                >
                  <c:forEach
                    items="${recipeNumMap}"
                    var="numsMap"
                    varStatus="i"
                  >
                    <c:if test="${i.index>0}">
                      <li>
                        <a
                          href="${contextPath}/community/recipe/recipeList.do?category=${numsMap.category}"
                          >${numsMap.category}(${numsMap.cnt})</a
                        >
                      </li>
                    </c:if>
                  </c:forEach>
                </ul>
              </div>
            </li>
          </ul>
          <div id="side_recentrecipe_wrapper">
            <div
              class="textcolor-black textsize-2 textbold"
              style="margin-left: 12px"
            >
              Recent Recipe
            </div>

            <c:forEach items="${newRecipeList}" var="recipe">
              <div
                id="side_recentrecipe_row"
                class="row"
                onclick="location.href='${contextPath}/community/recipe/recipeDetail.do?recipeNo=${recipe.recipeNo}'"
              >
                <div class="col-md-3 p-0">
                  <div class="img-square-wrapper">
                    <img
                      src="${contextPath}/download.do?imageFileName=${recipe.cookingImg}&path=recipeNo${recipe.recipeNo}"
                      alt="Recipe 사진"
                      style="width: 100%"
                    />
                  </div>
                </div>
                <div class="col-md-1 p-0">&nbsp;</div>
                <div class="col-md-8 p-0">
                  <div class="textbold textsize-2">${recipe.title}</div>
                  <div style="font-size: 8px">${recipe.creDate}</div>
                </div>
              </div>
            </c:forEach>
          </div>
          <div>&nbsp;</div>
        </div>
      </div>
    </div>
  </body>
</html>
