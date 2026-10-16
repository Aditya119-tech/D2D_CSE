//1.  Demonstrate the use of array to find maximum number. (A) 
// let a= [10,20,30,45,23,43,21];
// let max=a[0];
// for(let i=1;i<a.length;i++){
//     if(a[i]>max){
//         max=a[i];
//     }
// }
// document.write("Maximum From Array:"+max)
//2.  WAP to read an array from the user and sort them in ascending order. (A) 
// let num=[10,30,40,50,20,70,20];
// num.sort((a,b)=>a-b);
// document.write(num);
//3.  WAP to read an array from the user and sort them using bubble sort. (B) 
// let a=[10,30,20,60,50,40];
// for(let i=0;i<a.length-1;i++){
//     for(let j=0;j<a.length-i-1;j++){
//         if(a[j]>a[j+1]){
//             let temp=a[j];
//             a[j]=a[j+1];
//             a[j+1]=temp;
//         }
//     }
// }
// document.write("Sorted Array:"+a)
//4.  WAP to read an array form the user and sort them using quick sort. (C)
// function quicksort(arr){
//     if(arr.length<=1){
//         return arr;
//     }
//     let pivot=arr[arr.length-1];
//     let left =[];
//     let right=[];
//     for(let i=0;i<arr.length-1;i++){
//         if(arr[i]<pivot){
//             left.push(arr[i]);
//         }else{
//             right.push(arr[i]);
//         }
//     }
//     return quicksort(left).concat(pivot,quicksort(right));
// }

// let sorted_array=quicksort([10,40,30,80,90,60]);
// document.write("Sorted Array Using Quick Sort:"+ sorted_array);
//Write a JavaScript that uses a loop that searches a word in sentence held in an array,returning the index of the word. (C)
// let sentence = ["I", "am", "learning", "JavaScript"];

//     let word = "learning";
//     let index = -1;

//     for (let i = 0; i < sentence.length; i++) {
//         if (sentence[i] == word) {
//             index = i;
//             break;
//         }
//     }

//     if (index != -1) {
//         document.write("Word found at index: " + index);
//     } else {
//         document.write("Word not found");
//     }