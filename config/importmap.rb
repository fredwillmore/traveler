# Pin npm packages by running ./bin/importmap

pin "application", preload: true

pin_all_from "app/javascript/controllers", under: "controllers"

pin "vue", to: "https://ga.jspm.io/npm:vue@3.2.29/dist/vue.esm-browser.js"

pin "axios", to: "https://cdn.skypack.dev/axios@1.3.2"
pin "#lib/adapters/http.js", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0/nodelibs/@empty.js"
pin "#lib/platform/node/index.js", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0/nodelibs/@empty.js"
pin "#lib/platform/node/classes/FormData.js", to: "https://ga.jspm.io/npm:@jspm/core@2.0.0/nodelibs/@empty.js"
