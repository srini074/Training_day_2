const marks = [80,90,100,80];

//More control
for(let i = 0;i < marks.length; i++){
    console.log("Index: ", i, "Mark:", marks[i]);
}

// Readable and simple | in --> index
for(let idx in marks){
    console.log("Index: ", idx,"Mark:", marks[idx])
}


//Cleaner and Readable
for(let mark of marks){
    console.log("Mark:",mark);
}


//Ex 1:

const cart = [
    { name:"Apple",price:0.5,quantity:4},
    {name:"Banana",price:0.75,quantity:6}
];

const newItems = [
    {name:"Cherry",price:0.75,quantity:5},
    {name:"Data",price:1,quantity:3},

];

// Ex 1.1 Combine cart  +  newItems
// Ex 1.2: Find total of cart
//Done

let list=0
z = [...cart,...newItems]
for (let item of z) {
    list+=item.price * item.quantity
    console.log(list)

}

