{\rtf1\ansi\ansicpg1252\cocoartf2759
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 //merege sort in Rust\
fn merge_sort(array:&mut[i32],comparisons:&mut usize)\{\
    let len=array.len();\
    if len<=1\{\
        return;//base case\
    \}\
    let mid=len/2;\
    let mut left_array=Vec::with_capacity(mid);\
    let mut right_array=Vec::with_capacity(len-mid);\
    //dividing array into right and left subarrays\
    left_array.extend_from_slice(&array[..mid]);\
    right_array.extend_from_slice(&array[mid..]);\
    //printing subarrays\
    println!("The subarrays - dividing:");\
    println!("Left: \{:?\}",left_array);\
    println!("Right: \{:?\}",right_array);\
    println!();\
    //recursively sorting left and right subarrays\
    merge_sort(&mut left_array,comparisons);\
    merge_sort(&mut right_array,comparisons);\
    //merging sorted subarrays\
    merge(array,&mut left_array,&mut right_array,comparisons);\
\}\
//merging two sorted arrays\
fn merge(array:&mut[i32],left:&mut[i32],right:&mut[i32],comparisons:&mut usize)\{\
    let mut i=0;\
    let mut j=0;\
    let mut k=0;\
    //merging left and right arrays\
    while i<left.len() &&j<right.len()\{\
        *comparisons += 1;//incrementing comparisons\
        if left[i]<=right[j] \{\
            array[k]=left[i];\
            i=i+1;\
        \} else\{\
            array[k]=right[j];\
            j+=1;\
        \}\
        k+=1;\
    \}\
    //coping elements of left array\
    while i<left.len()\{\
        array[k]=left[i];\
        i+=1;\
        k+=1;\
    \}\
    //coping elements of right array\
    while j<right.len() \{\
        array[k]=right[j];\
        j+=1;\
        k+=1;\
    \}\
    //printing sorted subarray after merging\
    println!("Sorted Subarray - merging:");\
    display(array);\
    println!();\
\}\
fn main() \{\
    let mut array=vec![1430,3292,7684,1338,193,595,4243, 9002,4393,130];\
    let mut comparisons=0;\
    println!("Original array:");\
    display(&array);\
    println!();\
    merge_sort(&mut array, &mut comparisons);//calling on merge sort\
    println!("Number of Comparisons: \{\}",comparisons);\
    println!();\
    println!("Sorted array:");\
    display(&array);\
\}\
// Method to display elements of an array\
fn display(array:&[i32])\{\
    for &num in array\{\
        print!("\{\} ",num);\
    \}\
    println!();\
\}}