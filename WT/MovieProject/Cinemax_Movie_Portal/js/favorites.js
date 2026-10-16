document.addEventListener("DOMContentLoaded",()=>{
 const grid=document.getElementById("favoritesGrid"),empty=document.getElementById("favoriteEmpty");
 function render(){const list=movies.filter(m=>getFavorites().includes(m.id));grid.innerHTML=list.map(movieCard).join("");empty.hidden=list.length!==0;attachFavoriteButtons();document.querySelectorAll("[data-fav]").forEach(b=>b.addEventListener("click",render,{once:true}))}
 render();
});