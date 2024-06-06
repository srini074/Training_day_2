// Task 6
let sentence = "Hello world from JavaScript";
let transformed = transformSentence(sentence);
console.log(transformed); // Output: "JAVASCRIPT FROM WORLD HELLO"

// Task 7: Improving code quality

function processNames(names) {
  let result = [];
  for (let i = 0; i < names.length; i++) {
    let upperCaseName = names[i].toUpperCase();
    let nameParts = upperCaseName.split(" ");
    let joinedName = nameParts.join("_");
    result.push(joinedName);
  }
  return result;
}

const namesArray = ["john doe", "jane smith", "alice jones"];
console.log(processNames(namesArray));

const namesArray = ["john doe", "jane smith", "alice jones"];
function processNames(names) {
  let result = [];
for (let i = 0; i < names.length; i++) {
  let upperCaseName = names[i].toUpperCase().split(" ").join("_");
    result.push(upperCaseName)
    }
    return result;
}

const processNames=()

