
<?php
$servername = "127.0.0.1";
$username = "root";
$password = "root";
$dbname = "STEVE_Reads";

$secret = $_POST["secretWord"];
    if ("GenesisRocks!" != $secret) exit;

//make variables
$id = $_POST['Fid'];
$likes = $_POST['likes'];
$improve = $_POST['improve'];


// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);

// Check connection
if (mysqli_connect_errno()){
      echo "Failed to connect" . mysqli_connect_error();
        
    }

//COMMENTS FOR SPEED/TIME TESTING BELOW
//$starttime = microtime(true);
$query = "INSERT INTO Feedback(likes, improve) VALUES ( '".$likes."','".$improve."')";
//$endtime = microtime(true);
//$duration = ($endtime - $starttime)*1000;


$result = mysqli_query($conn,$query);

//SPEED/TIME TESTING
//printf("%s", $duration);

echo $result;//This goes back to App, to confirm insertion worked and present confirmation Pop-up

?>

