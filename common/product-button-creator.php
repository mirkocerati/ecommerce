<?php

function print_product($id, $name, $description, $price, $category, $gender, $age, $upload_date, $stock_amount, $image_url, $sale_percentage) {
	$sale_badge = "";
	$final_price = "€ " . $price;
	if($sale_percentage > 0) {
		$sale_badge = '<span style="background-color: red;" class="bage">-'.$sale_percentage.'%</span>';
		$final_price = "<s>€" . $price . "</s> €" . ($price - ($price * ($sale_percentage/100)));
		//$sale_badge = '-'.$sale_percentage.'%';
	}
    echo '<div class="col-md-4"><div class="product-item"><div class="product-thumb">'.$sale_badge.'<img class="img-responsive" src="' . $image_url . '" alt="product-img" />
						<div class="preview-meta">
							<ul>
								<li>
									<span  data-toggle="modal" data-target="#' . $id . '-product-modal">
										<i class="tf-ion-ios-search-strong"></i>
									</span>
								</li>
								<li>
			                        <a href="add_to_wishlist.php?code=' . $id . '" ><i class="tf-ion-ios-heart"></i></a>
								</li>
								<li>
									<a href="add_to_cart.php?code=' . $id . '"><i class="tf-ion-android-cart"></i></a>
								</li>
							</ul>
                      	</div>
					</div>
					<div class="product-content">
						<h4><a href="product.php?id=' . $id . '">' . $name . '</a></h4>
						<p class="price">' . $final_price . '</p>
					</div>
				</div>
			</div>
		
		<!-- Modal -->
		<div class="modal product-modal fade" id="' . $id . '-product-modal">
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
			        				<p class="product-price">' . $final_price . '</p>
			        				<p class="product-short-description">
									' . $description . '
			        				</p>
			        				<a href="https://mirko.lol/cart/add.php?id='.$id.'" class="btn btn-main">Aggiungi al carrello</a>
			        				<a href="product.php?id='.$id.'" class="btn btn-transparent">Visualizza dettagli</a>
			        			</div>
			        		</div>
			        	</div>
			        </div>
		    	</div>
		  	</div>
		</div><!-- /.modal -->



		';
}

?>