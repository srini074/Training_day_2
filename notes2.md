javascript
    <script>
      // let & const - block scope -
      {
        var x1=10;
        let x2=20;
      }
      console.log(x1);
      console.log(x2);

      //var can be contained in functional scope

      function fun(){
        var t1=10;
        let t2=20;
        console.log(t1) // 10
        console.log(t2) // 20
      }
      
      //console.log(t1)  // not defined (error)
      //console.log(t2)  // not defined (error)

      function drivingTest(){
        let msg;
        if(age>18){
          msg = "eligible";
        }else{
          msg="not eligible";
        }
        console.log("🚗 are eligible")
      }
      drivingTest(20)

      //Implicit coercion
      var x1=3;
      var x2="5";
      console.log(x1 + x2);
      console.log(x1 - x2);

      //Explicit coercion
      var x1=3;
      var x2="5";
      console.log(x1 + parseInt(x2));
      console.log(x1 + + x2);
      
      [2,4,5] + "abc";
      //'2,4,5abc'

      [] + [];
      // ''

      null + 5;
      // 5

      4 * "5";
      // 20

      4 * "5a";
      // NaN

      NaN * NaN;
      // NaN

      NaN/4;
      // NaN

      typeof(NaN);
      // 'number'


      var g1 = 5;
      var g2 = "5";
      console.log(g1 == g2); // true Allows coercion , slower will try to convert into same data types.
      console.log(g1 === g2); // false Does not allow coercion faster first checks if the data types are same if not will return false.

function double(n){
    return n * 2
}

console.log(double(10));    

// Function Call
// argument - 10
//Function body
//return statement
//function decalaration
//args, params

function double = (n)=>{
    return n * 2;
}

const double = (n)=>{
    return n * 2
};
// undefined

const double = (n) => n * 2;
// undefined

//Normal function

function sum1(a,b){
    return a + b;
}

//Arrow function ( Here we can use let, var & const also, no need to use only const)

const sum4 = (a,b) => {
    return a + b;
}

const sum2 = ( a,b) => a + b;
sum2(5,10);

//Why?

a1 = 2
b1 = 4
console.log("The sum is:", a1 + b1);

a2 = 2
b2 = 4
console.log("The sum is:", a2 + b2);

a3 = 2
b3 = 4
console.log("The sum is:", a3 + b3);

//DRY - Don't repeat yourself - Thumb rule

const sum2 = ( a,b) => a + b;

console.log("The sum is:", sum2(2,4));
console.log("The sum is:", sum2(2,5));
console.log("The sum is:", sum2(3,6));

// 5 Pillars of code quality

// 1.Readability - 75% - Should be easy for other to read and uderstand
// 2.Maintainability - Code Debt - if code is sluggish we have to fix it earlier and not postpone
// 3.Extensibility - Should be able to add new functions
// 4.Testability - should be easy for them to test
// 5. Performance -  should be proper enough and should perform well

    </script>
  </body>
</html>
=======
```javascript
    <script>
      // let & const - block scope -
      {
        var x1=10;
        let x2=20;
      }
      console.log(x1);
      console.log(x2);

      //var can be contained in functional scope

      function fun(){
        var t1=10;
        let t2=20;
        console.log(t1) // 10
        console.log(t2) // 20
      }
      
      //console.log(t1)  // not defined (error)
      //console.log(t2)  // not defined (error)

      function drivingTest(){
        let msg;
        if(age>18){
          msg = "eligible";
        }else{
          msg="not eligible";
        }
        console.log("🚗 are eligible")
      }
      drivingTest(20)

      //Implicit coercion
      var x1=3;
      var x2="5";
      console.log(x1 + x2);
      console.log(x1 - x2);

      //Explicit coercion
      var x1=3;
      var x2="5";
      console.log(x1 + parseInt(x2));
      console.log(x1 + + x2);
      
      [2,4,5] + "abc";
      //'2,4,5abc'

      [] + [];
      // ''

      null + 5;
      // 5

      4 * "5";
      // 20

      4 * "5a";
      // NaN

      NaN * NaN;
      // NaN

      NaN/4;
      // NaN

      typeof(NaN);
      // 'number'


      var g1 = 5;
      var g2 = "5";
      console.log(g1 == g2); // true Allows coercion , slower will try to convert into same data types.
      console.log(g1 === g2); // false Does not allow coercion faster first checks if the data types are same if not will return false.

function double(n){
    return n * 2
}

console.log(double(10));    

// Function Call
// argument - 10
//Function body
//return statement
//function decalaration
//args, params

function double = (n)=>{
    return n * 2;
}

const double = (n)=>{
    return n * 2
};
// undefined

const double = (n) => n * 2;
// undefined

//Normal function

function sum1(a,b){
    return a + b;
}

//Arrow function ( Here we can use let, var & const also, no need to use only const)

const sum4 = (a,b) => {
    return a + b;
}

const sum2 = ( a,b) => a + b;
sum2(5,10);

//Why?

a1 = 2
b1 = 4
console.log("The sum is:", a1 + b1);

a2 = 2
b2 = 4
console.log("The sum is:", a2 + b2);

a3 = 2
b3 = 4
console.log("The sum is:", a3 + b3);

//DRY - Don't repeat yourself - Thumb rule

const sum2 = ( a,b) => a + b;

console.log("The sum is:", sum2(2,4));
console.log("The sum is:", sum2(2,5));
console.log("The sum is:", sum2(3,6));

// 5 Pillars of code quality

// 1.Readability - 75% - Should be easy for other to read and uderstand
// 2.Maintainability - Code Debt - if code is sluggish we have to fix it earlier and not postpone
// 3.Extensibility - Should be able to add new functions
// 4.Testability - should be easy for them to test
// 5. Performance -  should be proper enough and should perform well

    </script>
  </body>
</html>