 Entities and attributes
 -
1. Student
   - 
   - Student ID
   - Gender
   - Name
   - Date of Birth
   - Class
2. Food item
   - 
   - Food Item ID
   - Nutritional value
   - Food name
   - Category
3. School
   -  
   - School ID
   - Name
   - Location
   - Contact info
   - Principle name
4. Distribution
   - 
   - Distribution ID
   - Date
   - Quantity
5. Meal plan
   -
   - Meal plan ID
   - Description
6. Student Attendance
   -
   - Attendance ID
   - Date
   - Status
7. Meal Consumption
   -
   - Consumption ID
   - Quantity consumed

Assumptions:

1. Each school has its own set of meal plans that are supposed to meet the specific nutritional needs of its students based on available food items.
2. Food items are distributed to schools in bulk, and the distribution event tracks which food was provided and in what quantity.
3. Nutritional value is calculated based on the food items consumed by the student.
4. Student attendance is monitored because it affects food distribution and consumption. (If a student is absent, they do not consume the meal).


Relationships:

School to Meal Plans:
A school can have many meal plans (1:M).

School to Distribution:
A school can receive many distributions (1:M).

Student to Attendance:
A student can have many attendance records (1:M).

Distribution to Meal Consumption:
A distribution can result in many meal consumptions (1:M).

Student to Food Items:
Multiple students consume multiple food items (M:M).

Student to Meal Consumption:
A student can have many meal consumptions (1:M).






