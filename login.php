<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
        <!--Link to bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!--Link to self-created css-->
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <title>Login</title>
    </head>
    <body>

        <?php
            require('db.php');
            session_start();
            // If form submitted, insert values into the database.
            if (isset($_POST['username'])){

                $username = stripslashes($_REQUEST['username']); // removes backslashes
                $username = mysqli_real_escape_string($con,$username); //escapes special characters in a string
                $password = stripslashes($_REQUEST['password']);
                $password = mysqli_real_escape_string($con,$password);

            //Checking is user existing in the database or not
                $query = "SELECT * FROM `users` WHERE username='$username' and password='".md5($password)."'";
                $result = mysqli_query($con,$query) or die(mysqli_error());
                $rows = mysqli_num_rows($result);
                if($rows==1){
                    $_SESSION['username'] = $username;
                    header("Location: index.php"); // Redirect user to index.php
                    }else{
                        echo "<div class='form'><h3>Username/password is incorrect.</h3><br/>Click here to <a href='login.php'>Login</a></div>";
                        }
            }else{
        ?>
        <div class="form">
            <h1>Log In</h1>
            <form action="" method="post" name="login">
                <input type="text" name="username" placeholder="Username" required />
                <input type="password" name="password" placeholder="Password" required />
                <input name="submit" type="submit" value="Login" />
            </form>
            <p>Not registered yet? <a href='registration.php'>Register Here</a></p>

            <br/><br/> 
        </div>
        <?php } ?>
    </body>
</html>
