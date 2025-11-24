<nav class="navbar navbar-expand-lg fixed-top"
	style="background-color: rgba(255, 152, 0, 0.85); backdrop-filter: blur(8px); transition: 0.3s;">
	<div class="container">

		<!-- Brand with Logo -->
		<a class="navbar-brand fw-bold d-flex align-items-center text-white"
			href="index.jsp"> <img src="img/eventhive_logo.png"
			alt="EventHive Logo"
			style="height: 45px; width: auto; margin-right: 10px;"> <span
			style="font-size: 1.6rem; font-weight: 700;">EVENTHIVE</span>
		</a>


		<!-- Mobile Toggle -->
		<button class="navbar-toggler border-0 shadow-none" type="button"
			data-bs-toggle="collapse" data-bs-target="#navbarContent">
			<i class="fa-solid fa-bars text-white"></i>
		</button>

		<!-- Navbar Links -->
		<div class="collapse navbar-collapse" id="navbarContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">

				<!-- ADMIN -->
				<li class="nav-item dropdown me-3"><a
					class="nav-link dropdown-toggle text-white" href="#" role="button"
					data-bs-toggle="dropdown"> <i
						class="fa-solid fa-user-shield me-1"></i> Admin
				</a>
					<ul class="dropdown-menu dropdown-menu-end">
						<li><a class="dropdown-item" href="Login.jsp"> <i
								class="fa-solid fa-right-to-bracket me-2"></i> Login
						</a></li>
					</ul></li>

				<!-- ORGANIZER -->
				<li class="nav-item dropdown me-3"><a
					class="nav-link dropdown-toggle text-white" href="#" role="button"
					data-bs-toggle="dropdown"> <i class="fa-solid fa-user-tie me-1"></i>
						Event Organizer
				</a>
					<ul class="dropdown-menu dropdown-menu-end">
						<li><a class="dropdown-item" href="Login.jsp">
								<i class="fa-solid fa-right-to-bracket me-2"></i> Login
						</a></li>
						<li><a class="dropdown-item" href="Register.jsp">
								<i class="fa-solid fa-user-plus me-2"></i> Register
						</a></li>
					</ul></li>

				<!-- CUSTOMER -->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle text-white" href="#" role="button"
					data-bs-toggle="dropdown"> <i class="fa-solid fa-users me-1"></i>
						Customer
				</a>
					<ul class="dropdown-menu dropdown-menu-end">
						<li><a class="dropdown-item" href="Login.jsp"> <i
								class="fa-solid fa-right-to-bracket me-2"></i> Login
						</a></li>
						<li><a class="dropdown-item" href="Register.jsp"> <i
								class="fa-solid fa-user-plus me-2"></i> Register
						</a></li>
					</ul></li>

			</ul>
		</div>
		
	</div>
	
</nav>

<style>
.navbar-scrolled {
	background-color: rgba(255, 152, 0, 0.95) !important;
	padding: 10px 0 !important;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
}

.nav-link:hover {
	color: #ffe0b2 !important;
}

.dropdown-menu {
	border-radius: 10px;
	border: none;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
}

.dropdown-item:hover {
	background-color: #fff3e0;
	color: #ff9800;
}
</style>

<script>
	// Navbar scroll animation
	window.addEventListener("scroll", function() {
		const nav = document.querySelector(".navbar");
		if (window.scrollY > 20)
			nav.classList.add("navbar-scrolled");
		else
			nav.classList.remove("navbar-scrolled");
	});
</script>
