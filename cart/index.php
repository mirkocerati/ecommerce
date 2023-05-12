<?php

session_start();

require('../common/SQL.php');
require('../common/cart_manager.php');


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
  <title>Aviato | Carrello</title>

  <!-- Mobile Specific Metas
  ================================================== -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
  
  <!-- Favicon -->
  <link rel="shortcut icon" type="image/x-icon" href="../images/favicon.png" />
  
  <!-- Themefisher Icon font -->
  <link rel="stylesheet" href="../plugins/themefisher-font/style.css">
  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css">
  
  <!-- Animate css -->
  <link rel="stylesheet" href="../plugins/animate/animate.css">
  <!-- Slick Carousel -->
  <link rel="stylesheet" href="../plugins/slick/slick.css">
  <link rel="stylesheet" href="../plugins/slick/slick-theme.css">
  
  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="../css/style.css">

</head>

<body id="body">

<?php require('../common/header.php'); ?>

<section class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="content">
					<h1 class="page-name">Il tuo carrello</h1>
				</div>
			</div>
		</div>
	</div>
</section>



<div class="page-wrapper">
  <div class="cart shopping">
    <div class="container">
      <div class="row">
        <div class="col-md-8 col-md-offset-2">
          <div class="block">
            <div class="product-list">
              
					<?php
					function build_cart($my_cart_id) {
						$q2 = SQL::getInstance()->Select("SELECT * FROM ((carts as c join cart_products as cp) join products as p) join product_images as pi where c.id=cp.cart_id and cp.product_id=p.id and c.id=? and pi.product_id=p.id AND pi.cover=TRUE AND p.hidden=FALSE and c.active=TRUE;", ["i", $my_cart_id]);
						$html = '<form method="post" action="https://mirko.lol/checkout.php"><table class="table">
            <thead>
              <tr>
                <th class="">Articolo</th>
                <th class="">Prezzo</th>
                <th class="">Quantità</th>
                <th class=""></th>
              </tr>
            </thead>
            <tbody>';
            if(count($q2) > 0) {
						foreach($q2 as $row) {
							$html .= '<tr>
							<td>
              
							  <div class="product-info">
								<img width="80" src="'.$row["image_url"].'" />
								<a href="https://mirko.lol/product.php?id='.$row["id"].'">'.$row["name"].'</a>
							  </div>
							</td>
							<td class="">€ '.$row["price"].'</td>
							<td class="">'.$row["amount"].'</td>
							<td class="">
							  <a class="product-remove" href="https://mirko.lol/cart/remove.php?id='.$row["id"].'">Rimuovi</a>
							</td>
						  </tr>';
						}
						echo $html . '</tbody>
            </table>
            <a href="https://mirko.lol/checkout.php" class="btn btn-main pull-right">Checkout</a>
          </form>';
					} else {
            echo '
            <section class="empty-cart page-wrapper">
          <div class="container">
            <div class="row">
              <div class="col-md-6 col-md-offset-1">
                <div class="block text-center">
                  <i class="tf-ion-ios-cart-outline"></i>
                    <h2 class="text-center">Il tuo carrello è vuoto!</h2>
                    <a href="../products.php" class="btn btn-main mt-20">Sfoglia prodotti</a>
              </div>
            </div>
          </div>
        </section>
            ';
          }
        }

					build_cart(get_cart_id());
					?>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>



<?php

require('../common/newsletter-footer.php');
require('../common/footer.php');

?>
    


  </body>
  </html>
