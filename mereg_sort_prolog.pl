{\rtf1\ansi\ansicpg1252\cocoartf2759
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 %merge sort in prolog\
merge_sort(Array,SortedArray,Comparisons):-\
    length(Array,Len),\
    (Len=<1->\
        SortedArray=Array,\
        Comparisons=0\
    ;\
        Mid is Len//2,\
        split_array(Array,LeftArray,RightArray,Mid),\
        %printing subarrays\
        format('The subarrays - dividing:~n',[]),\
        format('Left: ~w~n',[LeftArray]),\
        format('Right: ~w~n',[RightArray]),\
        format('~n',[]),\
        %recursively sorting left and right subarrays\
        merge_sort(LeftArray,SortedLeft,LeftComparisons),\
        merge_sort(RightArray,SortedRight,RightComparisons),\
        %merging the sorted subarrays\
        merge(SortedLeft,SortedRight,SortedArray,MergeComparisons),\
        Comparisons is LeftComparisons+RightComparisons+MergeComparisons\
    ).\
%splitting array into left and right subarrays\
split_array(Array,Left,Right,Mid):-\
    length(Left,Mid),\
    append(Left,Right,Array).\
%merging two sorted arrays\
merge([],Right,Right,0).\
merge(Left,[],Left,0).\
merge([LHead|LTail],[RHead|RTail],[LHead|Merged],Comparisons):-\
    LHead=<RHead,\
    merge(LTail,[RHead|RTail],Merged,TailComparisons),\
    Comparisons is TailComparisons+1.\
merge([LHead|LTail],[RHead|RTail],[RHead|Merged],Comparisons):-\
    LHead>RHead,\
    merge([LHead|LTail],RTail,Merged,TailComparisons),\
    Comparisons is TailComparisons+1.\
\
main:-\
    % Example array\
    Array=[1430,3292,7684,1338,193,595,4243,9002,4393,130],\
    merge_sort(Array, SortedArray, Comparisons),\
    format('Original array:~n',[]),%printing original array\
    display(Array),\
    format('~n',[]),\
    format('Number of Comparisons: ~d~n~n',[Comparisons]),%printing number of comparisons\
    format('Sorted array:~n',[]),%printing sorted array\
    display(SortedArray).\
\
display([]).\
display([Head|Tail]):-\
    format('~w ',[Head]),\
    display(Tail).\
\
:- initialization(main, main).% query to run main predicate\
}