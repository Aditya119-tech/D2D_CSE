// 1.
// function Change_Colour(){
//     let Change_Colour=document.getElementById("color-change");
//     Change_Colour.style.backgroundColor="red";
// }

// let box = document.getElementById("box");
// let res = document.getElementById("res");
// box.addEventListener('click', (e) => {
//     box.innerHTML = "Mouse " + e.type
// 2.
// });
// box.addEventListener('dblclick', (e) => {
//     box.innerHTML = "Mouse " + e.type
// });
// box.addEventListener('mousemove', (e) => {
//     box.innerHTML = "Mouse " + e.type
// });

//3.
// let box = document.getElementById("box");
// let res = document.getElementById("res");
// box.addEventListener('keydown', (e) => {
//     box.innerHTML = "Keyboard Event " + e.type
// });
// box.addEventListener('keyup', (e) => {
//     box.innerHTML = "Keyboard Event" + e.type
// });
// box.addEventListener('keypress', (e) => {
//     box.innerHTML = "Keyboard Event" + e.type
// });

//4.
// function showEvent(eventName) {
//             alert("Form " + eventName + " event is fired!");
// }

//5.
// function Change_Properties() {
//     document.getElementById("hd2").innerHTML = "HTML Properties Changed";

//     document.getElementById("hd2").style.color = "Blue";

//     document.getElementById("p").style.fontSize = "30px";

//     document.getElementById("p").style.backgroundColor = "yellow";
// }

//6.
// function Validate() {
//     var name = document.getElementById("name").value;
//     var email = document.getElementById("email").value;
//     var password = document.getElementById("password").value;
//     if (name == "") {
//                 alert("Please enter your name");
//                 return false;
//             }

//             if (!/^[A-Za-z ]+$/.test(name)) {
//                 alert("Name should contain only letters");
//                 return false;
//             }

//             if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
//                 alert("Please enter a valid email");
//                 return false;
//             }

//             if (password.length < 6) {
//                 alert("Password must contain at least 6 characters");
//                 return false;
//             }
// }

// //7.
// var arr = [];

// function create() {
//     var value = document.getElementById("item").value;

//     if (value == "") {
//         alert("Please enter a value");
//         return;
//     }

//     arr.push(value);
//     alert("Element added successfully");
//     read();
// }

// function read() {
//     document.getElementById("result").innerHTML =
//         "Array Elements: " + arr.join(", ");
// }

// function update() {
//     var i = document.getElementById("index").value;
//     var value = document.getElementById("item").value;

//     if (i === "" || value == "" ||
//         i < 0 || i >= arr.length ||
//         !Number.isInteger(Number(i))) {
//         alert("Enter a valid index and value");
//         return;
//     }

//     arr[i] = value;
//     alert("Element updated successfully");
//     read();
// }

// function del() {
//     var i = document.getElementById("index").value;

//     if (i === "" || i < 0 || i >= arr.length ||
//         !Number.isInteger(Number(i))) {
//         alert("Enter a valid index");
//         return;
//     }

//     arr.splice(Number(i), 1);
//     alert("Element deleted successfully");
//     read();
// }

//8.
// function showDateTime() {
//     var d = new Date();
//     document.getElementById("result").innerHTML = d;
// }

// function changeRed() {
//     document.body.style.backgroundColor = "red";
// }

// function changeGreen() {
//     document.body.style.backgroundColor = "green";
// }

//9.
// document.addEventListener("keydown", function (event) {
//     document.getElementById("result").innerHTML =
//         "Key Pressed: " + event.key +
//         "<br>Key Code: " + event.keyCode;
// });