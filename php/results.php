<?php
// score and return results
function returnResults($response){
  // init vars
  $con = db();
  $answers = json_decode($response, true);

  $scorecard = array("email" => 0,
    "ppc" => 0,
    "partnerships" => 0,
    "salesEnab" => 0,
    "comm" => 0,
    "press" => 0,
    "paidSoc" => 0,
    "magnets" => 0,
    "events" => 0,
    "refProg" => 0,
    "content" => 0,
  );

  $finalResults[] = [];

  $nicheComp = false;
  $nicheCompNickname = "nicheComp";
  $priceComp = false;
  $priceCompNickname = "priceComp";
  $productComp = false;
  $productCompNickname = "productComp";
  $productSpec = false;
  $productSpecNickname = "productFocus";
  $splitSpec = false;
  $splitSpecNickname = "split";
  $estChannelSpec = false;
  $estChannelSpecNickname = "estChannels";
  $scaleChannelSpec = false;
  $scaleChannelSpecNickname = "scaleChannels";

  // loop through answers
  for($i=0;$i<count($answers);$i++){

    if($answers[$i]["qid"] == "1"){
      switch($answers[$i]["aid"]){
        case "1":
          $scorecard["comm"] += 1;
          $scorecard["paidSoc"] += 1;
        break;
        case "2":
          $scorecard["ppc"] += 1;
          $scorecard["events"] += 1;
          $scorecard["salesEnab"] += 1;
        break;
        case "3":
          $splitSpec = true;
          $scorecard["ppc"] += 1;
          $scorecard["comm"] += 1;
          $scorecard["salesEnab"] += 1;
        break;
      }
    }

    if($answers[$i]["qid"] == "2"){
      switch($answers[$i]["aid"]){
        case "4":
          $productSpec = true;
          $scorecard["email"] += 1;
        break;
        case "5":
          $scorecard["content"] += 1;
          $scorecard["email"] += 1;
        break;
        case "6":
          $estChannelSpec = true;
        break;
      }
    }

    if($answers[$i]["qid"] == "3"){
      switch($answers[$i]["aid"]){
        case "7":
          $scorecard["partnerships"] += 1;
        break;
        case "8":
          $scorecard["content"] += 1;
          $scorecard["ppc"] += 1;
          $scorecard["magnets"] += 1;
        break;
        case "9":
          $scaleChannelSpec = true;
          $scorecard["events"] += 1;
        break;
      }
    }

    if($answers[$i]["qid"] == "4"){
      switch($answers[$i]["aid"]){
        case "10":
          $scorecard["comm"] += 1;
          $scorecard["ppc"] += 1;
          $scorecard["paidSoc"] += 1;
          $scorecard["content"] += 1;
          break;
        case "11":
          $scorecard["salesEnab"] += 1;
          $scorecard["email"] += 1;
          break;
        case "12":
          $scorecard["press"] += 1;
          $scorecard["paidSoc"] += 1;
          $scorecard["ppc"] += 1;
          $scorecard["refProg"] += 1;
        break;
        case "13":
          $scorecard["partnerships"] += 1;
          $scorecard["salesEnab"] += 1;
          $scorecard["magnets"] += 1;
        break;
      }
    }

    if($answers[$i]["qid"] == "5"){
      switch($answers[$i]["aid"]){
        case "14":
          $productComp = true;
        break;
        case "15":
          $priceComp = true;
        break;
        case "16":
          $nicheComp = true;
        break;
      }
    }
  }

  $nicknames = array();
  $finalResults = array();

  // must-haves
  $mustHaveSQL = "SELECT nickname FROM results WHERE category = 'musthave'";
  $mustHaveResult = mysqli_query($con, $mustHaveSQL);
  while($mustHaveArr = mysqli_fetch_array($mustHaveResult)) {
    array_push($nicknames, $mustHaveArr["nickname"]);
  }

  // considers
  foreach($scorecard as $name => $score){
    if($score > 1){
      $nicknames[] = $name;
    }
  }

  // flags - specials and competitive advantages
  if($nicheComp == true){
    $nicknames[] = $nicheCompNickname;
  }
  if($priceComp == true){
    $nicknames[] = $priceCompNickname;
  }
  if($productComp == true){
    $nicknames[] = $productCompNickname;
  }
  if($productSpec == true){
    $nicknames[] = $productSpecNickname;
  }
  if($splitSpec == true){
    $nicknames[] = $splitSpecNickname;
  }
  if($estChannelSpec == true){
    $nicknames[] = $estChannelSpecNickname;
  }
  if($scaleChannelSpec == true){
    $nicknames[] = $scaleChannelSpecNickname;
  }

  // SQL for results needed
  $resultString = "SELECT category, title, content FROM results WHERE ";
  for($i=0;$i<count($nicknames);$i++){
    if($i < count($nicknames) - 1){
      $resultString .= "nickname = '" . $nicknames[$i] . "' OR ";
    } else {
      $resultString .= "nickname = '" . $nicknames[$i] . "'";
    }
  }

  // push results into array & send
  $dbResult = mysqli_query($con, $resultString);
  while($row = mysqli_fetch_assoc($dbResult)) {
    array_push($finalResults, array(
      "title"=>$row["title"],
      "category"=>$row["category"],
      "content"=>$row["content"]
    ));
  }

  $encodeResults = mb_convert_encoding($finalResults, 'HTML-ENTITIES');
  $json = json_encode($encodeResults);
  if($json){
    return $json;
  } else {
    return json_last_error_msg();
  }

  $con->close();
}
?>
