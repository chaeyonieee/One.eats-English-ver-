<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib
uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> <%@ taglib prefix
="c" uri ="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Recipe List</title>
  </head>
  <body>
    <div class="container-md recipe_recommand_grid">
      <div
        class="row"
        style="border-bottom: 2px solid black; text-align: center"
      >
        <div class="textcolor-black textsize-4 textbold">
         How about this recipe?
        </div>
      </div>
      <div class="row">&nbsp;</div>
      <div class="row recipe_recommand_rows">
        <c:forEach items="${newRecipeList}" var="recipe">
          <div
            class="col recipe_recommand_col hoverexpand"
            onclick="location.href='${contextPath}/community/recipe/recipeDetail.do?recipeNo=${recipe.recipeNo}'"
          >
            <div class="row">
              <div class="img_wrapper">
                <img
                  src="${contextPath}/download.do?imageFileName=${recipe.cookingImg}&path=recipeNo${recipe.recipeNo}"
                  alt="Recipe 이미지"
                />
              </div>
            </div>
            <div class="row">&nbsp;</div>
            <div class="row">
              <div class="text-left textsize-1">${recipe.creDate}</div>
            </div>
            <div class="row">
              <div class="text-left textbold textsize-2">${recipe.title}</div>
            </div>
            <div class="row">
              <div class="text-left textsize-1">
                ${fn.substring(recipe.description,0,20)}
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
    <div>&nbsp;</div>
    <div>&nbsp;</div>
  </body>
</html>
