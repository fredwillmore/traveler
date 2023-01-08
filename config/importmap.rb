# Pin npm packages by running ./bin/importmap

pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true

pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.6.3/dist/jquery.js"
pin "vue", to: "https://ga.jspm.io/npm:vue@3.2.26/dist/vue.esm-browser.js"
pin_all_from "app/javascript/controllers", under: "controllers"

pin "application", preload: true