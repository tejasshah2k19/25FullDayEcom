<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Update user | Store admin</title>

<!-- Bootstrap 5 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
  :root {
    --ink: #14213d;
    --ink-soft: #4a5876;
    --surface: #ffffff;
    --page: #eef2f7;
    --line: #d5dce8;
    --accent: #0f766e;
    --accent-dark: #0b5a54;
  }

  body {
    font-family: "Segoe UI", system-ui, -apple-system, Roboto, "Helvetica Neue", Arial, sans-serif;
    color: var(--ink);
    background: var(--page);
  }

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
  .brand-panel p { color: #b8c3da; max-width: 36ch; margin-bottom: 0; }
  .brand-mark { font-weight: 700; letter-spacing: .02em; font-size: 1.1rem; }
  .brand-mark span { color: #5eead4; }

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
  .form-card h2 { font-size: 1.5rem; font-weight: 700; margin-bottom: .25rem; }
  .form-card .lead-text { color: var(--ink-soft); margin-bottom: 1.75rem; }

  .form-label { font-weight: 600; font-size: .9rem; }
  .form-control {
    padding: .65rem .85rem;
    border-color: var(--line);
    border-radius: 8px;
  }
  .form-control:focus {
    border-color: var(--accent);
    box-shadow: 0 0 0 .2rem rgba(15, 118, 110, .2);
  }
  .hint { font-size: .8rem; color: var(--ink-soft); margin-top: .35rem; }

  .btn-update {
    background: var(--accent);
    border-color: var(--accent);
    color: #fff;
    font-weight: 600;
    padding: .7rem 1.5rem;
    border-radius: 8px;
  }
  .btn-update:hover, .btn-update:focus {
    background: var(--accent-dark);
    border-color: var(--accent-dark);
    color: #fff;
  }
  .btn-cancel { color: var(--ink-soft); font-weight: 600; padding: .7rem 1.25rem; }

  @media (max-width: 991.98px) {
    .page-wrap { grid-template-columns: 1fr; }
    .brand-panel { padding: 1.5rem 1.25rem; gap: 1rem; }
    .brand-panel h1 { max-width: none; font-size: 1.5rem; }
    .brand-panel p { display: none; }
    .form-panel { align-items: flex-start; padding: 1.25rem .75rem 2rem; }
  }

  @media (max-width: 575.98px) {
    .form-card { padding: 1.5rem 1.15rem; }
    .form-actions .btn { width: 100%; }
  }
</style>
</head>
<body>

<div class="page-wrap">

  <aside class="brand-panel">
    <div class="brand-mark">Shop<span>Hub</span> admin</div>
    <div>
      <h1>Update an account</h1>
      <p class="mt-3">Enter the user ID and the corrected name. Email, password and role stay as they are.</p>
    </div>
    <small class="text-secondary d-none d-lg-block">&copy; ShopHub</small>
  </aside>

  <main class="form-panel">
    <section class="form-card">
      <h2>User details</h2>
      <p class="lead-text">All fields are required.</p>

      <form action="UpdateUserController" method="post" class="needs-validation" novalidate>
        <div class="row g-3">

          <div class="col-12">
            <label for="userId" class="form-label">User ID</label>
            <input type="number" class="form-control" id="userId" name="userId" min="1" required>
            <div class="invalid-feedback">Enter the ID of the user to update.</div>
            <div class="hint">The ID of the existing user you want to change.</div>
          </div>

          <div class="col-12 col-sm-6">
            <label for="firstName" class="form-label">First name</label>
            <input type="text" class="form-control" id="firstName" name="firstName"
                   autocomplete="given-name" maxlength="50" required>
            <div class="invalid-feedback">Enter the first name.</div>
          </div>

          <div class="col-12 col-sm-6">
            <label for="lastName" class="form-label">Last name</label>
            <input type="text" class="form-control" id="lastName" name="lastName"
                   autocomplete="family-name" maxlength="50" required>
            <div class="invalid-feedback">Enter the last name.</div>
          </div>

        </div>

        <div class="form-actions d-flex flex-column-reverse flex-sm-row justify-content-sm-end gap-2 mt-4">
          <a href="javascript:history.back()" class="btn btn-cancel">Cancel</a>
          <button type="submit" class="btn btn-update">Update user</button>
        </div>
      </form>
    </section>
  </main>
</div>

<script>
  (function () {
    var form = document.querySelector('.needs-validation');
    form.addEventListener('submit', function (e) {
      if (!form.checkValidity()) { e.preventDefault(); e.stopPropagation(); }
      form.classList.add('was-validated');
    });
  })();
</script>
</body>
</html>
