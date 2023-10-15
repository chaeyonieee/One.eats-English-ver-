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
    <link rel="stylesheet" href="${contextPath}/css/community.css" />
    <script src="${contextPath}/js/recipe.js"></script>
  </head>
  <body>
    <section>
      <div class="textsize-3 text-left textbold textcolor-black">
        <c:if test="${not empty category}"> ${category} </c:if>
        <c:if test="${empty category}">Total </c:if>
        Recipe
      </div>
      <c:if test="${not empty category}">
        <div class="float-right">
          <a href="${contextPath}/community/recipe/recipeList.do"
            >Back to Total Recipe</a
          >
        </div>
      </c:if>
      <div class="clear">&nbsp;</div>
      <div class="recipeList_grid">
        <c:forEach items="${recipeList}" varStatus="loop" step="2">
          <div class="row recipe_row">
            <c:set var="recipe" value="${recipeList[loop.index]}" />
            <div
              class="col-md recipe_col hoverexpand"
              onclick="location.href='${contextPath}/community/recipe/recipeDetail.do?recipeNo=${recipe.recipeNo}'"
            >
              <div class="row">
                <div class="col img_wrapper">
                  <c:if test="${not empty recipe.cookingImg}">
                    <img
                      src="${contextPath}/download.do?imageFileName=${recipe.cookingImg}&path=recipeNo${recipe.recipeNo}"
                      alt="Recipe 이미지"
                    />
                  </c:if>
                </div>
              </div>
              <div class="row">&nbsp;</div>
              <div class="row">
                <div
                  class="col text-left textcolor-black textsize-1 recipe_creDate"
                >
                  ${recipe.creDate}
                </div>
              </div>
              <div class="row">
                <div
                  class="col text-left textcolor-black textsize-2 recipe_title"
                >
                  ${recipe.title}
                </div>
              </div>
              <div class="row">
                <div
                  class="col text-left textcolor-black textsize-1 recipe_preview"
                >
                  <c:set var="des" value="${recipe.description}" />
                  <c:out
                    value='${fn:substring(des.replaceAll("\\\<.*?\\\>",""), 0, 20)}'
                  />
                </div>
              </div>
            </div>
            <c:if test="${fn:length(recipeList)>loop.index + 1}">
              <c:set var="recipe" value="${recipeList[loop.index+1]}" />
              <div
                class="col-md recipe_col hoverexpand"
                onclick="location.href='${contextPath}/community/recipe/recipeDetail.do?recipeNo=${recipe.recipeNo}'"
              >
                <div class="row">
                  <div class="col img_wrapper">
                    <c:if test="${not empty recipe.cookingImg}">
                      <img
                        src="${contextPath}/download.do?imageFileName=${recipe.cookingImg}&path=recipeNo${recipe.recipeNo}"
                        alt="Recipe 이미지"
                      />
                    </c:if>
                  </div>
                </div>
                <div class="row">&nbsp;</div>
                <div class="row">
                  <div
                    class="col text-left textcolor-black textsize-1 recipe_creDate"
                  >
                    ${recipe.creDate}
                  </div>
                </div>
                <div class="row">
                  <div
                    class="col text-left textcolor-black textsize-2 recipe_title"
                  >
                    ${recipe.title}
                  </div>
                </div>
                <div class="row">
                  <div
                    class="col text-left textcolor-black textsize-1 recipe_preview"
                  >
                    <c:set var="des" value="${recipe.description}" />
                    <c:out
                      value='${fn:substring(des.replaceAll("\\\<.*?\\\>",""), 0, 20)}'
                    />
                  </div>
                </div>
              </div>
            </c:if>
          </div>
          <!--Recipe 한 줄 끝-->
        </c:forEach>
      </div>
      <div>
        <ul class="ul-li">
          <c:if test="${section>1}">
            <li class="li-btn">
              <button
                class="btn-2 btn-square bg-white btn-border"
                onclick="location.href='${contextPath}/community/recipe/recipeList.do?category=${category}&section=${section-1}&pageNum=1'"
              >
                <img
                  width="20px"
                  height="20px"
                  src="${contextPath}/img/icon/prev.png"
                  alt="prev"
                />
              </button>
            </li>
          </c:if>
          <!-- 페이징을 위한 변수. 페이지 버튼이 어디서 끝나야 하는지. -->
          <c:set var="endPage" value="1" />
          <c:if test="${not empty searchRecipeNum && searchRecipeNum>0}">
            <!-- Recipe는 한 페이지당 6개, 섹션당 60개이므로 이런 식이 된다.-->
            <c:set
              var="result"
              value="${(searchRecipeNum - (section-1)*60) div 6}"
            />
            <c:set var="endPage" value="${Math.ceil(result)}" />
          </c:if>
          <c:if test="${endPage>10}">
            <c:set var="endPage" value="10" />
          </c:if>
          <c:forEach begin="1" end="${endPage}" var="i">
            <li class="li-btn">
              <button
                class="btn-2 btn-square bg-white btn-border"
                onclick="location.href='${contextPath}/community/recipe/recipeList.do?category=${category}&section=${section}&pageNum=${i}'"
              >
                ${(section-1)*10+i}
              </button>
            </li>
          </c:forEach>
          <c:if test="${searchRecipeNum > (section)*60}">
            <li class="li-btn">
              <button
                class="btn-2 btn-square bg-white btn-border"
                onclick="location.href='${contextPath}/community/recipe/recipeList.do?category=${category}&section=${section+1}&pageNum=1'"
              >
                <img
                  width="20px"
                  height="20px"
                  src="${contextPath}/img/icon/next.png"
                  alt="next"
                />
              </button>
            </li>
          </c:if>
        </ul>
        <div style="float: right">
          <button
            class="btn-write"
            onclick="location.href='${contextPath}/community/recipe/recipeForm.do'"
          >
            Recipe Write
          </button>
        </div>
      </div>
    </section>
  </body>
</html>
