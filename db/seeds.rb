# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#

Product.destroy_all
Comment.destroy_all

spam_text = <<-SPAM
Make $10k/month from home with this one simple trick!
1. Program for 6 years before college.
2. Get a computer science degree on 2 hours of sleep.
3. Save up $24k working at your first engineering job
4. Quit and read books for a year from a Florida craigslist bedroomwith no A/C.
5. Rediscover Ruby and web development.
6. Take 200+ hours of courses at CodeSchool.
7. Write Ruby articles for 6 months to pay rent.
8. Order credit cards to pay credit card bills because science.
9. Max out all of your cards and wait for homelessness.
10. Get a Norwegian consulting job 2 weeks before homeless.
11. Build fairly complex web app for billion dollar firm with Rails and AngularJS.
12. Make amazing JavaScripts with company in wild California.
SPAM

fedora_text = <<-FEDORA
My name is Xyzbo Glaxorp and I am a moderator of /r/vogon. Planets like this are
no match for my professional torture-poetry skills. They will bow before me and
my shis-kataka in 5 star cycles. All I ask is all your future clones' hands in
zeblunity, m'ledyp.
FEDORA

Product.create [
  {
    name: 'Vacuum',
    price: 11.99,
    description: 'Sucks real hard',
    comments: [
      Comment.create(text: 'Decent for the price'),
      Comment.create(text: 'This vacuum sucks.'),
      Comment.create(text: spam_text)
    ]
  },

  {
    name: 'Earth',
    price: 42.00,
    description: 'Harmless planet',
    comments: [
      Comment.create(text: 'Worst planet this side of the milky way.'),
      Comment.create(text: 'Ok experience but short-lived.'),
      Comment.create(text: fedora_text)
    ]
  },

  {
    name: 'Chair',
    price: 31.4,
    description: 'You can sit on it',
    comments: [
      Comment.create(text: 'Wife\'s friend broke it and now I have to sleep on the couch. Thanks.'),
      Comment.create(text: 'I mean it\'s a chair.')
    ]
  }
]
