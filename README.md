meteor-is-created
-----------------

This is a simple library that allows you to reactively check if templates are created.

    Template.isCreated("foo", "bar", ...)

will return true if templates "foo", "bar", etc, have been created (rendered at
least once).  It will change reactively as that condition changes.  It allows
you to concisely write in a reactive block

    Deps.autorun(function() {
      if (!Template.isCreated("myTemplate")) return;
      //Do stuff that requires myTemplate.
    });

This reactive block will short-circuit until the templates are created, and
then run as normal once they are created.
