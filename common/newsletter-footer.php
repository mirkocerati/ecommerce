<?php

//require_once('common/Alerts.php');

$newsletter_html;
function newsletter_subscribe() {
	$email = "";
	if(isset($_POST["newsletter-sub-email"])) {
		$email = $_POST["newsletter-sub-email"];

	if(isset($_POST["newsletter-sub-terms"]) && $_POST["newsletter-sub-terms"] == "accepted") {

		$nl_exists = SQL::getInstance()->Select("SELECT * FROM newsletter WHERE LOWER(email)=?", ["s", strtolower($email)]);

		if(count($nl_exists) > 0) {
			return "email_already_subscribed";
		}

		SQL::getInstance()->Insert("INSERT INTO `newsletter` (`email`, `date_subscribed`, `active`) VALUES (?, current_timestamp(), '1')", ["s", $email]);
		return "subscribed";

} else {
	return "terms_not_accepted";
}
}
}

function newsletter_popup($result) {
	switch(strtolower($result)) {
		case "subscribed":
			return Alerts::success($result);
		case "terms_not_accepted":
			return Alerts::warning($result);
		case "email_already_subscribed":
			return Alerts::danger($result);
	}
}

$newsletter = newsletter_subscribe();



echo '<!--
Start Call To Action
==================================== -->
<section id="newsletter" class="call-to-action bg-gray section">
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center">
				<div class="title">
					<h2>Iscriviti alla nostra newsletter</h2>
					<p>Non perdere le migliori offerte per te!<br></p>
				</div>
				<div class="col-lg-6 col-md-offset-3">
				<form action="#newsletter" method="post">
				    <div class="input-group subscription-form">
				      <input name="newsletter-sub-email" type="text" class="form-control" placeholder="esempio@mail.it">
				      <span class="input-group-btn">
				        <input type="submit" class="btn btn-main" type="button" value="ciao">
				      </span> 
				    </div><!-- /input-group -->
					<div class="copyright-text" style="padding: 10px;">
					<input type="checkbox" value="accepted" "id="newsletter-sub-ck" name="newsletter-sub-terms"><label for="newsletter-sub-ck">Selezionando questa casella accetti i <a href="https://mirko.lol/faq.php">Termini e le Condizioni</a> del servizio.</label>
					</div>
					'.newsletter_popup($newsletter).'
					</form>
			  </div><!-- /.col-lg-6 -->

			</div>
		</div> 		<!-- End row -->
	</div>   	<!-- End container -->
</section>   <!-- End section -->'; ?>