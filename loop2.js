// Ex 2: Rating 4.7 and above | Recommendations List
const books = [
    { title: "Infinite Jest", rating: 4.5, genre: "Fiction" },
    { title: "A Brief History of Time", rating: 4.8, genre: "Science" },
    { title: "The Catcher in the Rye", rating: 3.9, genre: "Fiction" },
    { title: "Sapiens", rating: 4.9, genre: "History" },
    { title: "Clean Code", rating: 4.7, genre: "Technology" },
  ];
  
  // Output
  // ['A Brief History of Time', 'Clean Code', 'Sapiens' ]
  let b=[]
for(let i of books){
    if(i.rating>=4.7){
        b.push(i.title)
        console.log(b)
    }
}