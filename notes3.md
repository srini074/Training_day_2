## Object Methods

- Object.keys();
- Object.values();

## Shortcuts

- `ctrl + space` -> Autocomplete
- `ctrl + /` -> comment
- `crtl +  ,` -> settings
- `win + .` -> emojis

- 'ctrl + shift + p' -> comman palette

## Ternary operator

```js
5 > 4 ? "Awesome" : "Cool";
```

## Binary Operator

- Arthimetic operators +, -, \*, /
- Logical operators ||, &&,
- Relational operator >,<,>=

## Unary operator

- ++, --
- !

## Truthy vs Falsy

```js
let x = "cool";

if (x) {
  console.log("hey");
} else {
  console.log("Nope");
}
```

- [Falsy table](https://developer.mozilla.org/en-US/docs/Glossary/Falsy)

## Template Literal

- Interpolation (substitution)
- supports multiline string

```javascript
function fullname(firstname, lastname) {
  return `Welcome ${lastname}, ${firstname} 😎!!!`;
}

fullname("Darth", "Vader");

//Exercise

function movieUrl(domain, genre, year) {
  return `http://${domain}?genre=${genre}&year=${year}`;
}

const movieUrl1 = (domain, genre, year) =>
  `http://${domain}?genre=${genre}&year=${year}`;

console.log(movieUrl1("imdb.com", "thriller", 2020));
```

## Refactoring

- Quality better & functionality same

## Array Destructuring

Destructing the array means unpacking the values from the array

- Default value will be taken only when the value is undefined

- const [t1,t2,t3]=[100,200]
  t3 is undefined
- const [t1,t2,t3=80]=[100,200,500]
- t3 is 500

## Holes

```javascript
const [,t1,t2,t3=80]=[100,200,null]
console.log(t1,t2,t3);
Output is t1=200,t2=null,t3=80
```

## Object Destructuring

```javascript
const {name,networth,power}={
  name:"Tony Stark",
  house:"h",
  networth:"Money"
  power:"3000"

}
console.log(networth); //Output is "Money"

const allItems=[..cart,...newItems];

//Ex 1.2 : Find total of the cart
let total=0
```

```js
var height = 150
var final = 140 || height

//140 is truthy and not in the falsy table for  || operator
Output is 140

|| operator always returns true if true and false are given

For ?? operator only null and undefined are falsy values

```

## Rest Operator

```js
var [t1,t2,...t3]=[10,50,60,70,50,80,90]
print(t3)

Output is t3 = [60,70,50,80,90]
```

```js
"Nithin".toUpperCase()

Output is "NITHIN"

"This is a beautiful day".split(" ")

Output is  ['This', 'is', 'a', 'beautiful', 'day']

 ['This', 'is', 'a', 'beautiful', 'day'].join("|")

Output is 'This|is|a|beautiful|day'

"This is a beautiful day".split("")
Output is : ['T', 'h', 'i', 's', ' ', 'i', 's', ' ', 'a', ' ', 'b', 'e', 'a', 'u', 't', 'i', 'f', 'u', 'l', ' ', 'd', 'a', 'y']


function transformSentence(sentence){
    return sentence.toUpperCase().split(" ").reverse().join(" ");
}

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
    return result
}

const processNames=(names)=>{
  namesArray.map(())
}



```
