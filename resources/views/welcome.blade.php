<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" data-bs-theme="dark">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Laravel | Vue3 | Postgres</title>

    @vite(['resources/scss/app.scss', 'resources/js/app.js', 'resources/js/vue-app.js'])
</head>
<body>
<main>
    <div class="container py-4">
        <div id="vueApp"></div>
    </div>
</main>
</body>
</html>
