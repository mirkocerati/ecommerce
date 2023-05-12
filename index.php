<?php
session_start();
require('common/SQL.php');
require('common/Alerts.php');

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
	<title>Aviato</title>

	<!-- Mobile Specific Metas
  ================================================== -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="description" content="Construction Html5 Template">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
	<meta name="author" content="Themefisher">
	<meta name="generator" content="Themefisher Constra HTML Template v1.0">

	<!-- theme meta -->
	<meta name="theme-name" content="aviato" />

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

	<!-- Start Top Header Bar -->
	<?php include 'common/header.php';?>

	<div class="hero-slider">
		<?php

		$result = SQL::getInstance()->Select("SELECT * FROM boards WHERE enabled=TRUE");

		foreach ($result as $row) {
			$title = $row["title"];
			$sub = $row["subtitle"];
			$url = $row["url"];
			$url_title = $row["url_title"];
			$image_url = $row["image_url"];

			$html =
				'
		<div class="slider-item th-fullpage hero-area" style="background-image: url(' . $image_url . ');">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 text-center">
          <p data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".1">'.$title.'</p>
          <h1 data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".5">'.$sub.'</h1>
          <a data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".8" class="btn" href="'.$url.'">'.$url_title.'</a>
        </div>
      </div>
    </div>
  </div>
  ';
			echo $html;
		}

		?>

	</div></section>
	<section class="products section bg-gray">
		<div class="container">
			<div class="row">
				<div class="title text-center">
					<h2>I prodotti più venduti del mese</h2>
				</div>
			</div>
			<div class="row">

			<?php

			$query_result = SQL::getInstance()->Select("SELECT p.* FROM ((products as p JOIN orders as o) JOIN carts as c) JOIN cart_products as cp WHERE o.status='COMPLETED' AND o.cart_id=c.id AND cp.cart_id=c.id AND p.id=cp.product_id ORDER BY o.creation_date LIMIT 6;");

			require('common/product-button-creator.php');
			require('common/product-image-query.php');

			foreach($query_result as $row) {
				$image_url = get_product_image($row["id"]);
				print_product($row["id"], $row["name"], $row["description"], $row["price"], $row["category"], $row["gender"], $row["age"], $row["time_published"], $row["stock_amount"], $image_url);
			}

?>

			</div>
		</div>
	</section>




	<?php

	include 'common/newsletter-footer.php';
	include 'common/footer.php';

	?>

	<!-- 
	Essential Scripts
	=====================================-->

	<!-- Main jQuery -->
	<script src="plugins/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.1 -->
	<script src="plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- Bootstrap Touchpin -->
	<script src="plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
	<!-- Instagram Feed Js -->
	<script src="plugins/instafeed/instafeed.min.js"></script>
	<!-- Video Lightbox Plugin -->
	<script src="plugins/ekko-lightbox/dist/ekko-lightbox.min.js"></script>
	<!-- Count Down Js -->
	<script src="plugins/syo-timer/build/jquery.syotimer.min.js"></script>

	<!-- slick Carousel -->
	<script src="plugins/slick/slick.min.js"></script>
	<script src="plugins/slick/slick-animation.min.js"></script>

	<!-- Google Mapl -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
	<script type="text/javascript" src="plugins/google-map/gmap.js"></script>

	<!-- Main Js File -->
	<script src="js/script.js"></script>



</body>

</html>