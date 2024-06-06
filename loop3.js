//Ex 3 
// Ex 3: If employee 80 or above promote them
const employees = [
    { id: 1, name: "Alice", grade: 78 },
    { id: 2, name: "Bob", grade: 85 },
    { id: 3, name: "Charlie", grade: 92 },
    { id: 4, name: "David", grade: 88 },
    { id: 5, name: "Eva", grade: 76 },
  ];
  
  // This should output:
  // [{ id: 2, status: 'Promoted' }, { id: 3, status: 'Promoted' }, { id: 4, status: 'Promoted' }]

  let goodemployees=[]
  for(let employee of employees){
    if(employee.grade>=80){
    goodemployees.push({id:employee.id,status:"Promoted"})
    }
  }
  console.log(goodemployees)