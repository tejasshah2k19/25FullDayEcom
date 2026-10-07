<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add user | Store admin</title>

<!-- Bootstrap 5 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
	rel="stylesheet">
<!-- Custom CSS -->

<style>
:root {
	--ink: #14213d;
	--ink-soft: #4a5876;
	--surface: #ffffff;
	--page: #eef2f7;
	--line: #d5dce8;
	--accent: #0f766e;
	--accent-dark: #0b5a54;
	--danger: #b42318;
}

html, body {
	height: 100%;
}

body {
	font-family: "Segoe UI", system-ui, -apple-system, Roboto,
		"Helvetica Neue", Arial, sans-serif;
	color: var(--ink);
	background: var(--page);
}

/* Layout: brand panel on the left (desktop), form on the right */
.page-wrap {
	min-height: 100vh;
	display: grid;
	grid-template-columns: minmax(280px, 5fr) 7fr;
}

.brand-panel {
	background: var(--ink);
	color: #fff;
	padding: 3rem 2.5rem;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

.brand-panel h1 {
	font-size: clamp(1.75rem, 3vw, 2.5rem);
	font-weight: 700;
	line-height: 1.15;
	max-width: 14ch;
}

.brand-panel p {
	color: #b8c3da;
	max-width: 36ch;
	margin-bottom: 0;
}

.brand-mark {
	font-weight: 700;
	letter-spacing: .02em;
	font-size: 1.1rem;
}

.brand-mark span {
	color: #5eead4;
}

.form-panel {
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 2rem 1.25rem;
}

.form-card {
	width: 100%;
	max-width: 560px;
	background: var(--surface);
	border: 1px solid var(--line);
	border-radius: 12px;
	padding: 2.25rem;
	box-shadow: 0 10px 30px rgba(20, 33, 61, .07);
}

.form-card h2 {
	font-size: 1.5rem;
	font-weight: 700;
	margin-bottom: .25rem;
}

.form-card .lead-text {
	color: var(--ink-soft);
	margin-bottom: 1.75rem;
}

.form-label {
	font-weight: 600;
	font-size: .9rem;
	color: var(--ink);
}

.form-control, .form-select {
	padding: .65rem .85rem;
	border-color: var(--line);
	border-radius: 8px;
}

.form-control:focus, .form-select:focus {
	border-color: var(--accent);
	box-shadow: 0 0 0 .2rem rgba(15, 118, 110, .2);
}

.password-group .btn-toggle {
	border: 1px solid var(--line);
	border-left: 0;
	background: #fff;
	color: var(--ink-soft);
	border-radius: 0 8px 8px 0;
}

.password-group .form-control {
	border-radius: 8px 0 0 8px;
}

.password-group .btn-toggle:focus-visible {
	outline: 2px solid var(--accent);
	outline-offset: -2px;
}

.hint {
	font-size: .8rem;
	color: var(--ink-soft);
	margin-top: .35rem;
}

.btn-create {
	background: var(--accent);
	border-color: var(--accent);
	color: #fff;
	font-weight: 600;
	padding: .7rem 1.5rem;
	border-radius: 8px;
}

.btn-create:hover, .btn-create:focus {
	background: var(--accent-dark);
	border-color: var(--accent-dark);
	color: #fff;
}

.btn-cancel {
	color: var(--ink-soft);
	font-weight: 600;
	padding: .7rem 1.25rem;
}

.alert {
	border-radius: 8px;
}

/* Tablet and mobile: stack the brand panel above the form */
@media ( max-width : 991.98px) {
	.page-wrap {
		grid-template-columns: 1fr;
	}
	.brand-panel {
		padding: 1.5rem 1.25rem;
		gap: 1rem;
	}
	.brand-panel h1 {
		max-width: none;
		font-size: 1.5rem;
	}
	.brand-panel p {
		display: none;
	}
	.form-panel {
		align-items: flex-start;
		padding: 1.25rem .75rem 2rem;
	}
}

@media ( max-width : 575.98px) {
	.form-card {
		padding: 1.5rem 1.15rem;
	}
	.form-actions .btn {
		width: 100%;
	}
}

@media ( prefers-reduced-motion : reduce) {
	* {
		transition: none !important;
	}
}
</style>

</head>
<body>

	<div class="page-wrap">

		<!-- Brand panel -->
		<aside class="brand-panel">
			<div class="brand-mark">
				Shop<span>Hub</span> admin
			</div>
			<div>
				<h1>Add a new account</h1>
				<p class="mt-3">Create shopper accounts or give a teammate admin
					access to manage products and orders.</p>
			</div>
			<small class="text-secondary d-none d-lg-block">&copy;
				ShopHub</small>
		</aside>

		<!-- Form panel -->
		<main class="form-panel">
			<section class="form-card">
				<h2>User details</h2>
				<p class="lead-text">All fields are required.</p>

				<%-- Messages set by the servlet: request.setAttribute("success", "...") / ("error", "...") --%>
	<%-- 			<c:if test="${not empty success}">
					<div class="alert alert-success d-flex align-items-center"
						role="alert">
						<i class="bi bi-check-circle-fill me-2"></i>
						<div>
							<c:out value="${success}" />
						</div>
					</div>
				</c:if> --%>
			<%-- 	<c:if test="${not empty error}">
					<div class="alert alert-danger d-flex align-items-center"
						role="alert">
						<i class="bi bi-exclamation-triangle-fill me-2"></i>
						<div>
							<c:out value="${error}" />
						</div>
					</div>
				</c:if>
 --%>
				<form action="AddUserController"
					method="post" class="needs-validation" novalidate>
					<div class="row g-3">

						<div class="col-12 col-sm-6">
							<label for="firstName" class="form-label">First name</label> <input
								type="text" class="form-control" id="firstName" name="firstName"
								value=""
								autocomplete="given-name" maxlength="50" required>
							<div class="invalid-feedback">Enter the first name.</div>
						</div>

						<div class="col-12 col-sm-6">
							<label for="lastName" class="form-label">Last name</label> <input
								type="text" class="form-control" id="lastName" name="lastName"
								value=""
								autocomplete="family-name" maxlength="50" required>
							<div class="invalid-feedback">Enter the last name.</div>
						</div>

						<div class="col-12">
							<label for="email" class="form-label">Email</label> <input
								type="email" class="form-control" id="email" name="email"
								value="" autocomplete="email"
								maxlength="100" required>
							<div class="invalid-feedback">Enter a valid email address,
								like name@example.com.</div>
						</div>

						<div class="col-12">
							<label for="password" class="form-label">Password</label>
							<div class="input-group password-group">
								<input type="password" class="form-control" id="password"
									name="password" autocomplete="new-password" minlength="8"
									maxlength="64" required>
								<button type="button" class="btn btn-toggle" id="togglePassword"
									aria-label="Show password">
									<i class="bi bi-eye" id="toggleIcon"></i>
								</button>
								<div class="invalid-feedback">Use at least 8 characters.</div>
							</div>
							<div class="hint">At least 8 characters.</div>
						</div>

						<div class="col-12">
							<label for="role" class="form-label">Role</label> <select
								class="form-select" id="role" name="role" required>
									<option value="ADMIN">Admin</option>
									<option value="USER">User</option>
							</select>
							<div class="invalid-feedback">Select a role.</div>
							<div class="hint">ADMIN can manage products, orders and
								other users.</div>
						</div>

					</div>

					<div
						class="form-actions d-flex flex-column-reverse flex-sm-row justify-content-sm-end gap-2 mt-4">
						<a href="${pageContext.request.contextPath}/users"
							class="btn btn-cancel">Cancel</a>
						<button type="submit" class="btn btn-create">Create user</button>
					</div>
				</form>
			</section>
		</main>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		// Bootstrap validation
		(function() {
			var form = document.querySelector('.needs-validation');
			form.addEventListener('submit', function(e) {
				if (!form.checkValidity()) {
					e.preventDefault();
					e.stopPropagation();
				}
				form.classList.add('was-validated');
			});
		})();

		// Show / hide password
		document.getElementById('togglePassword').addEventListener(
				'click',
				function() {
					var input = document.getElementById('password');
					var icon = document.getElementById('toggleIcon');
					var show = input.type === 'password';
					input.type = show ? 'text' : 'password';
					icon.className = show ? 'bi bi-eye-slash' : 'bi bi-eye';
					this.setAttribute('aria-label', show ? 'Hide password'
							: 'Show password');
				});
	</script>
</body>
</html>
