USE classicmodels;
DROP PROCEDURE IF EXISTS getCusById;
DROP PROCEDURE IF EXISTS GetCustomersCountByCity;
DROP PROCEDURE IF EXISTS SetCounter;
DELIMITER //
CREATE PROCEDURE getCusById(IN cusNum INT)
BEGIN
    SELECT * FROM customers WHERE customerNumber = cusNum;
END //
CREATE PROCEDURE GetCustomersCountByCity(IN in_city VARCHAR(50), OUT total INT)
BEGIN
    SELECT COUNT(customerNumber) INTO total FROM customers WHERE city = in_city;
END //
CREATE PROCEDURE SetCounter(INOUT counter INT, IN inc INT)
BEGIN
    SET counter = counter + inc;
END //
DELIMITER ;
CALL getCusById(175);
CALL GetCustomersCountByCity('Lyon', @total);
SELECT @total AS customers_in_lyon;
SET @counter = 1;
CALL SetCounter(@counter, 1);
SELECT @counter AS counter_2; -- 2
CALL SetCounter(@counter, 1);
SELECT @counter AS counter_3; -- 3
CALL SetCounter(@counter, 5);
SELECT @counter AS counter_8; -- 8
