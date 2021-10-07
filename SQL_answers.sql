-- Question 1
select st.store_id, st.store_name, ing.ingredient_name, COUNT(ing.ingredient_name) as lobster_ravioli_count
from store st
inner join sales sa on st.store_id = sa.store_id
inner join ingredient ing on sa.ingredient_id = ing.ingredient_id
where ing.ingredient_name='Lobster Ravioli'
group by st.store_id, st.store_name, ing.ingredient_name,
order by lobster_ravioli_count desc

-- Question 2
select st.store_id, st.store_name, ing.ingredient_name, COUNT(ing.ingredient_name) as lobster_ravioli_count
from store st
inner join sales sa on st.store_id = sa.store_id
inner join ingredient ing on sa.ingredient_id = ing.ingredient_id
where ing.ingredient_name='Lobster Ravioli' and business_date BETWEEN '2021-04-01' AND '2021-05-01' -- Question 2 Revision, querying on date range
group by st.store_id, st.store_name, ing.ingredient_name,
order by lobster_ravioli_count desc

-- Question 3
select st.store_id, st.store_name, ing.ingredient_name, COUNT(ing.ingredient_name) as lobster_ravioli_count
from store st
inner join sales sa on st.store_id = sa.store_id
inner join ingredient ing on sa.ingredient_id = ing.ingredient_id
where ing.ingredient_name='Lobster Ravioli' and business_date BETWEEN '2021-04-01' AND '2021-05-01'
group by st.store_id, st.store_name, ing.ingredient_name,
having lobster_ravioli_count > 45 -- Question 3 Revision
order by lobster_ravioli_count desc

-- Test Schema

CREATE TABLE Store (
    store_id int,
    store_name varchar(255),
    PRIMARY KEY (store_id)
);

CREATE TABLE Ingredient (
    ingredient_id int,
    ingredient_name varchar(255),
    PRIMARY KEY (ingredient_id)
);

CREATE TABLE Sales (
    sale_id int,
    store_id int,
    ingredient_id int,
    PRIMARY KEY (sale_id),
  CONSTRAINT fk_store
   FOREIGN KEY(store_id) 
      REFERENCES Store(store_id),
  CONSTRAINT fk_ingredient
   FOREIGN KEY(ingredient_id) 
      REFERENCES Ingredient(ingredient_id)
);

INSERT into Store
VALUES (1, 'test_store1');
INSERT into Store
VALUES (2, 'test_store2');
INSERT into Store
VALUES (3, 'test_store3');

INSERT into Ingredient
VALUES (1, 'Lobster Ravioli')

INSERT into Sales
Values (1, 1, 1)
INSERT into Sales
Values (2, 1, 1)
INSERT into Sales
Values (3, 1, 1)
INSERT into Sales
Values (4, 2, 1)
INSERT into Sales
Values (5, 2, 1)
INSERT into Sales
Values (6, 3, 1)