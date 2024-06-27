var q1 = [100,200];
var q2 = [...q1]; // spread (copy by value)

var q3 = [60,...q1,90,40];
console.log(q3);

var t1 = [400,500];
var t2 = [90, 80];

//Task
//t3 --> [90,80,400,500]