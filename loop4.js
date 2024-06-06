// Ex4: Top 1 movie titles

const movies = [
    { title: "Inception", ratings: [5, 4, 5, 4, 5] },
    { title: "Interstellar", ratings: [5, 5, 4, 5, 4] },
    { title: "Dunkirk", ratings: [4, 4, 4, 3, 4] },
    { title: "The Dark Knight", ratings: [5, 5, 5, 5, 5] },
    { title: "Memento", ratings: [4, 5, 4, 5, 4] },
  ];
  highest_average = 0;
highest_rated_movie = "";

for (let movie of movies) {
  
  let totalrating=0
  for(let rating of movie.ratings){
    totalrating+=rating;
  }
  if(totalrating>highest_average){
    highest_average=totalrating;
    highest_rated_movie=movie.title
  }
  }
console.log(highest_rated_movie)


console.log(highest_rated_movie);

  // Expected Output:  The Dark Knight 