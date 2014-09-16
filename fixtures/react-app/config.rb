activate :react do |r|
  r.targets << {
    main: 'js/app/main.js',
    output: 'js/app.compiled.js',
    minify: build?,
    debug: development?,
    env: {
      APP_NAME: 'app1'
    }
  }

  r.targets << {
    main: 'js/app2/main.js',
    output: 'js/app.compiled2.js',
    minify: development?,
    debug: build?,
    env: {
      APP_NAME: 'app2'
    }
  }
end

ignore "js/app2/*"