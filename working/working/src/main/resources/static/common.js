export function goPage(page){
    if(page){
        document.querySelector("#page").value = page;
    }
    document.querySelector("#searchForm").submit();
}