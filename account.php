<?php
session_start();
require('common/SQL.php');
require('auth/check_session.php');

function get_label($order_status = "") {
	switch(strtolower($order_status)) {
		case "processing":
			return "label-primary";
		case "completed":
			return "label-success";
		case "cancelled":
			return "label-danger";
		case "on_hold":
			return "label-info";
		case "pending":
			return "label-warning";
		default: return "label-primary";
	}
}

?>

<!DOCTYPE html>

<!--
 // WEBSITE: https://themefisher.com
 // TWITTER: https://twitter.com/themefisher
 // FACEBOOK: https://www.facebook.com/themefisher
 // GITHUB: https://github.com/themefisher/
-->

<html lang="en">
<head>

  <!-- Basic Page Needs
  ================================================== -->
  <meta charset="utf-8">
  <title>Il tuo profilo</title>

  <!-- Mobile Specific Metas
  ================================================== -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="Construction Html5 Template">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
  <meta name="author" content="Themefisher">
  <meta name="generator" content="Themefisher Constra HTML Template v1.0">
  
  <!-- Favicon -->
  <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
  
  <!-- Themefisher Icon font -->
  <link rel="stylesheet" href="plugins/themefisher-font/style.css">
  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
  
  <!-- Animate css -->
  <link rel="stylesheet" href="plugins/animate/animate.css">
  <!-- Slick Carousel -->
  <link rel="stylesheet" href="plugins/slick/slick.css">
  <link rel="stylesheet" href="plugins/slick/slick-theme.css">
  
  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="css/style.css">

</head>

<body id="body">
<?php

require('common/header.php');

$details_query_result = SQL::getInstance()->Select("SELECT * FROM users WHERE id=?", ["i", (int)$_SESSION["user_id"]]);
$name = "-"; $lastname = "-"; $email = "-"; $phone = "-"; $address = "-,-,-"; $birth_date = "-"; $image_url = "https://mirko.lol/images/users/blank.jpg";
foreach($details_query_result as $row) {
	$name = $row["name"]; $lastname = $row["lastname"]; $email = $row["email"]; $phone = $row["phone"];
	$address = $row["address"] . ", " . $row["city"] . " (" . $row["province"] . "), " . $row["postal_code"] . ", " . $row["country"];
	$birth_date = $row["birth_date"];
	$image_url = $row["profile_picture"];
}
$orders_html = "";
$orders_query_result = SQL::getInstance()->Select("SELECT *, o.status as order_status FROM orders as o JOIN payments as p WHERE o.user_id=? AND o.payment_id=p.id", ["i", (int)$_SESSION["user_id"]]);

foreach($orders_query_result as $row) {
	$orders_html .= '<tr>
	<td>'.$row["id"].'</td>
	<td>'.$row["creation_date"].'</td>
	<td>'.$row["amount"].'</td>
	<td><span class="label '.get_label($row["order_status"]).'">'.$row["order_status"].'</span></td>
	<td><a href="order.html" class="btn btn-default">View</a></td>
</tr>';
}


?>
<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">Il tuo profilo</h1>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="user-dashboard page-wrapper">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="dashboard-wrapper dashboard-user-profile">
          <div class="media">
            <div class="pull-left text-center" href="#!">
              <img class="media-object user-img" src="<?php echo $image_url ?>" alt="Image">
              <a href="#x" class="btn btn-transparent mt-20">Cambia immagine</a>
            </div>
            <div class="media-body">
              <ul class="user-profile-list">
                <li><span>Nome:</span><?php echo $name ?></li>
                <li><span>Cognome:</span><?php echo $lastname ?></li>
                <li><span>Data di nascita:</span><?php echo $birth_date ?></li>
                <li><span>Indirizzo di casa</span><?php echo $address ?></li>
                <li><span>Indirizzo email:</span><?php echo $email ?></li>
                <li><span>Numero di telefono:</span><?php echo $phone ?></li>
              </ul>
            </div>
          </div>
        </div>
		<div class="dashboard-wrapper user-dashboard">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>Order ID</th>
									<th>Date</th>
									<th>Total Price</th>
									<th>Status</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<?php echo $orders_html ?>
							</tbody>
						</table>
					</div>
				</div>
      </div>
    </div>
  </div>
</section>
<?php require('common/footer.php'); ?>

    


  </body>
  </html>