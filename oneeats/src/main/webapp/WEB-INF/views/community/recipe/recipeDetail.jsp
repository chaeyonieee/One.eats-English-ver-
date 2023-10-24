<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib
uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> <%@ taglib prefix
="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Recipe detail</title>
    <link rel="stylesheet" href="${contextPath}/css/community.css" />
    <script src="${contextPath}/js/recipe.js"></script>
  </head>
  <body>
    ${result}
    <section>
      <div class="recipeDetail_grid">
        <div class="row">
          <div class="col">
            <div class="textsize-3 text-left textbold textcolor-black">
              ${recipe.title}
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col">
            <div class="recipe_creDate textsize-1 text-left textcolor-black">
              ${recipe.creDate}
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col">
            <button
              class="btn-remove"
              style="float: right"
              onclick="fn_openalert('Do you want to delete the recipe?','${contextPath}/community/recipe/deleteRecipe.do?recipeNo=${recipe.recipeNo}')"
            >
              Delete
            </button>
            <button
              class="btn-modify"
              style="float: right"
              onclick="location.href='${contextPath}/community/recipe/recipeModForm.do?recipeNo=${recipe.recipeNo}'"
            >
              Modify
            </button>
          </div>
        </div>
        <div class="row">&nbsp;</div>
        <div class="row recipe_main_img_row">
          <div class="col">
            <div class="recipe_main_img_wrapper">
              <img
                src="${contextPath}/download.do?imageFileName=${recipe.cookingImg}&path=recipeNo${recipe.recipeNo}"
                alt="Recipe 메인 이미지"
              />
            </div>
          </div>
        </div>
        <div class="row">&nbsp;</div>
        <div class="row">&nbsp;</div>
        <div class="row">
          <div class="col">
            <div class="row">
              <div class="col lightgreen_title">Estimated time</div>
            </div>
            <div class="row">
              <div class="col">${recipe.cooking_time}</div>
            </div>
          </div>
        </div>
        <div class="row">&nbsp;</div>
        <div class="row">&nbsp;</div>
        <div class="row ingredient_grid">
          <div class="col">
            <div class="row">
              <div class="col lightgreen_title">
                Ingredient(${recipe.inbun}serving)
              </div>
            </div>
            <div class="row ingredient_rows">
              <div class="col">
                <c:forEach items="${ingredientList}" var="ingredient">
                  <div class="row ingredient_row">
                    <div class="col">${ingredient.name}</div>
                    <div class="col">${ingredient.qty}</div>
                  </div>
                </c:forEach>
              </div>
            </div>
          </div>
        </div>
        <div class="row">&nbsp;</div>
        <div class="row">&nbsp;</div>
        <div class="row howto_row">
          <div class="col">
            <div class="row">
              <div class="col lightgreen_title">How to make</div>
            </div>
            <div class="row">
              <div class="col howto_content">${recipe.description}</div>
            </div>
          </div>
        </div>
      </div>
      <div>&nbsp;</div>
      <div>&nbsp;</div>
    </section>
  </body>
</html>
