-- 46th Solution
SET SQL_MODE = '';

SELECT START_DATE, END_DATE
FROM
    (SELECT START_DATE FROM PROJECTS WHERE START_DATE NOT IN (SELECT END_DATE FROM PROJECTS)) A,
    (SELECT END_DATE FROM PROJECTS WHERE END_DATE NOT IN (SELECT START_DATE FROM PROJECTS)) B
    
WHERE START_DATE < END_DATE
GROUP BY START_DATE
ORDER BY DATEDIFF(END_DATE, START_DATE), START_DATE

-- 47th Solution
SELECT S.NAME
FROM ( 
    STUDENTS S JOIN FRIENDS F USING(ID)
    JOIN PACKAGES P1 ON S.ID=P1.ID
    JOIN PACKAGES P2 ON F.FRIEND_ID=P2.ID
)
WHERE P2.SALARY > P1.SALARY
ORDER BY P2.SALARY

-- 48th Solution
SELECT F1.X, F1.Y
FROM FUNCTIONS F1
INNER JOIN FUNCTIONS F2 ON F1.X = F2.Y AND F1.Y = F2.X
GROUP BY F1.X, F1.Y
HAVING COUNT(F1.X)>1 OR F1.X<F1.Y
ORDER BY F1.X

