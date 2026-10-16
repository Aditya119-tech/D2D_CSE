//1. WAP in JavaScript to make simple calculator using popup box.(A)
// let n1 =  parseInt(prompt("Enter A Number 1:"));
// let n2 =  parseInt(prompt("Enter A Number 2:"));
// let op = prompt("Enter Operator:(+,-,*,/)");
// let res;
// switch(op){
//     case '+':
//         res = n1+n2;
//         break;
//     case '-':
//         res = n1-n2;
//         break;
//     case '*':
//         res = n1*n2;
//         break;
//     case '/':
//         res = n1/n2;
//         break;
//     default:
//         alert("Inavlid Operator!!");
// }
// if(res != null){
//     alert("Result="+res);
// }
//2. WAP in JavaScript to check whether the given no. is prime or not.(A)
// var n = prompt("Enter a number:");
// var count = 0;

// for (var i = 1; i <= n; i++) {
//     if (n % i == 0) {
//         count++;
//     }
// }

// if (count == 2) {
//     alert(n + " is a Prime Number");
// } else {
//     alert(n + " is Not a Prime Number");
// }
//3. WAP in JavaScript to find the factorial of given number.(A)
// var n = parseInt(prompt("Enter A Number"));
// var fact=1;
// for(var i=1;i<=n;i++){
//     fact=fact*i;
// }
// alert("Fcatorial Of = "+n+" Is = "+fact);
//4. WAP in JavaScript to print the Fibonacci series of a number.(B)
// let n = parseInt(prompt("Enter A Number For Fibbonaci Series:"));
// let a=0,b=1;
// document.write("Fibbonacci Series:");
// for(var i=1;i<=n;i++){
//     document.write(a+" ");
//     let c=a+b;
//     a=b;
//     b=c;
// }
//5. WAP in JavaScript to check whether the given number is palindrome or not.(B)
//    let n1= parseInt(prompt("Enter A Number For Palindrome:"));
//    let og = n1;
//    let rev = 0;
//    while(n1>0){
//     let dig = n1 % 10;
//     rev = rev * 10 + dig;
//     n1 = Math.floor( n1 / 10 );
//    }
//    if(og==rev){
//         document.write(og+" The Number Is Palindrome");
//    }else{
//         document.write(og+" The Number Is Not Palindrome");
//   }
//6. WAP in JavaScript to check whether the given number is Armstrong or not.(C)
// let num = parseInt(prompt("Enter A Number:"));
// let og = num;
// let sum = 0;
// while (num > 0) {
//     let digit = num % 10;
//     sum = sum + (digit * digit * digit);
//     num = Math.floor(num / 10);
// }
// if (sum == og) {
//     document.write(og + " Is An Armstrong Number:");
// } else {
//     document.write(og + " Is Not An Armstrong Number:");
// }