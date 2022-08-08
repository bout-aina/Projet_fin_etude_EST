<!DOCTYPE HTML>
<html>

<head>
	<title>Shop Cart</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
	<!--styles -->
	<link rel="stylesheet" href="css/jquery.fancybox.css">
	<link rel="stylesheet" href="css/font-awesome.css">
	<link rel="stylesheet" href="css/jquery.owl.carousel.css">
	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/animate.css">
	<!--styles -->
</head>
<body class="woocommerce shop-cart pc">
	<!-- page header -->
	<header id="home">
		<div class="stick-wrapper">
			<div class="sticky clear">
				<div class="grid-row">
					<img class="splash" src="img/splash.png" alt="">
					<div class="logo">
						<a href="index.html"><img src="images/logo.png"  width="130"alt=""></a>
					</div>
					<nav class="nav">
						<a href="#" class="switcher">
							<i class="fa fa-bars"></i>
						</a>
						<ul class="clear">
                            <li><a href="doctorHome.html">Acceuil</a></li>
							<li><a href="doctorRDV.html">Rendez-vous</a></li>
							<li><a href="doctorMemo.html">Memo</a></li>
                            <li><a href="doctorSta.html">Statistique</a></li>
							<li><a href="doctorPa.html">Patients</a></li>
							<li><a href="doctorMsg.html">Messages</a></li>
							<li>
								<a href="doctorOut.html">Decoonexion</a>
								
							</li>
							
							
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<!--/ page header -->
	<div class="top-bg">
		
    	<img src="img/splash-top.png" class="splash-top" alt>
		<div class="page-title zoomIn animated">Shop</div>
	</div>
	<!-- page content -->
	<div class="page-content">
		<div class="grid-row">
			<!-- Shop -->
			
			<div id="content" role="main">
			
			<div class="title clear">
				<span class="main-title">NOM</span><div><a href="shop-product-list.html">BACK TO FOLDERS</a>
				<span class="slash-icon">/<i class="fa fa-angle-double-right"></i></span></div>
			</div>
			
				<form action="#" method="post">
				<p>
								<button type="submit" name="calc_shipping" value="1" class="rectangle-button green medium">Nouveau document</button>
							</p>
					<table class="shop_table cart">
						<thead>
							<tr>
								<!-- <th class="product-thumbnail">&nbsp;</th> -->
								<th class="product-quantity">Date</th>
								<th class="product-quantity">Nom</th>
								<th class="product-quantity">Email</th>
								<th class="product-quantity">Tel</th>
								<th class="product-name">Message</th>
								<th class="product-pin"> supprimer&nbsp;</th>
								<th class="product-remove"> Epingler&nbsp;</th>
							</tr>
						</thead>
						<tbody>								
							<tr class="cart_item">
								<td class="product-quantity">
									<span class="amount">06-10-2020</span>			
								</td>
								<td class="product-quantity">
									<span class="amount">david kali</span>			
								</td>
								<td class="product-quantity">
									<span class="amount">david@gmail.com</span>			
								</td>
								<td class="product-quantity">
									<span class="amount">06708987</span>			
								</td>
								<td class="product-name">
									<a href="shop-single-item.html">Nullam elementum tristique risus nec pellentesque</a>			
								</td>
								<td class="product-pin">
									<a href="#" class="pin" title="pin this item"></a>	
								</td>
								<td class="product-remove">
									<a href="#" class="remove" title="Remove this item"> </a>	
								</td>
							</tr>
							<!-- <tr>
								<td colspan="6" class="actions">
									<div class="coupon">
										<label for="coupon_code">Coupon:</label> 
										<input type="text" name="coupon_code" class="input-text" id="coupon_code" value="" placeholder="Coupon code">
										<input type="submit" class="rectangle-button green medium" name="apply_coupon" value="Apply Coupon">	
									</div>
									<input type="submit" class="rectangle-button green medium" name="update_cart" value="Update Cart">
									<input type="submit" class="checkout-button rectangle-button green medium alt wc-forward" name="proceed" value="Proceed to Checkout">	
								</td>
							</tr> -->
						</tbody>
					</table>
				</form>
				<!-- <div class="cart-collaterals">	
					
					<form class="shipping_calculator" action="#" method="post">
						<h2><a href="#" class="shipping-calculator-button">Calculate Shipping</a></h2>
						<section class="shipping-calculator-form">
							<p class="form-row form-row-wide">
								<select name="calc_shipping_country" id="calc_shipping_country" class="country_to_state" rel="calc_shipping_state">
									<option value="">Select a country...</option>
									<option value="AF">Afghanistan</option>
									<option value="AL">Albania</option>
									<option value="DZ">Algeria</option>
									<option value="AD">Andorra</option>
									<option value="AO">Angola</option>
									<option value="AI">Anguilla</option>
									<option value="AQ">Antarctica</option>
									<option value="AG">Antigua and Barbuda</option>
									<option value="AR">Argentina</option>
									<option value="AM">Armenia</option>
									<option value="AW">Aruba</option>
									<option value="AU">Australia</option>
									<option value="AT">Austria</option>
									<option value="AZ">Azerbaijan</option>
									<option value="BS">Bahamas</option>
									<option value="BH">Bahrain</option>
									<option value="BD">Bangladesh</option>
									<option value="BB">Barbados</option>
									<option value="BY">Belarus</option>
									<option value="PW">Belau</option>
									<option value="BE">Belgium</option>
									<option value="BZ">Belize</option>
									<option value="BJ">Benin</option>
									<option value="BM">Bermuda</option>
									<option value="BT">Bhutan</option>
									<option value="BO">Bolivia</option>
									<option value="BQ">Bonaire, Saint Eustatius and Saba</option>
									<option value="BA">Bosnia and Herzegovina</option>
									<option value="BW">Botswana</option>
									<option value="BV">Bouvet Island</option>
									<option value="BR">Brazil</option>
									<option value="IO">British Indian Ocean Territory</option>
									<option value="VG">British Virgin Islands</option>
									<option value="BN">Brunei</option>
									<option value="BG">Bulgaria</option>
									<option value="BF">Burkina Faso</option>
									<option value="BI">Burundi</option>
									<option value="KH">Cambodia</option>
									<option value="CM">Cameroon</option>
									<option value="CA">Canada</option>
									<option value="CV">Cape Verde</option>
									<option value="KY">Cayman Islands</option>
									<option value="CF">Central African Republic</option>
									<option value="TD">Chad</option>
									<option value="CL">Chile</option>
									<option value="CN">China</option>
									<option value="CX">Christmas Island</option>
									<option value="CC">Cocos (Keeling) Islands</option>
									<option value="CO">Colombia</option>
									<option value="KM">Comoros</option>
									<option value="CG">Congo (Brazzaville)</option>
									<option value="CD">Congo (Kinshasa)</option>
									<option value="CK">Cook Islands</option>
									<option value="CR">Costa Rica</option>
									<option value="HR">Croatia</option>
									<option value="CU">Cuba</option>
									<option value="CW">CuraÇao</option>
									<option value="CY">Cyprus</option>
									<option value="CZ">Czech Republic</option>
								</select>
							<p class="form-row form-row-wide">
								<input type="text" class="input-text" value="" placeholder="State / county" name="calc_shipping_state" id="calc_shipping_state">		
							</p>
							<p class="form-row form-row-wide">
								<input type="text" class="input-text" value="" placeholder="Postcode / Zip" name="calc_shipping_postcode" id="calc_shipping_postcode">
							</p>
							<p>
								<button type="submit" name="calc_shipping" value="1" class="rectangle-button green medium">Update Totals</button>
							</p>
						</section>
					</form>
					<div class="cart_totals ">	
						<h2>Cart Totals:</h2>
						<table>
							<tbody>
								<tr class="cart-subtotal">
									<th>Cart Subtotal</th>
									<td><span class="amount">$12.00</span></td>
								</tr>
								<tr class="shipping">
									<th>Shipping and Handling</th>
									<td>	
										Free Shipping		
									</td>
								</tr>
								<tr class="order-total">
									<th>Order Total</th>
									<td><strong><span class="amount">$12.00</span></strong> </td>
								</tr>			
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!--Shop -->
		</div>
	</div> -->
	<!--/ page content -->
	<!-- subscribe -->
	<!-- <div class="subscribe">
		<div class="grid-row clear">
			<div class="them-mask"></div>
			<div class="subscribe-header">subscribe</div>
			<form action="#" class="clear">
				<input type="email" placeholder="Your Email Address">
				<button type="submit" class="button-send">Send</button>
			</form>
		</div>
	</div> -->
	<!--/ subscribe -->
	<!-- page footer -->
	<!-- <footer id="footer">
		<div class="grid-row clear">
			<div class="footer">
				<div id="copyright">Copyright<span> Splashes</span> 2016-All Rights Reserved</div>
				<a href="index.html" class="footer-logo"><img src="images/logo.png"  width="200"alt=""></a>
				<!-- <div class="social">
					<a href="#" class="contact-round"><i class="fa fa-twitter"></i></a>
					<a href="#" class="contact-round"><i class="fa fa-facebook"></i></a>
					<a href="#" class="contact-round"><i class="fa fa-skype"></i></a>
					<a href="#" class="contact-round"><i class="fa fa-rss"></i></a>
					<a href="#" class="contact-round"><i class="fa fa-linkedin"></i></a>
				</div> -->
			</div>
		</div>
	</footer> -->
	<!--/ page footer -->
	<a href="#" id="scroll-top" class="scroll-top"><i class="fa fa-angle-up"></i></a>
	
	<!-- scripts -->
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.fancybox.pack.js"></script>
	<script src="js/jquery.fancybox-media.js"></script>
	<script src="js/jquery.isotope.min.js"></script>
	<script src="js/jquery.owl.carousel.js"></script>
	
	<script src="js/wow.min.js"></script>
	<script src="js/main.js"></script>
	<script src="js/retina.min.js"></script>
	<!--/ scripts -->
</body>
</html>