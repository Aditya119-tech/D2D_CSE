document.addEventListener("DOMContentLoaded",()=>{
 document.getElementById("featuredMovies").innerHTML=movies.slice(0,4).map(movieCard).join("");
 document.getElementById("popularMovies").innerHTML=[movies[8],movies[1],movies[2],movies[3]].map(movieCard).join("");
 attachFavoriteButtons();
});