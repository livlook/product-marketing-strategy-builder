<?php
header('Access-Control-Allow-Origin: http://localhost');
header('Access-Control-Allow-Headers: Content-type');
require 'results.php';
require 'conn.php';

$con = db();

if (!$con) {
  die("Connection failed: " . mysqli_connect_error());
}

$method = $_SERVER['REQUEST_METHOD'];
// session_start();
// $user_id = session_id();

if ($method == 'GET') {
  // question array
  $q_sql = "SELECT * FROM questions";
  $q_result = mysqli_query($con,$q_sql);
  while($q_arr = mysqli_fetch_array($q_result, MYSQLI_ASSOC)) {
    $questions[] = $q_arr;
  }

  // answers array
  $a_sql = "SELECT * FROM answers";
  $a_result = mysqli_query($con,$a_sql);
  while($a_arr = mysqli_fetch_array($a_result, MYSQLI_ASSOC)) {
    $answers[] = $a_arr;
  }

  $q_set = array();

  // loop through to build question set
  for($i=0;$i<count($questions);$i++){
    // loop through answers per question
    $a_set = array();
    for($j=0;$j<count($answers);$j++){
      if($answers[$j]['qid']==$questions[$i]['id']){
        array_push($a_set,array(
          'id'=>$answers[$j]['id'],
          'qid'=>$questions[$i]['id'],
          'content'=>$answers[$j]['content']
        ));
      }
    }

    array_push($q_set,array(
      'id'=>$questions[$i]['id'],
      'content'=>$questions[$i]['content'],
      'answers'=>$a_set
    ));
  }

  echo json_encode($q_set);
} elseif ($method == 'POST') {
  $_POST = json_decode(file_get_contents('php://input'), true);
  $final = returnResults($_POST["responses"]);
  echo $final;
}

$con->close();
?>
