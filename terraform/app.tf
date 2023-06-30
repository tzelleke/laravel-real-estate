resource "digitalocean_app" "laravel-vue3-postgres" {
  spec {
    name   = "laravel-vue3-postgres"
    region = "fra"

    alert {
      rule = "DEPLOYMENT_FAILED"
    }

    alert {
      rule = "DOMAIN_FAILED"
    }

    database {
      engine     = "PG"
      name       = "db-laravel"
      version    = "12"
      production = "false"
      db_name    = "db-laravel"
    }

    service {
      name               = "laravel"
      environment_slug   = "php"
      instance_count     = 1
      instance_size_slug = "basic-xxs"

      github {
        repo   = "tzelleke/laravel-vue3-postgres"
        branch = "main"
      }

      routes {
        path = "/"
      }

      build_command = <<-EOT
        npm run build
        cp .env.example .env
        php artisan key:generate
        php artisan config:cache
        php artisan view:cache
        php artisan event:cache
        php artisan route:cache
      EOT

      env {
        key   = "APP_ENV"
        scope = "RUN_AND_BUILD_TIME"
        value = "production"
        type  = "GENERAL"
      }

      env {
        key   = "APP_DEBUG"
        scope = "RUN_AND_BUILD_TIME"
        value = "false"
        type  = "GENERAL"
      }

      env {
        key   = "APP_URL"
        scope = "RUN_AND_BUILD_TIME"
        value = ""
        type  = "GENERAL"
      }

      env {
        key   = "LOG_LEVEL"
        scope = "RUN_AND_BUILD_TIME"
        value = "error"
        type  = "GENERAL"
      }

      env {
        key   = "DATABASE_URL"
        scope = "RUN_AND_BUILD_TIME"
        value = ""
        type  = "GENERAL"
      }

      source_dir  = "/"
      http_port   = 80
      run_command = "heroku-php-apache2 public/"
    }
  }
}
