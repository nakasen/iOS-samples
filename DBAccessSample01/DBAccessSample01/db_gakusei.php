<?php
  $include = "db_gakusei_define.php"; // $dsn, $user, $passが定義される
  $val = include($include);
  if(!$val){
    die("include error:" . $include);
  };  

  try {
    $dbh = new PDO($dsn, $user, $pass);

    // クエリー発行失敗時にPDOExceptionを発行
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // DBMSがmysqlなら文字コードをUTF8に
    //if ($dbh->getAttribute(PDO::ATTR_DRIVER_NAME) === 'mysql') {
    //  $dbh->exec('SET NAMES UTF8');
    //}
 
    // 非同期処理の効果を確かめるための待ちループ
    for ($i = 0; $i < 10000; $i++) {
      for ($j = 0; $j < 2000; $j++) {
        
      }
    }

    switch ($_SERVER['REQUEST_METHOD']) {
      case 'GET':
        $query = 'SELECT * FROM gakusei';
        if(isset($_GET['condition'])) {
          $query .= ' WHERE gno LIKE :string OR name LIKE :string';
        }
        $sth = $dbh->prepare($query);
        if(isset($_GET['condition'])) {
          $sth->bindValue(':string', '%'.$_GET['condition'].'%');
        }
        $sth->execute();
        $result = $sth->fetchAll(PDO::FETCH_ASSOC);
        $json = json_encode($result);
        print $json;
        $dbh = null;
        break;

      case 'POST':
        $query = 'INSERT INTO gakusei (gno, name) VALUES (:gno, :name)';
        transaction($dbh, $query, 'POST');
        break;

      case 'PUT':
        $query = 'UPDATE gakusei SET name = :name WHERE gno = :gno';
        transaction($dbh, $query, 'PUT');
        break;

      case 'DELETE':
        $query = 'DELETE FROM gakusei WHERE gno = :gno';
        transaction($dbh, $query, 'DELETE');
        break;
    }
  } catch (PDOException $e) {
    if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
      $dbh->rollback(); // ロールバック
    }
    print "Error: " . $e->getMessage() . PHP_EOL;
    exit;
  }

  // POST, PUT, DELETEの時に呼び出される関数
  // 複数件の書き込みに対応している
  function transaction($dbh, $query, $method) {
    $handle = fopen('php://input', 'r');
    $json_input = fgets($handle);
    $array = json_decode($json_input, true);
    $dbh->beginTransaction(); // トランザクション開始
    $sth = $dbh->prepare($query); // プリペアードクエリ

    foreach ($array as $row) {
      $sth->bindParam(':gno', $row['gno']);
      if (strcmp($method, 'DELETE') != 0) {
        $sth->bindParam(':name', $row['name']);
      }
      $sth->execute();
    }
    $dbh->commit(); // コミット
    $dbh = null;
  }
?>

