//1.  WAP to display Faculties stored in array. (A)
// let faculty=["Dr. Sharma","Prof. Patel","Dr.Mehta","Prof. Shah"];
// document.write("faculty");
// for(let i=0;i<faculty.length;i++){
//     document.write("<br>"+faculty[i]);
// }
//2.  WAP to display students stored in array. (A)
// let student=[
//     {
//         name:"Aditya",
//         Roll_No:123
//     },
//     {
//         name:"Manan",
//         Roll_No:133
//     }
// ];
// student.map((student,index)=>{
//     document.write("<br>Student name :<br>"+student.name+"<br>Student Roll :<br>"+student.Roll_No);
// })
//OR
// for(let i=0;i<student.length;i++){
//     document.write("Student Name Is="+student[i].name+"Student Roll No Is="+student[i].Roll_No);
// }
//3.  WAP to display products stored in array. (B)
// let products=[
//     {
//         name:"Phone",
//         Price:12000
//     },
//     {
//         name:"Television",
//         Price:1234567
//     },
//     {
//         name:"Fridge",
//         Price:12345
//     }
// ];
// products.map((products,index)=>{
//     document.write("<br>Products name :<br>"+products.name+"<br>Products Price :<br>"+products.Price);
// })
// OR
// for(let i=0;i<products.length;i++){
//     document.write("Product Name Is="+products[i].name+"Product Price Is="+products[i].Price);
// }
//4.  Demonstrate different array functions like push, pop, shift, unshift, splice, sort etc.. (C)
// let fruits=["Apple","Banana"];
// document.write("Push Operation:");
// fruits.push("Pineapple");
// document.write("<br>"+fruits);
// fruits.push("Mango");
// document.write("<br>"+fruits);
// document.write("<br> Pop Operation:");
// fruits.pop();
// document.write("<br>"+fruits);
// document.write("<br> Unshift Operation:");
// fruits.unshift("Kiwi");
// document.write("<br>"+fruits);
// document.write("<br> Shift Operation:");
// fruits.shift();
// document.write("<br>"+fruits);
// document.write("<br> Splice Operation:");
// fruits.splice(1,1,"Strawberry");
// document.write("<br>"+fruits);
// document.write("<br> Sort Operation:");
// fruits.sort();
// document.write("<br>"+fruits);
// document.write("<br> Index Operation:");
// document.write("<br>"+fruits.indexOf("Apple"));
// document.write("<br> Length Operation:");
// document.write("<br>"+fruits.length);