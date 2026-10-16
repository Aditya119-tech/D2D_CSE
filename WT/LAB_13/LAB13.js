//1. WAP in JavaScript to print the factors of given number.(A)

// var n = parseInt(prompt("Enter A Number"));
// var fact = 1;
// for (var i = 1; i <= n; i++) {
//     fact = fact * i;
// }
// alert("Factorial Of = " + n + " Is = " + fact);
//2. WAP in JavaScript to prime number between the given range of number. (A)

// let str_t = parseInt(prompt("Enter The Starting Range:"));
// let end = parseInt(prompt("Enter The Ending Range:"));
// document.write("Prime Numbers Start Between " + start + " And " + end + " Are:<br>");
// for (let num = str_t; num <= end;num++) {
//     let count = 0;
//     for (let i = 1; i <= num; i++) {
//         if (num % i == 0) {
//             count++;
//         }
//     }
//     if (count == 2) {
//         document.write(num + " ");
//     }
// }
//3. WAP to display given patterns using JavaScript.

// let n = 5;
// for (let i = 0; i <= n; i++) {
//     for (let j = 0; j <= i; j++) {
//         document.write("*\n");
//     }
//     document.write("<br>");
// }

// let n=5;
// document.write("<pre>");
// for (let i = 0; i <= n; i++) {

//     for (let j = 0; j <= n - i; j++) {
//         document.write("  ");
//     }

//     for (let j = 1; j <= (2 * i - 1); j++) {
//          document.write("* ");
//     }

//     document.write("<br>");
// }
// document.write("</pre>");
//4. WAP in JavaScript to print the GCD of two number.

// let a = parseInt(prompt("Enter Number 1: "));
// let b = parseInt(prompt("Enter Number 2: "));
// while (b != 0) {
//     let r = a % b;
//     a = b;
//     b = r;
// }
// alert("GCD = " + a);

// 5. Write a JavaScript to take 2-digit number and then separate these 2 digits, then 
// multiply first digit by itself for second digit times. (For example, 23 should be separated 
// as 2 and 3. 2 should multiply with itself 3 times). (B) 

// let num = parseInt(prompt("Enter Two Digit Number: "));
// let first = Math.floor(num/10);
// let second = num % 10;
// let result = 1;
// for(let i=1 ; i<=second;i++){
//     result*=first;
// }
// alert("First Digit = "+first);
// alert("Second Digit = "+second);
// alert("Result = "+result);

//6. Write an HTML page with JavaScript that takes a number from popup box in the range 
//0-999 and display it in words. If the number is out of range, it should show “out of 
// range” and if it is not a number ,it should show “not a number” message in the result 
// box. (C)

// let num = prompt("Enter a number (0-999):");

// if (isNaN(num)) {
//     document.write("Not a number");
// }
// else if (num < 0 || num > 999) {
//     document.write("Out of range");
// }
// else {
//     num = parseInt(num);

//     let ones = ["", "One", "Two", "Three", "Four", "Five",
//         "Six", "Seven", "Eight", "Nine"];

//     let tens = ["", "", "Twenty", "Thirty", "Forty",
//         "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"];

//     let result = "";
// 
//     if (num >= 100) {
//         result += ones[Math.floor(num / 100)] + " Hundred ";
//         num = num % 100;
//     }

//     if (num >= 20) {
//         result += tens[Math.floor(num / 10)] + " ";
//         num = num % 10;
//     }

//     if (num > 0) {
//         result += ones[num];
//     }

//     if (result == "") {
//         result = "Zero";
//     }

//     document.write(result);
// }
// 7. Write an HTML file with JavaScript that finds position of first occurrence of vowel “a”, 
// last occurrence of vowel “a” in a given word and returns the string between them. For 
// example, ajanta- then script would return first occurrence of “a”-that is position 1 and 
// last occurrence-6 and string between them is “jant”. (C)

// let str=prompt("Enter A Word: ");
// let first=str.indexOf("a");
// let last=str.lastIndexOf("a");
// if(first==-1){
//     document.write("Vowel 'a ' is Not Found");
// }else{
//     document.write("First Occurence of 'a' : "+(first+1)+"<br>");
//     document.write("Last Occurence of 'a' : "+(last+1)+"<br>");
//     document.write("String Between Them : "+str.substring(first+1,last));
// }
// or
// let str=prompt("Enter A word:");
// if(str.indexOf('a')==str.lastIndexOf('a')){
//     document.write(str.substring(str.indexOf('a'),str.lastIndexOf('a')));
// }else{
//     document.write("Invalid");
// }