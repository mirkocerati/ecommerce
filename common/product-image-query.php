<?php

function get_product_image($id) {
    $image_query_result = DBManager::getInstance()->Select("SELECT image_url FROM product_images WHERE product_id=" . $id . " LIMIT 1");

	foreach($image_query_result as $element) {
		return $element["image_url"];
	}

    return "https://mirko.lol/images/products/not_found.jpg";
}

?>