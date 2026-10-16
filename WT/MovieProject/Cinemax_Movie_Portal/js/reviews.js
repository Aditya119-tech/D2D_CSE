document.addEventListener("DOMContentLoaded",()=>{
 const select=document.getElementById("reviewMovie"),form=document.getElementById("reviewForm"),list=document.getElementById("reviewList");
 movies.forEach(m=>select.innerHTML+=`<option value="${m.title}">${m.title}</option>`);
 let reviews=JSON.parse(localStorage.getItem("cinemaxReviews")||"[]");
 function render(){list.innerHTML=reviews.length?reviews.map(r=>`<article class="review-item"><h3>${r.name} <span class="stars">${"★".repeat(r.rating)}${"☆".repeat(5-r.rating)}</span></h3><small>${r.movie}</small><p>${r.text}</p></article>`).join(""):"<div class='empty'>No reviews yet. Be the first to share one.</div>"}
 form.onsubmit=e=>{e.preventDefault();const email=document.getElementById("reviewEmail").value;if(!/^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$/.test(email)){document.getElementById("reviewMessage").textContent="Please enter a valid email.";return}reviews.unshift({name:document.getElementById("reviewName").value,email,movie:select.value,rating:Number(document.getElementById("reviewRating").value),text:document.getElementById("reviewText").value});localStorage.setItem("cinemaxReviews",JSON.stringify(reviews));form.reset();document.getElementById("reviewMessage").textContent="Review submitted successfully.";render()}
 render();
});