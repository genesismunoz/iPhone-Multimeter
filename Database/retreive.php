
<!DOCTYPE html>
<html lang="<?php echo $language; ?>">
<body>
<?php
$servername = "127.0.0.1";
$username = "root";
$password = "root";
$dbname = "STEVE_Reads";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);

// Check connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}
echo "Status: Connected to Database";

//Timing testing and Retreival Query
$starttime = microtime(true);
$sql = "SELECT * FROM Measurements";
$endtime = microtime(true);
$duration = ($endtime - $starttime)*1000;
printf("<br/>");
printf("Time of retreival in ms: %s", $duration);

//Get the Current Number of Rows in Table
$result = mysqli_query($conn, $sql);
printf("<br />Current Number of Rows %d <br />", $result->num_rows);


printf("<br/>");

//Print Column Names
$finfo = $result->fetch_field_direct(0);
printf("%s    " , $finfo->name);

$finfo = $result->fetch_field_direct(1);
printf("  %s  " , $finfo->name);

$finfo = $result->fetch_field_direct(2);
printf("  %s  " , $finfo->name);

$finfo = $result->fetch_field_direct(3);
printf("  %s  " , $finfo->name);

$finfo = $result->fetch_field_direct(4);
printf("  %s  " , $finfo->name);

$finfo = $result->fetch_field_direct(5);
printf("  %s  " , $finfo->name);

//Print Table Entries
printf("<br/>");
while ($row = $result->fetch_row()){
    printf("<br />   %s    %s    %s    %s    %s    %s  <br />", $row[0], $row[1], $row[2], $row[3], $row[4], $row[5]);
}

mysqli_close($conn);

?>
</body>
</html>

