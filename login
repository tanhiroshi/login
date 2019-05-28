<?php
namespace board3;
session_start();
require_once dirname(__FILE__).'\Bootstrap.class.php';
use board3\Bootstrap;
use lib\Database;

$link=new Database(Bootstrap::DB_HOST,Bootstrap::DB_USER,Bootstrap::DB_PASS,Bootstrap::DB_NAME);
$ses=array();
$msg="";
$emsg="";
if(isset($_POST["login"])){
$user=$_POST["user"];
$pass=$_POST["password"];
$qurey="select user,id from passwd_tb where pass=".$link->quote($pass)." and user=".$link->quote($user).";";
$ses=$link->select($qurey);

   if($ses===[]){
     $emsg="nameあるいはpasswordが間違いました。";
   }else{
     $msg="ようこそ、いらっしゃいませ";
     $_SESSION['name']=$ses[0]['user'];
     $_SESSION['id']=$ses[0]['id'];
     if($_SESSION['id']>0){
         header("location: http://localhost/board3/home.php");
   }
 }

}elseif(isset($_POST['create'])){
  header("location: http://localhost/board3/create.php");
}
 ?>

 <!DOCTYPE html>
 <html lang="en" dir="ltr">
   <head>
     <meta charset="utf-8">
     <title>LOGIN</title>
     <link rel="stylesheet" href="style.css">
   </head>
   <body>
     <header>
       <h1>温故知新の楽学園</h1>
       <p>自分で資料を作って、学習を楽しもう。</p>
     </header>
     <div id="content">
       <div id="main">
         <h2>ようこそ、温故知新の楽学園へ</h2>
         <div id="img_index">
         <image src="img2/welcome.jpg" width=300px height=300px>
         </div>

         <form  action="" method="post">
           NAME:　　　　　<input type="text" name="user" value=""> <br> <br>
           PASSWORD:　<input type="password" name="password" value=""> <br><br>
            <input type="submit" name="login" value="LOGIN">
         </form>
         <?php
         echo $msg;
         echo $emsg;
          ?>

       </div>
       <nav>
      <li><input type="button" onclick="location.href='http://localhost/board3/login2.php'" value="LOGIN"></li>
      <li><input type="button" onclick="location.href='http://localhost/board3/create.php'" value="新規登録"></li>
         <p>本日:<?php echo date("Y/m/d"); ?></p>
      </nav>
     </div>
     <footer>
      <p>制作者：tanhiroshi</p>
     </footer>
   </body>
 </html>
