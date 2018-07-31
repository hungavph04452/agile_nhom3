
<!-- *** MENU ***
 _________________________________________________________ -->

<div class="navbar navbar-default yamm" role="navigation" id="navbar">
	<div class="container">
		<div class="navbar-header">

			<a class="navbar-brand home" href="index.jsp"
				data-animate-hover="bounce"> <img src="img/logo.png"
				alt="Obaju logo" class="hidden-xs"> <img
				src="img/logo-small.png" alt="Obaju logo" class="visible-xs"><span
				class="sr-only">Obaju - go to homepage</span>
			</a>
			<div class="navbar-buttons">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#navigation">
					<span class="sr-only">Toggle navigation</span> <i
						class="fa fa-align-justify"></i>
				</button>
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#search">
					<span class="sr-only">Toggle search</span> <i class="fa fa-search"></i>
				</button>
				<a class="btn btn-default navbar-toggle" href="Cart.jsp"> <i
					class="fa fa-shopping-cart"></i> <span class="hidden-xs">items
						in cart</span>
				</a>
			</div>
		</div>
		<!--/.navbar-header -->

		<div class="navbar-collapse collapse" id="navigation">

			<ul class="nav navbar-nav navbar-left">
				<li class="active"><a href="index.jsp">Home</a></li>
				<li class="dropdown yamm-fw"><a href="Product.jsp"
					class="dropdown-toggle" data-hover="dropdown" data-delay="200">Product
						<b class="caret"></b>
				</a></li>

				<li class="dropdown yamm-fw"><a href="Invoice.jsp"
					class="dropdown-toggle" data-hover="dropdown" data-delay="200">Invoice
						<b class="caret"></b>
				</a></li>
			</ul>

		</div>
		<!--/.nav-collapse -->

		<div class="navbar-buttons">

			<div class="navbar-collapse collapse right" id="basket-overview">
				<a href="Cart.jsp" class="btn btn-primary navbar-btn"><i
					class="fa fa-shopping-cart"></i><span class="hidden-sm">items
						in cart</span></a>
			</div>
			<!--/.nav-collapse -->

			<div class="navbar-collapse collapse right" id="search-not-mobile">
				<button type="button" class="btn navbar-btn btn-primary"
					data-toggle="collapse" data-target="#search">
					<span class="sr-only">Toggle search</span> <i class="fa fa-search"></i>
				</button>
			</div>

		</div>

		<div class="collapse clearfix" id="search">

			<div class="navbar-collapse collapse right" id="search-not-mobile">
				<form class="navbar-form" role="SearchServlet"
					action="SearchServlet" method="post">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search..."
							name="txtSearch">
					</div>
				</form>
			</div>

		</div>
		<!--/.nav-collapse -->

	</div>
	<!-- /.container -->
</div>
<!-- /#navbar -->

<!-- *** MENU END *** -->