<?php

function print_empty_wishlist() {
    echo 
    '
    <section class="empty-cart page-wrapper">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3">
        <div class="block text-center">
        	<i class="tf-ion-ios-cart-outline"></i>
          	<h2 class="text-center">La tua lista dei desideri è vuota!</h2>
          	<p>Salva i prodotti che desidere ma su cui non sei convinto, e torna più tardi!</p>
          	<a href="../products.php" class="btn btn-main mt-20">Sfoglia prodotti</a>
      </div>
    </div>
  </div>
</section>
    ';
}

function print_wishlist_products($q) {
    $html = '<div class="page-wrapper">
    <div class="cart shopping">
      <div class="container">
        <div class="row">
          <div class="col-md-8 col-md-offset-2">
            <div class="block">
              <div class="product-list">
                <form method="post">
                  <table class="table">
                    <thead>
                      <tr>
                        <th class="">Oggetto</th>
                        <th class="">Prezzo attuale</th>
                        <th class=""></th>
                        <th class=""></th>
                      </tr>
                    </thead>
                    <tbody>
                ';
    foreach($q as $row) {
        $html .= '<tr>
        <td>
          <div class="product-info">
            <img width="80" src="../images/shop/cart/cart-1.jpg" alt="" />
            <a href="../product.php?id='.$row["id"].'">'.$row["name"].'</a>
          </div>
        </td>
        <td>'.$row["price"].'</td>
        <td>
          <a class="product-remove" href="remove.php?id='.$row["id"].'">Remove</a>
        </td>
        <td>
          <a class="product-remove" style="color: green" href="../cart/add.php?id='.$row["id"].'">ACQUISTA</a>
        </td>
      </tr>';
    }
    $html .= '</tbody>
    </table>
    <a href="checkout.html" class="btn btn-main pull-right">Checkout</a>
  </form>
</div>
</div>
</div>
</div>
</div>
</div>
</div>';

echo $html;
}

$query_result = DBManager::getInstance()->Select("SELECT * FROM products AS p JOIN wishlist AS w WHERE w.user_id=? AND w.product_id=p.id;", ["i", $user_id]);

if(count($query_result) < 1) {
    print_empty_wishlist();
} else {
    print_wishlist_products($query_result);
}
?>