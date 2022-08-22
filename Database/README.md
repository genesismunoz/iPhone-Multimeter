# ECEN-404
iPHONE-MULTIMETER

Frontend Subsystem

The database we used was MySQL, and managed it through MySQLWorkbench. The contents of the database were exported into two Separate CSV files, the Feedback Table and the Measurements Table. 

Values inside the Feedback Table were sent from the application to the database, and the values in the Measurements Table were manually inserted to reflect actual value that would have been sent from the Backend Subsystem.

PHP scripts are place into MAMP directory to host a local server to run them. Use feedback.php when trying to send feedback to the database and retrieve.php to retrieve the contents of the Measurements Table and output them in the server. 