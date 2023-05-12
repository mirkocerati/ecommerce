<?php
session_start();
require('common/SQL.php');

if(!isset($_GET["id"])) {
	header("location: products.php");
	die();
}

$id = (int)$_GET["id"];

$query_result = SQL::getInstance()->Select("SELECT * FROM products WHERE id=? AND hidden=FALSE", ["i", $id]);

if(count($query_result) < 1) {
	header("location: products.php");
	die();
}

$name; $description; $price; $image_url; $details; $category;

foreach($query_result as $row) {
	$name = $row["name"];
	$description = $row["description"];
	$price = $row["price"];
	$image_url = $row["image_url"];
	$details = $row["details"];
	$category = $row["category"];
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
  <?php echo "<title>$name</title>"; ?>

  <!-- Mobile Specific Metas
  ================================================== -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
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

<?php 
require_once('common/header.php'); 
//require_once('common/alert/AlertType.php');
require_once('common/Alerts.php'); 

?>


<section class="single-product">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<ol class="breadcrumb">
					<li><a href="index.php">Home</a></li>
					<li><a href="products.php">Prodotti</a></li>
					<?php echo "<li class='active'>$name</li>"; ?>
				</ol>
			</div>
			<div class="col-md-6">
				<ol class="product-pagination text-right">
					<li><a href="https://mirko.lol/wishlist/add.php?id=<?php echo $id; ?>"><i class="tf-ion-ios-heart"></i> <u>Aggiungi alla lista dei desideri</u></a></li>
				</ol>
			</div>
		</div>
		<?php
		//echo Alerts::danger("ciao");

		if(isset($_GET["cart_result"])) {
			switch(strtolower($_GET["cart_result"])) {
				case "added":
					echo Alerts::success("Questo prodotto è stato aggiunto correttamente al carrello!");
					break;
				case "failed":
					echo Alerts::danger("Non è stato possibile aggiungere questo prodotto al carrello.");
					break;
			}
		}

		if(isset($_GET["review_result"])) {
			switch(strtolower($_GET["review_result"])) {
				case "posted":
					echo Alerts::success("La tua recensione è stata inviata. Grazie, il tuo parere conta!");
					break;
				case "failed":
					echo Alerts::danger("Si è verificato un errore per cui la tua recensione non è stata inviata. Contatta un amministratore.");
					break;
				case "already_reviewed":
					echo Alerts::warning("Una tua recensione per questo prodotto è già presente!");
					break;
				case "not_purchased":
					echo Alerts::info("È necessario acquistare un prodotto prima di recensirlo!");
					break;
			}
		}


		?>
		<div class="row mt-20">
			<div class="col-md-5">
				<div class="single-product-slider">
					<div id='carousel-custom' class='carousel slide' data-ride='carousel'>
						<?php
						function fetch_images($product_id) {
							$html1 = '<div class"carousel-outer"><div class="carousel-inner">';
							$html2 = '<ol class="carousel-indicators mCustomScrollbar meartlab">';

							$images_query_result = SQL::getInstance()->Select("SELECT image_url FROM product_images WHERE product_id=?", ["i", (int)$product_id]);

							if(count($images_query_result) < 1) {
								echo '<div class"carousel-outer"><div class="carousel-inner">
								<div class="item active"><img src="https://mirko.lol/images/products/not_found.jpg" alt="" data-zoom-image="https://mirko.lol/images/products/not_found.jpg" /></div>
								</div><!-- sag sol --><a class="left carousel-control" href="#carousel-custom" data-slide="prev"><i class="tf-ion-ios-arrow-left"></i></a><a class="right carousel-control" href="#carousel-custom" data-slide="next"><i class="tf-ion-ios-arrow-right"></i></a></div>
								';
							}
							
							$counter = 0;

							foreach($images_query_result as $row) {
								$active = "";
								$active2 = "";
								if($counter == 0) {
									$active = "active";
									$active2 = 'class="active"';
								}

								$html1 .= '<div class="item '.$active.'"><img src="'.$row["image_url"].'" alt="" data-zoom-image="'.$row["image_url"].'" /></div>';
								$html2 .= '<li data-target="#carousel-custom" data-slide-to="'.$counter.'" '.$active2.'><img src="'.$row["image_url"].'" alt="" /></li>';
								$counter++;
							}

							$html1 .= '</div><!-- sag sol --><a class="left carousel-control" href="#carousel-custom" data-slide="prev"><i class="tf-ion-ios-arrow-left"></i></a><a class="right carousel-control" href="#carousel-custom" data-slide="next"><i class="tf-ion-ios-arrow-right"></i></a></div>';
							$html2 .= '</ol>';

							echo $html1;
							echo $html2;
						}
						fetch_images($id);
						?>
						<!--<div class='carousel-outer'>
							 me art lab slider
							<div class='carousel-inner '>
								<div class='item active'>
									<img src='https://mirko.lol/images/products/4-1.jpg' alt='' data-zoom-image="https://mirko.lol/images/products/4-1.jpg" />
								</div>
								<div class='item'>
									<img src='https://mirko.lol/images/products/pngwing.com.png' alt='' data-zoom-image="https://mirko.lol/images/products/pngwing.com.png" />
								</div>
								
							</div>
							
							<a class='left carousel-control' href='#carousel-custom' data-slide='prev'>
								<i class="tf-ion-ios-arrow-left"></i>
							</a>
							<a class='right carousel-control' href='#carousel-custom' data-slide='next'>
								<i class="tf-ion-ios-arrow-right"></i>
							</a>
						</div> 
						
						<ol class='carousel-indicators mCustomScrollbar meartlab'>
							<li data-target='#carousel-custom' data-slide-to='0' class='active'>
								<img src='https://mirko.lol/images/products/4-1.jpg' alt='' />
							</li>
							<li data-target='#carousel-custom' data-slide-to='1'>
								<img src='https://mirko.lol/images/products/pngwing.com.png' alt='' />
							</li>
						</ol> -->
					</div>
				</div>
			</div>
			<div class="col-md-7">
				<div class="single-product-details">
					<h2><?php echo $name; ?></h2>
					<p class="product-price"><?php echo $price; ?></p>
					
					<p class="product-description mt-20">
					<?php echo $description; ?>
					</p>
					<!--
					<div class="color-swatches">
						<span>color:</span>
						<ul>
							<li>
								<a href="#!" class="swatch-violet"></a>
							</li>
							<li>
								<a href="#!" class="swatch-black"></a>
							</li>
							<li>
								<a href="#!" class="swatch-cream"></a>
							</li>
						</ul>
					</div>
					<div class="product-size">
						<span>Size:</span>
						<select class="form-control">
							<option>S</option>
							<option>M</option>
							<option>L</option>
							<option>XL</option>
						</select>
					</div>
					<div class="product-quantity">
						<span>Quantity:</span>
						<div class="product-quantity-slider">
							<input id="product-quantity" type="text" value="0" name="product-quantity">
						</div>
					</div> -->
					<a href="https://mirko.lol/cart/add.php?id=<?php echo $id; ?>" class="btn btn-main mt-20">Aggiungi al carrello</a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<div class="tabCommon mt-20">
					<div class="tab-content patternbg">
						<div>
							<h4>Dettagli</h4>
							<p><?php echo $details; ?></p>						</div>
					</div>
					<br>
					<div class="tab-content patternbg">
						<div>

						<h4>Cosa ne pensano gli altri utenti</h4>
							<div class="post-comments">
						    	<ul class="media-list comments-list m-bot-50 clearlist">


									<?php

									function print_reviews(int $product_id) {
										$reviews_query = SQL::getInstance()->Select("SELECT * FROM reviews as r JOIN users as u WHERE r.product_id=? AND r.user_id=u.id AND r.hidden=FALSE;", ["i", $product_id]);
										if(count($reviews_query) < 1) {
											echo "Non è presente alcune recensione per questo prodotto.";
											return;
										}

										foreach($reviews_query as $review) {

											$stars = "";
											for ($i = 0; $i<(int)$review["stars"]; $i++) {
												$stars .= '<i class="tf-ion-ios-star"></i>';
											}
											echo '<li class="media">

											<a class="pull-left" href="https://mirko.lol/user.php?username='.$review["username"].'">
												<img class="media-object comment-avatar" src="'.$review["profile_picture"].'" alt="" width="50" height="50" />
											</a>
	
											<div class="media-body">
												<div class="comment-info">
													<h4 class="comment-author">
														<a href="https://mirko.lol/user.php?username='.$review["username"].'">'.$review["name"].' ' . $review["lastname"] . ' (@' . $review["username"] . ')</a>
								
													</h4>
													<h4>'.$stars.'</h4>
													<time datetime="2013-04-06T13:53">'.$review["date"].'</time>
												</div>
												<p>
													<b>'.$review["subject"].'</b>
												</p>
												<p>
													'.$review["text"].'
												</p>
											</div>
	
										</li>';
										}
									}

									print_reviews($id);


									?>
								    <!-- Comment Item start
								    <li class="media">

								        <a class="pull-left" href="#!">
								            <img class="media-object comment-avatar" src="images/blog/avater-1.jpg" alt="" width="50" height="50" />
								        </a>

								        <div class="media-body">
								            <div class="comment-info">
								                <h4 class="comment-author">
								                    <a href="#!">Jonathon Andrew</a>
								                	
								                </h4>
								                <time datetime="2013-04-06T13:53">July 02, 2015, at 11:34</time>
								                <a class="comment-button" href="#!"><i class="tf-ion-chatbubbles"></i>Reply</a>
								            </div>

								            <p>
								                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque at magna ut ante eleifend eleifend.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod laborum minima, reprehenderit laboriosam officiis praesentium? Impedit minus provident assumenda quae.
								            </p>
								        </div>

								    </li>
								    End Comment Item -->
							</ul>
							</div>
						</div>
					</div>
					<br>

					<div class="tab-content patternbg">
						<div>

						<h4>Lascia una recensione! Come trovi questo prodotto?</h4>
							<div class="post-comments">
						    	<ul class="media-list comments-list m-bot-50 clearlist">

								<form action="https://mirko.lol/common/post_review.php" method="post">
									<input type="hidden" name="product_id" value="<?php echo $id; ?>" />
								<label for="stars">Quante stelle merita questo prodotto?</label>

								

								<select type="select" name="stars" id="stars">
  									<option value="5">5</option>
  									<option value="4">4</option>
  									<option value="3">3</option>
  									<option value="2">2</option>
  									<option value="1">1</option>
								</select>
								<div class="form-group">
              						<input type="text" class="form-control" name="subject" placeholder="Oggetto">
            					</div>
            					<div class="form-group">
              						<input type="text" class="form-control" name="text" placeholder="Approfondisci...">
            					</div>
            					<div class="text-center">
              						<button type="submit" class="btn btn-main text-center">Invia recensione</button>
           						 </div>
								</form>


									<?php

									


									?>
							</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="products related-products section">
	<div class="container">
		<div class="row">
			<div class="title text-center">
				<h2>Ti potrebbe interessare anche...</h2>
			</div>
		</div>
		<div class="row">

			<?php

			require('common/product-button-creator.php');
			require('common/product-image-query.php');
			function print_related(int $category_id) {
				$related_query = SQL::getInstance()->Select("SELECT * FROM products WHERE category=? ORDER BY rand() LIMIT 3", ["i", $category_id]);

				

				foreach($related_query as $related) {
					$image_url = get_product_image($related["id"]);
					print_product($related["id"], $related["name"], $related["description"], $related["price"], $related["category"], $related["gender"], $related["age"], $related["time_published"], $related["stock_amount"], $image_url, $related["sale_percentage"]);
				}
			}
			print_related($category);
			?>


			<!--
			<div class="col-md-3">
				<div class="product-item">
					<div class="product-thumb">
						<span class="bage">Sale</span>
						<img class="img-responsive" src="images/shop/products/product-5.jpg" alt="product-img" />
						<div class="preview-meta">
							<ul>
								<li>
									<span  data-toggle="modal" data-target="#product-modal">
										<i class="tf-ion-ios-search"></i>
									</span>
								</li>
								<li>
			                        <a href="#" ><i class="tf-ion-ios-heart"></i></a>
								</li>
								<li>
									<a href="#!"><i class="tf-ion-android-cart"></i></a>
								</li>
							</ul>
                      	</div>
					</div>
					<div class="product-content">
						<h4><a href="product-single.html">Reef Boardsport</a></h4>
						<p class="price">$200</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="product-item">
					<div class="product-thumb">
						<img class="img-responsive" src="images/shop/products/product-1.jpg" alt="product-img" />
						<div class="preview-meta">
							<ul>
								<li>
									<span  data-toggle="modal" data-target="#product-modal">
										<i class="tf-ion-ios-search-strong"></i>
									</span>
								</li>
								<li>
			                        <a href="#" ><i class="tf-ion-ios-heart"></i></a>
								</li>
								<li>
									<a href="#!"><i class="tf-ion-android-cart"></i></a>
								</li>
							</ul>
                      	</div>
					</div>
					<div class="product-content">
						<h4><a href="product-single.html">Rainbow Shoes</a></h4>
						<p class="price">$200</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="product-item">
					<div class="product-thumb">
						<img class="img-responsive" src="images/shop/products/product-2.jpg" alt="product-img" />
						<div class="preview-meta">
							<ul>
								<li>
									<span  data-toggle="modal" data-target="#product-modal">
										<i class="tf-ion-ios-search"></i>
									</span>
								</li>
								<li>
			                        <a href="#" ><i class="tf-ion-ios-heart"></i></a>
								</li>
								<li>
									<a href="#!"><i class="tf-ion-android-cart"></i></a>
								</li>
							</ul>
                      	</div>
					</div>
					<div class="product-content">
						<h4><a href="product-single.html">Strayhorn SP</a></h4>
						<p class="price">$230</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="product-item">
					<div class="product-thumb">
						<img class="img-responsive" src="images/shop/products/product-3.jpg" alt="product-img" />
						<div class="preview-meta">
							<ul>
								<li>
									<span  data-toggle="modal" data-target="#product-modal">
										<i class="tf-ion-ios-search"></i>
									</span>
								</li>
								<li>
			                        <a href="#" ><i class="tf-ion-ios-heart"></i></a>
								</li>
								<li>
									<a href="#!"><i class="tf-ion-android-cart"></i></a>
								</li>
							</ul>
                      	</div>
					</div>
					<div class="product-content">
						<h4><a href="product-single.html">Bradley Mid</a></h4>
						<p class="price">$200</p>
					</div>
				</div>
			</div> -->
			
		</div>
	</div>
</section>




<?php
require('common/newsletter-footer.php');
require('common/footer.php');

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