<script>
    function goPage(page){
        if(page){
            document.querySelector("#page").value = page;
        }

        window.location.hash = "anchor";

        document.querySelector("#searchForm").submit();
    }
</script>

<c:if test="${page.totalPages > 0}">
    <div class="board-page">
        <div class="board-page-num">
            <c:if test="${!page.first}">
                <a class="btn first" onClick="goPage('0')"><<</a>
                <a class="btn prev"  onClick="goPage('${page.number-1}')"><</a>
            </c:if>
            <c:forEach begin="0" end="${page.totalPages-1}" var="idx">
                <c:choose>
                    <c:when test="${page.number == idx}"><a class="active">${idx+1}</a></c:when>
                    <c:otherwise><a href="#" onClick="goPage('${idx}')"> ${idx+1} </a></c:otherwise>
                </c:choose>
            </c:forEach>
            <c:if test="${!page.last}">
                <a class="btn next" onClick="goPage('${page.number+1}')">></a>
                <a class="btn last" onClick="goPage('${page.totalPages-1}')">>></a>
            </c:if>
        </div>
    </div>
</c:if>
