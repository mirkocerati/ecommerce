<?php
function build_dropdown_single_product($id, $name, $price, $amount, $image_url) {
	return '<!-- Cart Item -->
	<div class="media">
		<a class="pull-left" href="https://mirko.lol/product.php?id='.$id.'">
			<img class="media-object" src="'.$image_url.'" alt="image" />
		</a>
		<div class="media-body">
			<h4 class="media-heading"><a href="https://mirko.lol/product.php?id='.$id.'">'.$name.'</a></h4>
			<div class="cart-price">
				<span>x'.$amount.'</span>
				<span>€ '.$price.'</span>
			</div>
			<h5><strong>€ '.(string)($price * $amount) .'</strong></h5>
		</div>
		<a href="https://mirko.lol/cart/remove.php?id='.$id.'" class="remove"><i class="tf-ion-close"></i></a>
	</div><!-- / Cart Item -->
	<!-- Cart Item -->';
}

function build_dropdown_cart() {
	//unset($_COOKIE["cart"]);
	//setcookie("cart", "1", time()+86400);
	$cart_items = "";
	$total = 0;

	if(isset($_COOKIE["cart"])) {
	$cart_id = (int)$_COOKIE["cart"];
	$cart_query_result = SQL::getInstance()->Select("SELECT p.id, p.name, p.price, cp.amount FROM ((carts as c JOIN cart_products as cp) JOIN products as p) WHERE c.id=? AND c.id=cp.cart_id AND cp.product_id=p.id;", ["i", $cart_id]);
	
	
	foreach($cart_query_result as $cart_row) {
		$imgquery = SQL::getInstance()->Select("SELECT image_url FROM product_images where product_id=? LIMIT 1", ["i", $cart_row["id"]]);
		$image_url = "https://mirko.lol/images/products/not_found.jpg";
		foreach($imgquery as $imgrow) {
			$image_url = $imgrow["image_url"];
		}
		$price = $cart_row["price"];
		$amount = $cart_row["amount"];
		$total += $price * $amount;
		$cart_items .= build_dropdown_single_product($cart_row["id"], $cart_row["name"], $price, $amount, $image_url);
	}
}

if(!empty($cart_items)) {
	return $cart_items . '<div class="cart-summary">
	<span>Totale</span>
	<span class="total-price">€ '.$total.'</span>
</div>
<ul class="text-center cart-buttons">
	<li><a href="https://mirko.lol/cart" class="btn btn-small">Vai al carrello</a></li>
	<li><a href="https://mirko.lol/checkout.php" class="btn btn-small btn-solid-border">Checkout</a></li>
</ul>';
} else {
	return '<div class="cart-summary">
	<span>Il tuo carrello è vuoto!</span>
</div>
<ul class="text-center cart-buttons">
	<li><a href="https://mirko.lol/products.php" class="btn btn-small">Acquista</a></li>
	<li><a href="https://mirko.lol/auth?auth_type=sign_in" class="btn btn-small btn-solid-border">Accedi</a></li>
</ul>';
}

}

function build_single_navbar_menu($name, $categorieshtml) {
	return '
	<li class="dropdown dropdown-slide">
		<a href="https://mirko.lol/products.php?gender=MAN&age=ADULT" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350"
			role="button" aria-haspopup="true" aria-expanded="false">'.$name.' <span
				class="tf-ion-ios-arrow-down"></span></a>
		<div class="dropdown-menu">
			<div class="row">

				<!-- Basic -->
				<div class="col-lg-12 col-md-12 mb-sm-6">
					<ul>
						'.$categorieshtml.'

					</ul>
				</div>


			</div><!-- / .row -->
		</div><!-- / .dropdown-menu -->
	</li><!-- / Elements -->';
}

function build_navbar() {

	$query_result = SQL::getInstance()->Select("SELECT id, name FROM categories WHERE hidden=FALSE LIMIT 5");

$man = "";
$woman = "";
$child = "";

foreach($query_result as $row) {
	$id = $row["id"];
	$name = $row["name"];
	$man .= '<li><a href="https://mirko.lol/products.php?category=' . $id . '&gender=MAN&age=ADULT">' . $name . '</a></li>';
	$woman .= '<li><a href="https://mirko.lol/products.php?category=' . $id . '&gender=WOMAN&age=ADULT">' . $name . '</a></li>';
	$child .= '<li><a href="https://mirko.lol/products.php?category=' . $id . '&age=CHILD">' . $name . '</a></li>';
}


$man .= '<li><a href="https://mirko.lol/products.php?gender=MAN&age=ADULT"><b>Visualizza tutto</b></a></li>';
$woman .= '<li><a href="https://mirko.lol/products.php?gender=WOMAN&age=ADULT"><b>Visualizza tutto</b></a></li>';
$child .= '<li><a href="https://mirko.lol/products.php?age=CHILD"><b>Visualizza tutto</b></a></li>';
return '</section><!-- End Top Header Bar -->
<!-- Main Menu Section -->
<section class="menu">
	<nav class="navbar navigation">
		<div class="container">
			<div class="navbar-header">
				<h2 class="menu-title">Apri il menu</h2>
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
					aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>

			</div><!-- / .navbar-header -->

			<!-- Navbar Links -->
			<div id="navbar" class="navbar-collapse collapse text-center">
				<ul class="nav navbar-nav">

					<!-- Home -->
					<li class="dropdown ">
						<a href="https://mirko.lol/index.php">Home</a>
					</li><!-- / Home -->


					'. build_single_navbar_menu("Uomo", $man) . build_single_navbar_menu("Donna", $woman) . build_single_navbar_menu("Bambino", $child) . '

					<li><a style="color: red" href="https://mirko.lol/products.php?sale=true" role="button"><span class="tf-ion-ios-pricetags"></span> SALDI</a></li>

			</div>
			<!--/.navbar-collapse -->
		</div><!-- / .container -->
	</nav>
</section>';
}


function print_header() {
$category_query_result = SQL::getInstance()->Select("SELECT id, name FROM categories WHERE hidden=FALSE");

$man = "";
$woman = "";
$child = "";

foreach($category_query_result as $row) {
	$id = $row["id"];
	$name = $row["name"];
	$man .= '<li><a href="https://mirko.lol/products.php?category=' . $id . '&gender=MAN&age=ADULT">' . $name . '</a></li>';
	$woman .= '<li><a href="https://mirko.lol/products.php?category=' . $id . '&gender=WOMAN&age=ADULT">' . $name . '</a></li>';
	$child .= '<li><a href="https://mirko.lol/products.php?category=' . $id . '&age=CHILD">' . $name . '</a></li>';
}


$man .= '<li><a href="https://mirko.lol/products.php?gender=MAN&age=ADULT"><b>Visualizza tutto</b></a></li>';
$woman .= '<li><a href="https://mirko.lol/products.php?gender=WOMAN&age=ADULT"><b>Visualizza tutto</b></a></li>';
$child .= '<li><a href="https://mirko.lol/products.php?age=CHILD"><b>Visualizza tutto</b></a></li>';

$login_button_text = "Accedi";
if(isset($_SESSION["user_id"])) {
	$q = SQL::getInstance()->Select("SELECT name FROM users WHERE id=?", ["i", $_SESSION["user_id"]]);
	foreach($q as $r) {
		$login_button_text = "Ciao, " . $r["name"] . "!";
	}
}

echo '<section class="top-header">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-xs-12 col-sm-4">
				<div class="contact-number">
					<li class="li"><a style="background-color: #4db051" href="https://mirko.lol/contact.php" class="btn btn-main btn-small btn-round-full">Serve aiuto? Contattaci!</a></li>
				</div>
			</div>
			<div class="col-md-4 col-xs-12 col-sm-4">
				<!-- Site Logo -->
				<div class="logo text-center">
					<a href="https://mirko.lol/">
						<!-- replace logo here -->
						<svg width="145px" height="29px" viewBox="0 0 155 45" version="1.1" xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink">
							<g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" font-size="50"
								font-family="AustinBold, Austin" font-weight="bold">
								<g id="Group" transform="translate(-108.000000, -297.000000)" fill="#000000">
									<text id="AVIATO">
										<tspan x="108.94" y="340">AVIATO</tspan>
									</text>
								</g>
							</g>
						</svg>
					</a>
				</div>
			</div>
			<div class="col-md-4 col-xs-12 col-sm-4">
				<!-- Cart -->
				<ul class="top-menu text-right list-inline">
					<li class="dropdown cart-nav dropdown-slide height=45">
						<a href="https://mirko.lol/cart/" class="dropdown-toggle" data-hover="dropdown"><i
								class="tf-ion-android-cart"></i>Carrello</a>
						<div class="dropdown-menu cart-dropdown">
							'.build_dropdown_cart().'
						</div>

					</li><!-- / Cart -->

					<!-- Elements -->
					<li class="dropdown dropdown-slide text-center">
						<a href="https://mirko.lol/account.php"><span class="tf-ion-ios-contact"></span> '.$login_button_text.'</a>
					</li><!-- / Elements -->

	

				</ul><!-- / .nav .navbar-nav .navbar-right -->
			</div>
		</div>
	</div>' . build_navbar(); 
}

print_header();

?>