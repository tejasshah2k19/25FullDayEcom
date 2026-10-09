<%@page import="com.bean.UserBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!// Escapes HTML so names containing < > & " ' can't break the page
	private String esc(String s) {
		if (s == null)
			return "";
		return s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;").replace("'",
				"&#39;");
	}%>
<%
ArrayList<UserBean> users = (ArrayList<UserBean>) request.getAttribute("users");
int total = (users == null) ? 0 : users.size();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Users | Store admin</title>

<!-- Bootstrap 5 + icons -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
	rel="stylesheet">

<style>
:root {
	--ink: #14213d;
	--ink-soft: #4a5876;
	--surface: #ffffff;
	--page: #eef2f7;
	--line: #d5dce8;
	--accent: #0f766e;
	--accent-dark: #0b5a54;
	--list: #2b4a8b;
	--list-tint: #e4eaf7;
}

body {
	font-family: "Segoe UI", system-ui, -apple-system, Roboto,
		"Helvetica Neue", Arial, sans-serif;
	color: var(--ink);
	background: var(--page);
	min-height: 100vh;
}

.topbar {
	background: var(--ink);
	color: #fff;
	padding: 1rem 0;
}

.brand-mark {
	font-weight: 700;
	letter-spacing: .02em;
	font-size: 1.1rem;
	color: #fff;
	text-decoration: none;
}

.brand-mark span {
	color: #5eead4;
}

.brand-mark:hover {
	color: #fff;
}

.page-head {
	padding: 2.5rem 0 1.25rem;
}

.page-head h1 {
	font-size: clamp(1.6rem, 3.5vw, 2.25rem);
	font-weight: 700;
	margin-bottom: .25rem;
}

.page-head p {
	color: var(--ink-soft);
	margin-bottom: 0;
}

.btn-add {
	background: var(--accent);
	border-color: var(--accent);
	color: #fff;
	font-weight: 600;
	padding: .6rem 1.25rem;
	border-radius: 8px;
}

.btn-add:hover, .btn-add:focus {
	background: var(--accent-dark);
	border-color: var(--accent-dark);
	color: #fff;
}

.btn-back {
	color: var(--ink-soft);
	font-weight: 600;
	padding: .6rem 1rem;
}

.table-card {
	background: var(--surface);
	border: 1px solid var(--line);
	border-radius: 12px;
	overflow: hidden;
	box-shadow: 0 10px 30px rgba(20, 33, 61, .06);
}

.table-card .card-top {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 1rem 1.25rem;
	border-bottom: 1px solid var(--line);
}

.count-badge {
	background: var(--list-tint);
	color: var(--list);
	font-weight: 600;
	font-size: .85rem;
	padding: .3rem .75rem;
	border-radius: 999px;
}

.table {
	margin-bottom: 0;
	--bs-table-hover-bg: #f5f8fc;
}

.table thead th {
	background: #f6f8fc;
	color: var(--ink-soft);
	font-size: .8rem;
	text-transform: uppercase;
	letter-spacing: .05em;
	font-weight: 700;
	padding: .85rem 1.25rem;
	border-bottom: 1px solid var(--line);
}

.table tbody td {
	padding: .9rem 1.25rem;
	vertical-align: middle;
	border-color: var(--line);
}

.col-index {
	width: 64px;
	color: var(--ink-soft);
}

.avatar {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	width: 34px;
	height: 34px;
	border-radius: 50%;
	background: var(--list-tint);
	color: var(--list);
	font-weight: 700;
	font-size: .85rem;
	margin-right: .75rem;
	flex-shrink: 0;
}

.name-cell {
	display: flex;
	align-items: center;
}

.empty-state {
	padding: 3rem 1.25rem;
	text-align: center;
	color: var(--ink-soft);
}

.empty-state i {
	font-size: 2.25rem;
	color: var(--line);
	display: block;
	margin-bottom: .5rem;
}

@media ( max-width : 575.98px) {
	.page-head {
		padding: 1.75rem 0 1rem;
	}
	.page-actions .btn {
		width: 100%;
	}
	.table thead th, .table tbody td {
		padding: .75rem .9rem;
	}
	.col-index {
		display: none;
	}
	.avatar {
		display: none;
	}
}
</style>
</head>
<body>

	<header class="topbar">
		<div class="container">
			<a href="index.jsp" class="brand-mark">Shop<span>Hub</span> admin
			</a>
		</div>
	</header>

	<main class="container pb-5">

		<section
			class="page-head d-flex flex-column flex-sm-row justify-content-between align-items-sm-end gap-3">
			<div>
				<h1>Users</h1>
				<p>All registered user accounts.</p>
			</div>
			<div
				class="page-actions d-flex flex-column-reverse flex-sm-row gap-2">
				<a href="index.jsp" class="btn btn-back">Back to home</a> <a
					href="AddUser.jsp" class="btn btn-add"><i
					class="bi bi-person-plus me-1"></i> Add user</a>
			</div>
		</section>

		<section class="table-card">
			<div class="card-top">
				<strong>User list</strong> <span class="count-badge"><%=total%>
					<%=total == 1 ? "user" : "users"%></span>
			</div>

			<%
			if (total == 0) {
			%>
			<div class="empty-state">
				<i class="bi bi-people"></i>
				<p class="mb-1 fw-semibold">No users to show</p>
				<p class="mb-0">
					Add a user, or open this page through the <strong>List
						users</strong> link on the home page.
				</p>
			</div>
			<%
			} else {
			%>
			<div class="table-responsive">
				<table class="table table-hover align-middle">
					<thead>
						<tr>
							<th scope="col" class="col-index">#</th>
							<th scope="col">First name</th>
							<th scope="col">Last name</th>
							<th scope="col">Email</th>
							<th scope="col">Role</th>
							<th scope="col">Action</th>
							

						</tr>
					</thead>
					<tbody>
						<%
						int i = 0;
						for (UserBean user : users) {
							i++;
							String first = user.getFirstName();
							String initial = (first != null && !first.isEmpty()) ? first.substring(0, 1).toUpperCase() : "?";
						%>
						<tr>
							<td class="col-index"><%=i%></td>
							<td>
								<div class="name-cell">
									<span class="avatar" aria-hidden="true"><%=esc(initial)%></span>
									<span><%=esc(first)%></span>
								</div>
							</td>
							<td><%=esc(user.getLastName())%></td>
							<td><%=user.getEmail()%></td>
							<td><%=user.getRole() %></td>
							<td><a href="DeleteUserController?userId=<%=user.getUserId()%>">Delete</a> | Edit </td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
			<%
			}
			%>
		</section>

	</main>

</body>
</html>
