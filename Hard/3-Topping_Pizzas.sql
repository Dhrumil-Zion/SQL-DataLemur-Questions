with
    cte as (
        SELECT
            CONCAT (p1.topping_name,',',p2.topping_name,',',p3.topping_name) AS pizza,
            p1.ingredient_cost + p2.ingredient_cost + p3.ingredient_cost as total
        FROM
            pizza_toppings p1,
            pizza_toppings p2,
            pizza_toppings p3
        where
            p1.topping_name < p2.topping_name
            and p2.topping_name < p3.topping_name
    )

SELECT
    *
from
    cte
ORDER BY
    total desc,
    pizza;