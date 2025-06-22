
SELECT customer_id FROM CREDIT_PORTFOLIO
WHERE customer_name IS NULL OR TRIM(customer_name) = '';

SELECT customer_id FROM CREDIT_PORTFOLIO
WHERE birth_date IS NULL OR TRIM(birth_date) = '';

SELECT customer_id FROM CREDIT_PORTFOLIO
WHERE loan_amount IS NULL;

SELECT customer_id FROM CREDIT_PORTFOLIO
WHERE NOT REGEXP_LIKE(account_open_date, '^\d{4}-\d{2}-\d{2}$');

SELECT customer_id FROM CREDIT_PORTFOLIO
WHERE email IS NOT NULL AND NOT REGEXP_LIKE(email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');

SELECT customer_id FROM CREDIT_PORTFOLIO
WHERE phone_number IS NOT NULL AND NOT REGEXP_LIKE(phone_number, '^\+99450\d{7}$');


SELECT 'Null müştəri adları' AS risk_name,
       COUNT(*) AS risk_count,
       SYSDATE AS detection_date,
       'Completeness' AS dimension
FROM CREDIT_PORTFOLIO
WHERE customer_name IS NULL OR TRIM(customer_name) = ''

UNION ALL

SELECT 'Null doğum tarixi',
       COUNT(*),
       SYSDATE,
       'Completeness'
FROM CREDIT_PORTFOLIO
WHERE birth_date IS NULL OR TRIM(birth_date) = ''

UNION ALL

SELECT 'Null kredit məbləği',
       COUNT(*),
       SYSDATE,
       'Completeness'
FROM CREDIT_PORTFOLIO
WHERE loan_amount IS NULL

UNION ALL

SELECT 'Uyğun olmayan tarix formatı',
       COUNT(*),
       SYSDATE,
       'Validity'
FROM CREDIT_PORTFOLIO
WHERE NOT REGEXP_LIKE(account_open_date, '^\d{4}-\d{2}-\d{2}$')

UNION ALL

SELECT 'Uyğun olmayan email formatı',
       COUNT(*),
       SYSDATE,
       'Validity'
FROM CREDIT_PORTFOLIO
WHERE email IS NOT NULL AND NOT REGEXP_LIKE(email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$')

UNION ALL

SELECT 'Uyğun olmayan telefon formatı',
       COUNT(*),
       SYSDATE,
       'Validity'
FROM CREDIT_PORTFOLIO
WHERE phone_number IS NOT NULL AND NOT REGEXP_LIKE(phone_number, '^\+99450\d{7}$');
