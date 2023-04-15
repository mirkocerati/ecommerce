<?php

require('database/DBManager.php');

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

	<?php include 'common/header.php'; ?>

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

				//require("database/DBManager.php");

				$query_result = DBManager::getInstance()->Select("SELECT * FROM products WHERE hidden=FALSE");

				foreach ($query_result as $row) {
					$code = $row["id"];
					$name = $row["name"];
					$description = $row["description"];
					$price = $row["price"];
					$category = $row["category"];
					$gender = $row["gender"];
					$age = $row["age"];
					$time_published = $row["time_published"];
					$hidden = $row["hidden"];
					$stock = $row["stock_amount"];

					$image_query_result = DBManager::getInstance()->Select("SELECT image_url FROM product_images WHERE product_code=" . $code . " LIMIT 1");

					$image_url = "https://mirko.lol/images/products/not_found.jpg";

					foreach ($image_query_result as $row) {
						$image_url = $row["image_url"];
					}

					$html = '	

			<div class="col-md-4">
				<div class="product-item">
					<div class="product-thumb">
						<span class="bage">Sale</span>
						<img class="img-responsive" src="' . $image_url . '" alt="product-img" />
						<div class="preview-meta">
							<ul>
								<li>
									<span  data-toggle="modal" data-target="#' . $code . 'product-modal">
										<i class="tf-ion-ios-search-strong"></i>
									</span>
								</li>
								<li>
			                        <a href="add_to_wishlist.php?code=' . $code . '" ><i class="tf-ion-ios-heart"></i></a>
								</li>
								<li>
									<a href="add_to_cart.php?code=' . $code . '"><i class="tf-ion-android-cart"></i></a>
								</li>
							</ul>
                      	</div>
					</div>
					<div class="product-content">
						<h4><a href="view_product.php?code=' . $code . '">' . $name . '</a></h4>
						<p class="price">' . $price . '</p>
					</div>
				</div>
			</div>
		
		<!-- Modal -->
		<div class="modal product-modal fade" id="' . $code . 'product-modal">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<i class="tf-ion-close"></i>
			</button>
		  	<div class="modal-dialog " role="document">
		    	<div class="modal-content">
			      	<div class="modal-body">
			        	<div class="row">
			        		<div class="col-md-8 col-sm-6 col-xs-12">
			        			<div class="modal-image">
				        			<img class="img-responsive" src="' . $image_url . '" alt="product-img" />
			        			</div>
			        		</div>
			        		<div class="col-md-4 col-sm-6 col-xs-12">
			        			<div class="product-short-details">
			        				<h2 class="product-title">' . $name . '</h2>
			        				<p class="product-price">' . $price . '</p>
			        				<p class="product-short-description">
									' . $description . '
			        				</p>
			        				<a href="cart.html" class="btn btn-main">Aggiungi al carrello</a>
			        				<a href="product-single.html" class="btn btn-transparent">Visualizza dettagli</a>
			        			</div>
			        		</div>
			        	</div>
			        </div>
		    	</div>
		  	</div>
		</div><!-- /.modal -->



		';

					echo $html;
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