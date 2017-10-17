# Toytastic

This is meant to be a demo application for a 2 sided marketplace built in Ruby on Rails

The problem:
As people grow older, we often stop playing with toys (not true for some of us!). We want to find an easy way to sell our used toys in order to reclaim (or gain) some value back.

The solution:
Fortunately some people love collecting toys and younger generations still need toys! The goal is to make it easy and to do so regardless of where you are in the world.

## Dependencies

Main dependencies

bundler

ruby => 2.3.1

Rails 5.0.6

Rails gem dependencies can be found in the Gemfile

## Usage

In the root directory, run `bundle` to install dependencies.

You can run the specs by running:
`bundle exec rspec spec`

## Development Environment

Created with ruby version 2.3.1p113 on macOS Sierra 10.12.6

## Next Iterations and Improvements

As this is the skeleton for the start of an app there are lots of areas for improvements.
- Add a nicer homepage splash (playing video?)
- Add more tests on all the major controllers and models (There is only one main spec `toy_spec` but I implemented it FactoryGirl and Faker as well)
- Create a db seed for fake users to test
- Add expiry date for toys so toys can be listed and re-listed
- Add a filter for viewing active and sold toys
- Add a registration flow specifically for Sellers only
- Clean up search params
- Add a real admin section for more thorough application of authorisation ;)
- Flush out orders model e.g. holding information about shipping and become the starting point for payments model
- Link messages to a toy and evolve the messages model into conversations holding messages (requires a re-model of this relationship)
- Restrict all actions for each controller to the correct user
- Add default images if toy pictures are missing
- Override all the bootstrap CSS styling and fix CSS issues so it can look amazing!

As my primary aim was to achieve the functionality for the demo, there are areas of polish/design that will need to be re-visited. For example, as mentioned above and in the demo, the messages model is not considered a robust solution. I would be looking to implement a more robot solution such as the following

User has many conversations
Conversation has many messages
Messages have content, a from_id, a to_id and a conversation_id

If you are looking to test the authorisation portion of the app, I implemented a small easter egg as a fun way to tackle the requirement. If you visit `/crazy_things`. You will be able to press the button regardless of the type of user. However you have to have the role of an admin to see the side effect. To become an admin you can load your user in rails console and add an admin role.

```
rails c
user = User.last
user.add_role :admin
```

You can now visit the page and press the button successfully.

If you have any further questions, feel free to raech out to me.


## Contributing

If you have any input on design or code considerations, please feel free to reach out to me or send a pull request.
