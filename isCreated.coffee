#Allow a reactive Template.isCreated("foo") or Template.isCreated("foo", "bar", ...)

###
# Since we set the created flag on startup, some 
# autorun blocks might have already checked the template.
# We'll check this reactive dict first, and set it
# when we've actually set up the isCreated fn
###
declaredTemplates = new ReactiveDict()
createdTemplates = new ReactiveDict()

Meteor.startup ->
  for _name, _partial of Meteor._partials
    #Fix in vars with an IIFE
    ((name, partial) ->
      oldCreated = partial.created
      partial._name = name
      partial.created = ->
        createdTemplates.set name, true
        oldCreated?()
      declaredTemplates.set name, true
    )(_name, _partial)


@Template ?= {}
Template.isCreated = (names...) ->
  for name in names
    return false unless declaredTemplates.get(name) and createdTemplates.get(name)
  return true

