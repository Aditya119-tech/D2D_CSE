document.addEventListener("DOMContentLoaded",()=>{
 const grid=document.getElementById("movieGrid"), search=document.getElementById("searchInput"), genre=document.getElementById("genreFilter"), lang=document.getElementById("languageFilter"), year=document.getElementById("yearFilter"), rating=document.getElementById("ratingFilter"), sort=document.getElementById("sortSelect"), count=document.getElementById("resultCount"), empty=document.getElementById("emptyState");
 [...new Set(movies.map(m=>m.genre))].sort().forEach(x=>genre.innerHTML+=`<option>${x}</option>`);
 [...new Set(movies.map(m=>m.language))].sort().forEach(x=>lang.innerHTML+=`<option>${x}</option>`);
 [...new Set(movies.map(m=>m.year))].sort((a,b)=>b-a).forEach(x=>year.innerHTML+=`<option>${x}</option>`);
 const params=new URLSearchParams(location.search); if(params.get("genre"))genre.value=params.get("genre");
 function render(){let q=search.value.toLowerCase().trim(), arr=movies.filter(m=>(!q||(m.title+" "+m.genre+" "+m.description).toLowerCase().includes(q))&&(!genre.value||m.genre===genre.value)&&(!lang.value||m.language===lang.value)&&(!year.value||String(m.year)===year.value)&&(!rating.value||m.rating>=Number(rating.value)));
 const s=sort.value; arr.sort((a,b)=>s==="name-asc"?a.title.localeCompare(b.title):s==="name-desc"?b.title.localeCompare(a.title):s==="rating-desc"?b.rating-a.rating:s==="rating-asc"?a.rating-b.rating:s==="year-desc"?b.year-a.year:a.year-b.year);
 grid.innerHTML=arr.map(movieCard).join("");count.textContent=`${arr.length} movie${arr.length!==1?"s":""} found`;empty.hidden=arr.length!==0;attachFavoriteButtons()}
 [search,genre,lang,year,rating,sort].forEach(el=>el.addEventListener("input",render));document.getElementById("clearFilters").onclick=()=>{search.value=genre.value=lang.value=year.value=rating.value="";sort.value="name-asc";render()};render();
});