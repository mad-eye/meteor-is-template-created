Package.describe({
  summary: "Useful extensions to Template"
});

Package.on_use(function (api) {
  api.use('templating', 'client');
  api.use("coffeescript", "client");
  api.add_files(["isCreated.coffee"], "client");
});
