-- 코드를 입력하세요
# SELECT ONLINE_SALE.SALES_DATE, ONLINE_SALE.PRODUCT_ID, IFNULL(ONLINE_SALE.USER_ID , 'NULL') AS USER_ID, ONLINE_SALE.SALES_AMOUNT
# FROM ONLINE_SALE JOIN OFFLINE_SALE USING(PRODUCT_ID)
# WHERE ONLINE_SALE.SALES_DATE BETWEEN '2022-03-01' AND '2022-03-31'
# ORDER BY SALES_DATE, PRODUCT_ID, USER_ID
SELECT DATE_FORMAT(SALES_DATE, "%Y-%m-%d") AS SALES_DATE, PRODUCT_ID, USER_ID,  SALES_AMOUNT
FROM(
    SELECT DATE_FORMAT(SALES_DATE, "%Y-%m-%d") AS SALES_DATE, PRODUCT_ID, USER_ID,  SALES_AMOUNT
    FROM ONLINE_SALE
    WHERE SALES_DATE LIKE '2022-03%'
    UNION 
    SELECT DATE_FORMAT(SALES_DATE, "%Y-%m-%d") AS SALES_DATE, PRODUCT_ID, NULL AS USER_ID,  SALES_AMOUNT 
    FROM OFFLINE_SALE
    WHERE SALES_DATE LIKE '2022-03%'
) AS T
ORDER BY SALES_DATE, PRODUCT_ID, USER_ID