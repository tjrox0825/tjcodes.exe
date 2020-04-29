<?php 
//php script for form submission
if (isset($_POST['email']))
{
    
    //email information 
    $admin_email="tjrox0825@gmail.com";
    $name=$_POST['name'];
    $email=$_POST['email'];
    $phone=$_POST['phone'];
    $message=$_POST['message'];

    //send email 
    mail($admin_email, "Form Submission", $message .' - '. $phone, "From:" .$email);

    header('Location: submitted.html');
}
