-- 코드를 입력하세요
# SELECT *
# FROM CART_PRODUCTS
# WHERE CART_ID IN(
#     SELECT CART_ID
#     FROM CART_PRODUCTS
#     GROUP BY CART_ID
#     HAVING NAME='Yogurt' and NAME='Milk'
# )
SELECT DISTINCT(CART_ID)
FROM CART_PRODUCTS
WHERE CART_ID IN (
    SELECT CART_ID
    FROM CART_PRODUCTS
    WHERE NAME='Yogurt'
) AND CART_ID IN (
    SELECT CART_ID
    FROM CART_PRODUCTS
    WHERE NAME='Milk'
)
ORDER BY ID