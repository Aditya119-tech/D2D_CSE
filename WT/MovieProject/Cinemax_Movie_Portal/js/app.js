document.addEventListener("DOMContentLoaded",()=>{
 const nav=document.getElementById("mainNav"), menu=document.getElementById("menuBtn");
 if(menu)menu.onclick=()=>nav.style.display=nav.style.display==="flex"?"none":"flex";
 const theme=document.getElementById("themeBtn");
 const saved=localStorage.getItem("cinemaxTheme");
 if(saved==="light")document.body.classList.add("light");
 if(theme)theme.onclick=()=>{document.body.classList.toggle("light");localStorage.setItem("cinemaxTheme",document.body.classList.contains("light")?"light":"dark")};
 const footer=document.querySelector("footer");
 if(footer)footer.innerHTML=`<div class="container">© 2026 Cinemax • Movie Information Portal • Built with HTML5, CSS3, JavaScript, DOM, jQuery and Bootstrap concepts.</div>`;
});