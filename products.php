<?php
session_start();
require('common/SQL.php');

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
	<title>Risultato ricerca</title>

	<!-- Mobile Specific Metas
  ================================================== -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="description" content="Construction Html5 Template">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">

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

	<?php require('common/header.php'); ?>

	<section class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="content">
						<h1 class="page-name">Cerca prodotti</h1>
						<ol class="breadcrumb">
							<li><a href="index.php">Home</a></li>
							<li class="active">cerca prodotti</li>
						</ol>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="products section">
		<div class="container">
			<div class="row">

				<?php

				$query_result;
				$category = "";
				$gender = "";
				$age = "";
				$sale = "";

				/*if(is_int((int)$_GET["category"])) {
					echo "int!!";
				} else {
					echo "not int :(";
				}*/


				if(isset($_GET["category"])) {
					$category_parse = intval($_GET["category"]);
					if(is_int($category_parse)) {
						$category = " AND category=" . $category_parse;
					}
				}

				if(isset($_GET["gender"])) {
					switch(strtolower($_GET["gender"])) {
						case "man":
							$gender = " AND gender='MAN'";
							break;
						case "woman":
							$gender = " AND gender='WOMAN'";
							break;
						case "unisex":
							$gender = " AND gender='UNISEX'";
							break;
					}
				}

				if(isset($_GET["age"])) {
					switch(strtolower($_GET["age"])) {
						case "adult":
							$age = " AND age='ADULT'";
							break;
						case "woman":
							$age = " AND age='CHILD'";
					}
				}

				if(isset($_GET["sale"]) && strtolower($_GET["sale"]) == "true") {
					$sale = " AND sale_percentage>0";
				}

				$sql = "SELECT * FROM products WHERE hidden=0" . $category . $gender . $age . $sale;

				$query_result = SQL::getInstance()->Select($sql . " ORDER BY rand();");

				/*if(isset($_GET["category"])) {
					$query_result = SQL::getInstance()->Select("SELECT * FROM products WHERE hidden=FALSE AND category=? ".$sale." order by rand();", ["i", $_GET["category"]]);
				} else {
					$query_result = SQL::getInstance()->Select("SELECT * FROM products WHERE hidden=FALSE".$sale." order by rand();");
				}*/


				require('common/product-button-creator.php');
				require('common/product-image-query.php');

				foreach($query_result as $row) {
					$image_url = get_product_image($row["id"]);
					print_product($row["id"], $row["name"], $row["description"], $row["price"], $row["category"], $row["gender"], $row["age"], $row["time_published"], $row["stock_amount"], $image_url, $row["sale_percentage"]);
				}

				?>

			</div>
		</div>
	</section>




	<?php include 'common/footer.php'; ?>

	<!-- 
	Essential Scripts
	=====================================-->

	<!-- Main jQuery -->
	<script src="plugins/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.1 -->
	<script src="plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- Bootstrap Touchpin -->
	<script src="plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
	<!-- Video Lightbox Plugin -->
	<script src="plugins/ekko-lightbox/dist/ekko-lightbox.min.js"></script>
	<!-- Count Down Js -->
	<script src="plugins/syo-timer/build/jquery.syotimer.min.js"></script>

	<!-- slick Carousel -->
	<script src="plugins/slick/slick.min.js"></script>
	<script src="plugins/slick/slick-animation.min.js"></script>

	<!-- Main Js File -->
	<script src="js/script.js"></script>



</body>

</html>