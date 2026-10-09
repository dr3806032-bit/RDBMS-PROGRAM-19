DELIMITER //

CREATE PROCEDURE DisplayStudents()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE sid INT;
    DECLARE sname VARCHAR(20);
    DECLARE did INT;

    DECLARE cur CURSOR FOR
        SELECT StudentID, StudentName, DepartmentID
        FROM Student;

    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET done = 1;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO sid, sname, did;

        IF done = 1 THEN
            LEAVE read_loop;
        END IF;

        SELECT sid AS StudentID,
               sname AS StudentName,
               did AS DepartmentID;
    END LOOP;

    CLOSE cur;
END //

DELIMITER ;

CALL DisplayStudents();
