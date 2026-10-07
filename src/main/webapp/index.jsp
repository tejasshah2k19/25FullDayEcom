<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>User management | Store admin</title>

<!-- Bootstrap 5 + icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">

<style>
  :root {
    --ink: #14213d;
    --ink-soft: #4a5876;
    --surface: #ffffff;
    --page: #eef2f7;
    --line: #d5dce8;
    --accent: #0f766e;
    --accent-tint: #e1f3f1;
    --warn: #b42318;
    --warn-tint: #fdeceb;
    --edit: #9a5b00;
    --edit-tint: #fdf1dc;
    --list: #2b4a8b;
    --list-tint: #e4eaf7;
  }

  body {
    font-family: "Segoe UI", system-ui, -apple-system, Roboto, "Helvetica Neue", Arial, sans-serif;
    color: var(--ink);
    background: var(--page);
    min-height: 100vh;
  }

  .topbar {
    background: var(--ink);
    color: #fff;
    padding: 1rem 0;
  }
  .brand-mark { font-weight: 700; letter-spacing: .02em; font-size: 1.1rem; }
  .brand-mark span { color: #5eead4; }

  .intro { padding: 3rem 0 1.5rem; }
  .intro h1 {
    font-size: clamp(1.75rem, 4vw, 2.5rem);
    font-weight: 700;
    line-height: 1.15;
    margin-bottom: .5rem;
  }
  .intro p { color: var(--ink-soft); max-width: 52ch; margin-bottom: 0; }

  .action-card {
    display: flex;
    flex-direction: column;
    height: 100%;
    padding: 1.5rem;
    background: var(--surface);
    border: 1px solid var(--line);
    border-radius: 12px;
    text-decoration: none;
    color: inherit;
    transition: border-color .15s ease, box-shadow .15s ease;
  }
  .action-card:hover, .action-card:focus-visible {
    color: inherit;
    border-color: var(--card-color);
    box-shadow: 0 8px 24px rgba(20, 33, 61, .08);
  }
  .action-card:focus-visible { outline: 3px solid var(--card-color); outline-offset: 2px; }

  .action-icon {
    width: 48px;
    height: 48px;
    border-radius: 10px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.4rem;
    color: var(--card-color);
    background: var(--card-tint);
    margin-bottom: 1.1rem;
  }
  .action-card h2 { font-size: 1.2rem; font-weight: 700; margin-bottom: .35rem; }
  .action-card p { color: var(--ink-soft); font-size: .95rem; margin-bottom: 1.25rem; }
  .action-go { margin-top: auto; font-weight: 600; color: var(--card-color); }

  .card-list   { --card-color: var(--list);   --card-tint: var(--list-tint); }
  .card-add    { --card-color: var(--accent); --card-tint: var(--accent-tint); }
  .card-update { --card-color: var(--edit);   --card-tint: var(--edit-tint); }
  .card-delete { --card-color: var(--warn);   --card-tint: var(--warn-tint); }

  @media (max-width: 575.98px) {
    .intro { padding: 2rem 0 1rem; }
    .action-card { padding: 1.25rem; }
  }

  @media (prefers-reduced-motion: reduce) {
    .action-card { transition: none; }
  }
</style>
</head>
<body>

<header class="topbar">
  <div class="container">
    <div class="brand-mark">Shop<span>Hub</span> admin</div>
  </div>
</header>

<main class="container">
  <section class="intro">
    <h1>User management</h1>
    <p>View all accounts, add new ones, correct user names, or remove accounts you no longer need.</p>
  </section>

  <section class="row g-3 g-md-4 pb-5">

    <div class="col-12 col-md-6 col-xl-3">
      <a href="ListUserController" class="action-card card-list">
        <div class="action-icon"><i class="bi bi-people"></i></div>
        <h2>List users</h2>
        <p>See every user account with their name, email and role.</p>
        <span class="action-go">View all users <i class="bi bi-arrow-right"></i></span>
      </a>
    </div>

    <div class="col-12 col-md-6 col-xl-3">
      <a href="AddUser.jsp" class="action-card card-add">
        <div class="action-icon"><i class="bi bi-person-plus"></i></div>
        <h2>Add user</h2>
        <p>Create a USER or ADMIN account with a name, email and password.</p>
        <span class="action-go">Add a user <i class="bi bi-arrow-right"></i></span>
      </a>
    </div>

    <div class="col-12 col-md-6 col-xl-3">
      <a href="UpdateUser.jsp" class="action-card card-update">
        <div class="action-icon"><i class="bi bi-pencil-square"></i></div>
        <h2>Update user</h2>
        <p>Change the first and last name of an existing user by their ID.</p>
        <span class="action-go">Update a user <i class="bi bi-arrow-right"></i></span>
      </a>
    </div>

    <div class="col-12 col-md-6 col-xl-3">
      <a href="DeleteUser.jsp" class="action-card card-delete">
        <div class="action-icon"><i class="bi bi-person-dash"></i></div>
        <h2>Delete user</h2>
        <p>Permanently remove a user account. This can't be undone.</p>
        <span class="action-go">Delete a user <i class="bi bi-arrow-right"></i></span>
      </a>
    </div>

  </section>
</main>

</body>
</html>
